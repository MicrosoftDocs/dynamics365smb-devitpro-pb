---
title: "Deploy a Business Central Database to Azure SQL Database"
ms.custom: na
ms.date: 28/02/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---
# Deploy a Business Central Database to Azure SQL Database
This topic describes how you can deploy a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database to Microsoft Azure SQL Database.  

To deploy a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database to Azure SQL Database, the database must be exported as a data-tier application \(DAC\) file, which is known as a .bacpac file. This can be performed by using SQL Server Manager, as described in this topic.  

> [!IMPORTANT]  
>  To optimize, we recommend that the [!INCLUDE[server](../developer/includes/server.md)] instance that connects to the database is deployed on a virtual machine in Azure. Additionally, the virtual machine and SQL Database must be in the same Azure region.  

## Prerequisites

Make sure that you have the following prerequisites for completing this procedure:

-   A Microsoft Azure subscription and access to the Azure Portal.  

-   A [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database  installed on a SQL Server Database Engine instance.

-   SQL Server Manager is also installed on the same computer.    

-   Access to the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] installation media \(DVD\).  


## Create and configure an Azure SQL Database Server  

In the Azure Portal, create an SQL Database Server for hosting the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database. For more information about how to create and configure an SQL Database server, see [Create your first Azure SQL Database](https://azure.microsoft.com/en-us/documentation/articles/sql-database-get-started/).

Here are some important notes when creating the Azure SQL Database:

1.  You must specify a login name and password for the server. You will use this information in the next steps when you deploy the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database to Azure SQL and set up the [!INCLUDE[server](../developer/includes/server.md)] to authenticate with the database.  

2.  Configure the server to allow for access by Windows Azure Services.  

3. Make a note of the SQL Database server name because you will need it later.

    The name has a format similar to this: `mysqldatabaseserver.database.windows.net`.

4.  Configure the SQL database server firewall to allow for access by the IP address of the computer that you are using to deploy the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database.

    For information, see [How to: Configure Firewall Settings \(Azure SQL Database\)](https://azure.microsoft.com/en-us/documentation/articles/sql-database-configure-firewall-settings/).


<!--

3.  Deploy the existing [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database to an Azure SQL database.  

    In SQL Server Manager, use the **Deploy Database to SQL Azure** Wizard to deploy the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database from an instance of the Database Engine to the Azure SQL Database server you created in the previous step. The wizard deploys the database by first exporting the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database as a . bacpac file and then importing .bacbac file to the specified Azure SQL Database.  

    1.  Specify the server name as *SQLDatabaseServerName.database.windows.net*, where SQLDatabaseServerName is the name of Azure SQL Database server.  

    2.  Set the authentication to **SQL Server Authentication**, and provide the login name and password \(from step 2\) for accessing the Azure SQL Database server.  

    3.  Set the maximum database size to at least 10 GB.  

    4.  Make a note of the database name because you will need it later.  

     When completed successfully, you can connect to the database in Azure SQL from the SQL Server Manager or from the Azure Management Portal.  
 

4.  Create and configure an Azure Virtual Machine for [!INCLUDE[server](../developer/includes/server.md)].  

     In the Azure Management Portal, create a virtual machine on which you will later install the [!INCLUDE[server](../developer/includes/server.md)].  

    1.  Choose an image for an operating system that is supported by the [!INCLUDE[server](../developer/includes/server.md)]. For more information, see [Business Central Server Requirements](system-Requirement-business-central.md#NavServerReqs).  

    2.  Make a note of the Cloud Service DNS Name and the user name and password that you specified because you will need this later.  

         The user name and password will be used for logging on the Azure SQL database.  

    3.  Set up endpoints for the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] client services, Remote Desktop PowerShell.  

         You must set up an endpoint for the TCP port that clients will use to communicate with the . The default is port in the  configuration is 7046.  

         Remote Desktop and PowerShell ports are set up automatically.[!INCLUDE[server](../developer/includes/server.md)][!INCLUDE[server](../developer/includes/server.md)][!INCLUDE[prodshort](../developer/includes/prodshort.md)].  

     For more information, see [How to create a custom virtual machine](https://azure.microsoft.com/en-us/documentation/articles/virtual-machines-create-custom/)  

5.  Configure the Azure SQL Database Server firewall to allow the [!INCLUDE[server](../developer/includes/server.md)] virtual machine to connect to the database server.  

     In the Azure Management Portal, you must add a rule to the firewall that allows the public virtual IP address of the [!INCLUDE[server](../developer/includes/server.md)] virtual machine. For more information, see [How to: Configure Firewall Settings \(Azure SQL Database\)](https://azure.microsoft.com/en-us/documentation/articles/sql-database-configure-firewall-settings/).  

    > [!NOTE]  
    >  You can identify the IP address by viewing the Dashboard of the virtual machine in the Azure Management Portal.  

6.  Install and configure a [!INCLUDE[server](../developer/includes/server.md)] instance on the virtual machine.  

     From the Azure Management Portal, connect to the virtual machine. Run the setup.exe file that is available on the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] installation media \(DVD\) to install the [!INCLUDE[server](../developer/includes/server.md)].  

    1.  After you install the [!INCLUDE[server](../developer/includes/server.md)], configure SQL Server Authentication on the [!INCLUDE[server](../developer/includes/server.md)] instance. For the database credentials, use the login name and password that you set up in step 2.  

         For more information, see [Configuring SQL Server Authentication](../administration/configure-sql-server-authentication.md). 

-->
## Prepare the [!INCLUDE[prodshort](../developer/includes/prodshort.md)]  Database

Make sure the database meets these requirements:

1. Delete all users of the database that use Windows authentication.

    This includes `NT AUTHORITY\NETWORK SERVICE` and `NT AUTHORITY\SYSTEM`. Only users with SQL authentication are allowed in Azure SQL Database..

2. Upload a valid [!INCLUDE[prodshort](../developer/includes/prodshort.md)] license file to the database.

    For more information, see [Uploading a License File for a Specific Database](../cside/cside-upload-license-file.md#UploadtoDatabase).
3. Delete the deadlock monitors for the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database.

    You can do this in SQL Server Management Studio by running a query similar to the following:
            
    ```
    use [Demo Database BC (14-0)]
        
    DROP VIEW [dbo].[deadlock_report_ring_buffer_view]
    ```
    For more information about the deadlock monitor, see [Monitoring SQL Database Deadlocks](../administration/monitor-database-deadlocks.md).

## Export Business Central Database to a BACPAC File (.zip file)

When you deploy your application online, you must provide a compressed .zip file that contains the database as data-tier application file, known as BACPAC (.bacpac) file. This article describes how you to create the BACPAC files and zip. You can do this using SQL Server Management Studio.

1.	In SQL Server Management Studio, connect to the server instance that hosts the database.
2.	In **Object Explorer**, right-click either the database, choose **Task**, and then choose **Export Data-tier Application**.
3.	Follow the steps in the **Export Data-tier Application** wizard to export the database to a .bacpac file on your computer or network.

    You can use any name for the .bacpac file.
    For more information about exporting databases to .bacpac format, see [Export a Data-tier Application](https://msdn.microsoft.com/en-us/library/Hh213241.aspx). 

## Import the BACPAC to Azure SQL

1.	In SQL Server Management Studio, connect to Azure SQL Database server that you created.

    1. Select **File** > **Connect Object Explorer**.
    2. In the **Server Name**, enter the server name assigned to your Azure SQL Database server.

        For example, **mysqldatabaseserver.database.windows.net*. You can get this from the Overview page in the Azure portal.
    3. Enter the login name and password that you set up in the first task when creating the Azure SQL Database server.

2. Import the BACPAC file that you created for the Business Central Database.

    1. In **Object Explorer**, right-click the **Database** folder, and select **Import Data-tier Application**.
    2. Follow the wizard. On the **Import Settings** page, browse for the BACPAC that you create, and choose **Next**.
    3. Review the **Database Settings** page. Make changes if needed, and then choose the **Next** > **Finish**.

## Configure the SQL Server Authentication on the [!INCLUDE[server](../developer/includes/server.md)] instance

The last step is configure SQL Server Authentication on the [!INCLUDE[server](../developer/includes/server.md)] instance. For the database credentials, use the login name and password that set up when you created the Azure SQL Database server. 

For more information, see [Configuring SQL Server Authentication](../administration/configure-sql-server-authentication.md#ConfigNavServer).


The [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database is now deployed and configured on Azure. For developing, you can connect to the database from the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)].

## Changing database login account database

If you want to use a different login account for the database, to the following:

1. Create a new login that uses SQL Server authentication.  
  
     For more information, see [Create a Login](http://msdn.microsoft.com/en-us/library/aa337562.aspx).  
  
2.  Map the login to a user in the [!INCLUDE[!INCLUDE[prodshort](../developer/includes/prodshort.md)] database, and add the user to the **db\_owner** role of the [!INCLUDE[!INCLUDE[prodshort](../developer/includes/prodshort.md)] database.  
  
     For more information, see [Create a Database User](http://msdn.microsoft.com/en-us/library/aa337545.aspx).  

## See Also

[Installation Considerations for Microsoft SQL Server](installation-considerations-for-microsoft-sql-server.md)  
[Optimizing SQL Server Performance](../administration/optimize-sql-server-performance.md)  
()
 

