---
title: "Extending Any Microsoft Dynamics NAV Client Using Control Add-ins"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 117009ff-718f-47ba-bade-175481a0ca94
caps.latest.revision: 10
---
# Extending Any Microsoft Dynamics NAV Client Using Control Add-ins
With [!INCLUDE[navnow](includes/navnow_md.md)] you can write control add-ins that add custom functionality to Role Centers and pages on all display targets, using the same extensibility framework. The following sections provide an overview of the documentation that is available to develop and use control add-ins.  
  
 Control add-ins that are designed with [!INCLUDE[navsicily](includes/navsicily_md.md)], [!INCLUDE[navcrete](includes/navcrete_md.md)], or [!INCLUDE[navcorfu](includes/navcorfu_md.md)] using a .NET 4.5 assembly and a manifest file, can be used on all display targets. Control add-ins that were written for earlier versions, will still run on the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
> [!NOTE]  
>  Javascript-based client add-ins in repeater controls, such as lists, listparts, list subpages, and worksheets, are not supported on any of the [!INCLUDE[navnow](includes/navnow_md.md)] clients.  

> [!NOTE]  
>  To support control add-ins running in IE7 mode, you can enable a key in the ClientUserSettings.config file. For more information, see the **Settings in the ClientUserSettings.config file** section in [Configuring the Windows Client](Configuring-the-Windows-Client.md).

  
## Getting an Overview of Client Control Add-ins  
  
|To|See|  
|--------|---------|  
|Get a general overview about client control add-ins and where they fit in the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] architecture.|[Extending Any Microsoft Dynamics NAV Client Using Control Add-ins](Extending-Any-Microsoft-Dynamics-NAV-Client-Using-Control-Add-ins.md)|  
|Go through an example of how to implement a simple control add-in, creating a .NET assembly, a manifest file, and a page to display the control add-in from.|[Walkthrough: Creating and Using a Client Control Add-in](Walkthrough--Creating-and-Using-a-Client-Control-Add-in.md)|  
|Review an example of a manifest file.|[Manifest Overview](Manifest-Overview.md)|  
|Get reference Help on the available methods for the extensibility framework.|[InvokeExtensibilityMethod Method](InvokeExtensibilityMethod-Method.md), [GetImageResource Method](GetImageResource-Method.md), [GetEnvironment Method](GetEnvironment-Method.md), and [OpenWindow Method](Open-Window-Method.md).|  
  
## See Also    
 [Developing for the Microsoft Dynamics NAV Universal App](Developing-for-the-Microsoft-Dynamics-NAV-Universal-App.md)   
 [Developing for the Microsoft Dynamics NAV Web Client](Developing-for-the-Microsoft-Dynamics-NAV-Web-Client.md)
