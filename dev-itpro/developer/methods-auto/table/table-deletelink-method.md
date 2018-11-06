---
title: "DeleteLink Method"
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
# DeleteLink Method
Deletes a specified link from a record in a table.

## Syntax
```
 Table.DeleteLink(ID: Integer)
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*ID*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the link to delete.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 When you add a link to a page or a table, an entry is created in the **Record Link** system table. Each entry is given an ID.  
  
## Example  
 The following example removes the link that has link ID 20 from the MyRecord record \(record number 30000\) in the **Vendor** table. This example requires that you create the following global variable.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|MyRecord|Record|Vendor|  
  
```  
MyRecord.GET('30000')  
MyRecord.DELETELINK(20)  
```  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)