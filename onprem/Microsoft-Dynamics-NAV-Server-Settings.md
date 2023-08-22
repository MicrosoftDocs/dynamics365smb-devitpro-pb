---
title: "Microsoft Dynamics NAV Server Settings"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c6728883-e7a0-4965-9d4d-c8f323335c9a
caps.latest.revision: 13
---
# Microsoft Dynamics NAV Server Settings
The center pane in the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] shows settings for the currently selected [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. Settings are grouped into the following tabs, according to service category.  
  
|Tab|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------|---------------------------------------|  
|**General**|Settings apply to all kinds of services.|  
|**Client Services**|Settings apply to [!INCLUDE[nav_windows](includes/nav_windows_md.md)]s and [!INCLUDE[nav_web](includes/nav_web_md.md)]s.|  
|**OData Web Services**|Settings apply to OData web services.|  
|**SOAP Web Services**|Settings apply to SOAP web services.|  
|**NAS Services**|Settings apply to NAV Application Server \(NAS\) services.|  
|**Management Services**|Settings apply to the [!INCLUDE[nav_admin](includes/nav_admin_md.md)].|  
  
## Settings Information  
 In the [!INCLUDE[nav_admin](includes/nav_admin_md.md)], you can view information about the currently selected setting in the information pane at the bottom of the center pane. You can also view complete setting information in [!INCLUDE[navnow](includes/navnow_md.md)] Help. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  
  
## Modifying [!INCLUDE[nav_server](includes/nav_server_md.md)] Settings  
 If you change the value of any setting in any service category, you must restart the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance for the change to take effect. If you plan to run different types of services on a single [!INCLUDE[nav_server](includes/nav_server_md.md)] computer, it is a good idea to run different service types in separate service instances. For example, if you plan to run both Client services and NAS services on a single [!INCLUDE[nav_server](includes/nav_server_md.md)] computer, run the Client services in one server instance and the NAS services in a separate instance. That way, if you want to change one of your NAS services settings, you will not affect [!INCLUDE[nav_windows](includes/nav_windows_md.md)] users when you have to restart the instance to make the change take effect. For performance reasons, it is also a good idea to run different types of [!INCLUDE[navnow](includes/navnow_md.md)] services on a [!INCLUDE[nav_server](includes/nav_server_md.md)] computer in different instances.  
  
## See Also  
 [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)   
 [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md)
