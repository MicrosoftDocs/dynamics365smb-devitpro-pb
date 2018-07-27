---
title: "TextBuilder Data Type"
ms.author: solsen
ms.custom: na
ms.date: 07/27/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# TextBuilder Data Type



The following methods are available on instances of the TextBuilder data type.

|Method name|Description|
|-----------|-----------|
|[Append(Text)](textbuilder-append-method.md)|Appends a copy of the specified string to this instance.|
|[AppendLine([Text])](textbuilder-appendline-method.md)|Appends a copy of the specified string followed by the default line terminator to the end of the current TextBuilder object. If this parameter is omitted, only the line terminator will be appended.|
|[Capacity([Integer])](textbuilder-capacity-method.md)|Gets or sets the maximum number of characters that can be contained in the memory allocated by the current instance.|
|[Clear()](textbuilder-clear-method.md)|Removes all characters from the current TextBuilder instance.|
|[EnsureCapacity(Integer)](textbuilder-ensurecapacity-method.md)|Ensures that the capacity of this instance of StringBuilder is at least the specified value.|
|[Insert(Integer, Text)](textbuilder-insert-method.md)|Inserts a string into this instance at the specified character position.|
|[Length([Integer])](textbuilder-length-method.md)|Gets or sets the length of the current TextBuilder object.|
|[MaxCapacity()](textbuilder-maxcapacity-method.md)|Gets the maximum capacity of this instance.|
|[Remove(Integer, Integer)](textbuilder-remove-method.md)|Removes the specified range of characters from this instance.|
|[Replace(Text, Text)](textbuilder-replace-text-text-method.md)|Replaces all occurrences of a specified string in this instance with another specified string.|
|[Replace(Text, Text, Integer, Integer)](textbuilder-replace-text-text-integer-integer-method.md)|Replaces all occurrences of a specified string in this instance with another specified string.|
|[ToText()](textbuilder-totext--method.md)|Converts the value of this instance or a substring of this instance to a Text.|
|[ToText(Integer, Integer)](textbuilder-totext-integer-integer-method.md)|Converts the value of this instance or a substring of this instance to a Text.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

&gt; [!NOTE]    
&gt; For performance reasons all HTTP, JSON, TextBuilder, and XML types are reference types, not value types. Reference types holds a pointer to the data elsewhere in memory, whereas value types store its own data.

## See Also
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  