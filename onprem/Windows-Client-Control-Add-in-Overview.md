---
title: "Windows Client Control Add-in Overview"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b90d2cc6-b011-4d2c-9325-766cdb12ff9a
caps.latest.revision: 35
manager: edupont
---
# Windows Client Control Add-in Overview
With [!INCLUDE[navnowlong](includes/navnowlong_md.md)], you use [!INCLUDE[navnow](includes/navnow_md.md)] control add-ins to extend the [!INCLUDE[navnow](includes/navnow_md.md)] with custom functionality. A control add-in is a custom control, or visual element, for displaying and modifying data on [!INCLUDE[navnow](includes/navnow_md.md)] pages. The following illustration shows a control add-in example that displays a gauge control on a page.  

 ![Control add&#45;in example of a gauge control.](media/NAV_ControlAddin_Gauge_Example.png "NAV\_ControlAddin\_Gauge\_Example")  

 Control add-ins can exchange data with the [!INCLUDE[nav_server](includes/nav_server_md.md)] on various data types and can respond to user interaction to raise events in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] that execute additional C/AL code.  

 Control add-ins for [!INCLUDE[navnow](includes/navnow_md.md)] are built with the Microsoft .NET Framework–based assemblies that you install on computers that are running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

> [!IMPORTANT]  
>  With [!INCLUDE[navsicily](includes/navsicily_md.md)], you can write control add-ins that can be displayed on both the [!INCLUDE[nav_web](includes/nav_web_md.md)] and the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. For more information, see [Extending Any Microsoft Dynamics NAV Client Using Control Add-ins](Extending-Any-Microsoft-Dynamics-NAV-Client-Using-Control-Add-ins.md).  

> [!IMPORTANT]  
>  In general, add-ins are built with the technology of the client.  

 In [!INCLUDE[nav_server](includes/nav_server_md.md)], you register the control add-in, and you can then use it with [!INCLUDE[nav_windows](includes/nav_windows_md.md)] pages. For more information, see [Installing and Configuring Windows Client Control Add-ins on Pages](Installing-and-Configuring-Windows-Client-Control-Add-ins-on-Pages.md).  

 You can use Microsoft Visual Studio to create your own control add-ins. For more information, see [Developing Windows Client Control Add-ins](Developing-Windows-Client-Control-Add-ins.md).  

## Windows Client Control Add-in Model  
 The following illustration shows the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] in the [!INCLUDE[navnow](includes/navnow_md.md)] architecture.  

 ![RoleTailored client control add&#45;in model.](media/NAVRTCControlAddinArchitecture.png "NAVRTCControlAddinArchitecture")  

 You install control add-in assemblies on the computer that is running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], not the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)]. Unlike pages that are instantiated by C/AL code, control add-ins are instantiated by using metadata that is in the [!INCLUDE[navnow](includes/navnow_md.md)] database.  

 If the assembly that contains the add-in also contains other .NET objects that are used in C/AL code on the server, it might be necessary to have the assembly on the server, too. As a best practice, those cases should be extracted into a separate assembly to store the code for the client add-in only on the client computer.  

### Interfaces Overview  
 The following table describes the interfaces that you can implement in a control add-in.  

|Interface|Description|See|  
|---------------|-----------------|---------|  
|Data Binding interface|Displays data from the [!INCLUDE[navnow](includes/navnow_md.md)] database.|[Binding a Windows Client Control Add-in to the Database](Binding-a-Windows-Client-Control-Add-in-to-the-Database.md)|  
|Event Interface|Selected public events in a control add-in that convert into C/AL triggers on a page that sends data back to the [!INCLUDE[nav_server](includes/nav_server_md.md)].|[Exposing Events and Calling Respective C/AL Triggers from a Windows Client Control Add-in](Exposing-Events-and-Calling-Respective-C-AL-Triggers-from-a-Windows-Client-Control-Add-in.md)|  
|Methods and Properties|Selected public methods and properties in a control add-in that can be called from C/AL triggers on a page.|[Exposing Methods and Properties in a Windows Client Control Add-in](Exposing-Methods-and-Properties-in-a-Windows-Client-Control-Add-in.md)|  
|Site Interface|Provides information about a control add-in and allows the control add-in to call functionality inside the [!INCLUDE[navnow](includes/navnow_md.md)] framework, such as retrieving metadata \(visible, caption, and so on\). This interface is implemented by the default definition interfaces and base classes of the client extensibility API.|[Client Extensibility API Overview](Client-Extensibility-API-Overview.md)<br /><br /> [IControlAddInSite](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.IControlAddInSite)|  

## Control Add-ins That Are Not Supported  
 Control add-ins are not supported in the [!INCLUDE[nav_web](includes/nav_web_md.md)]. If the page is displayed in the [!INCLUDE[nav_web](includes/nav_web_md.md)], the control add-in is ignored.  

## See Also  
 [Installing and Configuring Windows Client Control Add-ins on Pages](Installing-and-Configuring-Windows-Client-Control-Add-ins-on-Pages.md)   
 [Developing Windows Client Control Add-ins](Developing-Windows-Client-Control-Add-ins.md)
