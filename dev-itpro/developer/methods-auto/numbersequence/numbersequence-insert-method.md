---
title: "NumberSequence.Insert Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# NumberSequence.Insert Method
> **Version**: _Available from runtime version 4.0._

Creates a number sequence in the database, with the given parameters.


## Syntax
```
 NumberSequence.Insert(Name: String [, Seed: BigInteger] [, Increment: BigInteger] [, CompanySpecific: Boolean])
```
## Parameters
*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies the name of the number sequence.  
*Seed*  
&emsp;Type: [BigInteger](../biginteger/biginteger-data-type.md)  
Specifies the first value coming from the number sequence. Default is 0.  
*Increment*  
&emsp;Type: [BigInteger](../biginteger/biginteger-data-type.md)  
The increment value used for the number sequence. Default is 1.  
*CompanySpecific*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies if the number sequence is company-specific. Default is true.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example
The following example creates the number sequence `MyNumberSequence` that starts at zero and increments by a value of ten. The number series is not company specific.
 
```al
NumberSequence.Insert('MyNumberSequence', 0, 10, false);
```
## See Also
[NumberSequence Data Type](numbersequence-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)