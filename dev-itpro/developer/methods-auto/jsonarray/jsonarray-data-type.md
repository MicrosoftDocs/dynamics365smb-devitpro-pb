---
title: "JsonArray Data Type"
ms.author: solsen
ms.custom: na
ms.date: 12/09/2020
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
# JsonArray Data Type
> **Version**: _Available from runtime version 1.0._

Is a container for any well-formed JSON array. A default JsonArray contains an empty JSON array.



The following methods are available on instances of the JsonArray data type.

|Method name|Description|
|-----------|-----------|
|[Add(JsonToken)](jsonarray-add-jsontoken-method.md)|Adds a new value at the end of the JsonArray.|
|[Add(JsonArray)](jsonarray-add-jsonarray-method.md)|Adds a new value at the end of the JsonArray.|
|[Add(JsonObject)](jsonarray-add-jsonobject-method.md)|Adds a new value at the end of the JsonArray.|
|[Add(JsonValue)](jsonarray-add-jsonvalue-method.md)|Adds a new value at the end of the JsonArray.|
|[Add(Boolean)](jsonarray-add-boolean-method.md)|Adds a new value at the end of the JsonArray.|
|[Add(Char)](jsonarray-add-char-method.md)|Adds a new value at the end of the JsonArray.|
|[Add(Byte)](jsonarray-add-byte-method.md)|Adds a new value at the end of the JsonArray.|
|[Add(Option)](jsonarray-add-option-method.md)|Adds a new value at the end of the JsonArray.|
|[Add(Integer)](jsonarray-add-integer-method.md)|Adds a new value at the end of the JsonArray.|
|[Add(BigInteger)](jsonarray-add-biginteger-method.md)|Adds a new value at the end of the JsonArray.|
|[Add(Decimal)](jsonarray-add-decimal-method.md)|Adds a new value at the end of the JsonArray.|
|[Add(Duration)](jsonarray-add-duration-method.md)|Adds a new value at the end of the JsonArray.|
|[Add(Date)](jsonarray-add-date-method.md)|Adds a new value at the end of the JsonArray.|
|[Add(Time)](jsonarray-add-time-method.md)|Adds a new value at the end of the JsonArray.|
|[Add(DateTime)](jsonarray-add-datetime-method.md)|Adds a new value at the end of the JsonArray.|
|[Add(String)](jsonarray-add-string-method.md)|Adds a new value at the end of the JsonArray.|
|[AsToken()](jsonarray-astoken-method.md)|Converts the value in a JsonArray to a JsonToken data type.|
|[Clone()](jsonarray-clone-method.md)|Creates a deep-copy of the JsonArray value.|
|[Count()](jsonarray-count-method.md)|Gets the number of elements in the JsonArray.|
|[Get(Integer, var JsonToken)](jsonarray-get-method.md)|Retrieves the value at the given index in the JsonArray.|
|[IndexOf(JsonToken)](jsonarray-indexof-jsontoken-method.md)|Determines the index of a specific value in the JsonArray.|
|[IndexOf(JsonArray)](jsonarray-indexof-jsonarray-method.md)|Determines the index of a specific value in the JsonArray.|
|[IndexOf(JsonObject)](jsonarray-indexof-jsonobject-method.md)|Determines the index of a specific value in the JsonArray.|
|[IndexOf(JsonValue)](jsonarray-indexof-jsonvalue-method.md)|Determines the index of a specific value in the JsonArray.|
|[IndexOf(Boolean)](jsonarray-indexof-boolean-method.md)|Determines the index of a specific value in the JsonArray.|
|[IndexOf(Char)](jsonarray-indexof-char-method.md)|Determines the index of a specific value in the JsonArray.|
|[IndexOf(Byte)](jsonarray-indexof-byte-method.md)|Determines the index of a specific value in the JsonArray.|
|[IndexOf(Option)](jsonarray-indexof-option-method.md)|Determines the index of a specific value in the JsonArray.|
|[IndexOf(Integer)](jsonarray-indexof-integer-method.md)|Determines the index of a specific value in the JsonArray.|
|[IndexOf(BigInteger)](jsonarray-indexof-biginteger-method.md)|Determines the index of a specific value in the JsonArray.|
|[IndexOf(Decimal)](jsonarray-indexof-decimal-method.md)|Determines the index of a specific value in the JsonArray.|
|[IndexOf(Duration)](jsonarray-indexof-duration-method.md)|Determines the index of a specific value in the JsonArray.|
|[IndexOf(Date)](jsonarray-indexof-date-method.md)|Determines the index of a specific value in the JsonArray.|
|[IndexOf(Time)](jsonarray-indexof-time-method.md)|Determines the index of a specific value in the JsonArray.|
|[IndexOf(DateTime)](jsonarray-indexof-datetime-method.md)|Determines the index of a specific value in the JsonArray.|
|[IndexOf(String)](jsonarray-indexof-string-method.md)|Determines the index of a specific value in the JsonArray.|
|[Insert(Integer, JsonToken)](jsonarray-insert-integer-jsontoken-method.md)|Inserts the value at the given index in the array while shifting all the values to the right by one position.|
|[Insert(Integer, JsonArray)](jsonarray-insert-integer-jsonarray-method.md)|Inserts the value at the given index in the array while shifting all the values to the right by one position.|
|[Insert(Integer, JsonObject)](jsonarray-insert-integer-jsonobject-method.md)|Inserts the value at the given index in the array while shifting all the values to the right by one position.|
|[Insert(Integer, JsonValue)](jsonarray-insert-integer-jsonvalue-method.md)|Inserts the value at the given index in the array while shifting all the values to the right by one position.|
|[Insert(Integer, Boolean)](jsonarray-insert-integer-boolean-method.md)|Inserts the value at the given index in the array while shifting all the values to the right by one position.|
|[Insert(Integer, Char)](jsonarray-insert-integer-char-method.md)|Inserts the value at the given index in the array while shifting all the values to the right by one position.|
|[Insert(Integer, Byte)](jsonarray-insert-integer-byte-method.md)|Inserts the value at the given index in the array while shifting all the values to the right by one position.|
|[Insert(Integer, Option)](jsonarray-insert-integer-option-method.md)|Inserts the value at the given index in the array while shifting all the values to the right by one position.|
|[Insert(Integer, Integer)](jsonarray-insert-integer-integer-method.md)|Inserts the value at the given index in the array while shifting all the values to the right by one position.|
|[Insert(Integer, BigInteger)](jsonarray-insert-integer-biginteger-method.md)|Inserts the value at the given index in the array while shifting all the values to the right by one position.|
|[Insert(Integer, Decimal)](jsonarray-insert-integer-decimal-method.md)|Inserts the value at the given index in the array while shifting all the values to the right by one position.|
|[Insert(Integer, Duration)](jsonarray-insert-integer-duration-method.md)|Inserts the value at the given index in the array while shifting all the values to the right by one position.|
|[Insert(Integer, Date)](jsonarray-insert-integer-date-method.md)|Inserts the value at the given index in the array while shifting all the values to the right by one position.|
|[Insert(Integer, Time)](jsonarray-insert-integer-time-method.md)|Inserts the value at the given index in the array while shifting all the values to the right by one position.|
|[Insert(Integer, DateTime)](jsonarray-insert-integer-datetime-method.md)|Inserts the value at the given index in the array while shifting all the values to the right by one position.|
|[Insert(Integer, String)](jsonarray-insert-integer-string-method.md)|Inserts the value at the given index in the array while shifting all the values to the right by one position.|
|[Path()](jsonarray-path-method.md)|Retrieves the JSON path of the array relative to the root of its containing tree.|
|[ReadFrom(String)](jsonarray-readfrom-string-method.md)|Reads the JSON data from the string into a JsonArray variable.|
|[ReadFrom(InStream)](jsonarray-readfrom-instream-method.md)|Reads the JSON data from the stream into a JsonArray variable.|
|[RemoveAt(Integer)](jsonarray-removeat-method.md)|Removes the token at the given index.|
|[SelectToken(String, var JsonToken)](jsonarray-selecttoken-method.md)|Selects a JsonToken using a JPath expression.|
|[Set(Integer, JsonToken)](jsonarray-set-integer-jsontoken-method.md)|Replaces the value at the given index with a new value.|
|[Set(Integer, JsonObject)](jsonarray-set-integer-jsonobject-method.md)|Replaces the value at the given index with a new value.|
|[Set(Integer, JsonArray)](jsonarray-set-integer-jsonarray-method.md)|Replaces the value at the given index with a new value.|
|[Set(Integer, JsonValue)](jsonarray-set-integer-jsonvalue-method.md)|Replaces the value at the given index with a new value.|
|[Set(Integer, Boolean)](jsonarray-set-integer-boolean-method.md)|Replaces the value at the given index with a new value.|
|[Set(Integer, Char)](jsonarray-set-integer-char-method.md)|Replaces the value at the given index with a new value.|
|[Set(Integer, Byte)](jsonarray-set-integer-byte-method.md)|Replaces the value at the given index with a new value.|
|[Set(Integer, Option)](jsonarray-set-integer-option-method.md)|Replaces the value at the given index with a new value.|
|[Set(Integer, Integer)](jsonarray-set-integer-integer-method.md)|Replaces the value at the given index with a new value.|
|[Set(Integer, BigInteger)](jsonarray-set-integer-biginteger-method.md)|Replaces the value at the given index with a new value.|
|[Set(Integer, Decimal)](jsonarray-set-integer-decimal-method.md)|Replaces the value at the given index with a new value.|
|[Set(Integer, Duration)](jsonarray-set-integer-duration-method.md)|Replaces the value at the given index with a new value.|
|[Set(Integer, Date)](jsonarray-set-integer-date-method.md)|Replaces the value at the given index with a new value.|
|[Set(Integer, Time)](jsonarray-set-integer-time-method.md)|Replaces the value at the given index with a new value.|
|[Set(Integer, DateTime)](jsonarray-set-integer-datetime-method.md)|Replaces the value at the given index with a new value.|
|[Set(Integer, String)](jsonarray-set-integer-string-method.md)|Replaces the value at the given index with a new value.|
|[WriteTo(var Text)](jsonarray-writeto-text-method.md)|Serializes and writes the JSON data of the JsonArray to a given Text object.|
|[WriteTo(OutStream)](jsonarray-writeto-outstream-method.md)|Serializes and writes the JSON data of the JsonArray to a given OutStream object.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [!NOTE]  
> For performance reasons all HTTP, JSON, TextBuilder, and XML types are reference types, not value types. Reference types holds a pointer to the data elsewhere in memory, whereas value types store its own data.

## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  