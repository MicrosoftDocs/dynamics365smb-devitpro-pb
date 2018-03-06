---
title: "SKIP Function (Report, XMLport)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: f5c7657b-aaa5-4b2c-974d-ac2cd2fc3c9c
caps.latest.revision: 10
---
# SKIP Function (Report, XMLport)
Skips the current iteration of the current report or XMLport.  
  
## Syntax  
  
```  
  
Record.SKIP  
```  
  
## Remarks  
 The [SKIP Function \(Report, XMLport\)](SKIP-Function--Report--XMLport-.md) allows you to conditionally skip processing of the current report or XMLport. If the processing occurs inside a loop, the processing continues with the next record after the [SKIP Function \(Report, XMLport\)](SKIP-Function--Report--XMLport-.md) is called.  
  
 A typical situation in which you will use SKIP is when you want to retrieve records from a related table by using values in the current record for forming a filter. If the values in the current record already indicate that no records from the related table will be retrieved, there is no need to perform this processing and you can use SKIP to avoid the processing.  
  
## Example  
 The following example shows how to use the [SKIP Function \(Report, XMLport\)](SKIP-Function--Report--XMLport-.md) to skip processing the current record if the balance field of the record is zero. Processing of records will continue until a record that has a balance of 0 is encountered. This example requires that you create the following variable in the **C/AL Globals** window.  
  
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
 [OnAfterGetRecord \(Data Items\) Trigger](OnAfterGetRecord--Data-Items--Trigger.md)   
 [OnAfterGetRecord \(XMLports\) Trigger](OnAfterGetRecord--XMLports--Trigger.md)   
 [Report Data Type](Report-Data-Type.md)   
 [XMLport Data Type](XMLport-Data-Type.md)