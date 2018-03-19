---
title: "DefaultRequestHeaders Method"
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

 

# DefaultRequestHeaders Method
Gets the default request headers which should be sent with each request.

```
HttpHeaders := HttpClient.DefaultRequestHeaders
```

## Property Value
*HttpHeaders*  
&emsp;Type: [HttpHeaders](httpheaders-class.md)

## Remarks
The [HttpHeaders](httpheaders-class.md) variable is a reference type. When you add a header to this variable, the default headers are changed.
You cannot set another HttpHeaders object as a default header, you have to update the header fetched from [HttpClient](httpclient-class.md).

## See Also
[HttpClient](httpclient-class.md)  
[HttpHeaders](httpheaders-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
