---
title: "SETVIEW Function (Record)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1e9c06f7-3c47-4bad-a58a-c8aeeeda121f
caps.latest.revision: 12
manager: edupont
---
# SETVIEW Function (Record)
Sets the current sort order, key, and filters on a table.  
  
## Syntax  
  
```  
  
Record.SETVIEW(String)  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record in the table for which to set the sort order, key, and filters.  
  
 *String*  
 Type: Text or code  
  
 A string that contains the sort order, key, and filter to set.  
  
 The string format is the same as the [SourceTableView Property](SourceTableView-Property.md) on pages.  
  
## Remarks  
 The value of the *String* parameter can be returned by the [GETVIEW Function \(Record\)](GETVIEW-Function--Record-.md).  
  
 If the **SETVIEW** function is executed with an empty string, all filters are removed and the primary key is used.  
  
## Example  
 The following code example uses the **SETVIEW** function to set the sort key to the Name field and the sort order to Ascending, and sets a filter that selects records with the No. field between 1000 and 2000 in the **Customer** table. The [GETVIEW Function \(Record\)](GETVIEW-Function--Record-.md) function retrieves the sort order, key, and filters that have been set and stores the value in the ViewString variable. The value in the ViewString variable is then displayed in a message box. This example requires that you create the following variables in the **C/AL Globals** window.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  
|ViewString|Text|Not applicable|  
  
```  
CustomerRec.SETVIEW('SORTING(Name) ORDER(Ascending) WHERE(No.=CONST(10000..20000))');  
ViewString := CustomerRec.GETVIEW;  
MESSAGE('The string:%1', ViewString)  
```  
  
## See Also  
 [Record Data Type](Record-Data-Type.md)