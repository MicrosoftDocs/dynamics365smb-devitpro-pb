---
title: "Troubleshooting: SQL Server Connection Problems"
description: Learn how to configure and troubleshoot SQL Server connections to Business Central.
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: SusanneWindfeldPedersen
---
# Configuring and troubleshooting SQL Server Connections

After installing and configuring [!INCLUDE[prod_short](../developer/includes/prod_short.md)], the [!INCLUDE[server](../developer/includes/server.md)] may not be able to connect to the SQL Server. For example, you'll get error messages in [!INCLUDE[admin_shell](../developer/includes/adminshell.md)] or event log like the following : 
  
`The program could not create a connection to the server. Do you want to try again?`

`ServerInstance 'MicrosoftDynamicsNavServer$bc210' failed to reach  status 'Running' on this server due to the following error: 'Cannot start the service.'. Additional information may be in the event log of
the server.`

`A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: SQL Network Interfaces, error: 26 - Error Locating Server/Instance Specified)`

This article describes configuration changes that you can try to resolve SQL Server connection problems. For more help, see [A network-related or instance-specific error occurred while establishing a connection to SQL Server](/troubleshoot/sql/connect/network-related-or-instance-specific-error-occurred-while-establishing-connection#get-the-tcp-port-of-the-instance).

## Enable Protocols in SQL Server Configuration Manager

SQL Server Configuration Manager is a tool for managing SQL Server services and network connectivity. You can use SQL Server Configuration Manager to enable and disable network protocols. For [!INCLUDE[prod_short](../developer/includes/prod_short.md)] to work correctly, the Named Pipes and TCP/IP protocols must be enabled for SQL Server.  
  
Follow these steps to verify that these protocols are enabled or to enable them if they are currently disabled.  
  
#### To enable Named Pipes and TCP/IP in SQL Server
  
1. Start SQL Server Configuration Manager.  
  
2. Expand the SQL Server Network Configuration node in the tree view, and then choose **Protocols for MSSQLSERVER**.  
  
3. Under **Protocol Name** in the right pane, verify that **Named Pipes** and **TCP/IP** have the status **Enabled**.  
  
4. If either protocol is not enabled, right-click the protocol, and then choose **Enable**.  
  
After exiting SQL Server Configuration Manager, start the [!INCLUDE[server](../developer/includes/server.md)] again to see if the connection problem has been resolved.  
  
## Allowing SQL Server with Windows Firewall
 
If Windows Firewall is running on the computer running SQL Server, then you must explicitly specify the SQL Server executable file as an allowed exception before you can connect to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database.  
  
#### To allow SQL Server with Windows Firewall  
  
1. In Control Panel, open **Windows Firewall**, choose **Change settings**, and then click the **Exceptions** tab.  
  
2. Choose **Add program**.  
  
3. Choose **Browse**, and then browse to the location of the SQL Server executable file \(sqlservr.exe\). The default location on a computer running Windows Server 2008 R2 is:  
  
    ```
    C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\Binn\sqlservr.exe  
    ```

  C:\Program Files\Microsoft SQL Server\MSSQL15.BCDEMO\MSSQL\Binn\sqlservr.exe  
4.  Double-click the executable file to select it and to exit the **Browse** window, and then choose **OK** to close the **Add a Program** window.  
  
5. Choose **OK** to close **Windows Firewall**.  
  
 After exiting SQL Server Configuration Manager, start the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client again to see if the connection problem has been resolved.  
  
## Starting SQL Browser Service

When using a named database instance for [!INCLUDE[prod_short](../developer/includes/prod_short.md)], and [!INCLUDE[server](../developer/includes/server.md)] and the SQL server are on separate computers, then SQL Browser Service must be running on the SQL Server. For more information, see [Start SQL Browser Service](/sql/database-engine/configure-windows/start-stop-pause-resume-restart-sql-server-services).  

## See Also  

[Installation Considerations for Microsoft SQL Server](../deployment/installation-considerations-for-microsoft-sql-server.md)