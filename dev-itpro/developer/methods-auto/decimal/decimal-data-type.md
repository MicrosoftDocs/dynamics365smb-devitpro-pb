---
title: "Decimal Data Type"
description: "Denotes decimal numbers ranging from -999,999,999,999,999.99 to +999,999,999,999,999.99."
ms.author: solsen
ms.custom: na
ms.date: 07/13/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Decimal Data Type
> **Version**: _Available or changed with runtime version 1.0._

Denotes decimal numbers ranging from -999,999,999,999,999.99 to +999,999,999,999,999.99.




[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example 1

The following are examples of decimal values.  

```
546.88  
3425.57  
```  

## Example 2

 The following is not a decimal, but rather an [Integer Data Type](../library.md).  

```
342  
```  

## Limits on Decimal Data Type Variables  

The Decimal data type is mapped to the Microsoft .NET Framework common language runtime \(CLR\) Decimal data type, which controls and the precision and limits for variables.  

The following table shows the limits for variables of type `Decimal`.  

|Limit|Value|
|-----------|------------------------------|  
|Maximum format value.<br /><br /> This is the maximum value that can be:<br /><br /> -   Formatted into a TEXT variable by the Format function.<br />-   Input from the UI or XMLPorts.<br />-   Assigned directly in source code.|+/- 999,999,999,999,999.99|
|Maximum field data type value.<br /><br /> This is the maximum value that a field variable in a record can hold while not being persisted.|+/- 999,999,999,999,999.99| 
|Maximum persisted value.<br /><br /> This is the maximum value that can be stored in the database.|Can read previous stored values but cannot store values outside the formatting range since field variables cannot be assigned values outside the formatting range.|
|Maximum calculating value.<br /><br /> This is the maximum value that can be calculated by code statements while not assigning to a field variable, storing to the database, or formatting to a text variable.|+/- 79,228,162,514,264,337,593,543,950,335|
|Scaling factor (digits after decimal point) for calculating values|28<br /><br />For example, 7.9228162514264337593543950335|  


The maximum safe value that will work on all Business Central versions of is +/- 999,999,999,999,999.99.

It is possible to assign to a variable the maximum value that can be formatted and then multiply that variable by a large positive number, thereby generating a greater value. However, we do not recommend doing this. If you do, you will get errors if you attempt to format this variable to a text variable or assign the variable to a field variable in a record.
 
## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)