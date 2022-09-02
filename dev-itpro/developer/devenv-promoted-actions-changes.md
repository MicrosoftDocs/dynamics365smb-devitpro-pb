---
title: "Promoted Action Changes"
description: The promoted action framework has been redesigned with Dynamics 365 Business Central 2022 release wave 2. 
ms.custom: na
ms.date: 09/02/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: SusanneWindfeldPedersen
--- 

# Promoted Action Changes

[!INCLUDE [2022_releasewave2](../includes/2022_releasewave2.md)]

With [!INCLUDE [prod_short](includes/prod_short.md)] 2022 release wave 2, we introduce a new syntax for defining promoted actions. The changes include a different behavior on the UI. The article lists the behavioral changes.

## Breaking changes <!-- ?? -->

|New Behavior (v21)| Previous Behavior (v20||
|------------------|------------------------|
|During personalization, if you hide a base action, all action refs will also be hidden. | During personalization, if you clicked "Remove" the base action would disappear, which was equivalent to making the action PromotedOnly = true; it would only show up in the promoted section. |
|||


## 

## See also