---
title: "Media.FindOrphans() Method"
description: "Discovers all orphaned media."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Media.FindOrphans() Method
> **Version**: _Available or changed with runtime version 11.0._

Discovers all orphaned media. Orphaned media is media that is not referenced by any other table.


## Syntax
```AL
Orphans :=   Media.FindOrphans()
```

## Return Value
*Orphans*  
&emsp;Type: [List of [Guid]](../list/list-data-type.md)  
A list of orphaned media.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[Media Data Type](media-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)