---
title: "GETFILTERS Function (RecordRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 59e65d40-c8e0-4a56-a737-b76f2cbe22ac
caps.latest.revision: 10
manager: edupont
---
# GETFILTERS Function (RecordRef)
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
 This function works just like the [GETFILTERS Function \(Record\)](GETFILTERS-Function--Record-.md).  
  
## Property Value/Return Value  
 Filters that have been applied to the table that is referred to by the *RecordRef* parameter.  
  
## Example  
 The following example opens a table as a RecorRef variable. The variable, RecRef, is used with the GETFILTERS function to retrieve the filters that are applied in the Customer table. If filters are applied, they will be stored in the Filters1 variable. The Filters1 variable does not contain any filters because filters have not been set. Then the [SETRECFILTER Function \(RecordRef\)](SETRECFILTER-Function--RecordRef-.md) is used to set the value in the current key of the current record as a filter. The variable Filters2 will now contain No. as a filter. The example requires that you create the following variables and text constant in the **C/AL Globals** window.  
  
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
 [RecordRef Data Type](RecordRef-Data-Type.md)