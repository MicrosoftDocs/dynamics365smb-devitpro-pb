---
title: "TextBuilder Data Type"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2019
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
# TextBuilder Data Type
Represents a lighweight wrapper for the .Net implementation of StringBuilder.



The following methods are available on instances of the TextBuilder data type.

|Method name|Description|
|-----------|-----------|
|[Append(Text)](textbuilder-append-method.md)|Appends a copy of the specified string to this TextBuilder instance.|
|[AppendLine([Text])](textbuilder-appendline-method.md)|Appends a copy of the specified string followed by the default line terminator to the end of the current TextBuilder object. If this parameter is omitted, only the line terminator will be appended.|
|[Capacity([Integer])](textbuilder-capacity-method.md)|Gets or sets the maximum number of characters that can be contained in the memory allocated by the current instance.|
|[Clear()](textbuilder-clear-method.md)|Removes all characters from the current TextBuilder instance.|
|[EnsureCapacity(Integer)](textbuilder-ensurecapacity-method.md)|Ensures that the capacity of this TextBuilder instance is at least the specified value.|
|[Insert(Integer, Text)](textbuilder-insert-method.md)|Inserts a string into this TextBuilder instance at the specified character position.|
|[Length([Integer])](textbuilder-length-method.md)|Gets or sets the length of this TextBuilder instance.|
|[MaxCapacity()](textbuilder-maxcapacity-method.md)|Gets the maximum capacity of this TextBuilder instance.|
|[Remove(Integer, Integer)](textbuilder-remove-method.md)|Removes the specified range of characters from this TextBuilder instance.|
|[Replace(Text, Text)](textbuilder-replace-text-text-method.md)|Replaces all occurrences of a specified string in this TextBuilder instance with another specified string.|
|[Replace(Text, Text, Integer, Integer)](textbuilder-replace-text-text-integer-integer-method.md)|Replaces, within a substring of this instance, all occurrences of a specified string in this TextBuilder instance with another specified string.|
|[ToText()](textbuilder-totext--method.md)|Converts the value of this TextBuilder instance to a Text.|
|[ToText(Integer, Integer)](textbuilder-totext-integer-integer-method.md)|Converts the value of a substring of this TextBuilder instance to a Text.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [!NOTE]  
> For performance reasons all HTTP, JSON, TextBuilder, and XML types are reference types, not value types. Reference types holds a pointer to the data elsewhere in memory, whereas value types store its own data.

## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  