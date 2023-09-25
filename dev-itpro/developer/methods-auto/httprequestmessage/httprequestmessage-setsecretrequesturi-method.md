---
title: "HttpRequestMessage.SetSecretRequestUri(SecretText) Method"
description: "Sets the secret URI used for the HTTP request."
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
# HttpRequestMessage.SetSecretRequestUri(SecretText) Method
> **Version**: _Available or changed with runtime version 12.0._

Sets the secret URI used for the HTTP request.


## Syntax
```AL
[Ok := ]  HttpRequestMessage.SetSecretRequestUri(RequestUri: SecretText)
```
## Parameters
*HttpRequestMessage*  
&emsp;Type: [HttpRequestMessage](httprequestmessage-data-type.md)  
An instance of the [HttpRequestMessage](httprequestmessage-data-type.md) data type.  

*RequestUri*  
&emsp;Type: [SecretText](../secrettext/secrettext-data-type.md)  
The secret URI to use for the HTTP request.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the URI was set successfully, otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[HttpRequestMessage Data Type](httprequestmessage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)