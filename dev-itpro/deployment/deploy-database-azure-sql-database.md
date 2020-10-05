---
title: "Running a Business Central Database to Azure SQL Database"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Running a Business Central Database on Azure SQL Database

This topic describes how you can deploy a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database to Microsoft Azure SQL Database.  

> [!TIP]  
> For multi-tenancy mode installations, the procedures outlined here must be performed both for the application database as well as for the tenant databases.  

## Prerequisites

Make sure that you have the following prerequisites for completing this procedure:

- A Microsoft Azure subscription and access to the Azure Portal.  

- A [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database  installed on a SQL Server Database Engine instance.

## Create and configure an Azure SQL Database Server  

In the Azure Portal, create an SQL Database Server for hosting the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database. For more information about how to create and configure an SQL Database server, see [Create your first Azure SQL Database](https://azure.microsoft.com/documentation/articles/sql-database-get-started/).

Here are some important notes when creating the Azure SQL Database:

1.  You must specify a login name and password for the server. You will use this information in the next steps when you deploy the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database to Azure SQL and set up the [!INCLUDE[server](../developer/includes/server.md)] to authenticate with the database.  

2.  Configure the server to allow for access by Windows Azure Services.  

3. Make a note of the SQL Database server name because you will need it later.

    The name has a format similar to this: `mysqldatabaseserver.database.windows.net`.

4.  Configure the SQL database server firewall to allow for access by the IP address of the computer that you are using to deploy the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database.

    For information, see [How to: Configure Firewall Settings \(Azure SQL Database\)](https://azure.microsoft.com/documentation/articles/sql-database-configure-firewall-settings/).


## Prepare the [!INCLUDE[prodshort](../developer/includes/prodshort.md)]  Database(s)

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


## Deploying using BACPAC files

For smaller databases (typically up to 50GB), you can deploy them using a bacpac file. This method requires the database to be off-line (the [!INCLUDE[server](../developer/includes/server.md)] instance cannot be connected to the database).

For multi-tenancy mode installations, this procedure must be performed both for the application database as well as for the tenant databases.

### Export Business Central Database to a BACPAC File

When you deploy your application online, you must provide a compressed .zip file that contains the database as data-tier application file, known as BACPAC (.bacpac) file. This article describes how you to create the BACPAC files and zip. You can do this using SQL Server Management Studio or the [SqlPackage.exe](/sql/tools/sqlpackage) command line tool.

1.	In SQL Server Management Studio, connect to the server instance that hosts the database.
2.	In **Object Explorer**, right-click either the database, choose **Task**, and then choose **Export Data-tier Application**.
3.	Follow the steps in the **Export Data-tier Application** wizard to export the database to a .bacpac file on your computer or network.

    You can use any name for the .bacpac file.
    For more information about exporting databases to .bacpac format, see [Export a Data-tier Application](https://msdn.microsoft.com/library/Hh213241.aspx). 

### Import the BACPAC to Azure SQL

1.	In SQL Server Management Studio, connect to Azure SQL Database server that you created.

    1. Select **File** > **Connect Object Explorer**.
    2. In the **Server Name**, enter the server name assigned to your Azure SQL Database server.

        For example, **mysqldatabaseserver.database.windows.net*. You can get this from the Overview page in the Azure portal.
    3. Enter the login name and password that you set up in the first task when creating the Azure SQL Database server.

2. Import the BACPAC file that you created for the Business Central Database.

    1. In **Object Explorer**, right-click the **Database** folder, and select **Import Data-tier Application**.
    2. Follow the wizard. On the **Import Settings** page, browse for the BACPAC that you create, and choose **Next**.
    3. Review the **Database Settings** page. Make changes if needed, and then choose the **Next** > **Finish**.

## Deploying/migrating existing databases

For larger databases (typically bigger than 50GB), deployments with bacpac file are not recommended. Instead, we recommend using the migration tools and options described in the [Azure Database Migration Guide](https://datamigration.microsoft.com/scenario/sql-to-azuresqldb?step=1).

## Configure the SQL Server Authentication on the [!INCLUDE[server](../developer/includes/server.md)] instance

The last step is configure SQL Server Authentication on the [!INCLUDE[server](../developer/includes/server.md)] instance. For the database credentials, use the login name and password that set up when you created the Azure SQL Database server. 

For more information, see [Configuring SQL Server Authentication](../administration/configure-sql-server-authentication.md#ConfigNavServer).


The [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database is now deployed and configured on Azure. For developing, you can connect to the database from the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)].

## Changing database login account database

If you want to use a different login account for the database, to the following:

1. Create a new login that uses SQL Server authentication.  
  
     For more information, see [Create a Login](https://msdn.microsoft.com/library/aa337562.aspx).  
  
2.  Map the login to a user in the [!INCLUDE[!INCLUDE[prodshort](../developer/includes/prodshort.md)] database, and add the user to the **db\_owner** role of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database.  
  
     For more information, see [Create a Database User](https://msdn.microsoft.com/library/aa337545.aspx).  

## Co-location of the [!INCLUDE[server](../developer/includes/server.md)] instance and the database

To minimize network latency between the [!INCLUDE[server](../developer/includes/server.md)] instance and a database running on Azure SQL (and therefore, optimize performance), we recommend that the [!INCLUDE[server](../developer/includes/server.md)] instance that connects to the database is deployed onto a virtual machine in Azure. Additionally, the virtual machine and the database must be in the same Azure region.

## Differences between Azure SQL database and SQL Server

When comparing the performance of Azure SQL database and a SQL Server deployed to a virtual machine, a few things are important to take into account:

- Azure SQL database is a high-availability database with a number of secondary replicas where writes must be confirmed for commits to be done. This will affect the performance of write operations (any inserts, updates, or deletes). For very high throughput systems, running the database on SQL Server might be a better option. In this case, high-availability can be achieved using delayed durability or async commits. Be aware that this will affect the data volume that you are ready to sacrifice in case of a database crash.
- Azure SQL database is a scalable and intelligent service that includes features such as high-availability, backups, automatic index tuning, security vulnerability assessment, and advanced threat detection. When choosing a pricing tier for running your production database, make sure that you compare this to a similar setup for SQL Server on a virtual machine (including the cost of administration and maintenance).
- The performance of an Azure SQL database is correlated to the price you pay for usage, and new pricing models evolve over time. Use the scalability options within the service to change the database performance tier for your installation as your workload changes over time.

## See Also

[Installation Considerations for Microsoft SQL Server](installation-considerations-for-microsoft-sql-server.md)  
[Optimizing SQL Server Performance](../administration/optimize-sql-server-performance.md)  
 

