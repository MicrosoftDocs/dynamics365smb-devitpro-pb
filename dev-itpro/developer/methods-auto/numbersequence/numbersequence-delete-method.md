---
title: "NumberSequence.Delete Method"
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
# NumberSequence.Delete Method
> **Version**: _Available or changed with runtime version 4.0._

Deletes a specific number sequence.


## Syntax
```
 NumberSequence.Delete(Name: String [, CompanySpecific: Boolean])
```
## Parameters
*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies the name of the number sequence.  
*CompanySpecific*  
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
