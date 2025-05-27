---
title: Managing tenants of a database that uses shared schema
description: Describes how to mount, configure, and upgrade tenants in a shared schema database. 
ms.date: 10/01/2018
ms.topic: article
author: jswymer
---
# Managing Tenants of a Shared Schema Database in a Multitenant Deployment
There are various tasks that you'll perform to set up and configure tenant databases and tenants against an application, and keep them running and up-to-date with the latest version.

You'll do most of these tasks by using the Powershell cmdlets that are available in the [!INCLUDE[navnow_md](includes/nav_shell_md.md)].

## Tenant Database and Tenant Management Cmdlets
After you convert the database to schared schema, you have access the following cmdlets for managing tenant databases and tenants:

### Tenant database cmdlets
|  Cmdlet  |  [!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]  |
|----------|-----------------------------------------------------------------------|
|[Mount-NAVTenantDatabase](Microsoft.Dynamics.NAV.Management/Mount-NAVTenantDatabase.md)| Mounts a tenant database on a [!INCLUDE[nav_server_md](includes/nav_server_md.md)] instance that is connected to an application database.|
|[Dismount-NAVTenantDatabase](Microsoft.Dynamics.NAV.Management/Dismount-NAVTenantDatabase.md)|Dismounts a tenant database from a [!INCLUDE[nav_server_md](includes/nav_server_md.md)] instance.|
|[Get-NAVTenantDatabase](Microsoft.Dynamics.NAV.Management/Get-NAVTenantDatabase.md)|Specifies a setting in an application-specific configuration file for a [!INCLUDE[nav_server_md](includes/nav_server_md.md)] instance.|
|[Sync-NAVTenantDatabase](Microsoft.Dynamics.NAV.Management/Sync-NAVTenantDatabase.md)|Synchronizes a tenant database with the application database on a specified [!INCLUDE[nav_server_md](includes/nav_server_md.md)] instance.|
|[Test-NAVTenantDatabaseSchema](Microsoft.Dynamics.NAV.Management/Test-NAVTenantDatabaseSchema.md)| Checks for any errors in the tenant database schema.|

### Tenant cmdlets
|  Cmdlet  |  [!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]  |
|----------|-----------------------------------------------------------------------|
|[Mount-NAVtenant](Microsoft.Dynamics.NAV.Management/Mount-NAVtenant.md)|Mounts a tenant in the tenant database to the server instance that the tenant
database is mounted.|
|[Dismount-NAVtenant](Microsoft.Dynamics.NAV.Management/Dismount-NAVtenant.md)|Dismount a tenant in a tenant database from a server instance. All active user sessions that access the tenant will end.|
|[New-NAVTenant](Microsoft.Dynamics.NAV.Management/New-NAVTenant.md)| Creates a new tenant in a tenant database. |
|[Copy-NAVTenantData](Microsoft.Dynamics.NAV.Management/Copy-NAVTenantData.md)|Copies tenant data from one tenant to another tenant in the same tenant database. |
|[Move-NAVTenant](Microsoft.Dynamics.NAV.Management/Move-NAVTenant.md)| Moves a tenant from a tenant database to another tenant database.|
|[Get-NAVTenant](Microsoft.Dynamics.NAV.Management/Get-NAVTenant.md)|Gets information about a tenant.|
|[Set-NAVTenant](Microsoft.Dynamics.NAV.Management/Set-NAVTenant.md)|Changes a tenant from a normal tenant to a buffer tenant, or acquires and release exclusive access to a tenant.|
|[Remove-NAVTenant](Microsoft.Dynamics.NAV.Management/Set-NAVTenant.md)|Deletes a tenant, including company and global data, from a tenant database.|
|[Start-NAVDataUpgrade](Microsoft.Dynamics.NAV.Management/Start-NAVDataUpgrade.md)|Starts the process for upgrading the data in the tenant database.|

## Getting started
This section outlines the basic steps for getting a tenant database and tenant up and running with a [!INCLUDE[navnow](includes/navnow_md.md)] application. The steps assume that the application database and tenant database already exist. The tenant database can either be an empty database or a valid Dynamics NAV 2018 database. 

1. Mount the application database to the server instance.

    Use the Mount-NAVApplication database to connect the server instance to Dynamics NAV application database. The application database contains tables that make up the application, as defined by its schema. The application database is assigned a version number.

2. Mount the tenant database to the server instance.

    Use the Mount-NavTenantDatabase cmdlet to mount a tenant database on the same server instance as the application database.

    ```
    Mount-NAVTenantDatabase -ServerInstance '[nav_server_instance_name]' -Id '[tenant_database_id]' -DatabaseName '[existing_database_name]' -DatabaseServer '[server_name]\[database_instance]'
    ```

    Substitute `[tenant_database_id]` with the ID that you want to assign the tenant database. You will use this ID for subsequent operations on the database, like when syncing or dismounting it, mounting a tenant, and more. 

    
    When a database is mounted for the first time on a Dynamics NAV Server instance, the server instance can process requests for data on the tenant database, however, the tenant database is not in the **Operational** state because it has not been synchronized with the application database on the server instance. This means that you cannot yet mount any tenants on the tenant database. 

3. Synchronize the tenant database with the application database.

    Use the Sync-NAVTenantDatabase cmdlet to synchronize the database schema in a tenant database with the schema in the application database.

    ```
    Sync-NAVTenantDatabase -ServerInstance '[nav_server_instance_name]' -Id '[tenant_database_id]'
    ```
    
    When synchronized successfully, the application version of the application database on the server instance is then registered for support in tenant database. The tenant database state changes to **Operational**, and you can start mounting tenants. 

4.  Add a tenant to the tenant database, and mount it on the Server Instance.

    Use the Mount-NAVTenant cmdlet to add an existing tenant to the tenant database and mount it to the [!INCLUDE[nav_server_md](includes/nav_server_md.md)] instance.

    ```
    Mount-NAVTenant -ServerInstance DynamicsNAV -Tenant 'Tenant1-1' -TenantDatabaseID 'TenantSharedDatabase1'
    ``` 

    If you do not have a tenant, you can use the New-NAVTenant to create a new-tenant, and then mount the new tenant. 


## Mounting and Synchronizing Tenant Databases
To connect a tenant database to a [!INCLUDE[nav_server_md](includes/nav_server_md.md)] instance, you must mount it on the server instance by using the Mount-NavTenantDatabase cmdlet. The database must already exist; it can be an empty SQL database or a valid [!INCLUDE[navnowlong](includes/navnowlong_md.md)] database, which can be either empty or contain business data. Once a tenant database is mounted on the server instance, you can start to mount tenants.

When a database is mounted for the first time on a server instance, the server instance can process requests for data on the tenant database, however, the tenant database is not in the **Operational** state because it has not been synchronized with the application database on the server instance. This means that you cannot yet create or mount tenants on the tenant database.

### Synchronizing 
To synchronize the tenant database and make it operational, you use the Sync-NAVTenantDatabase cmdlet. When synchronized successfully, the application version of the application database on the server instance is then registered for support in tenant database.

A tenant database can be mounted on and synchronized with more than one server instance. The application database version of each server instance is registered for support in the tenant database. This enables you to have tenants in the tenant database that are using different application versions. This is useful, for example, when upgrading tenants to a newer application. An existing tenant can be upgraded to a newer application version by mounting it on another server instance that uses the newer application version, and then running a data upgrade.

There are two important parameters that you can set to determine how the synchronization is performed: `-Mode` and `-CommitPerTable`.

**-Mode**
The `-Mode` parameter specifies how the database schema for the tenant database is synchronized with the database schema that the mounted application database defines. You can specify the parameter value by name or by integer as follows:

|  Mode  |  Description  |
|--------|---------------|
|ForceSync or 0 |The database schema in the tenant database is updated with the application database schema even if data is lost. For example, if a table or a field has been deleted in the current application, the table or field is removed from the tenant database even if it contains data.|
|Sync or 2|The database schema in the tenant database will be updated unless data is lost. For example, if a table or a field has been deleted in the current application, and it contains data in the tenant database, the tenant cannot be mounted against the Microsoft Dynamics NAV Server instance. This is the default setting.|
|CheckOnly or 3 |Microsoft Dynamics NAV Server tests if a change in the current application will result in data loss in the tenant database if the tenant is mounted with Mode set to ForceSync. For example, if a table or a field has been deleted in the current application and it contains data in the tenant database.|

**-CommitPerTable**
The `-CommitPerTable` parameter specifies that database schema modifications are committed by separate transactions on each affected table. Transactions are run one at a time, as they occur. With the default behavior (that is, without using the -CommitPerTable parameter), all modifications are committed in a single transaction.

Using this method provides better protection against leaving the database in an inconsistent state than using the `-CommitPerTable` parameter. If the synchronization process is terminated before it is completed, any changes that were made before the problem occurred are rolled back, returning the database to its original state.

-   The drawback of setting the `-CommitPerTable` parameter is that for large databases, the synchronization process can take a long time and consume considerable computer resources.
-   The advantage of setting the `-CommitPerTable` parameter is that it will decrease the time that is required to complete the synchronization process and consume less computer resources, which can be useful for large databases when performance is a concern. However, when you set this parameter, committed changes are not rolled back if the synchronization process is terminated before it is completed. This can result in a partial synchronization of the database, which might leave the database inoperable. We recommend that you make a backup of the database before you run the Sync-NAVTenant cmdlet. Also, tables are not always locked during synchronization. Therefore, you should prohibit users from connecting to the database during synchronization.

### Example
This example mounts the database **NAVTenantDatabase** as a tenant database on a server instance. The database is assigned the ID **MyTenantDatabase**. The Sync-NAVTenantDatabase cmdlet synchronizes the tenant database schema with the application database that is mounted on the server instance. 

```
Mount-NAVTenantDatabase -ServerInstance 'DynamicsNAV' -Id 'MyTenantDatabase1' -DatabaseName 'NAVTenantDatabase' -DatabaseServer localhost\NAVDEMO
Sync-NAVTenantDatabase -ServerInstance 'DynamicsNAV' -Id 'MyTenantDatabase1' -CommitPerTable
```

## Creating a new tenant in a tenant database

You can use the New-NAVTenant cmdlet to create a normal tenant (as opposed to a buffer tenant) in a specific tenant database.

-   The tenant cannot have the same ID as any existing tenants in the tenant database. 
-   The tenant database must be mounted on a Dynamics NAV Server instance that is configured as a multitenant server instance.

The new tenant will be empty, and will not be mounted on the Dynamics NAV Server instance. If you have a tenant in the tenant database that contains business data, you can use the Copy-NAVTenant to populate the new tenant with the same data.

### <a name="NewNAVTenantExample"></a>Example

This example illustrate how you can use the New-NAVTenant cmdlet together with the Copy-NAVTenantData cmdlet to create a new tenant that is populated with data from another tenant. This example assumes that you already have a tenant named **TenantA**, which contains the business data that you want in the new tenant **TenantB**. **TenantA** must be mounted on the Dynamics NAV Server instance **DynamicsNAV**.
```
New-NAVTenant -ServerInstance DynamicsNAV -TenantId TenantB -TenantDatabaseId MyTenantDatabase1
Mount-NAVTenant -ServerInstance DynamicsNAV -TenantId TenantB -TenantDatabaseId MyTenantDatabase1
Copy-NAVTenantData -ServerInstance DynamicsNAV -SourceTenant TenantA -DestinationTenant TenantB
```

## Copying the data from one tenant to another

You can use the Copy-NAVTenantData cmdlet to copy data from one tenant to another tenant in the same tenant database.

-   The destination tenant must not contain any business data, and must be similar to a tenant that is created by using the New-NAVTenant cmdlet.
-   The source and destination tenants must be mounted on the same Dynamics NAV Server instance.

Together with the New-NAVTenant cmdlet, this cmdlet provides you with an efficient way to create multiple tenants that are pre-populated with
business data. For example, you can have one tenant that contains the business data, and acts as a kind of template tenant for other tenants. You can create new tenants with the New-NAVTenant cmdlet, and then populate the new tenants with data by using the Copy-NAVTenantData cmdlet.

The concept of creating new tenants and copying data between tenants is particularly useful when setting up buffer tenants in a deployment environment where you have to get new tenants up and running quickly on demand. Buffer tenants are created using the Set-NAVTenant cmdlet. For more information about buffer tenants, see [Using buffer tenants](manage-tenants-shared-schema.md#BufferTenants).

### Example
See the example for [Creating a new tenant in a tenant database](manage-tenants-shared-schema.md#NewNAVTenantExample).

## Moving a tenant from one database to another
You can use the Move-NAVTenant cmdlet to move a tenant from its current database to another tenant database that is mounted on the same Dynamics NAV Server instance.

-   The source tenant must be mounted the server instance, and must be in **Operational** state.
-   The destination tenant database must also be mounted on the same server instance. The destination tenant database can contain other tenants.

During the move operation, tenant data will be copied from the source tenant database to the destination tenant database. This process will run in exclusive access mode, which means that all current sessions to the tenant will be disconnected, and new sessions to the tenant are prevented.

The tenant data in the source tenant database will then be deleted. You can use the -ImmediateSourceTenantRemoval parameter to specify how this
data is deleted. If you omit the parameter, the data is deleted by a system task in Task Scheduler. The task will run in the time period that is defined by the server instance configuration settings: TaskSchedulerSystemTaskStartTime and TaskSchedulerSystemTaskEndTime (see [Configuring the Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md). If you use the -ImmediateSourceTenantRemoval parameter, the data is deleted immediately without using the system task.

The result of running the cmdlet is as follows:

-   If the move operation is successful, the tenant is mounted on the destination tenant database in the **Operational** state. A record of the original tenant remains mounted on the source tenant database,except its name has been suffixed with a GUID. For example, `tenant1` becomes `tenant10dda87eff3dd40af9be4748ea6987491`. Use the Get-NAVTenant cmdlet to get the new name. The original tenant will have the state **Soft Deleted**, **Deleting**, or **Deleted** so it cannot be accessed. To remove this tenant from the source tenant database, wait until the state is **Deleted**, then manually dismount it by using the Dismount-NAVTenant cmdlet.
-   If the move operation fails, the tenant data is restored in the source tenant database and the tenant will have the same state it had before the move operation. The destination tenant database will not contain any of the tenant's data.

## Deleting a tenant from a tenant database
You can use the Remove-NAVTenant cmdlet to permanently delete a tenant and all its company and associated global data from the tenant database. This operation is immediate and cannot be undone.

-   The tenant must be mounted on a multitenant Dynamics NAV Server instance
-   The tenant database that the tenant belongs to must use the shared schema database model.

There are two ways to delete the tenant and its data:

-   If you don't use the -ForceImmediateRemoval parameter, the deletion is performed by a scheduled system task in task scheduler. The time of day that the task actually runs and deletes the tenant and its data is determined by the Dynamics NAV Server instance settings: TaskSchedulerSystemTaskStartTime and TaskSchedulerSystemTaskEndTime. Before the system tasks runs, the tenant state is 'SoftDeleted'. While the
system task is running, the state is 'Deleting'. If the Dynamics NAV Server instance crashes while running the task, the task will be automatically rescheduled after a server instance mounts the tenant again.
-   If you use the -ForceImmediateRemoval switch parameter, the deletion starts immediately, without using task scheduler. If the server instance crashes while being deleted, the tenant should be manually removed by using Remove-NAVTenant again.

Whichever way you choose, as soon as you run the cmdlet, the tenant can no longer be accessed by client sessions. Any current sessions are lost. The tenant will remain mounted before, during, and after deletion. After a successful deletion, its state changes to 'Deleted'. A record of the tenant remains in the database until you dismount the tenant.

### Example
This example uses server instance 'DynamicsNAV' to delete tenant 'TenantA' immediately. The cmdlet will return after completely deleting the tenant. The Dismount-NAVTenant will delete the record of the tenant from the database.

```
Remove-NAVTenant -ServerInstance DynamicsNAV -TenantId TenantA -ForceImmediateRemoval
Dismount-NAVTenant -ServerInstance DynamicsNAV -TenantId TenantA
```

## <a name="BufferTenants"></a>Using buffer tenants
You can use the Set-NAVTenant cmdlet to change a specific tenant from a *normal* tenant to a *buffer* tenant. There are basically two types of tenants: normal and buffer.

-   A normal tenant is a tenant in the tenant database that can potentially be mounted on a [!INCLUDE[nav_server_md](includes/nav_server_md.md)] instance, and eventually used and managed in a production environment. Tenants are by default normal tenants.
-   A buffer tenant is a specific type of tenant that can be added to a tenant database. A buffer tenant is a kind of predefined tenant that typically contains some basic or demonstration data. Buffer tenants are useful in a deployment environment where you have to get new tenants up and running quickly on demand. A buffer tenant is created from a normal tenant by using the Set-NAVTenant cmdlet. 

Changing a tenant from a normal tenant to a buffer tenant retains the tenant data as is, however the tenant is in a state that prevents it from being mounted until it is changed back to a normal tenant by using the Register-NAVTenant cmdlet.

### Registering a buffer tenant for use
A tenant database can contain one or more buffer tenants. A buffer tenant cannot be mounted on a server instance until is changed to a normal tenant by using the Register-NAVTenant cmdlet. The Register-NAVTenant cmdlet can register any buffer tenant that is contained in the tenant databases that are mounted on the Dynamics NAV Server instance. There are three options for registering a buffer tenant.

- Register an unspecified buffer tenant from any mounted tenant database.
- Register an unspecified buffer tenant from a specific tenant database.
- Register a specific buffer tenant, if you know its ID.

The output object of Register-NAVTenant contains all the details about the registered tenant.

### Example
This example illustrates how to use a normal tenant (**TenantA**) as a template for creating one or more buffer tenants. The New-NAVTenant cmdlet creates a new empty normal tenant named **TenantB** in the tenant database. The Copy-NAVTenantData cmdlet copies the data from **TenantA** to **TenantB**. The Set-NAVTenant cmdlet changes **TenantB** to a buffer tenant. Finally, the Register-NAVTenant cmdlet registers the buffer tenant from the tenant database and assigns it the ID **TenantC**.

```
New-NAVTenant -ServerInstance DynamicsNAV -Tenant TenantB -TenantDatabaseId MyTenantDatabase1
Mount-NAVTenant -ServerInstance DynamicsNAV -TenantId TenantB -TenantDatabaseId MyTenantDatabase1
Copy-NAVTenantData -ServerInstance DynamicsNAV -SourceTenant TenantA -DestinationTenant TenantB
Set-NAVTenant -ServerInstance DynamicsNAV -Tenant TenantB -TenantDatabaseId MyTenantDatabase1 -BufferTenant
Register-NAVTenant -ServerInstance 'DynamicsNAV' -Tenant 'TenantC'  -TenantDatabaseId 'MyTenantDatabase1'
```

<!--## Acquiring exclusive access

## Versioning
A tenant database can be mounted on and synchronized with more than one server instance. The application database version of each server instance is registered for support in the tenant database. This enables you to have tenants in the tenant database that are using different application versions. This is useful, for example, when upgrading tenants to a newer application. An existing tenant can be upgraded to a newer application version by mounting it on the server instance that uses the newer application version, and then running a data upgrade.-->


## See Also  
[Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)   
[Migrating to Multitenancy](Migrating-to-Multitenancy.md)  
[Configuring Microsoft SQL Server](Configuring-Microsoft-SQL-Server.md)   
[Configuring Microsoft Dynamics NAV](Configuring-Microsoft-Dynamics-NAV.md)  
