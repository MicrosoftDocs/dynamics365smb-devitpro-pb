---
title: "FieldNo Method"
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
# FieldNo Method
Gets the number assigned to a field in the table description.

## Syntax
```
Number :=   Table.FieldNo(Field: Any)
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
The name of the field in the record.
          


## Return Value
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 This example requires that you create the following variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|Num|Integer|Not applicable|  
|CustomerRec|Record|Customer|  
  
```  
Num := CustomerRec.FIELDNO("No.");  
```  
  
 This statement assigns the number of the No. field in the CustomerRec record to the number variable.  
  
## Example  
 In this example, the **FIELDNO** method is used to determine which field that a variable, which contains a field number, points to in a record. This example requires that you create the following variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CurrentFieldNo|Integer|Not applicable|  
|CustomerRec|Record|Customer|  
  
```  
CASE CurrentFieldNo OF  
  Customer.FIELDNO("No."):   
    ...  
  Customer.FIELDNO(Name):   
    ...  
  Customer.FIELDNO(Address):  
    ...  
  ELSE  
    ...  
END;  
```  
  
 This construct allows you to take actions based on the field number contained in the CurrentFieldNo variable.  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)