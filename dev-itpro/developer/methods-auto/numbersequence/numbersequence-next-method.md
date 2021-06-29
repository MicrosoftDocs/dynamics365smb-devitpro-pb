---
title: "NumberSequence.Next Method"
description: "Retrieves the next value from the number sequence."
ms.author: solsen
ms.custom: na
ms.date: 05/31/2021
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
# NumberSequence.Next Method
> **Version**: _Available or changed with runtime version 4.0._

Retrieves the next value from the number sequence.


## Syntax
```
Next :=   NumberSequence.Next(Name: String [, CompanySpecific: Boolean])
```
## Parameters
*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies the name of the number sequence.  
*[Optional] CompanySpecific*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies if the number sequence is company-specific. Default is true.  


## Return Value
*Next*  
&emsp;Type: [BigInteger](../biginteger/biginteger-data-type.md)  
Returns the next value from number sequence.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example
The following example gets the next value in the number sequence `MyNumberSequence`. The number series is not company specific.
 
```al
number := NumberSequence.Next('MyNumberSequence', false);
```

## See Also
[NumberSequence Data Type](numbersequence-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)
