---
title: "AppSourceCop Rule AS0006"
description: "Tables that have been published must not change name. This might break the upgrade of existing installations and dependent extensions."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# AppSourceCop Rule AS0006
Tables that have been published must not change name.

## Description
Tables that have been published must not change name. This might break the upgrade of existing installations and dependent extensions.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [!NOTE]  
> This rule validates tables independently of their Accessibility or ObsoleteState, because they are used when synchronizing the schema defined in the extension to the database.

## See Also

[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
