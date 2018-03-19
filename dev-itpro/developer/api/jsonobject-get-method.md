---
title: "Get Method"
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

 

# Get Method
Retrieves the value of a property with a given key from a [JsonObject](jsonobject-class.md).

```
[Ok := ] JsonObject.Get(Key, Value)
```

## Parameters
*Key*  
&emsp;Type: [String](../datatypes/devenv-text-data-type.md)

*Result*  
&emsp;Type: [JsonToken](jsontoken-class.md)

A variable of type JsonToken that will contain the result if the operation is successful.

## Return Value
&emsp;Type: [Boolean](../datatypes/devenv-boolean-data-type.md)

**True** if the operation was successful; otherwise, **false**.

If you omit this optional return value and if the select does not execute successfully, then a run-time error occurs.

## Remarks
The operation will fail if the object does not contain a property with the given *Key*.

## See Also
[JsonObject](jsonobject-class.md)  
[JsonToken](jsontoken-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
