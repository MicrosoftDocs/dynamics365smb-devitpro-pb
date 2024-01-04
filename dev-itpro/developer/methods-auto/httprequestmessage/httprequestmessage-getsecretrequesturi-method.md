---
title: "HttpRequestMessage.GetSecretRequestUri() Method"
description: "Gets the secret URI used for the HTTP request."
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
# HttpRequestMessage.GetSecretRequestUri() Method
> **Version**: _Available or changed with runtime version 12.0._

Gets the secret URI used for the HTTP request.


## Syntax
```AL
RequestUri :=   HttpRequestMessage.GetSecretRequestUri()
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*HttpRequestMessage*  
&emsp;Type: [HttpRequestMessage](httprequestmessage-data-type.md)  
An instance of the [HttpRequestMessage](httprequestmessage-data-type.md) data type.  

## Return Value
*RequestUri*  
&emsp;Type: [SecretText](../secrettext/secrettext-data-type.md)  
The secret URI used for the HTTP request.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[HttpRequestMessage Data Type](httprequestmessage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)