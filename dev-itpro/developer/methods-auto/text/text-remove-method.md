---
title: "Text.Remove(Integer [, Integer]) Method"
description: "Returns a new Text in which a specified number of characters from the current string are deleted."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# Text.Remove(Integer [, Integer]) Method
> **Version**: _Available or changed with runtime version 1.0._

Returns a new Text in which a specified number of characters from the current string are deleted.


## Syntax
```AL
Result :=   Text.Remove(StartIndex: Integer [, Count: Integer])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Text*  
&emsp;Type: [Text](text-data-type.md)  
An instance of the [Text](text-data-type.md) data type.  

*StartIndex*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The one-based position to begin deleting characters.
        
*[Optional] Count*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of characters to delete.  


## Return Value
*Result*  
&emsp;Type: [Text](text-data-type.md)  
The end result Text.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Text Data Type](text-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)