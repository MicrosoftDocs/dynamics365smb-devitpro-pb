---
title: "FieldActive Method"
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
# FieldActive Method
Checks whether a field is enabled.

## Syntax
```
Ok :=   Table.FieldActive(Field: Any)
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
The field that you want to check.
          


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 Each field in a record can be set as enabled or disabled in the table description. You cannot use a disabled field because disabled fields cannot contain data.  

## Example  
 This example requires that you create the following global variable and text constants.  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  

|Text constant name|ENU value|  
|------------------------|---------------|  
|Text000|Atlanta|  
|Text001|The field is not marked as enabled.|  

```  
CustomerRec."Address 2" := Text000;  
// If the Address 2 field has not been marked as enabled, then this   
// statement causes a run-time error.  
// You can avoid this error by performing the following test.  
IF CustomerRec.FIELDACTIVE("Address 2") THEN  
  CustomerRec."Address 2" := Text000  
ELSE  
  MESSAGE(Text001);  
```  


## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)