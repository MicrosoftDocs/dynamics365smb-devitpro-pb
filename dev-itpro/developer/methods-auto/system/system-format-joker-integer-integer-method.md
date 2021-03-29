---
title: "System.Format Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# System.Format Method
> **Version**: _Available or changed with runtime version 1.0._

Formats a value into a string.


## Syntax
```
String :=   System.Format(Value: Any [, Length: Integer] [, FormatNumber: Integer])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Value*  
&emsp;Type: [Any](../any/any-data-type.md)  
This is an AL variable (expression) of any simple data type, such as Option, Integer, BigInteger, Decimal, Char, Text, Code, Date, Time, DateTime, Boolean, or GUID. If, when the system formats Value, the result is a value larger than the maximum length MAXSTRLEN method (Code, Text) of String, a run-time error occurs.
          
*Length*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
This optional parameter specifies the length of String.  
*FormatNumber*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
This optional parameter specifies the format that you want to use.  


## Return Value
*String*
&emsp;Type: [String](../string/string-data-type.md)



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)