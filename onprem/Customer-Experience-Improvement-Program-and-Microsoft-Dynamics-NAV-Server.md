---
title: "Customer Experience Improvement Program and Microsoft Dynamics NAV Server"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 3f97bafc-0349-49b5-9e5a-90b6a7599ad1
caps.latest.revision: 11
---
# Customer Experience Improvement Program and Microsoft Dynamics NAV Server
[!INCLUDE[nav_server](includes/nav_server_md.md)] supports the Customer Experience Improvement Program \(CEIP\), a tool that sends information to Microsoft about [!INCLUDE[nav_server](includes/nav_server_md.md)] usage and about the capacities of the computers where [!INCLUDE[nav_server](includes/nav_server_md.md)] is installed.  
  
 After [!INCLUDE[nav_server](includes/nav_server_md.md)] is installed, you can turn CEIP on or off on a per-server-instance basis with the **Send Feedback** parameter, which is on the **General** pane in the [!INCLUDE[nav_admin](includes/nav_admin_md.md)]. See [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md). By default, CEIP is disabled.  
  
## Background on CEIP  
 Microsoft uses the information it collects through the Customer Experience Improvement Program to improve products. The information that is gathered contains no personally identifying information \(such as passwords, IP addresses, or user IDs\), no customer identifying information, and no customer data. CEIP helps Microsoft understand usage patterns and common computer configurations. It can also provide information that helps Microsoft diagnose software failures.  
  
 CEIP sends usage data to Microsoft at midnight every seven days counting from the midnight before when the server instance starts, and also when the service instance stops. If there is no opportunity to send data when the server instance stops, it is sent the next time that the server instance starts.  
  
 The [!INCLUDE[navnow](includes/navnow_md.md)] team uses CEIP information when trying to determine feature sets for upcoming releases and when deciding which issues to address in release updates. CEIP also allows the team to validate assumptions about design and customer usage.  
  
## Information Collected by the Customer Experience Improvement Program  
 When CEIP is enabled, [!INCLUDE[nav_server](includes/nav_server_md.md)] sends information about the configuration of the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer:  
  
-   Physical memory  
  
-   Number of processors  
  
-   Processor speed  
  
-   Operating system  
  
-   System language  
  
 In addition, information about [!INCLUDE[nav_server](includes/nav_server_md.md)] instance usage and configuration is sent:  
  
-   Maximum number of connections per client type. See [Client Types](Client-Types.md).  
  
-   Maximum number of connections between [!INCLUDE[nav_server](includes/nav_server_md.md)] and the database.  
  
-   Time since the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance started.  
  
-   [!INCLUDE[nav_server](includes/nav_server_md.md)] version information.  
  
-   Is the [!INCLUDE[rtc](includes/rtc_md.md)] enabled for the server instance?  
  
-   Are SOAP web services enabled for the server instance?  
  
-   Are OData web services enabled for the server instance?  
  
-   Are NAS services enabled for the server instance?  
  
-   Is SSL enabled for the server instance?  
  
## See Also  
 [Provisioning the Microsoft Dynamics NAV Server Account](Provisioning-the-Microsoft-Dynamics-NAV-Server-Account.md)   
 [Corporate Customer Experience Improvement Program Client-to-Server Protocol Specification](https://go.microsoft.com/fwlink/?LinkId=260878)
