---
title: "Fields must not change type, since dependent extensions may break"
ms.author: solsen
ms.custom: na
ms.date: 06/19/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Rule AS0004
Fields must not change type, since dependent extensions may break  

## Description
Fields must not change type.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

The validation of the length of table fields was previously done with [AS0004](appsourcecop-as0004-fieldtypechangenotallowed.md) and has now been split into two different rules:
- [AS0080](appsourcecop-as0080-fieldlengthdecreasenotallowed.md) - which validates against decreasing the length of field
- [AS0086](appsourcecop-as0086-fieldlengthincreasenotallowed.md) - which validates against increasing the length of field

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  