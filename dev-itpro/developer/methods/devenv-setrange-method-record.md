---
title: "SETRANGE Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 3aa14cb8-0dd7-4210-9d65-79be5e0eeb45
caps.latest.revision: 11
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SETRANGE Method (Record)
Sets a simple filter, such as a single range or a single value, on a field.  
  
## Syntax  
  
```  
  
Record.SETRANGE(Field [,FromValue] [,ToValue])  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record that contains the field that you want to filter.  
  
 *Field*  
 Type: Field  
  
 The field that you want to filter.  
  
 *FromValue*  
 Type: Any  
  
 The lower limit of the range. The data type of this parameter must match the data type of *Field*.  
  
 *ToValue*  
 Type: Any  
  
 The upper limit of the range. If you omit this parameter, then the value that you specified for *FromValue* is used. The data type of this parameter must match the data type of *Field*.  
  
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
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)