---
title: "Text.LastIndexOf(Text [, Integer]) Method"
description: "Reports the one-based index position of the last occurrence of a specified string in this instance."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# Text.LastIndexOf(Text [, Integer]) Method
> **Version**: _Available or changed with runtime version 1.0._

Reports the one-based index position of the last occurrence of a specified string in this instance.


## Syntax
```AL
Index :=   Text.LastIndexOf(Value: Text [, StartIndex: Integer])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Text*  
&emsp;Type: [Text](text-data-type.md)  
An instance of the [Text](text-data-type.md) data type.  

*Value*  
&emsp;Type: [Text](text-data-type.md)  
The string to seek.
        
*[Optional] StartIndex*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The search starting position. The search proceeds from startIndex toward the beginning of this instance.  


## Return Value
*Index*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The one-based index of the last occurrence of the specified string in this instance. If the index returned is 0, the value is not present in the string.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Text Data Type](text-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)