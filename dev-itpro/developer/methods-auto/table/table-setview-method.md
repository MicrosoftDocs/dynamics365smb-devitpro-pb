---
title: "SetView Method"
ms.author: solsen
ms.custom: na
ms.date: 10/17/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# SetView Method
Sets the current sort order, key, and filters on a table.

## Syntax
```
 Table.SetView(String: String)
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*String*  
&emsp;Type: [String](../string/string-data-type.md)  
A string that contains the sort order, key, and filter to set. The string format is the same as the SourceTableView Property on pages.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The value of the *String* parameter can be returned by the [GETVIEW Method \(Record\)](../../methods/devenv-getview-method-record.md).  
  
 If the **SETVIEW** method is executed with an empty string, all filters are removed and the primary key is used.  
  
## Example  
 The following code example uses the **SETVIEW** method to set the sort key to the Name field and the sort order to Ascending, and sets a filter that selects records with the No. field between 1000 and 2000 in the **Customer** table. The [GETVIEW Method \(Record\)](../../methods/devenv-getview-method-record.md) method retrieves the sort order, key, and filters that have been set and stores the value in the ViewString variable. The value in the ViewString variable is then displayed in a message box. This example requires that you create the following global variables.  
  
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
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)