---
title: "WriteTo_Stream Method"
ms.author: solsen
ms.custom: na
ms.date: 12/15/2017
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

 

# WriteTo_Stream Method
Serializes and writes the JSON data of the JsonObject to a given OutStream object.

```
[Ok := ] JsonObject.WriteTo(var OutStream)
```

### Parameters
*JsonObject*  
&emsp;Type: [JsonObject](jsonobject-class.md)

*OutStream*  
&emsp;Type: [OutStream](../datatypes/devenv-instream-and-outstream-data-types.md)

The OutStream object to which the JSON data will be written.

## Property Value/Return Value
&emsp;Type: [Boolean](../datatypes/devenv-boolean-data-type.md)

**True** if the write was successful; otherwise, **false**.

If you omit this optional return value and if the write does not execute successfully, then a run-time error occurs.

## See Also
[JsonObject](jsonobject-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
