---
title: Prediction API overview
description: Integrate with the Azure Machine Learning web service through the prediction API in Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: conceptual
ms.date: 06/07/2024
ms.custom: bap-template
ms.collection:
  - get-started
ms.reviewer: solsen
---

# Prediction API overview

The Prediction API is the latest addition to the collection of machine learning APIs that are embedded in [!INCLUDE [prod_short](includes/prod_short.md)]. It first and foremost supports the **Late Payment Prediction** extension <!-- link -->. However, it can be used to solve other problems with regression or classification, or it could be used to build a model that predicts customer churn, quote conversion, or shipment delay. <!-- For example, in our “Christmas Apparel Demo” <link>, we used the Prediction API to build a classification model that allocates each item to one of three classes based on the expected sales volume.We could also use the Prediction API to build a model that predicts customer churn, quote conversion, or shipment delay.-->

The classification is a typical problem that can be solved with machine learning, and there are multiple techniques to do that. If you read the [Forecasting API overview](ml-forecasting-api-overview.md) article, you know that we used the Custom Vision service to train an image classification model based on the provided images and tags.

The Prediction API is another tool that works on a different type of training dataset. As introduced in the [Forecasting API overview](ml-forecasting-api-overview.md) article, the training dataset contains one or more features and a label. We didn’t specify features for the Custom Vision model, because, for images, one pixel is usually one feature (grayscale) or three features (RGB). However, if we want to build a classification model for sales volume, we must define our own features, such as price, gender, sleeve length, and so on.

All logic of the Prediction API is concentrated in the [ML Prediction Management](/dynamics365/business-central/application/base-application/codeunit/system.ai.ml-prediction-management) codeunit (ID=2003) and has the following methods:

- [Initialize](/dynamics365/business-central/application/base-application/codeunit/system.ai.ml-prediction-management#initialize)
- [SetRecord](/dynamics365/business-central/application/base-application/codeunit/system.ai.ml-prediction-management#setrecord)
- [AddFeature](/dynamics365/business-central/application/base-application/codeunit/system.ai.ml-prediction-management#addfeature) 
- [SetLabel](/dynamics365/business-central/application/base-application/codeunit/system.ai.ml-prediction-management#setlabel) 
- [SetConfidence](/dynamics365/business-central/application/base-application/codeunit/system.ai.ml-prediction-management#setconfidence)
- [Train](/dynamics365/business-central/application/base-application/codeunit/system.ai.ml-prediction-management#train)
- [Predict](/dynamics365/business-central/application/base-application/codeunit/system.ai.ml-prediction-management#predict)

The Prediction API is a wrapper around an Azure Machine Learning experiment, which is published as a web service. For [!INCLUDE [prod_short](includes/prod_short.md)] online, the experiment is published by Microsoft and connected to the Microsoft subscription. For other deployment options, you must publish the experiment in your own Azure subscription.

The publishing task consists of four simple steps: 

- Open the [Prediction Experiment for Dynamics 365 Business Central](https://gallery.azure.ai/Experiment/Prediction-Experiment-for-Dynamics-365-Business-Central) experiment in Azure Machine Learning studio. 
- Run it, and then deploy it as a web service. 
- In the web service dashboard, copy the API key.
- Choose REQUEST/RESPONSE, and then copy the Request URI.

The purpose of this task is to get API URI and API key and pass them to the `Initialize` method. 

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
        field(6; IsChristmas; Boolean) { }
        field(10; DecemberSales; Option) { OptionMembers = Low,Medium,High; }
        field(11; Confidence; Decimal) { }
    }

    Keys
    {
        key(PK; Counter) { Clustered = true; }
    }
}
```

It’s just a buffer table, where Counter is the primary key. `Price`, `Gender`, `Material`, `SleeveLength`, and `IsChristmas` are features. The `DecemberSales` field stores labels for training and receives the predicted value. `Confidence` is a field that specifies the probability that the classification is correct.

The next step is to fill the buffer table with data, done in AL and not shown here.

:::image type="content" source="media/prediction-parameters.png" alt-text="Prediction parameters":::

Once we have the training data, we can use the Prediction API to train the model. Let see if the system figures out how different combinations of price, gender, material, and Christmas theme lead to different sales volumes in December.
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
  MLPredictionManagement.AddFeature(MLPredictionParameters.FieldNo(IsChristmas));   

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
MLPredictionManagement.AddFeature(MLPredictionParameters.FieldNo(IsChristmas));
MLPredictionManagement.SetConfidence(MLPredictionParameters.FieldNo(Confidence));
MLPredictionManagement.SetLabel(MLPredictionParameters.FieldNo(DecemberSales));

MLPredictionManagement.Predict(ModelAsText);
```

The last method that you call is the `Predict` method, which sends the model and data to the Azure Machine Learning experiment. As soon as results are received, the fields `DecemberSales` and `Confidence` are updated with the predicted class and the probability that the classification is correct.

Now, you can loop through the updated buffer table and read the label and confidence for each record used in the prediction. 
For more information, see the source code of the [Late Payment Prediction extension](https://github.com/microsoft/ALAppExtensions/tree/master/AddOns/LatePaymentPredictor).

## See also

[Forecasting API overview](ml-forecasting-api-overview.md)  