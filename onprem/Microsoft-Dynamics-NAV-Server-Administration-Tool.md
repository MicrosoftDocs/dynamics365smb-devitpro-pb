---
title: "Microsoft Dynamics NAV Server Administration Tool"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 2d721218-fa9e-4140-bca3-c479438e8212
caps.latest.revision: 30
manager: edupont
---
# Microsoft Dynamics NAV Server Administration Tool
The [!INCLUDE[nav_admin](includes/nav_admin_md.md)] is a Microsoft Management Console \(MMC\) snap-in for creating and managing [!INCLUDE[nav_server](includes/nav_server_md.md)] instances. When you install the [Server Option](Server-Option.md) on a computer, the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] is one of the default features. The [!INCLUDE[nav_admin](includes/nav_admin_md.md)] is also an option when you install the [Client Option](Client-Option.md), although it is not one of the default components.  
  
 You typically run the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] by choosing **Microsoft Dynamics NAV Administration** from the Start menu. For some scenarios, however, you may need to open the MMC first and then add the [!INCLUDE[navnow](includes/navnow_md.md)] snap-in. For example, see [How to: Administer Multiple Microsoft Dynamics NAV Server Computers](How-to--Administer-Multiple-Microsoft-Dynamics-NAV-Server-Computers.md). In this case, choose **Run** from the Start menu and then specify the Microsoft Management Console:  
  
```  
mmc  
```  
  
> [!IMPORTANT]  
>  Only members of the Administrator group on the computer are able to use the [!INCLUDE[nav_admin](includes/nav_admin_md.md)].  
  
> [!IMPORTANT]  
>  The [!INCLUDE[nav_admin](includes/nav_admin_md.md)] is not supported for multi-user environments.  
  
 To learn more about how to use [!INCLUDE[nav_admin](includes/nav_admin_md.md)], see one of the following topics:  
  
|To|See|  
|--------|---------|  
|Learn about the different tools and options for administering [!INCLUDE[navnowlong](includes/navnowlong_md.md)].|[Administration](Administration.md)|  
|Administer a remote [!INCLUDE[nav_server](includes/nav_server_md.md)] computer.|[How to: Administer a Remote Microsoft Dynamics NAV Server Computer](How-to--Administer-a-Remote-Microsoft-Dynamics-NAV-Server-Computer.md)|  
|Administer multiple [!INCLUDE[nav_server](includes/nav_server_md.md)] computers from a single administrative console.|[How to: Administer Multiple Microsoft Dynamics NAV Server Computers](How-to--Administer-Multiple-Microsoft-Dynamics-NAV-Server-Computers.md)|  
|Create a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.|[How to: Create a Microsoft Dynamics NAV Server Instance](How-to--Create-a-Microsoft-Dynamics-NAV-Server-Instance.md)|  
|Mount a tenant on a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that is configured for multitenancy.|[How to: Mount or Dismount a Tenant on a Microsoft Dynamics Server Instance](How-to--Mount-or-Dismount-a-Tenant-on-a-Microsoft-Dynamics-Server-Instance.md)|  
|Manage [!INCLUDE[nav_server](includes/nav_server_md.md)] instances.|[Managing Microsoft Dynamics NAV Server Instances](Managing-Microsoft-Dynamics-NAV-Server-Instances.md)|  
|Manage settings for a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.|[Microsoft Dynamics NAV Server Settings](Microsoft-Dynamics-NAV-Server-Settings.md)|  
|Configure [!INCLUDE[nav_server](includes/nav_server_md.md)] settings.|[Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)|  
  
> [!TIP]  
>  You can also administrate your [!INCLUDE[navnow](includes/navnow_md.md)] deployment using [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets. For more information, see [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md).  
  
## Navigating the Microsoft Dynamics NAV Server Administration Tool  
 [!INCLUDE[nav_admin](includes/nav_admin_md.md)] is divided into three panes:  
  
-   The left pane shows a tree view that lists all [!INCLUDE[nav_server](includes/nav_server_md.md)] computers that you are administering from this computer and all [!INCLUDE[nav_server](includes/nav_server_md.md)] instances on those computers. The first time that you run [!INCLUDE[nav_admin](includes/nav_admin_md.md)], the view is collapsed. You only see the local server computer without any [!INCLUDE[nav_server](includes/nav_server_md.md)] instances listed.  
  
     ![Admin Console Root collapsed.](media/ConsoleRootInit.jpg "ConsoleRootInit")  
  
-   Choose **Microsoft Dynamics NAV \(Local\)**, under Console Root, in the left pane of the Microsoft Dynamics NAV Server Administration tool, to display all Microsoft Dynamics NAV instances on the server computer in the center pane:  
  
     ![Console root with two server instances.](media/ConsoleRootExp.png "ConsoleRootExp")  
  
     For information about how to manage [!INCLUDE[nav_server](includes/nav_server_md.md)] instances, see [Managing Microsoft Dynamics NAV Server Instances](Managing-Microsoft-Dynamics-NAV-Server-Instances.md).  
  
-   The **center pane** shows information about the item that you have selected in the left pane. When the selected item is a computer running [!INCLUDE[nav_server](includes/nav_server_md.md)], the center pane shows a list of [!INCLUDE[nav_server](includes/nav_server_md.md)] instances on that computer and the status of each instance \(running or stopped\), and the name of the account the instance is running under.  
  
     When the item selected in the left pane is a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, the center pane shows the settings for that instance. For information about how settings are organized in the center pane, see [Microsoft Dynamics NAV Server Settings](Microsoft-Dynamics-NAV-Server-Settings.md). For information about a specific setting, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  
  
-   If the [!INCLUDE[nav_server](includes/nav_server_md.md)] is configured for multitenancy, then you can expand the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance items in the left pane to display a **Tenants** item. Select the **Tenants** item to display all the tenants that are mounted on a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance in the center pane. For more information, see [Multitenant Deployment Architecture](Multitenant-Deployment-Architecture.md)  
  
-   The **right pane** displays available actions for the object that is selected in the left pane. These options differ depending on whether a [!INCLUDE[nav_server](includes/nav_server_md.md)] computer or a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is selected.  
  
-   The **Windows PowerShell History** pane lists the [!INCLUDE[wps_2](includes/wps_2_md.md)] commands that the equivalent of the tasks you perform in the [!INCLUDE[nav_admin](includes/nav_admin_md.md)]. You can access the Windows PowerShell History pane from the **Actions** menu and from the right pane. To run a command that is shown in the **Windows PowerShell History** pane, you can copy the command and paste it into the [!INCLUDE[nav_shell](includes/nav_shell_md.md)], for example.