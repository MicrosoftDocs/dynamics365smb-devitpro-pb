---
title: "Label.StrCheckSum(Text [, Text] [, Integer]) Method"
description: "Calculates a checksum for a string that contains a number."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Label.StrCheckSum(Text [, Text] [, Integer]) Method
> **Version**: _Available or changed with runtime version 15.0._

Calculates a checksum for a string that contains a number. If the source is empty, 0 is returned. Each char in the source and in the weight must be a numeric character 0-9, otherwise an exception is thrown. If the WeightString parameter is shorter then the source, it is padded with '1' up until the length of source. If the WeightString parameter is longer than the source, an exception is thrown.


## Syntax
```AL
CheckNumber :=   Label.StrCheckSum(String: Text [, WeightString: Text] [, Modulus: Integer])
```
## Parameters
*String*  
&emsp;Type: [Text](../text/text-data-type.md)  
This string contains the number for which you want to calculate a checksum. You can only enter the numeric characters 0-9 in this string. If you enter anything else, a run-time error will occur. If String is empty, 0 is returned.  

*[Optional] WeightString*  
&emsp;Type: [Text](../text/text-data-type.md)  
This string contains numbers that you want to use as weights when calculating the checksum. The default value is a string that contains STRLEN(String) '1'-characters.  

*[Optional] Modulus*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number that you want to use in the checksum formula. The default value is 10.  


## Return Value
*CheckNumber*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The resulting checksum value.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[Label data type](label-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)