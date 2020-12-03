---
title: "JsonToken Data Type"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# JsonToken Data Type
> **Version**: _Available from runtime version 1.0._

Is a container for any well-formed JSON data. A default JsonToken object contains the JSON value of NULL.



The following methods are available on instances of the JsonToken data type.

|Method name|Description|
|-----------|-----------|
|[IsObject()](jsontoken-isobject-method.md)|Indicates whether a JsonToken contains a JSON object.|
|[IsValue()](jsontoken-isvalue-method.md)|Indicates whether a JsonToken contains a JSON value.|
|[IsArray()](jsontoken-isarray-method.md)|Indicates whether a JsonToken represents a JSON array.|
|[AsArray()](jsontoken-asarray-method.md)|Converts the value in a JsonToken to a JsonArray data type.|
|[AsValue()](jsontoken-asvalue-method.md)|Converts the value in a JsonToken to a JsonValue data type.|
|[AsObject()](jsontoken-asobject-method.md)|Converts the value in a JsonToken to a JsonObject data type.|
|[Path()](jsontoken-path-method.md)|Retrieves the JSON path of the token relative to the root of its containing tree.|
|[ReadFrom(String)](jsontoken-readfrom-string-method.md)|Reads the JSON data from the string into a JsonToken variable.|
|[ReadFrom(InStream)](jsontoken-readfrom-instream-method.md)|Reads the JSON data from the stream into a JsonToken variable.|
|[WriteTo(var Text)](jsontoken-writeto-text-method.md)|Serializes and writes the JSON data of the JsonToken to a given Text object.|
|[WriteTo(OutStream)](jsontoken-writeto-outstream-method.md)|Serializes and writes the JSON data of the JsonToken to a given OutStream object.|
|[SelectToken(String, var JsonToken)](jsontoken-selecttoken-method.md)|Selects a JsonToken using a JPath expression.|
|[Clone()](jsontoken-clone-method.md)|Creates a deep-copy of the JsonToken value.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [!NOTE]  
> For performance reasons all HTTP, JSON, TextBuilder, and XML types are reference types, not value types. Reference types holds a pointer to the data elsewhere in memory, whereas value types store its own data.

## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  