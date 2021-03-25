---
title: "Running a Business Central Database to Azure SQL Database"
description: Learn how to deploy a Business Central database to Azure SQL Database
ms.custom: na
ms.date: 02/19/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Running a Business Central Database on Azure SQL Database

This article describes how you can deploy a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database to Microsoft Azure SQL Database.  

> [!TIP]  
> For multi-tenancy mode installations, the procedures outlined here must be performed both for the application database as well as for the tenant databases.  

## Prerequisites

Make sure that you have the following prerequisites for completing this procedure:

- A Microsoft Azure subscription and access to the Azure portal.  

- A [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database installed on a SQL Server Database Engine instance. The database must use a supported Windows collation. For a list of Windows collations, see [Windows Collations
](/sql/t-sql/statements/windows-collation-name-transact-sql#windows-collations) in the SQL Server documentation.

## Create and configure an Azure SQL Database Server  

In the Azure portal, create an SQL Database Server for hosting the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database. For more information about how to create and configure an SQL Database server, see [Create your first Azure SQL Database](/azure/azure-sql/database/single-database-create-quickstart).

Here are some important notes when creating the Azure SQL Database:

1. Specify a login name and password for the server. You'll use this information in the next steps when you deploy the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database to Azure SQL and set up the [!INCLUDE[server](../developer/includes/server.md)] to authenticate with the database.  

2. Configure the server to allow for access by Windows Azure Services.  

3. Make a note of the SQL Database server name because you'll need it later.

    The name has a format similar to: `mysqldatabaseserver.database.windows.net`.

4. Configure the server firewall to allow for access by the IP address of the computer that you're using to deploy the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database.

    For information, see [How to: Configure Firewall Settings \(Azure SQL Database\)](/azure/azure-sql/database/firewall-configure).

## Prepare the [!INCLUDE[prod_short](../developer/includes/prod_short.md)]  Database(s)

Make sure the database meets these requirements:

1. Upload a valid [!INCLUDE[prod_short](../developer/includes/prod_short.md)] license file to the database.

    For more information, see [Uploading a License File for a Specific Database](../cside/cside-upload-license-file.md#UploadtoDatabase).

2. Delete all users of the database that use Windows authentication.

    Make sure to delete `NT AUTHORITY\NETWORK SERVICE` and `NT AUTHORITY\SYSTEM`. Only users with SQL authentication are allowed in Azure SQL Database.

3. Delete any deadlock monitors for the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database.

    SQL Server Management Studio, you can run a query similar to the following query:

    ```
    use [Demo Database BC (14-0)]
        
    DROP VIEW [dbo].[deadlock_report_event_file_view]
    ```

    For more information about the deadlock monitor, see [Monitoring SQL Database Deadlocks](../administration/monitor-database-deadlocks.md).

## Deploying using BACPAC files

For smaller databases (typically up to 50 GB), you can deploy them using a BACPAC file. This method requires the database to be off-line (the [!INCLUDE[server](../developer/includes/server.md)] instance cannot be connected to the database).

For multi-tenancy mode installations, complete the steps for both the application database and the tenant databases.

### Export Business Central Database to a BACPAC File

When you deploy your application online, you must provide a compressed .zip file that contains the database as data-tier application file, known as BACPAC (.bacpac) file. This article describes how you to create the BACPAC files and zip. You can do this using SQL Server Management Studio or the [SqlPackage.exe](/sql/tools/sqlpackage) command-line tool.

1. In SQL Server Management Studio, connect to the server instance that hosts the database.
2. In **Object Explorer**, right-click either the database, choose **Task**, and then choose **Export Data-tier Application**.
3. Follow the steps in the **Export Data-tier Application** wizard to export the database to a BACPAC file on your computer or network.

    You can use any name for the BACPAC file.
    For more information about exporting databases to BACPAC format, see [Export a Data-tier Application](/sql/relational-databases/data-tier-applications/export-a-data-tier-application). 

### Import the BACPAC to Azure SQL

In this task, you'll import the BACPAC files to the Azure SQL Database server instance.

1. In SQL Server Management Studio, connect to Azure SQL Database server instance that you created.

    1. Select **File** > **Connect Object Explorer**.
    2. In the **Server Name**, enter the server name assigned to your Azure SQL Database server.

        For example, *mysqldatabaseserver.database.windows.net*. You can get this information from the **Overview** page in the Azure portal.
    3. Set **Authentication** to **SQL Server Authentication**.
    4. Enter the login name and password that you set up in the first task when creating the Azure SQL Database server.
    5. Select **Connect**.

2. Import the BACPAC file that you created for the Business Central Database.

    This step creates a new database on the Azure SQL Database server instance. The database is based on the BACPAC file. It uses the same schema and includes all the data of the original database.

    1. In **Object Explorer**, right-click the **Databases** folder for the Azure SQL database, and select **Import Data-tier Application**.
    2. Follow the wizard. On the **Import Settings** page, browse for the BACPAC that you create, and choose **Next**.

        During this step, you'll specify a name for the database. You can give it any valid name you like.  
    3. Review the **Database Settings** page. Make changes if needed, and then choose the **Next** > **Finish**.

    Now, you're ready to [configure the [!INCLUDE[server](../developer/includes/server.md)] instance](#config).

## Deploying/migrating existing databases

For larger databases (typically bigger than 50 GB), deployments with BACPAC file aren't recommended. Instead, we recommend using the migration tools and options described in the [Azure Database Migration Guide](https://datamigration.microsoft.com/scenario/sql-to-azuresqldb?step=1).

<!--
## Configure the SQL Server Authentication on the [!INCLUDE[server](../developer/includes/server.md)] instance

The next step is to configure SQL Server Authentication on the [!INCLUDE[server](../developer/includes/server.md)] instance. For the database credentials, use the login name and password that set up when you created the Azure SQL Database server.

For more information, see [Configuring SQL Server Authentication](../administration/configure-sql-server-authentication.md#ConfigNavServer).-->

## <a name="config"></a>Configure the [!INCLUDE[server](../developer/includes/server.md)] instance

The next task is to configure the [!INCLUDE[server](../developer/includes/server.md)] instance to connect to the databases in Azure SQL Database. You can configure the server instance using the [!INCLUDE[admintool](../developer/includes/admintool.md)] or the [Set-NAVServerConfiuration cmdlet](/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration) of [!INCLUDE[adminshell](../developer/includes/adminshell.md)].

1. Set up SQL Server authentication that uses the login account for the application database in Azure SQL Database.

    For more information, see [Configuring SQL Server Authentication](../administration/configure-sql-server-authentication.md#ConfigNavServer).
2. Configure the database connection settings to point to the application database:

    |Setting (Key)|Value|
    |-------|-----|
    |Database Instance (DatabaseInstance)|Empty|
    |Database Name (DatabaseName)|The name of the database in Azure SQL Database. |
    |Database Server (DatabaseServer)|The name of the Azure SQL database server, for example, *mysqldatabaseserver.database.windows.net*.|

    For more information, see [Configuring Business Central Server](../administration/configure-server-instance.md).

3. Restart the  [!INCLUDE[server](../developer/includes/server.md)] instance.

    The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database is now deployed and configured on Azure.
    
    - If you have a single-tenant server instance, your deployment is ready to use.
    - If you have a multitenant server instance, go to the next step.

4. Mount the tenant database (multitenant-only).

    The final step in a multi-tenant deployment is to mount Azure SQL Database that holds the business data as a tenant on the [!INCLUDE[server](../developer/includes/server.md)] instance. Mount the tenant using the [!INCLUDE[admintool](../developer/includes/admintool.md)] or [Mount-NAVTenant cmdlet](/powershell/module/microsoft.dynamics.nav.management/mount-navtenant) of [!INCLUDE[adminshell](../developer/includes/adminshell.md)].

    When mounting the tenant, provide the following information:

    |Setting (Key)|Value|
    |-------|-----|
    |Database Name (DatabaseName)|The name of the tenant database in Azure SQL Database. |
    |Database Server (DatabaseServer)|The name of the Azure SQL database server, for example, *mysqldatabaseserver.database.windows.net*.|
    |Login name and password (DatabaseCredentials)|The credentials of the login account used of Azure SQL Database server instance. |

    For more information, see [Mount or Dismount a Tenant on a Microsoft Dynamics Server Instance](../administration/mount-dismount-tenant.md).

## Additional information

### Changing database login account database

If you want to use a different login account for the database, do the following steps:

1. Create a new login that uses SQL Server authentication.  
  
    For more information, see [Create a Login](/sql/relational-databases/security/authentication-access/create-a-login).  
  
2. Map the login to a user in the [!INCLUDE[!INCLUDE[prod_short](../developer/includes/prod_short.md)] database, and add the user to the **db\_owner** role of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database.  
  
    For more information, see [Create a Database User](/sql/relational-databases/security/authentication-access/create-a-database-user).  

### Colocation of the [!INCLUDE[server](../developer/includes/server.md)] instance and the database

To minimize network latency between the [!INCLUDE[server](../developer/includes/server.md)] instance and a database running on Azure SQL and optimize performance, we recommend that the [!INCLUDE[server](../developer/includes/server.md)] instance that connects to the database is deployed onto a virtual machine in Azure. Additionally, the virtual machine and the database must be in the same Azure region.

### Differences between Azure SQL database and SQL Server

When comparing the performance of Azure SQL database and a SQL Server deployed to a virtual machine, a few things are important to take into account:

- Azure SQL database is a high-availability database with a number of secondary replicas where writes must be confirmed for commits to be done. Secondary replicas will affect the performance of write operations (any inserts, updates, or deletes). For high throughput systems, running the database on SQL Server might be a better option. In this case, high-availability can be achieved using delayed durability or async commits. This condition will affect the data volume that you're ready to sacrifice if a database crash occurs.
- Azure SQL database is a scalable and intelligent service that includes features such as high-availability, backups, automatic index tuning, security vulnerability assessment, and advanced threat detection. When choosing a pricing tier for running your production database, make sure that you compare Azure SQL database to a similar setup for SQL Server on a virtual machine (including the cost of administration and maintenance).
- The performance of an Azure SQL database is correlated to the price you pay for usage, and new pricing models evolve over time. Use the scalability options within the service to change the database performance tier for your installation as your workload changes over time.

## See Also

[Installation Considerations for Microsoft SQL Server](installation-considerations-for-microsoft-sql-server.md)  
[Optimizing SQL Server Performance](../administration/optimize-sql-server-performance.md)  
[Creating Databases in Business Central](devenv-create-databases.md)