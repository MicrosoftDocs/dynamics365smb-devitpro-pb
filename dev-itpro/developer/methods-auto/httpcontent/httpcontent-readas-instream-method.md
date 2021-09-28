---
title: "HttpContent.ReadAs(var InStream) Method"
description: "Reads the content into the provided text."
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
# HttpContent.ReadAs(var InStream) Method
> **Version**: _Available or changed with runtime version 1.0._

Reads the content into the provided text.


## Syntax
```AL
[Ok := ]  HttpContent.ReadAs(var InStream: InStream)
```
## Parameters
*HttpContent*  
&emsp;Type: [HttpContent](httpcontent-data-type.md)  
An instance of the [HttpContent](httpcontent-data-type.md) data type.  

*InStream*  
&emsp;Type: [InStream](../instream/instream-data-type.md)  
The InStream variable that will contain the HTTP content stream.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[HttpContent Data Type](httpcontent-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)