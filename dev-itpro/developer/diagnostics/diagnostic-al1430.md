---
title: "Compiler Warning AL1430"
description: "Sorting on field '{0}' of table '{1}' is not backed by a key and may perform poorly on large tables."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Warning AL1430

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

Sorting on field '{0}' of table '{1}' is not backed by a key and may perform poorly on large tables. Because '{0}' is added by table extension '{2}' in another app, add a key that includes '{0}' to table extension '{2}', or remove the sort.


## Description
The field used for sorting is introduced by a table extension in a different app, so a key that includes it cannot be added from the current app. Add the key in the app that owns the table extension, or remove the sort to avoid a performance penalty.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  