---
title: Hardening Business Central Server Security
description: Learn how you can harden security on the Business Central Server component to protect access to the configuration settings.
author: SusanneWindfeldPedersen

ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
ms.date: 10/01/2020
---
# Hardening [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server Security

[!INCLUDE[server](../developer/includes/server.md)] is a .NET-based Windows Service application that works exclusively with SQL Server and Azure SQL Server databases. [!INCLUDE[server](../developer/includes/server.md)] provides an additional layer of security between clients and the database. It leverages the authentication features of the Windows Communications Framework to provide another layer of user authentication and uses impersonation to ensure that business logic is executed in a process that has been instantiated by the user who submitted the request. This means that authorization and logging of user requests are performed on a per-user basis.  
  
## Login Account

The [!INCLUDE[server](../developer/includes/server.md)] is configured with a login account, which is referred to as the *service account*. The service account is used by [!INCLUDE[prod_short](../developer/includes/prod_short.md)] clients to log on to the [!INCLUDE[server](../developer/includes/server.md)] instance. The [!INCLUDE[server](../developer/includes/server.md)] then uses the service account to log on to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database.
  
The default configuration is for the service to log on using the NT Authority\\Network Service account. If [!INCLUDE[server](../developer/includes/server.md)] and SQL Server are on different computers, then we recommend that you configure [!INCLUDE[server](../developer/includes/server.md)] to log on using a dedicated Windows domain user account instead. This account should not be an administrator either in the domain or on any local computer. A dedicated domain user account is considered more secure because no other services and therefore no other users have permissions for this account. For more information about using a domain account and configuring the recommended permissions, see [Provisioning the Business Central Server Service Account](../deployment/provision-server-account.md).  
  
## Disk quotas  
 Client users can send files to be stored on [!INCLUDE[server](../developer/includes/server.md)], so we recommend that administrators set up disk quotas on all computers running [!INCLUDE[server](../developer/includes/server.md)]. This can prevent users from uploading too many files, which can make the server unstable. Disk quotas track and control disk space usage for NTFS volumes, which allows administrators to control the amount of data that each user can store on a specific NTFS volume. For more information about disk quotas, see the [Disk Quotas Technical Reference](/previous-versions/windows/it-pro/windows-server-2003/cc786969(v=ws.10)) on Microsoft TechNet.  
  
## Limiting port access
  
 The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Setup program opens a port in the firewall on the computer where you install [!INCLUDE[server](../developer/includes/server.md)]. By default, this is port 7046. To improve security, you can consider limiting access to this port to a specific subnet. One way is to use `netsh`, which is a command-line tool for configuring and monitoring Windows-based computers at a command prompt. The specific version of this command that you would use is `netsh firewall set portopening`. For example, the following command limits access to port 7046 to the specified addresses and subnets:  
  
```  
netsh firewall set portopening protocol=TCP port=7046 scope=subnet addresses=LocalSubnet  
```  

## <a name="data-encryption"></a>Data Encryption Between [!INCLUDE[server](../developer/includes/server.md)] and SQL Server  

When SQL Server and [!INCLUDE[server](../developer/includes/server.md)] are running on different computers, you can make this data channel more secure by encrypting the connection with IPSec. \(Other encryption options are not supported.\) For information on how to do this, see [Enable Encrypted Connections to the Database Engine](/sql/database-engine/configure-windows/enable-encrypted-connections-to-the-database-engine?view=sql-server-2017). 



## See Also  
 [Configuring Business Central Server](../administration/configure-server-instance.md)   
 [Security and Protection](security-and-protection.md)   
 [How to Use the Netsh.exe Tool and Command-Line Switches](/previous-versions/tn-archive/bb490939(v=technet.10))