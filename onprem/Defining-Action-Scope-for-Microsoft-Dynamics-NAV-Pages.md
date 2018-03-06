---
title: "Defining Action Scope for Microsoft Dynamics NAV Pages"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0f85161b-ecc1-4106-b7d5-82b559233161
caps.latest.revision: 12
manager: edupont
---
# Defining Action Scope for Microsoft Dynamics NAV Pages
When developing pages for [!INCLUDE[navnow](includes/navnow_md.md)] that include a repeater control, it is useful to be able to define whether the actions available on a page apply to the whole page or are related to the repeater control on the page.  
  
 The purpose of the **Scope** property is to enable developers to add row-specific actions to the shortcut menu which is available to the user on each line. This gives users a more direct way to invoke actions that relate to the selected row or line.  
  
 This is the case when you have, for example, **Line Comments** which are related to a line, but appear in the ribbon. You can specify the scope of the action by setting the **Scope** property on the page action to be either **Page** or **Repeater**.  
  
> [!NOTE]  
>  It is strongly recommended that the **Scope** property is always appropriately set when developing pages for the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)].  
  
 For more information on how the settings are interpreted on the various clients, see [Scope Property](Scope-Property.md).  
  
## See Also  
 [Scope Property](Scope-Property.md)