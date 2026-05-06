---
title: "Compiler Warning AL0914"
description: "Table '{0}' has {1} fields."
ms.author: solsen
ms.date: 04/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Warning AL0914

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

Table '{0}' has {1} fields. Tables with many fields might limit the ability of other extensions to add fields, as the total number of fields across a table and all its extensions cannot exceed the maximum number of columns allowed in SQL.


## Description
A table with many fields may limit extensibility. Consider splitting the table or reducing the number of fields.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  