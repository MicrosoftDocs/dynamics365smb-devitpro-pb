---
title: "PromotedOnly Property"
ms.custom: na
ms.date: 06/16/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 516cecd6-1623-4c0a-9191-f88e626964d1
caps.latest.revision: 3
author: SusanneWindfeldPedersen
---

 

# PromotedOnly Property
Specifies whether the selected action is *promoted only*, which means that it will appear only on the **Home** tab in the ribbon and not on the tab (ActionContainer control) where it is defined.  
  
## Applies To  
  
-   Page Actions  
  
## Property Value  
 **True** to set the action as promoted only; otherwise, **false**. The default value is **false**.  
  
## Remarks  
 This property is only applicable when the [Promoted Property](devenv-promoted-property.md) is set to **true**. For example, if you have an action defined under the **ActionItems** action container, and you set the **Promoted** and **PromotedOnly** properties to **true**, then in the client, the action will be shown on the **Home** tab but will be hidden on the **Actions** tab.  
  
 This property in not relevant on the tablet and phone because only promoted actions are displayed on these clients.  
  
## See Also  
<!--
 [How to: Promote Actions on Pages](../devenv-How-to-Promote-Actions-on-Pages.md)   
 [How to: Add Actions to a Page](../devenv-How-to-Add-Actions-to-a-Page.md)   -->
 [Actions Overview](../devenv-actions-overview.md)