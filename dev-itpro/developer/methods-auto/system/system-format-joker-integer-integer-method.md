---
title: "System.Format(Any [, Integer] [, Integer]) Method"
description: "Formats a value into a string."
ms.author: solsen
ms.custom: na
ms.date: 03/02/2023
ms.reviewer: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# System.Format(Any [, Integer] [, Integer]) Method
> **Version**: _Available or changed with runtime version 1.0._

Formats a value into a string.


## Syntax
```AL
String :=   System.Format(Value: Any [, Length: Integer] [, FormatNumber: Integer])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Value*  
&emsp;Type: [Any](../any/any-data-type.md)  
This is an AL variable (expression) of any simple data type, such as Option, Integer, BigInteger, Decimal, Char, Text, Code, Date, Time, DateTime, Boolean, or GUID. If, when the system formats Value, the result is a value larger than the maximum length MAXSTRLEN method (Code, Text) of String, a run-time error occurs.  

*[Optional] Length*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
This optional parameter specifies the length of String.  

*[Optional] FormatNumber*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
This optional parameter specifies the format that you want to use.  


## Return Value
*String*  
&emsp;Type: [Text](../text/text-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The *FormatNumber* parameter specifies the format that you want to use. The basic options for the Decimal data type are as follows:  

- <*Sign*><*Integer Thousand*><*Decimals*> is Format 0  
- <*Sign*><*Integer*><*Decimals*> is Format 1  
- <*Sign*><*Integer*><*Decimals*><*Comma*,.> is Format 2  
- <*Integer Thousand*><*Decimals*><*Sign,1*> is Format 3  
- <*Integer*><*Decimals*><*Sign,1*> is Format 4  


For more information, see [Formatting Values, Dates, and Time](../../devenv-format-property.md)).

## See also

[System Data Type](system-data-type.md)  
[Get started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)
