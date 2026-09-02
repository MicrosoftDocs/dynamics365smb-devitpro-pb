---
title: Role Center Behaviors on Tablet and Phone
description: Learn how Role Center pages behave differently in the Business Central tablet and phone clients compared to the web client, and how that affects design.
ms.date: 08/24/2026
ms.reviewer: solsen
ms.topic: concept-article
author: SusanneWindfeldPedersen
ms.author: solsen
---

# Role Center behaviors
This section describes how the Role Center pages behave differently in the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and the [!INCLUDE[nav_phone](includes/nav_phone_md.md)] compared to the [!INCLUDE[nav_web](includes/nav_web_md.md)]. This behavior influences how you build your Role Center pages. To learn more about pages on tablets and phones, see [Differences and limitations when developing pages for the Business Central mobile app](devenv-differences-and-limitations-developing-pages-business-central-mobile-app.md).  
  
## Behavioral differences  
  
|Concept|On tablet or phone|  
|-------------|----------------------|  
|Tiles|The app bar automatically shows tiles in two or three columns, depending on the total number of tiles. A Role Center with many tiles only displays the tiles that fit vertically on the screen. Other tiles aren't shown and aren't available.<br /><br /> On the phone, the Home page automatically shows tiles in one or two columns, depending on the total number of tiles, and you can scroll them.|  
|Actions|Actions that are added under an **ActionContainer** of the subtype **Embedding** are always shown in the navigation pane.|  
|Actions|Actions that you add under an **ActionContainer** of the subtype **Sections** never show, and you can't access them.<br /><br /> You can't go to other activity groups as you can in [!INCLUDE[nav_web](includes/nav_web_md.md)]. Because activity groups link to related functionality, provide links to this functionality through its own Role Center as a separate entry point.|  
|Actions|- In the action pane, if the current profile has no configuration for the specific page, for example, if you delete it, only promoted actions show. If there are no promoted actions, any actions under **Creation** show. If there are no **Creation** actions, an empty pane shows.<br />-   If a page configuration exists, the **Creation** group shows, together with any new groups that you created. Actions that remain in their original group, even if you renamed them, don't show until you move them to a custom group. This behavior differs from [!INCLUDE[nav_web](includes/nav_web_md.md)] which always shows them.<br />-   When you add actions to the **Home** tab, it corresponds to setting the actions to **Promoted**. However, you can only do this with the configuration tooling if there is at least one **Promoted** action. Otherwise, the **Home** tab is never available for customization.|  
|Parts|Available on the tablet.<br /><br /> On the phone, a maximum of five parts can be displayed. If you have multiple parts that contain cues, these parts display as one part.<br /><br /> When you build Role Centers, avoid using the **Group** type to group the parts that make up the Role Center. Instead, create all parts directly underneath the **Container** type. This approach optimizes the layout to dynamically switch between a one, two, or three column layout, and thereby fit more display targets.|  
  
## Related information  
[Differences and limitations when developing pages for the Business Central mobile app](devenv-differences-and-limitations-developing-pages-business-central-mobile-app.md)  
