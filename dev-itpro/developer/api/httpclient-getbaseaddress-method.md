---
title: "GetBaseAddress Method"
ms.author: solsen
ms.custom: na
ms.date: 12/12/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 620f0e32-eadc-43e9-8f6e-8fc0b12c3aaf
caps.latest.revision: 9
manager: edupont
author: SusanneWindfeldPedersen
---

 

# GetBaseAddress Method
Gets the base address of Uniform Resource Identifier (URI) of the Internet resource used when sending requests.

```
[Ok := ] HttpClient.GetBaseAddress
```
## Parameters
*HttpClient*  
&emsp;Type: [HttpClient](httpclient-class.md)  

&emsp;The HttpClient whose BaseAddress we are trying to get.

## Return value
*Address*  
&emsp;Type: [Boolean](../datatypes/devenv-boolean-data-type.md)

The base address of URI of the Internet resource used when sending requests.

## See Also
[HttpClient](httpclient-class.md)  
[HttpRequestMessage](httprequestmessage-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  