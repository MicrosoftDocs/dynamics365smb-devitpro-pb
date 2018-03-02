---
title: "Enhancing Microsoft Dynamics NAV Server Security"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c85fa3e9-db59-4e52-8b00-aa4b4378e147
caps.latest.revision: 9
manager: edupont
---
# Enhancing Microsoft Dynamics NAV Server Security
[!INCLUDE[nav_server](includes/nav_server_md.md)] is a .NET-based Windows Service application that works exclusively with SQL Server databases. [!INCLUDE[nav_server](includes/nav_server_md.md)] provides an additional layer of security between clients and the database. It leverages the authentication features of the Windows Communications Framework to provide another layer of user authentication and uses impersonation to ensure that business logic is executed in a process that has been instantiated by the user who submitted the request. This means that authorization and logging of user requests are performed on a per-user basis.  
  
## Login Account  
 After you install [!INCLUDE[nav_server](includes/nav_server_md.md)], the default configuration is for the service to log on using the NT Authority\\Network Service account. If [!INCLUDE[nav_server](includes/nav_server_md.md)] and SQL Server are on different computers, then we recommend that you configure [!INCLUDE[nav_server](includes/nav_server_md.md)] to log on using a dedicated Windows domain user account instead. This account should not be an administrator either in the domain or on any local computer. A dedicated domain user account is considered more secure because no other services and therefore no other users have permissions for this account.  
  
## Disk Quotas  
 Client users can send files to be stored on [!INCLUDE[nav_server](includes/nav_server_md.md)], so we recommend that administrators set up disk quotas on all computers running [!INCLUDE[nav_server](includes/nav_server_md.md)]. This can prevent users from uploading too many files, which can make the server unstable. Disk quotas track and control disk space usage for NTFS volumes, which allows administrators to control the amount of data that each user can store on a specific NTFS volume. For more information about disk quotas, see the [Disk Quotas Technical Reference](http://go.microsoft.com/fwlink/?LinkId=119641) on Microsoft TechNet.  
  
## Limiting Port Access  
 The [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] Setup program opens a port in the firewall on the computer where you install [!INCLUDE[nav_server](includes/nav_server_md.md)]. By default, this is port 7046. To improve security, you can consider limiting access to this port to a specific subnet. One way is to use `netsh`, which is a command-line tool for configuring and monitoring Windows-based computers at a command prompt. The specific version of this command that you would use is `netsh firewall set portopening`. For example, the following command limits access to port 7046 to the specified addresses and subnets:  
  
```  
netsh firewall set portopening protocol=TCP port=7046 scope=subnet addresses=LocalSubnet  
```  
  
## See Also  
 [Walkthrough: Installing the Three Tiers on Three Computers](Walkthrough--Installing-the-Three-Tiers-on-Three-Computers.md)   
 [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)   
 [Security Overview](Security-Overview.md)   
 [How to Use the Netsh.exe Tool and Command-Line Switches](http://go.microsoft.com/fwlink/?LinkId=166310)