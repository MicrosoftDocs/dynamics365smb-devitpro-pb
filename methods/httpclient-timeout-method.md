---
title: "Timeout Method"
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
# Timeout Method
Gets or sets the duration in seconds to wait before the request times out.

## Syntax
```
[CurrentTimeout := ]  HttpClient.Timeout([SetTimeout: Duration])
```
> [!NOTE]  
> This method can be invoked using property access syntax.  
## Parameters
*HttpClient*  
&emsp;Type: [HttpClient](httpclient-data-type.md)  
An instance of the [HttpClient](httpclient-data-type.md) data type.  
*SetTimeout*  
&emsp;Type: [Duration](duration-data-type.md)  
  


## Return Value
*CurrentTimeout*  
&emsp;Type: [Duration](duration-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[HttpClient Data Type](httpclient-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)