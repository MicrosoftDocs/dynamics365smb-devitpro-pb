---
title: Defining Action Scope for Business Central Pages
description: Learn how to define the action scope for Business Central pages.
ms.date: 04/01/2021
ms.reviewer: solsen
ms.topic: concept-article
author: blrobl
---

# Defining action scope for Business Central pages

When developing pages for [!INCLUDE[d365_bus_central_md](includes/d365_bus_central_md.md)] that include a repeater control, it is useful to be able to define whether the actions available on a page apply to the whole page or are related to the repeater control on the page.  
The purpose of the [Scope Property](properties/devenv-scope-action-property.md) is to enable developers to add row-specific actions to the shortcut menu which is available to the user on each line. This gives users a more direct way to invoke actions that relate to the selected row or line.  
  
This is the case when you have, for example, **Line Comments** which are related to a line, but appear in the action bar. You can specify the scope of the action by setting the [Scope Property](properties/devenv-scope-action-property.md) on the page action to be either **Page** or **Repeater**.  
  
> [!NOTE]  
> It's strongly recommended that the [Scope property](properties/devenv-scope-action-property.md) is always appropriately set when developing pages for the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)].  
  
Learn more about how the settings are interpreted on the various clients in [Scope property](properties/devenv-scope-property.md).  
  
## Related information  

[Scope property](properties/devenv-scope-action-property.md)
