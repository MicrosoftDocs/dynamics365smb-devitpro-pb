---
title: "Text.PadLeft Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# Text.PadLeft Method
> **Version**: _Available from runtime version 1.0._

Returns a new Text that right-aligns the characters in this instance by padding them on the left, for a specified total length.


## Syntax
```
Result :=   Text.PadLeft(Count: Integer [, Char: Char])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Text*
&emsp;Type: [Text](text-data-type.md)
An instance of the [Text](text-data-type.md) data type.

*Count*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of characters in the resulting string, equal to the number of original characters plus any additional padding characters.
        
*Char*  
&emsp;Type: [Char](../char/char-data-type.md)  
A padding character.  


## Return Value
*Result*
&emsp;Type: [Text](text-data-type.md)
The end result Text.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Text Data Type](text-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)