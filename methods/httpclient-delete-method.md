---
title: "Delete Method"
ms.author: solsen
ms.custom: na
ms.date: 07/27/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# Delete Method
Sends a DELETE request to delete the resource identified by the request URL.

## Syntax
```
[Ok := ]  HttpClient.Delete(Path: String, var Response: HttpResponseMessage)
```
#### Parameters
*HttpClient*  
&emsp;Type: [HttpClient](httpclient-data-type.md)  
An instance of the [HttpClient](httpclient-data-type.md) data type.  
*Path*  
&emsp;Type: [String](string-data-type.md)  
  
*Response*  
&emsp;Type: [HttpResponseMessage](httpresponsemessage-data-type.md)  
  


#### Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
Accessing the HttpContent property of HttpResponseMessage in a case when the request fails will result in an error.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[HttpClient Data Type](httpclient-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)