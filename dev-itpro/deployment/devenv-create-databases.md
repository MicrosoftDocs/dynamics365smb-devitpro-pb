---
title: Creating and Altering Business Central Databases
description: Create a new database by using the New-NAVDatabase cmdlet in the Administration Shell. 
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Creating Databases in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]

[!INCLUDE[2019_releasewave2](../includes/2019_releasewave2.md)]

This article describes how to create new databases in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] for storing application and business data.

## Overview

### Application and tenant databases

There are two types of databases: application and tenant.

- The application database stores data that defines the application and its business logic. This data includes descriptions of the objects and the code of your application. Essentially, it includes data that are common to all tenants. It's the application database to which you publish your extensions, including the base application, system application, and other extensions.

- The tenant database is often referred as just the tenant. The tenant database stores the actual business data for specific companies, for example, data that users enter and modify by using the application. It's the tenant database on which you install extensions that are published to the application database.

In a single-tenant deployment architecture, the application data and business (tenant) data are stored in the same database. That is, there's only one database. If you want to set up single-tenant deployment, you only have to create an application database.

If you have a multitenant deployment architecture, you create an application database and one or more tenant databases.

### Supported collations

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] supports Windows collations only. For a list of Windows collations, see [Windows Collations
](/sql/t-sql/statements/windows-collation-name-transact-sql#windows-collations) in the SQL Server documentation.

## <a name="application"></a>Create an application database

To create an application database, for either a single-tenant or multitenant deployment, you use the [New-NAVApplicationDatabase cmdlet](/powershell/module/microsoft.dynamics.nav.management/new-navapplicationdatabase). This cmdlet is available in the [!INCLUDE[adminshell](../developer/includes/adminshell.md)]. You use the New-NAVApplicationDatabase cmdlet to create either new database or initialize an existing empty database to make it an [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application database.

- If you create a new database, the cmdlet will add a database in SQL Server. The database includes the tables and data required for a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application database. The cmdlet creates a master data file (MDF) and log data file (LDF). Using the cmdlet, you can set the database name, the collation, and where to store the data files. Other database options are set for you.

- If you use the cmdlet with an existing database, the cmdlet modifies the existing database to include [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application tables and data. You configure a database beforehand, setting options that aren't done by the cmdlet, such as options for the data files (MDF/NDF/LDF) and their filegroups, [table partitioning](../administration/optimize-sql-data-access.md#TablePartitioning), and more.

> [!TIP]
> Starting in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1, the application database will automatically include the platform [symbols](upgrade-overview-v15.md#Symbols).

To create an application database, complete the following steps:

1. Run the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator.

    Make sure that the Window user that you run as has the appropriate privileges on the SQL Server as described in [Assign privileges on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database-level](provision-server-account.md#BCdb).

2. Run the New-NAVApplicationDatabase cmdlet to create a new database or initialize an existing database.

    ```powershell
    New-NAVApplicationDatabase [-DatabaseServer <database server name>\<database server instance>] -DatabaseName <String> [-DatabaseLocation <String>] [[-Collation] <String>] [-ApplicationDatabaseCredentials <PSCredential>]
    ```

    To create a new application database, set `-DatabaseName` to the name you want to give the database, and the `-Collation` to the wanted collation. If you omit the `-Collation`, then Latin1_General_100_CS_AS is used by default. Optionally, set the `-DatabaseLocation` to the directory path where you want to store the data files; otherwise the database files will be stored in the default SQL Server location.
    
    To use an existing empty database, set the `-DatabaseName` to the name of the existing database. You can't use the `-Collation` parameter to change the current collation of the database.
    
    The following example creates a new database called MyBCApplicationDB. The database is given the collation Latin1_General_100_CS_AS on the SQL Server instance BCDEMO. The database files are stored in the default data directory for the SQL Server instance (for example, C:\Program Files\Microsoft SQL Server\MSSQL13.BCDEMO\MSSQL\DATA).

    ```powershell
    New-NAVApplicationDatabase -DatabaseServer .\BCDEMO -DatabaseName "MyBCApplicationDB" 
    ```

    When the database has been successfully created, text similar to the following displays:

    ```powershell
    DatabaseServer      : .\BCDEMO
    DatabaseName        : MyBCApplicationDB
    DatabaseCredentials :
    DatabaseLocation    :
    Collation           : Latin1_General_100_CS_AS
    ```

3. Connect [!INCLUDE[server](../developer/includes/server.md)] instance to the new database.

    For example:

    ```powershell
    Set-NAVServerConfiguration BC160 -KeyName DatabaseName -KeyValue "MyBCApplicationDB"
    ```

4. Run the [Set-NAVApplication cmdlet](/powershell/module/microsoft.dynamics.nav.management/set-navapplication) to set the application version on the database.

    To set the application version, use the `-ApplicationVersion` parameter. The value must have the format `major.minor.[build[.revision]]`, such as '15.1', '15.1.0', or 15.1.0.0'. For example:

    ```powershell
    Set-NAVApplication BC160 -ApplicationVersion 15.1.0.0 -Force
    ```

    This step is required to synchronize your tenant and extensions later. This step sets a value to the `applicationversion` column in the **$ndo$dbproperty** table of the application database.

5. Give the [!INCLUDE[server](../developer/includes/server.md)] service account privileges to the database.

    For more information, see [Provisioning the Business Central Server Service Account](provision-server-account.md#BCdb).

    If you have a multitenant deployment, go to the next section about creating a tenant database.

6. If you have a single-tenant deployment, you can now synchronize the tenant. For a multitenant deployment, go to the next section. 

    Run the [Sync-NAVTenant](/powershell/module/microsoft.dynamics.nav.management/sync-navtenant) cmdlet to synchronize the tenant. For example:

    ```powershell
    Sync-NAVTenant -ServerInstance BC160
    ```

    This step will create the tenant-related tables in the database.

## <a name="tenant"></a>Create a tenant database

Complete the followings step to create a new tenant database in a multitenant deployment.

1. In SQL Server, create a new database.

    > [!IMPORTANT]
    > Set the collation to the same as the application database.
2. Give the [!INCLUDE[server](../developer/includes/server.md)] service account privileges to the database, like you did with the application database.

    For more information, see [Provisioning the Business Central Server Service Account](provision-server-account.md#BCdb).
3. Mount the database as a tenant to the application.

    To mount the tenant, use the [Mount-NAVTenant](/powershell/module/microsoft.dynamics.nav.management/mount-navtenant) cmdlet. For example:

    ```powershell
    Mount-NAVTenant -ServerInstance BC160 -DatabaseName "BCTenantDB" -DatabaseServer .\BCDEMO -Tenant BCTenant1 -AllowAppDatabaseWrite
    ```

    > [!NOTE]  
    > For now, we recommend that you use the `-AllowAppDatabaseWrite` parameter. Later, you can dismount and mount the tenant again without the parameter if needed.

4. Synchronize the tenant.
  
    Use the [Sync-NAVTenant](/powershell/module/microsoft.dynamics.nav.management/sync-navtenant) cmdlet. For example:

    ```powershell  
    Sync-NAVTenant -ServerInstance BC160 -Tenant BCTenant1 -Mode Sync
    ```

    This step will create the tenant-related tables in the database.
  
## Next steps

Complete the following steps to get the application up and running on your tenants.

1. Publish the system symbols and extensions that make up your application. For example, publish the system application, base application, Microsoft extensions, and third-party extensions.

    See [Publishing and Installing an Extension](../developer/devenv-how-publish-and-install-an-extension-v2.md).

    For [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1 and later, you don't have to publish the symbols, because they've been automatically published for you.

2. Synchronize and install extensions on the tenant.

    See [Publishing and Installing an Extension](../developer/devenv-how-publish-and-install-an-extension-v2.md).


3. Add a company to the database.

    To add a company, run the [New-NAVCompany cmdlet](/powershell/module/microsoft.dynamics.nav.management/new-navcompany).

4. Export and import existing permissions sets.

    A new database won't include any permission sets except for the SUPER permission set. Also, there will only be one user, typically for your account. You can either create permissions sets from scratch or export the sets from an existing database. As a minimum, it's a good idea to export the BASIC permissions set. The BASIC permission set grants the minimum permissions required for any user to access the application.

    For more information, see [Export Permission Sets](../developer/devenv-export-permission-sets.md) and [Special Permission Sets](../administration/administration-special-permission-sets.md).

## See also

[Changing Collation of Existing Database](../cside/cside-change-database-collation.md)  
[Multitenant Deployment Architecture in Business Central](Multitenant-Deployment-Architecture.md)  
[Creating and Altering [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Databases (Spring 2019 and earlier)](../cside/cside-create-databases.md)