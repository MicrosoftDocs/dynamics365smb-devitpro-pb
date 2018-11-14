---
title: "CurrentCompany Method"
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
# CurrentCompany Method
Gets the current company of a database table record.

## Syntax
```
Company :=   Table.CurrentCompany()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

## Return Value
*Company*  
&emsp;Type: [String](../string/string-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example returns the current company that is used in the **Customer** table and displays it in a message box. The MyRecord record is from the **Customer** table. This example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|MyRecord|Record|Customer|  
|CurrentCompany|Text||  
  
|Text constant name|ConstValue|  
|------------------------|----------------|  
|Text000|The current company is: %1|  
  
```  
CurrentCompany := MyRecord.CURRENTCOMPANY;  
MESSAGE(Text000, CurrentCompany);  
```  
  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)