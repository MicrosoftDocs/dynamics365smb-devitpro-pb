---
title: "TextBuilder Data Type"
description: "Represents a lighweight wrapper for the ."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TextBuilder Data Type
> **Version**: _Available or changed with runtime version 1.0._

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

## Remarks
The **TextBuilder** data type is one-based indexed, that is, the indexing begins with 1.

The [Text Data Type](..\text\text-data-type.md) is a value type, such that every time you use a method on it, you create a new string object in memory. This requires a new allocation of space. In situations where you need to perform repeated modifications to a string, the overhead associated with creating a [Text Data Type](..\text\text-data-type.md) can be costly.  

The **TextBuilder** data type is a reference type, which holds a pointer elsewhere in memory. For performance reasons, we recommend you to use it when you want to modify a string without creating a new object. For example, using **TextBuilder** data type can boost performance when concatenating many strings together in a loop.

## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[Text Data Type](..\text\text-data-type.md) 