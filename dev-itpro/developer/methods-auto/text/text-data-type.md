---
title: "Text Data Type"
description: "Denotes a text string."
ms.author: solsen
ms.custom: na
ms.date: 07/11/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Text Data Type
> **Version**: _Available or changed with runtime version 1.0._

Denotes a text string.




[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The **Text** data type is a value type, such that every time you use a method on it, you create a new string object in memory. This requires a new allocation of space. In situations where you need to perform repeated modifications to a string, the overhead associated with creating a **Text** data type can be costly.  

The [TextBuilder Data Type](../textbuilder/textbuilder-data-type.md) is a reference type, which holds a pointer elsewhere in memory. For performance reasons, we recommend you to use it when you want to modify a string without creating a new object. For example, using [TextBuilder Data Type](../textbuilder/textbuilder-data-type.md)  can boost performance when concatenating many strings together in a loop.

## See Also  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[TextBuilder Data Type](../textbuilder/textbuilder-data-type.md)