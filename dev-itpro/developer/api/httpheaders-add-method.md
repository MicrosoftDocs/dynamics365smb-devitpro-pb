---
title: "Add Method"
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

 

# Add Method
Adds sets the provided value for the provided header name.

```
[Ok := ] HttpHeaders.Add(Key, Value)
```

## Parameters
*HttpHeaders*  
&emsp;Type: [HttpHeaders](httpheaders-class.md)

*Key*  
&emsp;Type: [Text](../datatypes/devenv-text-data-type.md)

*Value*  
&emsp;Type: [Text](../datatypes/devenv-text-data-type.md)

## Return Value
*Ok*  
&emsp;Type: [Boolean](../datatypes/devenv-boolean-data-type.md)  

&emsp;**True** if the operation was successful; otherwise, **false**.

## See Also
[HttpHeaders](httpheaders-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  