---
title: "Ascending Method"
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
# Ascending Method
Gets or sets the order in which the system searches through a table.

## Syntax
```
[Ascending := ]  Table.Ascending([Ascending: Boolean])
```
> [!NOTE]  
> This method can be invoked using property access syntax.  
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*Ascending*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
  


## Return Value
*Ascending*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example returns a value that indicates the current search order of the Customer table, to which MyRecord record belongs. The return value is stored in the *IsAscending* variable and displayed in a message box. In this example, the value **Yes** is displayed in the message box, which mean the search order is ascending. This is because the *SetAscending* parameter is not used. This example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|MyRecord|Record|Customer|  
|IsAscending|Boolean|Not applicable|  
  
|Text constant name|Data type|ENU value|  
|------------------------|---------------|---------------|  
|Text000|Text|Is the current sort order ascending?:  %1|  
  
```  
  
IsAscending := MyRecord.ASCENDING;  
MESSAGE(Text000, IsAscending);  
```  
  
## Example  
 The following example sets the current sort order to descending by setting the *SetAscending* parameter to **false**. The value displayed in the message box is **No**.  
  
```  
  
IsAscending := MyRecord.ASCENDING(FALSE);  
MESSAGE(Text000, IsAscending);  
```  
  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)