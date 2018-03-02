---
title: "How to: Deploy a Microsoft Dynamics NAV Database to Azure SQL Database"
author: edupont04
manager: edupont04
ms.custom: na
ms.date: 10/13/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 9d10def7-b641-497e-9e03-192d174674c8
caps.latest.revision: 7
---
# How to: Deploy a Microsoft Dynamics NAV Database to Azure SQL Database
This topic describes how you can deploy a [!INCLUDE[navnow](includes/navnow_md.md)] database to Microsoft Azure SQL Database.  

 To deploy a [!INCLUDE[navnow](includes/navnow_md.md)] database to Azure SQL Database, the database must be exported as a data-tier application \(DAC\) file, which is known as a .bacpac file. This can be performed by using SQL Server Manager, as described in this topic.  

> [!IMPORTANT]  
>  To optimize, we recommend that the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that connects to the database is deployed on a virtual machine in Azure. Additionally, the virtual machine and SQL Database must be in the same Azure region.  

### To deploy a [!INCLUDE[navnow](includes/navnow_md.md)] database to Azure SQL Database  

1.  Make sure that you have the following prerequisites for completing this procedure:  

    -   A Microsoft Azure subscription and access to the Azure Management Portal.  

    -   [!INCLUDE[navnow](includes/navnow_md.md)] database is installed on a SQL Server Database Engine instance. SQL Server Manager is also installed on the same computer.  

        Make sure the database does not contain users with Windows credentials. Only users with SQL authentication are allowed.  

        Also, you must have saved a valid [!INCLUDE[navnow](includes/navnow_md.md)] license file in the database before you upload it to Azure SQL Database. For more information, see [Uploading a License File for a Specific Database](How-to--Upload-the-License-File.md#UploadtoDatabase).  

    -   Access to the [!INCLUDE[navnow](includes/navnow_md.md)] installation media \(DVD\).  

2.  Create and configure an SQL Database Server in Azure.  

     In the Azure Management Portal, create an SQL Database Server for hosting the [!INCLUDE[navnow](includes/navnow_md.md)] database.  

    1.  You must specify a login name and password for the server. You will use this information in the next steps when you deploy the [!INCLUDE[navnow](includes/navnow_md.md)] database to Azure SQL and set up the [!INCLUDE[nav_server](includes/nav_server_md.md)] to authenticate with the database.  

    2.  Configure the server to allow for access by Windows Azure Services.  

    3.  Configure the SQL database server firewall to allow for access by the IP address of the computer that you are using to deploy [!INCLUDE[navnow](includes/navnow_md.md)].  

    4.  Make a note of the SQL Database server name because you will need it later.  

     For more information about how to create and configure an SQL Database server, see [Create your first Azure SQL Database](https://azure.microsoft.com/en-us/documentation/articles/sql-database-get-started/) and [How to: Configure Firewall Settings \(Azure SQL Database\)](https://azure.microsoft.com/en-us/documentation/articles/sql-database-configure-firewall-settings/).  

3.  Deploy the existing [!INCLUDE[navnow](includes/navnow_md.md)] database to an Azure SQL database.  

     In SQL Server Manager, use the **Deploy a Database to SQL Azure** Wizard to deploy the [!INCLUDE[navnow](includes/navnow_md.md)] database from an instance of the Database Engine to the Azure SQL Database server you created in the previous step. The wizard deploys the database by first exporting the [!INCLUDE[navnow](includes/navnow_md.md)] database as a . bacpac file and then importing .bacbac file to the specified Azure SQL Database.  

    1.  Specify the server name as *SQLDatabaseServerName.database.windows.net*, where SQLDatabaseServerName is the name of Azure SQL Database server.  

    2.  Set the authentication to **SQL Server Authentication**, and provide the login name and password \(from step 2\) for accessing the Azure SQL Database server.  

    3.  Set the maximum database size to at least 10 GB.  

    4.  Make a note of the database name because you will need it later.  

     When completed successfully, you can connect to the database in Azure SQL from the SQL Server Manager or from the Azure Management Portal.  

     For more information about how to deploy a database to Azure SQL, see [Deploy a Database By Using a DAC](https://msdn.microsoft.com/en-us/library/JJ554810\(v=sql.120\).aspx)  

4.  Create and configure an Azure Virtual Machine for [!INCLUDE[nav_server](includes/nav_server_md.md)].  

     In the Azure Management Portal, create a virtual machine on which you will later install the [!INCLUDE[nav_server](includes/nav_server_md.md)].  

    1.  Choose an image for an operating system that is supported by the [!INCLUDE[nav_server](includes/nav_server_md.md)]. For more information, see [Microsoft Dynamics NAV Server Requirements](System-Requirements-for-Microsoft-Dynamics-NAV.md#NavServerReqs) supported  

    2.  Make a note of the Cloud Service DNS Name and the user name and password that you specified because you will need this later.  

         The user name and password will be used for logging on the Azure SQL database.  

    3.  Set up endpoints for the [!INCLUDE[navnow](includes/navnow_md.md)] client services, Remote Desktop PowerShell.  

         You must set up an endpoint for the TCP port that clients will use to communicate with the . The default is port in the  configuration is 7046.  

         Remote Desktop and PowerShell ports are set up automatically.[!INCLUDE[nav_server](includes/nav_server_md.md)][!INCLUDE[nav_server](includes/nav_server_md.md)][!INCLUDE[navnow](includes/navnow_md.md)].  

     For more information, see [How to create a custom virtual machine](https://azure.microsoft.com/en-us/documentation/articles/virtual-machines-create-custom/)  

5.  Configure the Azure SQL Database Server firewall to allow the [!INCLUDE[nav_server](includes/nav_server_md.md)] virtual machine to connect to the database server.  

     In the Azure Management Portal, you must add a rule to the firewall that allows the public virtual IP address of the [!INCLUDE[nav_server](includes/nav_server_md.md)] virtual machine. For more information, see [How to: Configure Firewall Settings \(Azure SQL Database\)](https://azure.microsoft.com/en-us/documentation/articles/sql-database-configure-firewall-settings/).  

    > [!NOTE]  
    >  You can identify the IP address by viewing the Dashboard of the virtual machine in the Azure Management Portal.  

6.  Install and configure a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance on the virtual machine.  

     From the Azure Management Portal, connect to the virtual machine. Run the setup.exe file that is available on the [!INCLUDE[navnow](includes/navnow_md.md)] installation media \(DVD\) to install the [!INCLUDE[nav_server](includes/nav_server_md.md)].  

    1.  After you install the [!INCLUDE[nav_server](includes/nav_server_md.md)], configure SQL Server Authentication on the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. For the database credentials, use the login name and password that you set up in step 2.  

         For more information, see [How to: Configure SQL Server Authentication in Microsoft Dynamics NAV](How-to--Configure-SQL-Server-Authentication-in-Microsoft-Dynamics-NAV.md).  

 The [!INCLUDE[navnow](includes/navnow_md.md)] database is now deployed and configured on Azure. For developing, you can connect to the database from the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)].  

## See Also  
 [Configuring Database Components](Configuring-Database-Components.md)   
 [Configuring Microsoft SQL Server](Configuring-Microsoft-SQL-Server.md)
