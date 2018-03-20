---
title: "WriteFrom Method"
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
author: SusanneWindfeldPedersen
---

# WriteFrom Method
Sets [HttpContent](httpcontent-class.md) content to the provided text or stream.

```
HttpContent.WriteFrom(Value)
```

## Parameters
*HttpContent*  
&emsp;Type: [HttpContent](httpcontent-class.md)

*Value*  
&emsp;Type: [Text](../datatypes/devenv-text-data-type.md) or [InStream](../datatypes/devenv-instream-and-outstream-data-types.md)

A new HttpContent is constructed with this value and headers from before.

## See Also
[HttpContent](httpcontent-class.md)  
[HttpHeaders](httpheaders-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
