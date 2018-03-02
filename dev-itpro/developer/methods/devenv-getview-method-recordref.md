---
title: "GETVIEW Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 959dfa6f-0c30-43aa-b337-e433411fc8cc
caps.latest.revision: 9
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GETVIEW Method (RecordRef)
Returns a string that describes the current sort order, key, and filters on a table.  
  
## Syntax  
  
```  
  
String := RecordRef.GETVIEW([UseCaptions])  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that refers to the table.  
  
 If no table is selected, the method returns an empty string.  
  
 *UseCaptions*  
 Type: Boolean  
  
 If this parameter is **true** \(default\) or if it is empty, the returned string contains references to field captions in the table with which the record is associated. If this parameter is **false**, the returned string contains references to field numbers in the table with which the record is associated.  
  
 This parameter is optional.  
  
## Property Value/Return Value  
 Type: Text or code  
  
 The string format is the same as the [SourceTableView Property](../properties/devenv-SourceTableView-Property.md) on pages.  
  
## Remarks  
 If the [SETVIEW Method \(RecordRef\)](devenv-SETVIEW-Method-RecordRef.md) has been executed, the *String* parameter will return the value set by SETVIEW.  
  
 This method works the same way as the [GETVIEW Method \(Record\)](devenv-GETVIEW-Method-Record.md).  
  
## Example  
 The following example opens the Customer table as a RecordRef variable that is named RecRef. The RecRef variable uses the GETVIEW method to retrieve the field that the table is sorted on and stores the value in the varView variable. The Customer table does not have any filters and keys set so no filters or keys are displayed. The *UseCaptions* parameter is set to **true** so the name of the field is displayed. If you set the *UseCaptions* to **false**, the field number will be displayed. This example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|RecRef|RecordRef|  
|varView|Text|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|The current view of the table is: %1.|  
  
```  
  
RecRef.OPEN(DATABASE::Customer);  
varView := RecRef.GETVIEW(TRUE);  
MESSAGE(Text000, varView);  
```  
  
## See Also  
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)