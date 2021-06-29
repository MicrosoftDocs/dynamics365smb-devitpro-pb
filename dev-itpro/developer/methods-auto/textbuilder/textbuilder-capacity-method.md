---
title: "TextBuilder.Capacity Method"
description: "Gets or sets the maximum number of characters that can be contained in the memory allocated by the current instance."
ms.author: solsen
ms.custom: na
ms.date: 05/31/2021
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
# TextBuilder.Capacity Method
> **Version**: _Available or changed with runtime version 1.0._

Gets or sets the maximum number of characters that can be contained in the memory allocated by the current instance.


## Syntax
```
[OldCapacity := ]  TextBuilder.Capacity([NewCapacity: Integer])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*TextBuilder*  
&emsp;Type: [TextBuilder](textbuilder-data-type.md)  
An instance of the [TextBuilder](textbuilder-data-type.md) data type.  

*[Optional] NewCapacity*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The maximum number of characters that can be contained in the memory allocated by the current instance. Its value can range from Length to MaxCapacity.  


## Return Value
*[Optional] OldCapacity*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The maximum number of characters that can be contained in the memory allocated by the current instance.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TextBuilder Data Type](textbuilder-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)