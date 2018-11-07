---
title: "CopyLinks Method"
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
# CopyLinks Method
Copies all the links from a specified record.

## Syntax
```
 Table.CopyLinks(var FromRecord: Table)
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*FromRecord*  
&emsp;Type: [Table](table-data-type.md)  
Specifies the record from which you want to copy links.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 Use this method to copy all the links from a specified record and paste the links to the current record.  
  
 The link can be a link to a website, a file stored on the local or on a remote computer, or a link to a page.  
  
## Example  
 The following example copies all the links from a record named SourceRecord to the record named DestRecord. This example requires that you create the following global variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|SourceRecord|Record|Customer|  
|DestRecord|Record|Customer|  
  
```  
  
DestRecord.COPYLINKS(SourceRecord);  
```  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)