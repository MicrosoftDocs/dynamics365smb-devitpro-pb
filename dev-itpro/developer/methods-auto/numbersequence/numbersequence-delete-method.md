---
title: "NumberSequence.Delete(Text [, Boolean]) Method"
description: "Deletes a specific number sequence."
ms.author: solsen
ms.custom: na
ms.date: 03/24/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# NumberSequence.Delete(Text [, Boolean]) Method
> **Version**: _Available or changed with runtime version 4.0._

Deletes a specific number sequence.


## Syntax
```AL
 NumberSequence.Delete(Name: Text [, CompanySpecific: Boolean])
```
## Parameters
*Name*  
&emsp;Type: [Text](../text/text-data-type.md)  
Specifies the name of the number sequence.  

*[Optional] CompanySpecific*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies if the number sequence is company-specific. Default is true.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example
The following example checks whether the number sequence `MyNumberSequence` exists, and if so, it deletes it.
 
```al
if NumberSequence.Exists('MyNumberSequence', false) then
    NumberSequence.Delete('MyNumberSequence', false);
```
## See Also
[NumberSequence Data Type](numbersequence-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)