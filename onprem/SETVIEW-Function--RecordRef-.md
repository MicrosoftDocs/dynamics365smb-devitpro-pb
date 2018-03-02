---
title: "SETVIEW Function (RecordRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 546dbac6-6660-4718-9bc1-32d2eec73d17
caps.latest.revision: 12
manager: edupont
---
# SETVIEW Function (RecordRef)
Sets the current sort order, key, and filters on a table.  
  
## Syntax  
  
```  
  
RecordRef.SETVIEW(String)  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that refers to the table on which you want to set the current sort order, key, and filters.  
  
 *String*  
 Type: Text or code  
  
 The string format is the same as the [SourceTableView Property](SourceTableView-Property.md) on pages.  
  
## Remarks  
 The value of the *String* parameter can be returned by the [GETVIEW Function \(RecordRef\)](GETVIEW-Function--RecordRef-.md).  
  
 If the SETVIEW function is executed with an empty string, all the filters are removed and the primary key is used.  
  
 If no table is selected, the SETVIEW function fails.  
  
 This function works the same as the [SETVIEW Function \(Record\)](SETVIEW-Function--Record-.md).  
  
## Example  
 The following example opens the Customer \(18\) table as a RecordRef variable that is named CustomerRecRef. The SETVIEW function sets the sort key to the Name field, sort order to Ascending and sets a filter that selects records between 1000 and 2000. The [GETVIEW Function \(RecordRef\)](GETVIEW-Function--RecordRef-.md) retrieves the sort order, key and filters that have been set and stores the value in the ViewString variable. The value in the ViewString variable is displayed in a message box. This example requires that you create the following variables and text constant in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|CustomerRecRef|RecordRef|  
|ViewString|Text|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|The following is the current sort order, key, and filters that are set: %1|  
  
```  
  
CustomerRecRef.OPEN(18);  
CustomerRecRef.SETVIEW('SORTING(Name) ORDER(Ascending) WHERE(No.=CONST(10000..20000))');  
ViewString := CustomerRecRef.GETVIEW;  
MESSAGE(Text000, ViewString);  
  
```  
  
## See Also  
 [RecordRef Data Type](RecordRef-Data-Type.md)