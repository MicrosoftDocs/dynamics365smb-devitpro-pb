---
title: "HttpContent.IsSecretContent() Method"
description: "Returns if the content is secret."
ms.author: solsen
ms.custom: na
ms.date: 09/06/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# HttpContent.IsSecretContent() Method
> **Version**: _Available or changed with runtime version 12.0._

Returns if the content is secret. If it is secret it can be read only as a SecretText.


## Syntax
```AL
[Ok := ]  HttpContent.IsSecretContent()
```
## Parameters
*HttpContent*  
&emsp;Type: [HttpContent](httpcontent-data-type.md)  
An instance of the [HttpContent](httpcontent-data-type.md) data type.  

## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[HttpContent Data Type](httpcontent-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)