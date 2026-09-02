---
title: Defining Action Scope for Business Central Pages
description: Learn how to define the action scope for Business Central pages, so that actions apply either to the whole page or to the selected rows in a repeater.
ms.date: 08/24/2026
ms.reviewer: solsen
ms.topic: concept-article
author: SusanneWindfeldPedersen
ms.author: solsen
---

# Defining action scope for Business Central pages

When you develop pages for [!INCLUDE[d365_bus_central_md](includes/d365_bus_central_md.md)] that include a repeater control, it's useful to define whether the actions on a page apply to the whole page or to the repeater control on the page.

The [Scope property](properties/devenv-scope-action-property.md) lets you add row-specific actions to the shortcut menu that's available on each line. This gives users a more direct way to run actions that relate to the selected row.

For example, **Line Comments** relates to a line, but appears in the action bar. You specify the scope of the action by setting the [Scope property](properties/devenv-scope-action-property.md) on the page action to either **Page** or **Repeater**.

> [!NOTE]  
> We strongly recommend that you always set the [Scope property](properties/devenv-scope-action-property.md) when you develop pages for the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)].

Learn more about how the settings are interpreted on the different clients in [Scope property](properties/devenv-scope-property.md).

## Related information  

[Scope property](properties/devenv-scope-action-property.md)
