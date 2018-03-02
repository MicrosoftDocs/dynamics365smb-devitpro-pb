---
title: "ConstValue Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0e3ac7d5-83b5-4f92-b0d5-fd98fd932647
caps.latest.revision: 4
---
# ConstValue Property
Sets the value of the C/AL text constant for the current application language of the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)].  
  
## Applies To  
 **Local** and **global** text constants in the C/AL code of objects.  
  
## Remarks  
 The **ConstValue** property sets the text string in the [ConstValueML Property](ConstValueML-Property.md) for the current application language of the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]. For example, if the application language of the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] is set to English \(United States\) and you set the **ConstValue** property to **test**, then the value **ENU=test** is included in the **ConstValueML** property.  
  
## See Also  
 [How to: Change the Language in the User Interface](How-to--Change-the-Language-in-the-User-Interface.md)   
 [Multilanguage Development](Multilanguage-Development.md)