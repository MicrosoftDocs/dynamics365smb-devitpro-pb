---
title: "Format Method"
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
# Format Method
Formats a value into a string.

## Syntax
```
String :=   System.Format(Value: Any, Length: Integer, FormatString: String)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Value*  
&emsp;Type: [Any](../any/any-data-type.md)  
This is an AL variable (expression) of any simple data type, such as Option, Integer, BigInteger, Decimal, Char, Text, Code, Date, Time, DateTime, Boolean, or GUID. If, when the system formats Value, the result is a value larger than the maximum length MAXSTRLEN function (Code, Text) of String, a run-time error occurs.
          
*Length*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
This optional parameter specifies the length of String.
        
*FormatString*  
&emsp;Type: [String](../string/string-data-type.md)  
A literal string that defines a format as in the Format Property.  


## Return Value
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)