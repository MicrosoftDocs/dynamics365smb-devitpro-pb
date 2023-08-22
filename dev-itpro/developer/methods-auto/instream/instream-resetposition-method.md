---
title: "InStream.ResetPosition() Method"
description: "Resets the stream position on an InStream object."
ms.author: solsen
ms.custom: na
ms.date: 01/23/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# InStream.ResetPosition() Method
> **Version**: _Available or changed with runtime version 11.0._

Resets the stream position on an InStream object.


## Syntax
```AL
[Status := ]  InStream.ResetPosition()
```
## Parameters
*InStream*  
&emsp;Type: [InStream](instream-data-type.md)  
An instance of the [InStream](instream-data-type.md) data type.  

## Return Value
*[Optional] Status*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
True if the stream position was reset to the beginning of stream. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[InStream Data Type](instream-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)