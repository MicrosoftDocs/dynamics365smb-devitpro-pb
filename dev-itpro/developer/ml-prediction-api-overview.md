---
title: Prediction API overview
description: Integrate with the Azure Machine Learning web service through the prediction API in Business Central.
author: AndreiPanko
ms.author: solsen
ms.topic: conceptual
ms.date: 06/07/2024
ms.custom: bap-template
ms.collection:
  - get-started
ms.reviewer: solsen
---

# Prediction API overview

The Prediction API is another machine learning APIs that are embedded in [!INCLUDE [prod_short](includes/prod_short.md)]. It first and foremost supports the [**Late Payment Prediction**](/dynamics365/business-central/ui-extensions-late-payment-prediction) extension. However, it can be used to solve other problems with regression or classification, like customer churn, quote conversion, or shipment delay. 

## Prediction Model

The Prediction Model for [!INCLUDE[prod_short](includes/prod_short.md)] lets you easily train, evaluate, visualize models for prediction purpose. This model uses the Execute R Script module to run the R scripts that performs all the tasks. The two input modules define the expected structure of the input datasets. The first module defines the structure of the dataset, which is flexible and can accept up to 25 features, and the second defines the parameters.

### Input Data Schema

When you call the API, you need to pass several parameters:

- **method (String)** – Required parameter. Specifies the Machine Learning procedure to be used. The model supports the following methods:
  - train (system decides whether to use classification or regression based on your dataset)
  - trainclassification
  - trainregression
  - predict
  - evaluate
  - plotmodel

Based on selected method you might need extra parameters, such as
- The **train_percent (Numeric)** – Required for **train**, **trainclassification**, and **trainregression** methods. Specifies how to divide a dataset into training and validation sets. 80 means 80% of dataset are used for training and 20% for validation of result.
- The **model (String;base64)** - Required for **predict**, **evaluate**, and **plotmodel** methods. Contents serialized model, encoded with Base64. You can get model as result of run train, trainclassification, or trainregression methods.
- The **captions (String)** – Optional parameter used with the **plotmodel** method. Contains comma separated captions for features. If not passed Feature1..Feature25 are used.
- The **labels (String)** – Optional parameter used with the **plotmodel** method. Contains comma separated alternative captions for labels. If not passed actual values are used.
- The **dataset** - Required for **train**, **trainclassification**, **trainregression**, **evaluate**, **predict**, and it consists of:
  - **Feature1..25** – The features are the descriptive attributes (also known as dimensions) that describe the single observation (record in dataset). It can be integer, decimal, Boolean, option, code, or string.
  - **Label** – Required but should be empty for predict method. The label is what you're attempting to predict or forecast

### Output Data Schema
The output of the service:
- The **model (String;base64)** – Result of execution of **train**, **trainclassification**, and **trainregression** methods. Contains serialized model, encoded with Base64.
- The **quality (Numeric)** – Result of execution of **train**, **trainclassification**, **trainregression**, and **evaluate** methods. In current experiment we use Balanced Accuracy score as a measure of a model’s quality.
- The **plot (application/pdf;base64)** – Result of execution of **plotmodel** method. Contains visualization of model in pdf format encoded with Base64.
- The **Dataset** – Result of execution of predict method, consists of:
  - **Feature1..25** – same as input.
  - **Label** – the predicted value
  - **Confidence** – the probability that classification is correct.

## Prediction API

All logic of the Prediction API is concentrated in the [ML Prediction Management](/dynamics365/business-central/application/base-application/codeunit/system.ai.ml-prediction-management) codeunit (ID=2003) and has the following methods:

- [Initialize](/dynamics365/business-central/application/base-application/codeunit/system.ai.ml-prediction-management#initialize)
- [SetRecord](/dynamics365/business-central/application/base-application/codeunit/system.ai.ml-prediction-management#setrecord)
- [AddFeature](/dynamics365/business-central/application/base-application/codeunit/system.ai.ml-prediction-management#addfeature) 
- [SetLabel](/dynamics365/business-central/application/base-application/codeunit/system.ai.ml-prediction-management#setlabel) 
- [SetConfidence](/dynamics365/business-central/application/base-application/codeunit/system.ai.ml-prediction-management#setconfidence)
- [Train](/dynamics365/business-central/application/base-application/codeunit/system.ai.ml-prediction-management#train)
- [Predict](/dynamics365/business-central/application/base-application/codeunit/system.ai.ml-prediction-management#predict)

For [!INCLUDE [prod_short](includes/prod_short.md)] online, the experiment is published by Microsoft and connected to the Microsoft subscription. For other deployment options, you have to create Machine Learning resources in your own Azure subscription. You can find sample steps in the [sample repo](https://github.com/microsoft/BCTech/tree/master/samples/MachineLearning).

The purpose of this task is to get the API URI and API key and pass them into the `Initialize` method. That gives the Prediction API the end-point to contact:

```al

var
  MLPredictionManagement: Codeunit "ML Prediction Management";
  URITxt: TextConst ENU = 'https://../execute?api-version=2.0&details=true';
  KeyTxt: TextConst ENU = 'TlfjUL..Mnrahg==';
begin
  MLPredictionManagement.Initialize(URITxt, KeyTxt, 0);
```

In [!INCLUDE [prod_short](includes/prod_short.md)] online, you can use the default credentials. In that case, you can use the following method instead:

```al
  MLPredictionManagement.InitializeWithKeyVaultCredentials(0);
```

Once initialized, you must prepare the training dataset. Just like the Forecasting API, the Prediction API can take almost any record as input. But, from a practical perspective, it's recommended to create a buffer table to aggregate the training data. In this case, you can gather data from multiple sources and perform the data transformation as needed. Even in the simple “Christmas Apparel Demo”, the data was coming from multiple sources: Sales prices come from the Item card or the Sales Prices table; gender, material, and sleeve length came from item attributes. So let’s get started by creating the buffer table.

```al

Table 50136 "ML Prediction Parameters"
{
    fields
    {
        field(1; Counter; Integer) { AutoIncrement = true; }
        field(2; Price; Option) { OptionMembers = Low,Medium,High; }
        field(3; Gender; Option) { OptionMembers = Man,Women; }
        field(4; Material; Option) { OptionMembers = Cashmere,Silk,Wool,Acrylic,Viscose,Cotton; }
        field(5; SleeveLength; Option) { OptionMembers = Full,Half,Short,Threequarter,Butterfly,Sleveless; }
        field(10; DecemberSales; Option) { OptionMembers = Low,Medium,High; }
        field(11; Confidence; Decimal) { }
    }

    Keys
    {
        key(PK; Counter) { Clustered = true; }
    }
}
```

It’s just a buffer table, where Counter is the primary key. `Price`, `Gender`, `Material`, and `SleeveLength` are features. The `DecemberSales` field stores labels for training and receives the predicted value. `Confidence` is a field that specifies the probability that the classification is correct.

The next step is to fill the buffer table with data, done in AL and not shown here. 

Price|Gender|Material|SleeveLength|DecemberSales
---|---|---|---|---
Medium|Woman|Cotton|Threequarter|**Low**
High|Man|Cotton|Half|**Low**
Medium|Woman|Acrylic|Butterfly|**High**
Medium|Man|Silk|Short|**Medium**
Medium|Woman|Cotton|Butterfly|**High**
Low|Woman|Acrylic|Threequarter|**Low**
Medium|Man|Wool|Full|**Medium**
Low|Man|Cotton|Full|**High**
…|…|…|…|…
Low|Woman|Acrylic|Short|**High**

Once we have the training data, we can use the Prediction API to train the model. Let see if the system figures out how different combinations of price, gender, material lead to different sales volumes in December.
We use the `SetRecord` method to point to the table with the training dataset. After that, we run the `AddFeature` method for each field that contains our features (Price, Gender, and so on). We can add up to 25 features.

Then, we must specify, which fields contain the label (the expected output) and confidence. Though confidence isn't needed at this stage, the way the API is implemented requires us to specify the confidence field.

```al
var
  MLPredictionParameters: Record "ML Prediction Parameters";
  ModelAsText: Text;
  ModelQuality: Decimal;
begin
  MLPredictionManagement.SetRecord(MLPredictionParameters);

  MLPredictionManagement.AddFeature(MLPredictionParameters.FieldNo(Price));
  MLPredictionManagement.AddFeature(MLPredictionParameters.FieldNo(Gender));
  MLPredictionManagement.AddFeature(MLPredictionParameters.FieldNo(Material));
  MLPredictionManagement.AddFeature(MLPredictionParameters.FieldNo(SleeveLength));

  MLPredictionManagement.SetLabel(MLPredictionParameters.FieldNo(DecemberSales));  

  MLPredictionManagement.SetConfidence(MLPredictionParameters.FieldNo(Confidence));
```

The last method to call is `Train`, which sends data to the Azure Machine Learning experiment and receives the trained model as text and an indication of the quality of model.

```al
  MLPredictionManagement.Train(ModelAsText, ModelQuality);
```

If the quality of the model (the percentage of correct predictions) is acceptable for your business scenario (0.8 or higher), then you can store the model for future use, for example in a BLOB field. Now, you have the trained model, and you can use it for classification tasks.

The application code is similar to the code we wrote for training purposes. Again we use a buffer table, but this time it contains records with features only. Notice that in this case, you keep the label field empty (in our scenario, that’s the `DecemberSales` field).

```al
MLPredictionManagement.Initialize(URITxt, KeyTxt, 0);

MLPredictionManagement.SetRecord(MLPredictionParameters);
MLPredictionManagement.AddFeature(MLPredictionParameters.FieldNo(Price));
MLPredictionManagement.AddFeature(MLPredictionParameters.FieldNo(Gender));
MLPredictionManagement.AddFeature(MLPredictionParameters.FieldNo(Material));
MLPredictionManagement.AddFeature(MLPredictionParameters.FieldNo(SleeveLength));
MLPredictionManagement.SetConfidence(MLPredictionParameters.FieldNo(Confidence));
MLPredictionManagement.SetLabel(MLPredictionParameters.FieldNo(DecemberSales));

MLPredictionManagement.Predict(ModelAsText);
```

The last method that you call is the `Predict` method, which sends the model and data to the Azure Machine Learning experiment. As soon as results are received, the fields `DecemberSales` and `Confidence` are updated with the predicted class and the probability that the classification is correct.

Now, you can loop through the updated buffer table and read the label and confidence for each record used in the prediction. 
For more information, see the source code of the [Late Payment Prediction extension](https://github.com/microsoft/ALAppExtensions/tree/master/AddOns/LatePaymentPredictor).

## See also

[Forecasting API overview](ml-forecasting-api-overview.md)  
[The Late Payment Prediction Extension](/dynamics365/business-central/ui-extensions-late-payment-prediction)
