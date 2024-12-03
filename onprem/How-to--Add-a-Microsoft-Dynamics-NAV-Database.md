---
title: Add Dynamics NAV Database
description: Add a new Dynamics NAV database instance to SQL Server from a database backup file .bak by using the New-NAVDatabase cmdlet of the Administration Shell.
ms.date: 10/01/2018
ms.topic: article
ms.assetid: 65605d7a-a133-4dca-8bed-b58bfe857b59
caps.latest.revision: 10
---
# How to Add a Microsoft Dynamics NAV Database
This topic describes how add a new [!INCLUDE[navnow](includes/navnow_md.md)] database instance to SQL Server from a database backup file \(.bak\). To add a [!INCLUDE[navnow](includes/navnow_md.md)] database, you use the New-NAVDatabase cmdlet of the [!INCLUDE[nav_shell](includes/nav_shell_md.md)].  

> [!TIP]  
>  You can also create a database from the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)]. For more information, see [How to: Create Databases](How-to--Create-Databases.md).  

### To add a [!INCLUDE[navnow](includes/navnow_md.md)] database  

1.  On the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)], run **[!INCLUDE[navnow](includes/navnow_md.md)] Administration Shell** as an Administrator.  

    1.  Choose **Start**, in the **Search** box, type **[!INCLUDE[navnow](includes/navnow_md.md)] Administration Shell**.  

    2.  Right-click the related link, and then choose **Run as Administrator**.  

2.  At the command prompt, type the following command:  

    ```  
    New-NAVDatabase -FilePath <DatabaseBAKfile> -DatabaseName <MyNavDatabase> -DatabaseInstance <DatabaseInstance> -DatabaseServer <DatabaseServer> -ServiceAccount <ServiceAccount>  
    ```  

     Change the following parameter values.  

    |Parameter|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |---------------|---------------------------------------|  
    |*\<DatabaseBAKfile>*|Specifies the path and file name of the [!INCLUDE[navnow](includes/navnow_md.md)] database backup file that you want to restore.|  
    |*\<MyNavDatabase>*|Specifies the name to give the new database in SQL Server.|  
    |*\<DatabaseInstance>*|Specifies the name of the SQL Server database instance to connect to.<br /><br /> If you there is only one database instance on the SQL server, then you can omit this parameter. The default instance is DynamicsNAV70\_Instance1.|  
    |*\<DatabaseServer>*|Specifies the name of the computer that is running SQL Server. The name has the *domain\\computername* format.<br /><br /> If this is the computer that you are working from, then you can omit this parameter.|  
    |*\<ServiceAccount*|Specifies the logon account that runs the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.<br /><br /> This account is given the appropriate permissions to the database when you run the cmdlet. For more information, see [Provisioning the Microsoft Dynamics NAV Server Account](Provisioning-the-Microsoft-Dynamics-NAV-Server-Account.md). If you do not specify an account, then Network Service is used.|  

    > [!NOTE]  
    >  The command that is shown includes only a subset of all the parameters of the New-NavDatabase cmdlet. For more information about the syntax and parameters, see New-NAVDatabase topic in the Administration Cmdlets for [!INCLUDE[navnow](includes/navnow_md.md)] section of the Technical Reference.  

3.  Press Enter to run the cmdlet.  

     A new [!INCLUDE[navnow](includes/navnow_md.md)] database that has the specified name is added on SQL Server.  

## Example  
 The following example restores a database and preserves the original file names, locations, and logon accounts.  

```  
New-NavDatabase -FilePath C:\Backups\NavDemoDatabase.bak –DatabaseName MyNewDatabase -verbose  
```  

## See Also  
 [Scaling the Microsoft Dynamics NAV Network Topology](Scaling-the-Microsoft-Dynamics-NAV-Network-Topology.md)   
 [SQL Server Database Components](SQL-Server-Database-Components.md)   
 [Deploying and Managing Microsoft Dynamics NAV on Microsoft Azure](Deploying-and-Managing-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)   
 [How to: Add a Microsoft Dynamics NAV Server Instance](How-to--Add-a-Microsoft-Dynamics-NAV-Server-Instance.md)   
 [How to: Add a Microsoft Dynamics NAV Web Server Instance](How-to--Add-a-Microsoft-Dynamics-NAV-Web-Server-Instance.md)   
 [How to: Add a Microsoft Dynamics NAV Company](How-to--Add-a-Microsoft-Dynamics-NAV-Company.md)
