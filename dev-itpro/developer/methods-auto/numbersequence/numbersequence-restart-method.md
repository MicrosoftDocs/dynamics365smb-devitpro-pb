---
title: "NumberSequence.Restart(Text [, BigInteger] [, Boolean]) Method"
description: "Restarts a number sequence."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# NumberSequence.Restart(Text [, BigInteger] [, Boolean]) Method
> **Version**: _Available or changed with runtime version 13.0._

Restarts a number sequence.


## Syntax
```AL
 NumberSequence.Restart(Name: Text [, Seed: BigInteger] [, CompanySpecific: Boolean])
```
## Parameters
*Name*  
&emsp;Type: [Text](../text/text-data-type.md)  
Specifies the name of the number sequence.  

*[Optional] Seed*  
&emsp;Type: [BigInteger](../biginteger/biginteger-data-type.md)  
Specifies the first value coming from the number sequence after the restart. Default is 0.  

*[Optional] CompanySpecific*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies if the number sequence is company-specific. Default is true.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[NumberSequence Data Type](numbersequence-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)