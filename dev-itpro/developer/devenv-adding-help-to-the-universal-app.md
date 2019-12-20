---
title: "Adding Help to the Microsoft Dynamics NAV Universal App"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics365-business-central"
---
# Adding Help to the Microsoft Dynamics NAV Universal App
To complete designing your [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)] solution, you have to offer users Help. Although tablets and phones have a simpler interface than both the [!INCLUDE[nav_web](includes/nav_web_md.md)] and the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], there can be times where the user needs help understanding the purpose of a page or a workflow.  
  
 Adding Help to a [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)] solution is not different from adding Help to [!INCLUDE[d365_bus_cent_short](includes/d365_bus_cent_short_md.md)] in general.  
  
 Help is linked to the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)] using the same technology as for the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[nav_web](includes/nav_web_md.md)]. Help is invoked on the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)] through an action on each page. The Help action is always the last action on the list. Because the same underlying technology applies to all clients, Help can be reused on all clients. The only difference is that field Help cannot be called directly from the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)]. Instead, users will be lead to the page Help and this should therefore be designed to guide users to relevant field topics.  
  
## Adding Help  
 Add Help to your solution by adding new HTML files, or modifying existing HTML files on your Help Server. Context-sensitivity is decided by topic names alone. Therefore naming is very important to get the Help call to work. Also, always make sure to work on an offline copy of a Help topic on the Help Server and then upload the topic\(s\) when you are finished.  
  
 For example, you can add a new topic to guide users who are using the Sales Rep Role Center created in [Walkthrough: Developing a Sales Rep Role Center for the Business Central Tablet Client](devenv-Walkthrough-Developing-Sales-Rep-Role-Center-business-central-Tablet-Client.md). This topic will have to be named **N\_50006.htm**, based on the page ID and prefixed with N\_ which is the notation for pages. This topic must be put on your Help Server in the equivalent folder of `C:\inetpub\wwwroot\bc_server_instanceHelp\help\en`. In this topic, write text that guides the user and explains the processes and workflows associated with the Role Center page. Also, add direct links to Help topics on fields that you think the user will need guidance for. The notation for fields on tables is **T\_\<table ID>\_\<field ID>**, and the notation for page controls is **N\_\<page ID>\_\<page control ID>**. See more examples on your Help Server.  
  
> [!IMPORTANT]  
>  The N\_50006.htm file must adhere to the classic.css style sheet, which you can find on the Help Server.  
  
## See Also  
 [Developing for the Business Central Universal App](devenv-Developing-for-the-Universal-App.md)   
 [Getting Started Developing for the Business Central Universal App](devenv-Getting-Started-Developing-for-the-Universal-App.md)