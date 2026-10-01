---
title: "Compiler Error AL0926"
description: "The '{0}' section is not valid here."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0926

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The '{0}' section is not valid here. In a {1} object, the expected section order is: {2}. Metadata sections must appear before var declarations, triggers, and procedures.


## Description
A metadata section keyword appears after triggers, procedures, or variable declarations within an AL object. Each object type has a strict ordering for its metadata sections (e.g., tables require fields before keys before fieldgroups). Sections must also appear before any var declarations, triggers, or procedures.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  