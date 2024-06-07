---
title: Forecasting API overview
description: Integrate with the Azure Machine Learning web service through the forecasting API in Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: conceptual
ms.date: 06/07/2024
ms.custom: bap-template
ms.collection:
  - get-started
ms.reviewer: solsen
---

# Forecasting API overview

The Forecasting API, also known as the Time Series API, is designed to predict future values of a specific indicator based on its past, time-ordered observations. This API is useful for two reasons:

1. The dataset required for training is very simple – it primarily needs labels. Features aren't really needed for forecasting. The only requirement is that labels must be sorted chronologically and that they must represent the same time interval.
2. Business applications are full of data, which is sorted chronologically. Approximately 30% of all tables contain a column of type *Date* and a column of type *Decimal*.

All logic of the Forecasting API is encapsulated in the Time Series Management codeunit (ID 2000) and it consists of the following methods:

- [Initialize](/dynamics365/business-central/application/base-application/codeunit/system.ai.time-series-management#initialize)  
- [PrepareData](/dynamics365/business-central/application/base-application/codeunit/system.ai.time-series-management#preparedata)  
- [SetPreparedData](/dynamics365/business-centra/application/base-application/codeunit/system.ai.time-series-management#setprepareddata)  
- [GetPreparedData](/dynamics365/business-central/application/base-application/codeunit/system.ai.time-series-management#getprepareddata)  
- [Forecast](/dynamics365/business-central/application/base-application/codeunit/system.ai.time-series-management#forecast)  
- [GetForecast](/dynamics365/business-central/application/base-application/codeunit/system.ai.time-series-management#getforecast)  

The Forecasting API is a wrapper around an Azure Machine Learning experiment, which is published as a web service. The Forecasting API, also known as the Time Series API, is designed to predict future values of a specific indicator based on its past, time-ordered observations. This API is particularly beneficial for two reasons:

For [!INCLUDE [prod_short](includes/prod_short.md)] online, the experiment is published by Microsoft and connected to the Microsoft subscription. For other deployment options, you have to publish the experiment in your own Azure subscription.

The publishing task consists of four steps: 

1. Open the [Forecasting Model for Microsoft Dynamics 365 Business Central](https://gallery.azure.ai/Experiment/Forecasting-Model-for-Microsoft-Dynamics-365-Business-Central) experiment in Azure Machine Learning Studio. 
2. Run it, and then deploy it as a web service. 
3. In the web service dashboard, copy the API key.
4. Choose **REQUEST/RESPONSE**, and then copy the Request URI.

The purpose of this task is to get the API URI and API key and pass them into the `Initialize` method. That gives the Forecasting API the end-point to contact:

```al
var
  TimeSeriesManagement: Codeunit "Time Series Management";
  URITxt: TextConst ENU = 'https://..f1e/execute?api-version=2.0&details=true';
  KeyTxt: TextConst ENU = '1MhwM1T..oF4U2A==';
begin
  TimeSeriesManagement.Initialize(URITxt, KeyTxt, 0, false);
 
```

If you pass empty strings, the system will use the default end-point, but that will only work for Business Central online: 

```al
TimeSeriesManagement.Initialize('', '', 0, true);
```

Once initialized, you must prepare the training dataset. There are two options:

1. You can prepare the dataset “manually” by inserting records into a temporary instance of the **Time Series Buffer** table.
2. Or, you can use the helper method `PrepareData`, which will do it for you. The `PrepareData` method transforms any passed record into a format, which can be processed by the Forecasting API. For example, if you want to detect sales volume, you'll probably use the **Item Ledger Entry** table as the source table:

```al

var
  ItemLedgerEntry: Record "Item Ledger Entry";
  Date: Record Date;
begin
  ItemLedgerEntry.Reset();
  ItemLedgerEntry.SetRange("Entry Type", ItemLedgerEntry."Entry Type"::Sale);
  TimeSeriesManagement.PrepareData(                   
    ItemLedgerEntry,			                //Source record
    ItemLedgerEntry.FieldNo("Item No."),	    //Field for grouping
    ItemLedgerEntry.FieldNo("Posting Date"),	//Date field
    ItemLedgerEntry.FieldNo(Quantity),	        //Aggregation field
    Date."Period Type"::Month, 		            //Period representing 1 data point
    WorkDate(), 			                    //Forecasting Start Date
    12);				                        //Number of data points
```

The provided code prepares the **Item Ledger Entry** table by filtering it by the **Entry Type** field because we need to focus on sales transactions. Then, we must specify, which field should be used for chronological ordering of dataset. There could be multiple fields, such as **Posting Date** and **Document Date**, so we need to specify, which field to be used for processing.

The **Period Type** field specifies how to aggregate transactions. Notice that the Forecasting API requires data points separated by the same interval, which can be day, week, month, quarter, or even year. It all depends on the amount of available data and a reasonable interval for prediction.

The number of data points specifies how many data points must be produced by the method.

> [!NOTE]
> The Forecasting API doesn’t tolerate missing data points. If you have 0 sales on Monday and 3 on Tuesday, you still need to report one value for Monday (0) and one for Tuesday (the sum of 3 separate transactions).

The method will aggregate data, starting from the specified date and will move backwards. In this example, the method will return aggregated sales for 12 months preceding the work date.

Most probably your **Item Ledger Entry** table contains information about multiple items. The Forecasting API supports bulk processing, so you get a forecast for multiple entries. In this example, we use “Item No.” as the grouping field, so the `PrepareData` method will prepare a dataset for each item.

You can read the prepared dataset with the GetPreparedData method.

```al
var
  TempTimeSeriesBuffer: Record "Time Series Buffer" temporary;
begin
  TimeSeriesManagement.GetPreparedData(TempTimeSeriesBuffer);
```

If you create a page based on the **Time Series Buffer** table, you can display the training dataset for inspection:

:::image type="content" source="media/forecasting_api1.png" alt-text="Training set for inspection":::
 
You can see 12 periods for each item (only one item is displayed on screenshot). 

You can update the dataset (for example invert the sign for values) or create your own dataset if you need to collect data from more than one table. Then, you can send that dataset back to the Forecasting API with the `SetPreparedData` method. That's what we do with the Cash Flow Forecast, where we gather data from the **Customer Ledger Entries**, **Vendor Ledger Entries**, and **Tax Entries** tables.

Once your dataset is ready, it's time to run the Forecast method. The only parameter you need to specify is the number of data points you want to forecast:

```al
TimeSeriesManagement.Forecast(3, 0, 0);
```

The quality of the forecast is affected by specifying too many data points at a time. We'll address this later in this article.

Now, you can get results for further processing. The `GetForecast` method will fill the **Time Series Forecast** table with results.

```al
    var
        TempTimeSeriesForecast: Record "Time Series Forecast" temporary;
    begin
        TimeSeriesManagement.GetForecast(TempTimeSeriesForecast);   
```

This following picture shows the forecast for the next 3 periods (13, 14, 15) that comes after the initial 12. There are forecasted values and delta for each data point.

:::image type="content" source="media/forecasting_api2.png" alt-text="Forecast for the next 3 periods":::
 
The Forecasting API doesn’t return the single value for a data point, but returns a range where the predicted value will be. In the example above, the period 15 has a predicted value of 13 and a delta of 6,02. This means that the value for the 15th period will be somewhere between 6,98 and 19,02 (13-6,02 and 13+6,02). 


It depends on what you are predicting, but in most cases I would ignore forecasts where the delta is wider than 20-30%. The narrower the better.

:::image type="content" source="media/forecasting_graph.png" alt-text="Forecasting graph":::

## Next steps

You can now try to build an extension that populates the Demand Forecast. For more advanced scenarios, see []().

## See also
