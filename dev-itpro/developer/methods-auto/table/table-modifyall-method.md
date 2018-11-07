---
title: "ModifyAll Method"
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
# ModifyAll Method
Modifies a field in all records within a range that you specify.

## Syntax
```
 Table.ModifyAll(Field: Any, NewValue: Any, [RunTrigger: Boolean])
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
The field that you want to modify.
          
*NewValue*  
&emsp;Type: [Any](../any/any-data-type.md)  
The value that you want to assign to Field in all records. The data type of NewValue must match the data type of Field.
          
*RunTrigger*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
If this parameter is true, the code in the OnModify Trigger is executed. If this parameter is false (default), the code in the OnModify trigger is not executed.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If no filter is set, the field is modified in all records in the table. If a filter is set, the fields are modified only in the records which fall within the range specified by the filter.  
  
 The [OnValidate \(Fields\) Trigger](../../triggers/devenv-onvalidate-fields-trigger.md) is never executed when MODIFYALL is used.  
  
## Example  
 This example requires that you create the following global variable.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  
  
```  
// The result of this statement:  
CustomerRec.MODIFYALL("Statistics Group", 2);  
// is equivalent to:  
IF CustomerRec.FIND('-') THEN   
  REPEAT  
    CustomerRec."Statistics Group" := 2;  
    CustomerRec.MODIFY;  
  UNTIL CustomerRec.NEXT = 0;  
```  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)