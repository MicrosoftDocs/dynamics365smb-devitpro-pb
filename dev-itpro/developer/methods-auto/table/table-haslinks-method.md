---
title: "HasLinks Method"
ms.author: solsen
ms.custom: na
ms.date: 11/02/2018
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
# HasLinks Method
Determines whether a record contains any links.

## Syntax
```
Ok :=   Table.HasLinks()
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

## Remarks  
 The link can be a link to a web site, a file stored on the local or on a remote computer, or a link to a page of your application.  

## Example  
 The following code example retrieves record number 10000 from the Vendor table and stores it in the MyRecord variable. The HASLINKS method determines whether the record contains one or more links. Record number 10000 contains one link so the varHasLink variable displays **Yes**. This example requires that you create the following global variables.  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|MyRecord|Record|Vendor|  
|varHasLinks|Boolean|Not applicable|  

```  

MyRecord.GET('10000');  
varHasLinks := MyRecord.HASLINKS;  
MESSAGE('Does this record have one or more links: %1', varHasLinks);  
```  


## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)