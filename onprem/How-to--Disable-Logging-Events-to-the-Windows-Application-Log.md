---
title: "How to: Disable Logging Events to the Windows Application Log"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 98fd11e6-fac1-4ad6-8a3f-93e8b39e94b1
caps.latest.revision: 3
---
# How to: Disable Logging Events to the Windows Application Log
Because the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance events are always logged to the Application and Services Logs, you can disable logging [!INCLUDE[nav_server](includes/nav_server_md.md)] instance events in the Windows Application log and not lose any data. The Windows Application log contains events from several applications and components. Disabling logging to the Windows Application log enables you to limit the amount of data that is stored.  
  
> [!IMPORTANT]  
>  If you are using System Center Operations Manager to monitor [!INCLUDE[nav_server](includes/nav_server_md.md)] instances, do not disable logging to the Windows Application log. If you do, monitoring will not work.  
  
 To disable logging to the Window Applications Log, you can use the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] or modify the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance configuration file \(CustomSettings.config\).  
  
## To configure custome telemtery logging to the Windows Application log by using the [!INCLUDE[nav_admin](includes/nav_admin_md.md)]  
  
1.  To start the [!INCLUDE[nav_admin](includes/nav_admin_md.md)], choose **Start**, and in the **Search programs and files** box, type **Microsoft Dynamics NAV Administration**, and then choose the related link.  
  
2.  In the left pane, under **Console root**, select the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  
  
3.  In the center pane, choose the **Edit** button.  
  
4.  Under **General**, clear the **Enable Event Logging to Windows Application Log** check box.  
  
5.  Choose the **Save** button, and then choose the **OK** button.  
  
     You must restart the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance for the changes to take effect.  
  
6.  To restart, the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, in the left pane, select the Microsoft Dynamics NAV computer.  
  
     Unless you are administering a remote computer, this is Microsoft Dynamics NAV \(local\).  
  
7.  In the center pane, right-click an instance, and then choose **Restart**.  
  
## To disable logging to the Windows Application log by modifying the CustomSettings.config file  
  
1.  Open the CustomSettings.config file for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance in a text editor, such as Notepad.  
  
     By default, the file is located in the [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\Service folder or [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\Service\\Instances\\\<instancename> folder \(for multitenant installations\).  
  
2.  Set the **EnableApplicationChannelLog** setting to **false**.  
  
3.  Save the file, and then restart the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  
  
## See Also  
 [Monitoring Dynamics NAV Server Events Using Event Viewer](Monitoring-Microsoft-Dynamics-NAV-Server-Events-in-the-Windows-Event-Log.md)   
 [Monitoring Microsoft Dynamics NAV Server Events](Monitoring-Microsoft-Dynamics-NAV-Server-Events.md)