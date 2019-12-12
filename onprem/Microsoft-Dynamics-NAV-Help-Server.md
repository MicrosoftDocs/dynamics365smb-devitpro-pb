---
title: Microsoft Dynamics NAV Help Server 
description: The Help functionality deploys to a Dynamics NAV Help Server, which is a website that installs on the specified server.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 168fade9-6f28-4e01-ae0e-20f4a8b546cd
caps.latest.revision: 5
---
# Working with Dynamics NAV Help Server 
[!INCLUDE[navnow](includes/navnow_md.md)] Help deploys to a [!INCLUDE[navnow](includes/navnow_md.md)] Help Server, which is a website that installs on the specified server. The website includes Search and other navigation, and it provides context-sensitive Help for [!INCLUDE[nav_web](includes/nav_web_md.md)] in addition to [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. Depending on your deployment architecture, you can choose to set up a dedicated Help Server that all clients connect to, or you can choose to deploy customer-specific Help Servers.  

## Accessing [!INCLUDE[navnow](includes/navnow_md.md)] Help  
 When you have deployed a [!INCLUDE[navnow](includes/navnow_md.md)] Help Server, users in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[nav_web](includes/nav_web_md.md)] can access Help by pressing F1 or choosing a Help icon.  

> [!TIP]  
>  In the [!INCLUDE[nav_web](includes/nav_web_md.md)], if you want to access context-sensitive Help for a field, for example, choose the caption of the field. This is equivalent to pressing F1 in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

 If you want to access the [!INCLUDE[navnow](includes/navnow_md.md)] Help in a browser, enter the address for the Help Server, such as https://*MyServer*:49000/main.aspx?lang=en&content=conGettingStarted.htm. You can save the URL as a favorite in your browser, and you can save links to individual Help topics such as https://*MyServer*:49000/Main.aspx?lang=en&content=conWorkingWithNav.htm.  

 For example, if there is a complicated task that you have to do periodically, you can find the topic that describes how to do that task, and you can save the URL to the topic to your desktop or your favorites.  

 The URL to a Help topic contains two query parameters as described in the following table.  

|Name|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|Example|  
|----------|---------------------------------------|-------------|  
|*lang*|Specifies the locale.<br /><br /> [!INCLUDE[navnow](includes/navnow_md.md)] defaults to the Help content in the non-locale-specific version if the client locale cannot be found.|*da-dk*|  
|*content*|Specifies the HTML file that contains the relevant Help content.|conGettingStarted.htm|  

 In the standard Help, most Help topics have easily recognizable file names, such as conGettingStarted.htm for the conceptual overview that is called Getting Started. Similarly, the Help content for field 1 on table 3 is in the T\_3\_1.htm file.  

 In the standard Help for [!INCLUDE[navnow](includes/navnow_md.md)], many file names for topics have a prefix that identifies the type of content that the topic contains. The following table describes the prefixes for file names.  

|Name|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|----------|---------------------------------------|  
|con|The topic contains a conceptual overview.|  
|B\_|The topic contains reference content for a batch job.|  
|N\_|The topic contains reference content for a page.|  
|ori|The topic is an orientation topic that provides an overview of a group of topics.|  
|R\_|The topic contains reference content for a report.|  
|ref|The topic contains reference content for the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)].|  
|S\_|The topic contains reference content for a system window or dialog.|  
|T\_|The topic contains reference content for a table or a field on a table.|  
|tsk|The topic is a task topic and contains procedures.|  
|wlk|The topic contains a walkthrough.|  

## See Also  
 [Configuring Microsoft Dynamics NAV Help Server](Configuring-Microsoft-Dynamics-NAV-Help-Server.md)   
 [Upgrading Your Existing Help Content](Upgrading-Your-Existing-Help-Content.md)   
 [Help Table of Contents](Help-Table-of-Contents.md)   
 [Finding Information in Help](Finding-Information-in-Help.md)   
 [Product and Architecture Overview](Product-and-Architecture-Overview.md)
