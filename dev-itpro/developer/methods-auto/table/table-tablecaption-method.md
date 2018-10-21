---
title: "TableCaption Method"
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
# TableCaption Method
Gets the current caption of a table as a string.

## Syntax
```
Caption :=   Table.TableCaption()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

## Return Value
*Caption*  
&emsp;Type: [String](../string/string-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 **TABLECAPTION** returns the caption of a table. **TABLECAPTION** first looks for a [CaptionML Property](../../properties/devenv-captionml-property.md). If it does not find one, it uses the [Name Property](../../properties/devenv-name-property.md). This means that **TABLECAPTION** has multilanguage functionality.  
  
## Example  
 The following example retrieves the caption of the **Customer** table by using the CustomerRec variable, a record from the **Customer** table. The value of the **Customer** table caption is stored in the TableCaption variable and displayed in a message box. The value that is displayed is Customer. This example requires that you create the following global variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  
|TableCaption|Text|Not applicable|  
  
```  
TableCaption := CustomerRec.TABLECAPTION;  
MESSAGE('The caption for the customer table is: %1', TableCaption);  
```  
  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)