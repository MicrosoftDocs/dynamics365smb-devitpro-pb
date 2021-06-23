---
title: "Dictionary.ContainsKey Method"
description: "Determines whether the Dictionary contains the specified key."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# Dictionary.ContainsKey Method
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
## See Also
[Dictionary Data Type](dictionary-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)