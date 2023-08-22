---
title: "NumberSequence.Exists(Text [, Boolean]) Method"
description: "Checks whether a specific number sequence exists."
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
# NumberSequence.Exists(Text [, Boolean]) Method
> **Version**: _Available or changed with runtime version 4.0._

Checks whether a specific number sequence exists.


## Syntax
```AL
Exists :=   NumberSequence.Exists(Name: Text [, CompanySpecific: Boolean])
```
## Parameters
*Name*  
&emsp;Type: [Text](../text/text-data-type.md)  
Specifies the name of the number sequence.  

*[Optional] CompanySpecific*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies if the number sequence is company-specific. Default is true.  


## Return Value
*Exists*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Returns true if the number sequence exists.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example
The following example checks whether the number sequence `MyNumberSequence` exists, and if so, it deletes it.
 
```al
if NumberSequence.Exists('MyNumberSequence', false) then
    NumberSequence.Delete('MyNumberSequence', false);
```
## See Also
[NumberSequence Data Type](numbersequence-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)