---
title: "HasFilter Method"
ms.author: solsen
ms.custom: na
ms.date: 11/06/2018
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
# HasFilter Method
Determines whether a filter is attached to a record within the current filter group.

## Syntax
```
Ok :=   Table.HasFilter()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example uses the **HASFILTER** method to determine whether the **Customer** table that contains the MyRecord record has a filter. The method returns **No** because the MyRecord record has no filters. The return value is displayed in a message box. The [SETFILTER Method \(Record\)](../../methods/devenv-setfilter-method-record.md) is then used to set a filter for the table. This time, the return value is **Yes** because the table now has a filter. This example requires that you create the following global variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|MyRecord|Record|Customer|  
|HasFilter|Boolean|Not applicable|  
  
```  
HasFilter := MyRecord.HASFILTER;  
MESSAGE('Does this record have a filter? %1', HasFilter);  
MyRecord.SETFILTER("No.", '100..200');  
HasFilter := MyRecord.HASFILTER;  
MESSAGE('Does this record have a filter? %1', HasFilter);  
```  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)