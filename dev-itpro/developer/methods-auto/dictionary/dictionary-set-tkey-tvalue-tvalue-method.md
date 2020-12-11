---
title: "Dictionary.Set Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Dictionary.Set Method
> **Version**: _Available from runtime version 1.0._

Sets the value associated with the specified key.


## Syntax
```
[Replaced := ]  Dictionary.Set(Key: TKey, Value: TValue, var OldValue: TValue)
```
## Parameters
*Dictionary*
&emsp;Type: [Dictionary](dictionary-data-type.md)
An instance of the [Dictionary](dictionary-data-type.md) data type.

*Key*  
&emsp;Type: [TKey](dictionary-data-type.md)  
The key of the value to set.
        
*Value*  
&emsp;Type: [TValue](dictionary-data-type.md)  
The value that will be associated with the specified key.
        
*OldValue*  
&emsp;Type: [TValue](dictionary-data-type.md)  
The value that was previously associated with the specified key.  


## Return Value
*Replaced*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the Dictionary contained a value associated with the given key that was replaced with the new value, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Dictionary Data Type](dictionary-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)