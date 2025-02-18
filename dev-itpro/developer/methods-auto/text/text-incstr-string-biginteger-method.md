---
title: "Text.IncStr(Text, BigInteger) Method"
description: "Increases the last positive number or decreases the last negative number inside a string by the provided positive increment."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Text.IncStr(Text, BigInteger) Method
> **Version**: _Available or changed with runtime version 15.0._

Increases the last positive number or decreases the last negative number inside a string by the provided positive increment.


## Syntax
```AL
NewString :=   Text.IncStr(String: Text, Increment: BigInteger)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*String*  
&emsp;Type: [Text](text-data-type.md)  
The string that you want to increase or decrease.  

*Increment*  
&emsp;Type: [BigInteger](../biginteger/biginteger-data-type.md)  
The increment value. Only values from 1 to the max value of type BigInteger are supported.  


## Return Value
*NewString*  
&emsp;Type: [Text](text-data-type.md)  
The incremented string.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Text data type](text-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)