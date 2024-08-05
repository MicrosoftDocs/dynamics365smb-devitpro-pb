---
title: Server Instance Management
description: This article describes how to work with Server instances in the Server Administration tool and in the Services MMC snap-in.
ms.date: 10/01/2018
ms.topic: article
ms.assetid: 490ff91d-fc9e-4c80-bfc7-00e5ae87d24f
caps.latest.revision: 28
---
# Managing Microsoft Dynamics NAV Server Instances
This topic describes how to work with [!INCLUDE[nav_server](includes/nav_server_md.md)] instances in the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] and in the Services MMC snap-in. For more information about how to create a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, see [How to: Create a Microsoft Dynamics NAV Server Instance](How-to--Create-a-Microsoft-Dynamics-NAV-Server-Instance.md). For more information about the settings that you can configure in a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, see [Microsoft Dynamics NAV Server Settings](Microsoft-Dynamics-NAV-Server-Settings.md).  
  
 Each [!INCLUDE[nav_server](includes/nav_server_md.md)] instance on a computer runs as a separate Windows service and can run under a separate computer account, which is the Service Account.  
  
 In addition to the [!INCLUDE[nav_admin](includes/nav_admin_md.md)], you can use the Services snap-in, which is included in **Control Panel**, to see the [!INCLUDE[nav_server](includes/nav_server_md.md)] instances on the computer. To open the Services snap-in, choose the **Start** menu, in the Search box type **Services**, and then choose the related link. Each instance name begins with **Microsoft Dynamics NAV Server**. The default instance is identified as **[!INCLUDE[nav_server](includes/nav_server_md.md)]\[[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]\]**. Any instances that you create are identified by **[!INCLUDE[nav_server](includes/nav_server_md.md)]**, following by the instance name in brackets. For example, if you create a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance and name it **Denmark**, the Services snap-in shows the following instances:  
  
-   **[!INCLUDE[nav_server](includes/nav_server_md.md)]\[[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]\]**  
  
-   **[!INCLUDE[nav_server](includes/nav_server_md.md)] \[Denmark\]**  
  
> [!TIP]  
>  You can also administrate your [!INCLUDE[navnow](includes/navnow_md.md)] deployment using [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets. For more information, see [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md).  
  
## Server Instances and Service Types  
 In [!INCLUDE[nav_admin](includes/nav_admin_md.md)], settings for a server instance are organized into tabs and then organized by service type.  
  
|Setting|Applies to|  
|-------------|----------------|  
|**General**|All types of services.|  
|**Client Services**|[!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[nav_web](includes/nav_web_md.md)].|  
|**OData Web Services**|OData web services.|  
|**SOAP Web Services**|SOAP web services|  
|**NAS Services**|[!INCLUDE[navnow](includes/navnow_md.md)] Application Server \(NAS\) services.|  
|**Management Services**|Services for managing [!INCLUDE[nav_server](includes/nav_server_md.md)] on the computer.|  
  
 For more information about the different service types, see [Client Types](Client-Types.md).  
  
 You should recognize and understand the difference between server instances and service types.  
  
 A *server instance* is a distinct service in Windows and is the middle tier in the [!INCLUDE[navnow](includes/navnow_md.md)] three-tier architecture. For more information, see [Product and Architecture Overview](Product-and-Architecture-Overview.md).  
  
 A *service type* is a category within a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  
  
> [!IMPORTANT]  
>  When you modify a permission set or modify permissions for a user, you must restart all [!INCLUDE[nav_server](includes/nav_server_md.md)] instances in the database for those changes to take effect. The exception is for the current instance—that is, the instance that the client \(the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or the [!INCLUDE[nav_web](includes/nav_web_md.md)]\) is using when the changes are made. There is no need to restart this instance. It is also necessary to restart [!INCLUDE[nav_server](includes/nav_server_md.md)] instances if you modify permissions sets or user permissions using the [!INCLUDE[navnow](includes/navnow_md.md)] Windows PowerShell cmdlets.  
  
## Managing Different Types of Services from a Single [!INCLUDE[nav_server](includes/nav_server_md.md)] Computer  
 When you change the value of any setting in any service category, you must restart the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance for the change to take effect. Restarting the instance affects all services types within that instance. For example, [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[nav_web](includes/nav_web_md.md)] users are disconnected, and web service applications are interrupted. Therefore, if you plan to run different types of services on a single computer running [!INCLUDE[nav_server](includes/nav_server_md.md)], we recommend that you run different services types in separate service instances. Your computer should have sufficient memory to run multiple service instances. For example, if you plan to use both the Client Services and OData Web Services on a single computer running [!INCLUDE[nav_server](includes/nav_server_md.md)], then you should run the Client Services in one server instance and the OData Web Services in a separate server instance. If you have to change an OData web services setting, then you do not affect [!INCLUDE[nav_windows](includes/nav_windows_md.md)] users when you restart the instance to enable the change.  
  
 To disable a service type, clear the **Enable** property on the relevant tab. The only service type that does not have an **Enable** property is NAS Services. To disable NAS Services, set **Startup Codeunit** on the **NAS Services** tab to **0**. For more information, see [Configuring NAS Services](Configuring-NAS-Services.md).  
  
## See Also  
 [How to: Configure a Microsoft Dynamics NAV Server Instance](How-to--Configure-a-Microsoft-Dynamics-NAV-Server-Instance.md)   
 [How to: Start, Stop, Restart, or Remove a Microsoft Dynamics NAV Server Instance](How-to--Start--Stop--Restart--or-Remove-a-Microsoft-Dynamics-NAV-Server-Instance.md)