---
title: "TestField Method"
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
# TestField Method
Tests whether the contents of a field match a given value.

## Syntax
```
 Table.TestField(Field: Any, Value: Any)
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
The field that you want to test.
          
*Value*  
&emsp;Type: [Any](../any/any-data-type.md)  
The value that you want to compare to Field. The data type of this parameter must match the data type of Field. If you include this optional parameter and the contents of Field do not match, then an error message is displayed. If you omit this parameter and the contents of Field is zero or blank (empty string), then an error message is displayed.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If the contents of the field differ from the given value, then an error message is displayed.  
  
## Example  
 This example shows how to use the **TESTFIELD** method without the *Value* parameter. This example requires that you create the following global variable.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  
  
```  
CustomerRec."No." := '';  
CustomerRec.TESTFIELD("No.")  
```  
  
 The following error message is displayed:  
  
 **You must specify No. in Customer No.=''.**  
  
## Example  
 This example shows how to use the **TESTFIELD** method with the *Value* parameter. This example requires that you create the following global variable.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  
  
```  
CustomerRec."No." := 'AAA 1050';  
CustomerRec.TESTFIELD("No.",'1000')  
```  
  
 If No. is not 1000, then the following message is displayed:  
  
 **No. must be 1000 in Customer No.='AAA 1050'.**  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)