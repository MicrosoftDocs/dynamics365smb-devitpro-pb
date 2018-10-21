---
title: "FieldCaption Method"
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
# FieldCaption Method
Gets the current caption of the specified field as a string.

## Syntax
```
Caption :=   Table.FieldCaption(Field: Any)
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
The field for which you want to retrieve the caption.
          


## Return Value
*Caption*  
&emsp;Type: [String](../string/string-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The **FIELDCAPTION** method returns the caption of a specified field. **FIELDCAPTION** searches for a [CaptionML Property](../properties/devenv-CaptionML-Property.md). If none is found, the [Name Property](../properties/devenv-Name-Property.md) is used. This means that **FIELDCAPTION** has multilanguage functionality.  
  
## Example  
 The following example uses the **FIELDCAPTION** method to retrieve the caption of the Address 2 field in the **Customer** table. The method stores the retrieved caption in the varFieldCaption variable and displays it in a message box. In this **Customer** table, the field name is the same as the caption so the value Address 2 is displayed for the caption. If you change the caption for Address 2 in the Address 2 property window, then the new caption will be displayed. This example requires that you create the following global variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|MyRecord|Record|Customer|  
|varFieldCaption|Text|Not applicable|  
  
```  
varFieldCaption := MyRecord.FIELDCAPTION("Address 2");  
MESSAGE(varFieldCaption);  
```  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)