---
title: "SetRange Method"
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
# SetRange Method
Sets a simple filter, such as a single range or a single value, on a field.

## Syntax
```
 Table.SetRange(Field: Any, [FromValue: Any], [ToValue: Any])
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
The field that you want to filter.
          
*FromValue*  
&emsp;Type: [Any](../any/any-data-type.md)  
The lower limit of the range. The data type of this parameter must match the data type of Field.
          
*ToValue*  
&emsp;Type: [Any](../any/any-data-type.md)  
The upper limit of the range. If you omit this parameter, then the value that you specified for FromValue is used. The data type of this parameter must match the data type of Field.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 **SETRANGE** is a quick way to set a simple filter on a field.  
  
 **SETRANGE** removes any filters that were set previously and replaces them with the *FromValue* and *ToValue* parameters that you specify.  
  
 If you use **SETRANGE** without setting the *FromValue* and *ToValue* parameters, then the method removes any filters that are already set.  
  
 If you set only the *FromValue*, then the *ToValue* is set to the same value as the *FromValue*.  
  
## Example  
 This example shows how to use the **SETRANGE** method to specify that you want to see only customers 100 through 200. This example requires that you create the following global variable.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  
  
```  
CustomerRec.SETRANGE("No.", '100', '200');  
// The above statement is a quick way to set the same filter as:  
CustomerRec.SETFILTER("No.", '>=100&<=200');   
```  
  
## Example  
 This example shows how to find the first record that has a blank for the requested delivery date. It requires that you create the following variable.  
  
|Name|Data type|Subtype|  
|----------|---------------|-------------|  
|SalesLineRec|Record|Sales Line|  
  
```  
SalesLineRec.SETRANGE("Requested Delivery Date",0D);  
IF SalesLineRec.FIND('-') THEN  
  MESSAGE('Sales Order %1 has no requested delivery date.', SalesLineRec."Document No.");  
```  
  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)