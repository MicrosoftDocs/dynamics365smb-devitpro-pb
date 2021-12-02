---
title: "Scope (Action) Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Scope (Action) Property
Specifies the scope of the action to be either page-specific, or specific to a repeater control. The **Scope** property has two options; **Page** and **Repeater**.  
  
The **Scope** property is only used on pages that include a repeater control and it offers a way to determine the scope of an action to be the page or to be specific to the repeater control. In the repeater control, actions display in the shortcut menu the is available for each row in a list. The default behavior of the **Scope** property is **Page**.
  
 The Scope property has the following effect:  
  
-   On a [!INCLUDE[nav_web](../includes/nav_web_md.md)], if the **Scope** property is set to **Page**, the action will be shown in the action bar. If the **Scope** property is set to **Repeater** the action will be shown in both the repeater control shortcut menu and in the action bar.  
  
-   On a [!INCLUDE[nav_tablet](../includes/nav_tablet_md.md)], if the **Scope** property is set to **Page**, the action will be shown in the page action menu. If the **Scope** property is set to **Repeater**, the action is moved from the page action menu to the repeater control shortcut menu.  
  
-   On a [!INCLUDE[nav_phone](../includes/nav_phone_md.md)], if the **Scope** property is set to **Page**, the action will be shown in the page action menu. If the **Scope** property is set to **Repeater**, there are two scenarios:  
  
    -   If the list **is** associated with a card page, then the action is not available on the list page anywhere, and you should add the action to the card page.  
  
    -   If the list **is not** associated with a card page, and the user taps a row in the list to view details, the action is available on the details page.  
    
  
## See Also  
[Properties](devenv-properties.md)  
[Scope (Table) Property](devenv-scope-table-property.md)  
[Defining Action Scope for Business Central Pages](../devenv-defining-action-scope-for-pages.md)