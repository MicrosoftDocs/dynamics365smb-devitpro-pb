---
title: "NumberSequence.Range(Text, Integer [, Boolean]) Method"
description: "Retrieves a range of values from the number sequence."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# NumberSequence.Range(Text, Integer [, Boolean]) Method
> **Version**: _Available or changed with runtime version 13.0._

Retrieves a range of values from the number sequence.


## Syntax
```AL
RangeStart :=   NumberSequence.Range(Name: Text, Count: Integer [, CompanySpecific: Boolean])
```
## Parameters
*Name*  
&emsp;Type: [Text](../text/text-data-type.md)  
Specifies the name of the number sequence.  

*Count*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies the number of sequence values to retrieve.  

*[Optional] CompanySpecific*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies if the number sequence is company-specific. Default is true.  


## Return Value
*RangeStart*  
&emsp;Type: [BigInteger](../biginteger/biginteger-data-type.md)  
Returns the start of the range from the number sequence.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[NumberSequence Data Type](numbersequence-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)