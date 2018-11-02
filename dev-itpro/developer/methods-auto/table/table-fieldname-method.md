---
title: "FieldName Method"
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
# FieldName Method
Gets the name of a field as a string.

## Syntax
```
Name :=   Table.FieldName(Field: Any)
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
The name of the field in the record.
          


## Return Value
*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The [FIELDCAPTION Method \(Record\)](../../methods/devenv-fieldcaption-method-record.md) retrieves the [Caption Property](../../properties/devenv-caption-property.md) of a field. If you want to enable your application for multilanguage functionality now or in the future, you must use the **FIELDCAPTION** method instead of the **FIELDNAME** method.  

## Example  
 This example requires that you create the following variables.  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|NameOfField|Text|Not applicable|  
|CustomerRec|Record|Customer|  

```  
NameOfField := CustomerRec.FIELDNAME("No.");  
```  

 The name of the field is stored in a string.  

 The advantage of using this statement instead of `Name := 'No.';` is that using the **FIELDNAME** method dynamically adapts to any change to the field name made in the development system. The statement `Name := 'No.';` performs a static assignment.  


## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)