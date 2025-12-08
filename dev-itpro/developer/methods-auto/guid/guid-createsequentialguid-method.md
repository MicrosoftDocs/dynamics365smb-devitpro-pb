---
title: "Guid.CreateSequentialGuid() Method"
description: "Creates a new sequential unique GUID."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Guid.CreateSequentialGuid() Method
> **Version**: _Available or changed with runtime version 16.0._

Creates a new sequential unique GUID. Sequential GUIDs perform better when used as a field in a key, because they are partially sequential instead of fully random.


## Syntax
```AL
Guid :=   Guid.CreateSequentialGuid()
```

## Return Value
*Guid*  
&emsp;Type: [Guid](guid-data-type.md)  
A new sequential unique GUID.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Guid data type](guid-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)