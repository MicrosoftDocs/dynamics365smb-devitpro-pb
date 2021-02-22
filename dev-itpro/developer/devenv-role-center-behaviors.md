---
title: Role Center Behaviors
description: This section describes in which areas the Role Center pages have a different behavior in the tablet client and the phone client from the web client.
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: blrobl
---

# Role Center Behaviors
This section describes in which areas the Role Center pages have a different behavior in the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and the [!INCLUDE[nav_phone](includes/nav_phone_md.md)] compared to the [!INCLUDE[nav_web](includes/nav_web_md.md)]. This behavior has influence on how you will build your Role Center pages. For information about pages on tablets and phones in general, see [Differences and Limitations When Developing Pages for the Business Central Mobile App](devenv-differences-and-limitations-developing-pages-business-central-mobile-app.md).  
  
## Behavioral differences  
  
|Concept|On Tablet/Phone|  
|-------------|----------------------|  
|Tiles|The app bar will automatically show tiles in two or three columns depending on the total number of tiles. A Role Center with many tiles only displays the tiles that fit vertically on the screen; other tiles are not shown and will not be available.<br /><br /> On the phone, the Home page will automatically show tiles in one or two columns depending on the total number of tiles and these can be scrolled.|  
|Actions|Actions that are added under an **ActionContainer** of the subtype **Embedding** are always shown in the navigation pane.|  
|Actions|Actions that are added under an **ActionContainer** of the subtype **Sections** are never shown, and cannot be accessed.<br /><br /> There is no ability to navigate to other Activity Groups as you can do in [!INCLUDE[nav_web](includes/nav_web_md.md)]. Because Activity Groups link to related functionality, the recommended workaround is to providing links to this functionality through their own Role Center as a separate entry point.|  
|Actions|-   In the action pane, if the current profile has no configuration for the specific page, for example, if this was deleted, only promoted actions will be shown. If there are no promoted actions, any actions under **Creation** will be shown. If there are no **Creation** actions, an empty pane will be shown.<br />-   If a page configuration exists, the **Creation** will be shown, together with any new groups that were created. Actions, even if they were renamed, which remain in their original group will not show until you move them to a custom group. This behavior differs from [!INCLUDE[nav_web](includes/nav_web_md.md)] which will always show them.<br />-   When you add actions to the **Home** tab, it corresponds to setting the actions to **Promoted**. However, you can only do this with the configuration tooling if there is at least one **Promoted** action. Otherwise, the **Home** tab will never be available for customization.|  
|Parts|Available on the tablet.<br /><br /> On the phone, there is a limit to a total number of 5 parts that can be displayed. If you have multiple parts that contain cues, these are currently displayed as one part.<br /><br /> When building Role Centers it is recommended to avoid using the **Group** type to group the parts that make up the Role Center, and instead create all parts directly underneath the **Container** type. This will optimize the layout to dynamically switch from a 1 to 2 to 3 column layout and thereby fit more display targets.|  
  
## See Also  
[Differences and Limitations When Developing Pages for the Business Central Mobile App](devenv-differences-and-limitations-developing-pages-business-central-mobile-app.md)  
