---
title: "SETRECFILTER Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 0a805d73-ce3a-45d4-914e-6a7d6edf80d2
caps.latest.revision: 11
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SETRECFILTER Method (Record)
Sets the values in the current key of the current record as a record filter.  
  
## Syntax  
  
```  
  
Record.SETRECFILTER  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 Specifies the current record for which you want to set the filter.  
  
## Example  
 You can use this method to set a filter on a table before you run a report. Enter AL code similar to the following example in the [OnAction Trigger](../triggers/devenv-OnAction-Trigger.md) of an action on a page. When the code is triggered, the current key fields of the current record in the page will be used as a filter when the report is run.  
  
 This example requires that you create the following global variable.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  
  
```  
CustomerRec.SETRECFILTER;  
REPORT.RUN(REPORT::"111",FALSE,FALSE,CustomerRec);   
```  
  
## See Also  
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)