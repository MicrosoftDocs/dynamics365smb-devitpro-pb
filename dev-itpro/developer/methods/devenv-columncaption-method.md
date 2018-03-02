---
title: "COLUMNCAPTION Method"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 47ad403e-3a68-47b8-a4a2-0896b1c88a0d
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# COLUMNCAPTION Method
Returns the current caption of a query column as a text string.  

## Syntax  

```  

Caption := Query.COLUMNCAPTION(Column)  
```  

#### Parameters  
 *Query*  
 Type: query  

 A variable that specifies the query object that contains the column.  

 *Column*  
 Type: Text  

 Refers to the name of the query column. The name of a query column is specified by the [Name Property](../properties/devenv-Name-Property.md) of the column in Query Designer.  

## Property Value/Return Value  
 Type: Text  

 The current value of [CaptionML Property](../properties/devenv-CaptionML-Property.md) for the query column.  

## Remarks  
 The **CaptionML** property is multi-language enabled, so it can contain a list of text strings in different languages. The string that is used is selected according to the user's language settings. For more information, see [Multilanguage Development](../devenv-multilanguage-development.md).  

## Example  
 The following example shows how to get the caption for a column of a query. The query is called **My Customer Query** and has a column with the name **Customer\_No**.  

 This example requires that you create the following variables.  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|Caption|Text|Not applicable|  
|MyQuery|Query|My Customer Query|  

```  
Caption := MyQuery.COLUMNCAPTION("Customer_No");  
MESSAGE(Caption);  
```  

## See Also  
 <!--NAV [How to: Create Queries](How-to--Create-Queries.md) -->  
