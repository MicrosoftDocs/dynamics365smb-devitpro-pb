---
title: "Compiler Warning AL0915"
description: "Table extension '{0}' adds {1} fields to table '{2}'."
ms.author: solsen
ms.date: 04/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Warning AL0915

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

Table extension '{0}' adds {1} fields to table '{2}'. Adding many fields in a single table extension might limit the ability of other extensions to add fields, as the total number of fields across a table and all its extensions cannot exceed the maximum number of columns allowed in SQL.


## Description
A table extension with many added fields may limit extensibility for the target table. Consider reducing the number of fields added.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  