---
title: "Dictionary.ContainsKey(TKey) Method"
description: "Determines whether the Dictionary contains the specified key."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Dictionary.ContainsKey(TKey) Method
> **Version**: _Available or changed with runtime version 1.0._

Determines whether the Dictionary contains the specified key.


## Syntax
```AL
Ok :=   Dictionary.ContainsKey(Key: TKey)
```
## Parameters
*Dictionary*  
&emsp;Type: [Dictionary](dictionary-data-type.md)  
An instance of the [Dictionary](dictionary-data-type.md) data type.  

*Key*  
&emsp;Type: [TKey](dictionary-data-type.md)  
The key to locate in the Dictionary.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the Dictionary contains an element with the specified key, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[Dictionary Data Type](dictionary-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)