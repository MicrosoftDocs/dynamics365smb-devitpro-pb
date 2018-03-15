---
title: "TextBuilder Class"
ms.author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 12/18/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 620f0e32-eadc-43e9-8f6e-8fc0b12c3aaf
caps.latest.revision: 1
manager: edupont
author: SusanneWindfeldPedersen
---

# TextBuilder Class
TextBuilder can performantly concatenate multiple bigger strings together. The following methods are available on the TextBuilder class.  

> [!NOTE]
> For performance reasons all [HTTP, JSON, TextBuilder, and XML types](../devenv-restapi-overview.md) are *reference* types, not *value* types. Reference types holds a pointer to the data elsewhere in memory, whereas value types store its own data.

|Method name|Description|  
|-----------|-----------|
|[TextBuilder.Append(Text)](textbuilder-append-method.md)|Appends a copy of the specified string to this instance.|  
|[TextBuilder.AppendLine(Text)](textbuilder-appendline-method.md)|Appends a copy of the specified string followed by the default line terminator to the end of the current TextBuilder object. If this parameter is omitted, only the line terminator will be appended.|  
|[TextBuilder.Capacity(Integer)](textbuilder-capacity-property.md)|Gets or sets the maximum number of characters that can be contained in the memory allocated by the current instance.|  
|[TextBuilder.Clear()](textbuilder-clear-method.md)|Removes all characters from the current TextBuilder instance.|  
|[TextBuilder.EnsureCapacity(Integer)](textbuilder-ensurecapacity-method.md)|Ensures that the capacity of this instance of StringBuilder is at least the specified value.|  
|[TextBuilder.Insert(Integer, Text)](textbuilder-insert-method.md)|Inserts a string into this instance at the specified character position.|  
|[TextBuilder.Length(Integer)](textbuilder-length-property.md)|Gets or sets the length of the current TextBuilder object.|  
|[TextBuilder.MaxCapacity](textbuilder-maxcapacity-property.md)|Gets the maximum capacity of this instance.|  
|[TextBuilder.Remove(Integer, Integer)](textbuilder-remove-method.md)|Removes the specified range of characters from this instance.|  
|[TextBuilder.Replace(Text, Text)](textbuilder-replace-oldtext-newtext-method.md)|Replaces all occurrences of a specified string in this instance with another specified string.|  
|[TextBuilder.Replace(Text, Text, Integer, Integer)](textbuilder-replace-oldtext-newtext-startindex-count-method.md)|Replaces all occurrences of a specified string in this instance with another specified string.|  
|[TextBuilder.ToText()](textbuilder-totext-method.md)|Converts the value of this instance or a substring of this instance to a Text.|  
|[TextBuilder.ToText(Integer, Integer)](textbuilder-totext-startindex-count-method.md)|Converts the value of this instance or a substring of this instance to a Text.| 
 
## See Also
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
