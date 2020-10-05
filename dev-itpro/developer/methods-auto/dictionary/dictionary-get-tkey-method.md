---
title: "Dictionary.Get Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
# Dictionary.Get Method
Gets the value associated with the specified key.


## Syntax
```
Value :=   Dictionary.Get(Key: TKey)
```
## Parameters
*Dictionary*  
&emsp;Type: [Dictionary](dictionary-data-type.md)  
An instance of the [Dictionary](dictionary-data-type.md) data type.  

*Key*  
&emsp;Type: [TKey](dictionary-data-type.md)  
The key of the value to get. If the specified key is not found an error will be reported.  


## Return Value
*Value*  
&emsp;Type: [TValue](dictionary-data-type.md)  
The value associated with the specified key. If the specified key is not found, an error will be raised.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Dictionary Data Type](dictionary-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)