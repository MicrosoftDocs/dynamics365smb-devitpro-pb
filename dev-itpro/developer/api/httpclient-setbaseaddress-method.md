---
title: "SetBaseAddress Method"
ms.author: solsen
ms.custom: na
ms.date: 12/13/2017
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

 

# SetBaseAddress Method

Sets the base address of Uniform Resource Identifier (URI) of the Internet resource used when sending requests.

```
[Ok := ] HttpClient.SetBaseAddress(Path)
```
## Parameters
*Path*  
Type: [String](../datatypes/devenv-text-data-type.md)

## Return value
*Ok*  
&emsp;Type: [Boolean](../datatypes/devenv-boolean-data-type.md)  

&emsp;**True** if the operation was successful; otherwise, **false**.

## See Also
[HttpClient](httpclient-class.md)  
[HttpRequestMessage](httprequestmessage-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  