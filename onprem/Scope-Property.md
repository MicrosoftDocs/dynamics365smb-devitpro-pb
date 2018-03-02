---
title: "Scope Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5be1e2fa-e50e-4f07-a48b-76fed26fd9a0
caps.latest.revision: 9
manager: edupont
---
# Scope Property
Specifies the scope of the action to be either page-specific, or specific to a repeater control. The **Scope** property has two options; **Page** and **Repeater**.  
  
 The **Scope** property is only used on pages that include a repeater control and it offers a way to determine the scope of an action to be the page or to be specific to the repeater control. The default behavior of the **Scope** property is **Page**.  
  
 The Scope property has the following effect:  
  
-   On a [!INCLUDE[nav_windows](includes/nav_windows_md.md)], the **Scope** property has no effect. All actions are shown in the ribbon.  
  
-   On a [!INCLUDE[nav_web](includes/nav_web_md.md)], if the **Scope** property is set to **Page**, the action will be shown in the ribbon. If the **Scope** property is set to **Repeater** the action will be shown in both the repeater control and in the ribbon.  
  
-   On a [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)], if the **Scope** property is set to **Page**, the action will be shown in the page action menu. If the **Scope** property is set to **Repeater**, the action is moved from the page action menu to the repeater control shortcut menu.  
  
-   On a [!INCLUDE[nav_phone](includes/nav_phone_md.md)], if the **Scope** property is set to **Page**, the action will be shown in the page action menu. If the **Scope** property is set to **Repeater**, there are two scenarios:  
  
    -   If the list **is** associated with a card page, the developer must make sure to add the action functionality to this card page.  
  
    -   If the list **is not** associated with a card page, and the user taps a row in the list to view details, the action is available on the details page.  
  
## See Also  
 [Defining Action Scope for Microsoft Dynamics NAV Pages](Defining-Action-Scope-for-Microsoft-Dynamics-NAV-Pages.md)   
 [Differences and Limitations When Developing Pages for the Microsoft Dynamics NAV Universal App](Differences-and-Limitations-When-Developing-Pages-for-the-Microsoft-Dynamics-NAV-Universal-App.md)