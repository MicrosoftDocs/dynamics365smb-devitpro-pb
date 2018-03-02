---
title: "SKIP Method (Report, XMLport)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: f5c7657b-aaa5-4b2c-974d-ac2cd2fc3c9c
caps.latest.revision: 10
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SKIP Method (Report, XMLport)
Skips the current iteration of the current report or XMLport.  

## Syntax  

```  

Record.SKIP  
```  

## Remarks  
 The [SKIP Method \(Report, XMLport\)](devenv-SKIP-Method-Report-XMLport.md) allows you to conditionally skip processing of the current report or XMLport. If the processing occurs inside a loop, the processing continues with the next record after the [SKIP Method \(Report, XMLport\)](devenv-SKIP-Method-Report-XMLport.md) is called.  

 A typical situation in which you will use SKIP is when you want to retrieve records from a related table by using values in the current record for forming a filter. If the values in the current record already indicate that no records from the related table will be retrieved, there is no need to perform this processing and you can use SKIP to avoid the processing.  

## Example  
 The following example shows how to use the [SKIP Method \(Report, XMLport\)](devenv-SKIP-Method-Report-XMLport.md) to skip processing the current record if the balance field of the record is zero. Processing of records will continue until a record that has a balance of 0 is encountered. This example requires that you create the following global variable.  

|Variable|DataType|  
|--------------|--------------|  
|Balance|Decimal|  

```  
IF Balance = 0 THEN  
  CurrReport.SKIP  
ELSE  
  ... // Do some processing.  
```  

## See Also  
 [OnAfterGetRecord \(Data Items\) Trigger](../triggers/devenv-OnAfterGetRecord-Data-Items-Trigger.md)   
 [OnAfterGetRecord \(XMLports\) Trigger](../triggers/devenv-OnAfterGetRecord-XMLports-Trigger.md)   
 [Report Data Type](../datatypes/devenv-Report-Data-Type.md)   
 [XMLport Data Type](../datatypes/devenv-XMLport-Data-Type.md)
