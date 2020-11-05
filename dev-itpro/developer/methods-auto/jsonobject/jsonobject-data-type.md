---
title: "JsonObject Data Type"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
# JsonObject Data Type
Is a container for any well-formed JSON object. A default JsonObject contains an empty JSON object.



The following methods are available on instances of the JsonObject data type.

|Method name|Description|
|-----------|-----------|
|[Path()](jsonobject-path-method.md)|Retrieves the JSON path of the object relative to the root of its containing tree.|
|[Keys()](jsonobject-keys-method.md)|Gets a set of keys of the JsonObject.|
|[Values()](jsonobject-values-method.md)|Gets a set of values of the JsonObject.|
|[ReadFrom(String)](jsonobject-readfrom-string-method.md)|Reads the JSON data from the string into a JsonObject variable.|
|[ReadFrom(InStream)](jsonobject-readfrom-instream-method.md)|Reads the JSON data from the stream into a JsonObject variable.|
|[WriteTo(var Text)](jsonobject-writeto-text-method.md)|Serializes and writes the JSON data of the JsonObject to a given Text object.|
|[WriteTo(OutStream)](jsonobject-writeto-outstream-method.md)|Serializes and writes the JSON data of the JsonObject to a given OutStream object.|
|[SelectToken(String, var JsonToken)](jsonobject-selecttoken-method.md)|Selects a JsonToken using a JPath expression.|
|[Clone()](jsonobject-clone-method.md)|Creates a deep-copy of the JsonToken value.|
|[AsToken()](jsonobject-astoken-method.md)|Converts the value in a JsonObject to a JsonToken data type.|
|[Contains(String)](jsonobject-contains-method.md)|Verifies if a JsonObject contains a property with a given key.|
|[Get(String, var JsonToken)](jsonobject-get-method.md)|Retrieves the value of a property with a given key from a JsonObject.|
|[Add(String, JsonToken)](jsonobject-add-string-jsontoken-method.md)|Adds a new property to a JsonObject.|
|[Add(String, JsonObject)](jsonobject-add-string-jsonobject-method.md)|Adds a new property to a JsonObject.|
|[Add(String, JsonValue)](jsonobject-add-string-jsonvalue-method.md)|Adds a new property to a JsonObject.|
|[Add(String, JsonArray)](jsonobject-add-string-jsonarray-method.md)|Adds a new property to a JsonObject.|
|[Add(String, Boolean)](jsonobject-add-string-boolean-method.md)|Adds a new property to a JsonObject.|
|[Add(String, Char)](jsonobject-add-string-char-method.md)|Adds a new property to a JsonObject.|
|[Add(String, Byte)](jsonobject-add-string-byte-method.md)|Adds a new property to a JsonObject.|
|[Add(String, Option)](jsonobject-add-string-option-method.md)|Adds a new property to a JsonObject.|
|[Add(String, Integer)](jsonobject-add-string-integer-method.md)|Adds a new property to a JsonObject.|
|[Add(String, BigInteger)](jsonobject-add-string-biginteger-method.md)|Adds a new property to a JsonObject.|
|[Add(String, Decimal)](jsonobject-add-string-decimal-method.md)|Adds a new property to a JsonObject.|
|[Add(String, Duration)](jsonobject-add-string-duration-method.md)|Adds a new property to a JsonObject.|
|[Add(String, String)](jsonobject-add-string-string-method.md)|Adds a new property to a JsonObject.|
|[Add(String, Date)](jsonobject-add-string-date-method.md)|Adds a new property to a JsonObject.|
|[Add(String, Time)](jsonobject-add-string-time-method.md)|Adds a new property to a JsonObject.|
|[Add(String, DateTime)](jsonobject-add-string-datetime-method.md)|Adds a new property to a JsonObject.|
|[Replace(String, JsonToken)](jsonobject-replace-string-jsontoken-method.md)|Replaces the value of the property with the given key with the new value.|
|[Replace(String, JsonArray)](jsonobject-replace-string-jsonarray-method.md)|Replaces the value of the property with the given key with the new value.|
|[Replace(String, JsonObject)](jsonobject-replace-string-jsonobject-method.md)|Replaces the value of the property with the given key with the new value.|
|[Replace(String, JsonValue)](jsonobject-replace-string-jsonvalue-method.md)|Replaces the value of the property with the given key with the new value.|
|[Replace(String, Boolean)](jsonobject-replace-string-boolean-method.md)|Replaces the value of the property with the given key with the new value.|
|[Replace(String, Char)](jsonobject-replace-string-char-method.md)|Replaces the value of the property with the given key with the new value.|
|[Replace(String, Byte)](jsonobject-replace-string-byte-method.md)|Replaces the value of the property with the given key with the new value.|
|[Replace(String, Integer)](jsonobject-replace-string-integer-method.md)|Replaces the value of the property with the given key with the new value.|
|[Replace(String, Option)](jsonobject-replace-string-option-method.md)|Replaces the value of the property with the given key with the new value.|
|[Replace(String, BigInteger)](jsonobject-replace-string-biginteger-method.md)|Replaces the value of the property with the given key with the new value.|
|[Replace(String, Decimal)](jsonobject-replace-string-decimal-method.md)|Replaces the value of the property with the given key with the new value.|
|[Replace(String, Duration)](jsonobject-replace-string-duration-method.md)|Replaces the value of the property with the given key with the new value.|
|[Replace(String, Date)](jsonobject-replace-string-date-method.md)|Replaces the value of the property with the given key with the new value.|
|[Replace(String, Time)](jsonobject-replace-string-time-method.md)|Replaces the value of the property with the given key with the new value.|
|[Replace(String, DateTime)](jsonobject-replace-string-datetime-method.md)|Replaces the value of the property with the given key with the new value.|
|[Replace(String, String)](jsonobject-replace-string-string-method.md)|Replaces the value of the property with the given key with the new value.|
|[Remove(String)](jsonobject-remove-method.md)|Removes the property with the given key from the object.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [!NOTE]  
> For performance reasons all HTTP, JSON, TextBuilder, and XML types are reference types, not value types. Reference types holds a pointer to the data elsewhere in memory, whereas value types store its own data.

## Remarks 
An unitialized variable of JsonObject type represents an empty JSON object. Given a value of JsonObject type, you can check if it is empty by checking that the number of keys in the object is 0.

```
jsonObject.Keys.Count =  0
```

## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  