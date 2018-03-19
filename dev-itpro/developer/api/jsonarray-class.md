---
title: "JsonArray Class" 
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

 

# JsonArray Class
JsonArray is a container for any well-formed JSON array. A default JsonArray contains an empty JSON array.

> [!NOTE]
> For performance reasons all [HTTP, JSON, TextBuilder, and XML types](../devenv-restapi-overview.md) are *reference* types, not *value* types. Reference types holds a pointer to the data elsewhere in memory, whereas value types store its own data.

The following methods are available on the JsonArray class.

|Method name|Description|
|-----------|-----------|
|[Path](jsonarray-path-method.md)|Retrieves the JSON path of the array relative to the root of its containing tree.|
|[ReadFrom_Stream](jsonarray-readfrom-stream-method.md)|Reads the JSON data from the stream into a JsonArray variable.|
|[ReadFrom_String](jsonarray-readfrom-string-method.md)|Reads the JSON data from the string into a JsonArray variable.|
|[WriteTo_Stream](jsonarray-writeto-stream-method.md)|Serializes and writes the JSON data of the JsonArray to a given OutStream object.|
|[WriteTo_String](jsonarray-writeto-string-method.md)|Serializes and writes the JSON data of the JsonArray to a given Text object.|
|[Clone](jsontoken-clone-method.md)|Creates a deep-copy of the JsonArray value.|
|[SelectToken](jsontoken-selecttoken-method.md)|Selects a JsonToken using a JPath expression.|
|[AsToken](jsonarray-astoken-method.md)|Converts the value in the JsonObject to a JsonToken data type.|
|[Add](jsonarray-add-method.md)|Adds a new value at the end of the JsonArray.|
|[Count](jsonarray-count-method.md)|Gets the number of elements in the JsonArray.|
|[Get](jsonarray-get-method.md)|Retrieves the value at the given index in the JsonArray.|
|[IndexOf](jsonarray-indexof-method.md)|Replaces the value at the given index with a new value.|
|[Insert](jsonarray-insert-method.md)|Inserts the value at the given index in the array while shifting all the values to the right by one position (to the right).|
|[RemoveAt](jsonarray-removeat-method.md)|Removes the token at the given index.|
|[Set](jsonarray-set-method.md)|Replaces the value at the given index with a new value.|
|[RemoveAll](jsonarray-removeall-method.md)|Removes all the children of the given array.|

## Remarks
Objects of type JsonArray represent a 0-based array.

## See Also
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[JsonObject](jsonobject-class.md)  
[JsonToken](jsontoken-class.md)  
[JsonValue](jsonvalue-class.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
