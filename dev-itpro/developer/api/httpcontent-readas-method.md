---
title: "ReadAs Method"
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
author: SusanneWindfeldPedersen
---

# ReadAs Method
Reads the content into the provided text.

```
[Ok := ] HttpContent.ReadAs(Result)
```

## Parameters
*HttpContent*  
&emsp;Type: [HttpContent](httpcontent-class.md)

*Result*  
&emsp;Type: [Text](../datatypes/devenv-text-data-type.md) or [InStream](../datatypes/devenv-instream-and-outstream-data-types.md)

## Return Value
*Ok*  
&emsp;Type: [Boolean](../datatypes/devenv-boolean-data-type.md)  

&emsp;**True** if the operation was successful; otherwise, **false**.

Accessing the [HttpContent](httpcontent-class.md) property of [HttpResponseMessage](httpresponsemessage-class.md) in a case when the request fails will result in an error.

## See Also
[HttpContent](httpcontent-class.md)  
[HttpResponseMessage](httpresponsemessage-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  