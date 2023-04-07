---
title: "Developing Windows Client Control Add-ins"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0eacbf83-dce2-496e-8ea7-c3c42bcdd9cf
caps.latest.revision: 26
---
# Developing Windows Client Control Add-ins
[!INCLUDE[navnowlong](includes/navnowlong_md.md)] includes the client extensibility API for creating [!INCLUDE[nav_windows](includes/nav_windows_md.md)] control add-ins. The client extensibility API is provided in the Microsoft.Dynamics.Framework.UI.Extensibility.dll assembly, which is installed with the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. You develop control add-ins using Microsoft Visual Studio and distribute them as Microsoft .NET Framework–based assemblies for deployment to computers that are running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

## Design Considerations When Developing Control Add-ins  
 This section includes things to consider when you develop control add-ins.  

### Using a Control Add-in on Pages  

-   You apply control add-ins on field controls of [!INCLUDE[nav_windows](includes/nav_windows_md.md)] pages.  

    > [!IMPORTANT]  
    >  To develop control add-ins that supported both by the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[nav_web](includes/nav_web_md.md)], see [Extending Any Microsoft Dynamics NAV Client Using Control Add-ins](Extending-Any-Microsoft-Dynamics-NAV-Client-Using-Control-Add-ins.md).  

-   You can apply control add-ins on more than one field control on a page.  

-   You can use control add-ins on all page types except a RoleCenter page type.  

    > [!NOTE]  
    >  To include a control add-in on a Role Center, you apply the control add-in on a page that is assigned to a part of the Role Center.  

-   You can use control add-ins on pages that are included in parts and FactBoxes of other pages.  

-   You can design the user interface of the control add-in to fill the page part area partially or completely.  

-   You cannot use control add-ins on the following areas:  

    -   On a field under a repeater control, this is used display data in a list, such as in a list place  

    -   Ribbon  

    -   Command bar  

    -   Filter pane  

### Binding a Control Add-in to the Database to Display Data  
 A control add-in can bind with data in the [!INCLUDE[navnow](includes/navnow_md.md)] database, which lets you create control add-ins that can display and update data in the database. For more information, see [Binding a Windows Client Control Add-in to the Database](Binding-a-Windows-Client-Control-Add-in-to-the-Database.md).  

### Exposing Events and Calling Respective C/AL Triggers on a Page  
 By firing exposed events, a control add-in can call the **OnControlAddin** trigger or other triggers that correspond to those events on a page for a field that is equipped with the control add-in. For more information, see [Exposing Events and Calling Respective C/AL Triggers from a Windows Client Control Add-in](Exposing-Events-and-Calling-Respective-C-AL-Triggers-from-a-Windows-Client-Control-Add-in.md).  

### Exposing Methods and Properties to C/AL code  
 To extend UI controls on a page, you can expose methods and properties in a control add-in assembly so that they can be called by C/AL code on most any page code. For more information, see [Exposing Methods and Properties in a Windows Client Control Add-in](Exposing-Methods-and-Properties-in-a-Windows-Client-Control-Add-in.md).  

## See Also  
 [Client Extensibility API Overview](Client-Extensibility-API-Overview.md)   
 [How to: Create a Windows Client Control Add-in](How-to--Create-a-Windows-Client-Control-Add-in.md)   
 [Binding a Windows Client Control Add-in to the Database](Binding-a-Windows-Client-Control-Add-in-to-the-Database.md)   
 [Exposing Events and Calling Respective C/AL Triggers from a Windows Client Control Add-in](Exposing-Events-and-Calling-Respective-C-AL-Triggers-from-a-Windows-Client-Control-Add-in.md)   
 [Installing and Configuring Windows Client Control Add-ins on Pages](Installing-and-Configuring-Windows-Client-Control-Add-ins-on-Pages.md)   
 [Windows Client Control Add-in Overview](Windows-Client-Control-Add-in-Overview.md)
