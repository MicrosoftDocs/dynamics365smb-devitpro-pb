---
title: "ASCENDING Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: dfda4f72-f0c5-4c71-98ea-e59204110942
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# ASCENDING Method (RecordRef)
Changes or checks the order in which a search through the table that is referred to by RecordRef will be performed.  
  
## Syntax  
  
```  
  
[IsAscending :=] RecordRef.ASCENDING([SetAscending])  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 *SetAscending*  
 Type: Boolean  
  
 Determines the order of the search.  
  
 If this parameter is **true**, it will search in ascending order. If this parameter is **false**, it will search in descending order. If you do not specify this parameter, it will check the search order.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 Specifies the order in which a search will be performed.  
  
## Remarks  
 This method works just like the [ASCENDING Method \(Record\)](devenv-ASCENDING-Method-Record.md).  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named CustomerRecref. The [SETVIEW Method \(RecordRef\)](devenv-SETVIEW-Method-RecordRef.md) sets a filter that includes sorting the data in ascending order. The ASCENDING method then checks whether the sort order is ascending, stores the return value in the IsAscending variable and displays **Yes** in a message box. This example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|CustomerRecref|RecordRef|  
|IsAscending|Boolean|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|Is the sort order ascending?  %1|  
  
```  
CustomerRecref.OPEN(18);  
CustomerRecref.SETVIEW('SORTING(Name) ORDER(Ascending) WHERE(No.=CONST(10000..20000))');  
IsAscending := CustomerRecref.ASCENDING;  
MESSAGE(Text000, IsAscending);  
```  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named CustomerRecref. The [SETVIEW Method \(RecordRef\)](devenv-SETVIEW-Method-RecordRef.md) sets a filter that includes sorting the data in descending order. The ASCENDING method then checks whether the sort order is ascending, stores the return value in the IsAscending variable and displays **No** in a message box because the sort order is descending. The ASCENDING method changes the sort order to ascending by setting the *SetAscending* parameter to **true**. The ASCENDING method checks the sort order again. This time **Yes** is displayed.  
  
```  
CustomerRecref.OPEN(18);  
CustomerRecref.SETVIEW('SORTING(Name) ORDER(Descending) WHERE(No.=CONST(10000..20000))');  
IsAscending := CustomerRecref.ASCENDING;  
MESSAGE(Text000, IsAscending);  
IsAscending := CustomerRecref.ASCENDING(TRUE);  
MESSAGE(Text000, IsAscending);  
```  
  
## See Also  
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)