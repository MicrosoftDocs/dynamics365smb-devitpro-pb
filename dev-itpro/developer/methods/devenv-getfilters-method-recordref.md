---
title: "GETFILTERS Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 59e65d40-c8e0-4a56-a737-b76f2cbe22ac
caps.latest.revision: 10
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GETFILTERS Method (RecordRef)
Determines which filters have been applied to the table referred to by the RecordRef.  
  
## Syntax  
  
```  
  
String := RecordRef.GETFILTERS  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef to use to identify the record in the table on which filters may have been applied.  
  
## Remarks  
 This method works just like the [GETFILTERS Method \(Record\)](devenv-GETFILTERS-Method-Record.md).  
  
## Property Value/Return Value  
 Filters that have been applied to the table that is referred to by the *RecordRef* parameter.  
  
## Example  
 The following example opens a table as a RecorRef variable. The variable, RecRef, is used with the GETFILTERS method to retrieve the filters that are applied in the Customer table. If filters are applied, they will be stored in the Filters1 variable. The Filters1 variable does not contain any filters because filters have not been set. Then the [SETRECFILTER Method \(RecordRef\)](devenv-SETRECFILTER-Method-RecordRef.md) is used to set the value in the current key of the current record as a filter. The variable Filters2 will now contain No. as a filter. The example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|RecRef|RecordRef|  
|Filters1|Text|  
|Filters2|Text|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|Filters1 contains : %1  Filters2 contains: %2|  
  
```  
  
RecRef.OPEN(DATABASE::Customer);  
Filters1 := RecRef.GETFILTERS;  
RecRef.SETRECFILTER;  
Filters2 := RecRef.GETFILTERS;  
MESSAGE(Text000, Filters1, Filters2);  
```  
  
## See Also  
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)