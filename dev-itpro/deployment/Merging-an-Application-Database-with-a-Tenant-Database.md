---
title: "Migrating to Single-Tenancy From Multitenancy"
description: Learn how to migrate from a single-tenant Business Central deployment to a multitenant deployment.
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-business-central
ms.assetid: 39a81332-8db1-4e5d-acda-915bf9591880
author: jswymer
---
# Migrating to Single-Tenancy From Multitenancy

With a multitenant deployment of [!INCLUDE[prod_short](../developer/includes/prod_short.md)], you separate the application data into a dedicated application database, separate from the business data in the tenant database. If you want to revert a single-tenant deployment, you can revert the separation of application data and business data, merging the two databases. [!INCLUDE[prod_short](../developer/includes/prod_short.md)] includes [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] cmdlets that can help you merge the databases, and you can use the cmdlets in a script that runs in [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)]. This topic provides sample scripts that you can use.  
  
When you merge the two databases, you migrate to single-tenancy. In a multitenant deployment, you can merge a single tenant with the application tables and leave the remaining tenants in the existing deployment. In that case, you add the application tables to the relevant tenant database and leave the original application database unchanged. If you have separated the application data into a dedicated database but you have not used it in a multitenant deployment, you can also use the cmdlet and a sample script to merge the two databases.  
  
## Merging an application database with a tenant database

 Before you can start the merge of the two databases, you must collect the relevant information. If you write a script, you must be able to provide values for the parameters that the [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] cmdlets require. The migration includes the following main steps:  
  
1.  Gather the prerequisite information.  
  
2.  Merge the two databases.  
  
    1.  Migrate from multitenancy to single-tenancy.  
  
    2.  Migrate from two databases to one database.  
  
3.  Change the client connection endpoints.  
  
4.  Post-migration clean-up.  
  
 Each step is explained in more details in the following sections.  
  
## Step 1: Gather the prerequisite information  
 The sample scripts require the following information:  
  
-   Identify the name of the [!INCLUDE[server](../developer/includes/server.md)] instance that the tenant database is connected to. This value is used as the input for the `serverInstance` variable in the sample scripts.  
  
-   Identify the name of the application database that the tenant database is connected to. This value is used as the input for the `appDatabaseName` variable in the sample scripts.  
  
-   Identify the name of the tenant database that you want to merge with the application database. This value is used as the input for the `tenantDatabaseName` variable in the sample scripts.  
  
-   If you are migrating from a multitenant deployment, identify the tenant ID of the tenant database. This value is used as the input for the `tenantId` variable in the sample scripts.  
  
-   Make sure that you have the server role called **securityadmin** in the relevant instance of SQL Server.  
  
-   Make sure that you have the **db\_owner** role for both the application database and the tenant database.  
  
-   Make sure that you are a member of the **Administrators** security group on the server that runs the [!INCLUDE[server](../developer/includes/server.md)] instance and where the [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] scripts run.  
  
### Step 2: Merge the two databases
  
To merge the application database and the tenant database, you must run the [!INCLUDE[devshell](../developer/includes/devshell.md)] as an administrator. Depending on your scenario, you can copy one of the sample scripts and update the variables based on the prerequisite information that you gathered in the previous section. This section includes two sample scripts that you can base your own script on.  
  
The first script merges an application database and a tenant database that is currently a tenant in a multitenant deployment.  
  
```  
# PURPOSE: This sample script migrates a tenant in a multitenant deployment to a single-tenant deployment.  
### Modify these variables with values appropriate to your environment ###  
$serverInstance = ""  
$appDatabaseName = ""  
$tenantDatabaseName = ""  
$tenantId = ""  
### You should not need to modify any variables below this line ###  
  
# Create a new server instance for the requested tenant.  
New-NAVServerInstance -ServerInstance $tenantId -ManagementServicesPort 7045  
  
# Dismount the requested tenant from the multitenant server instance.  
Dismount-NAVTenant -ServerInstance $serverInstance -Tenant $tenantId  
  
# Remove any application tables from the tenant database if these were not already removed.  
Remove-NAVApplication -DatabaseName $tenantDatabaseName  
  
# Copy the application tables from the current application database to the tenant database.  
Export-NAVApplication -DatabaseName $appDatabaseName -DestinationDatabaseName $tenantDatabaseName  
  
# Reconfigure the CustomSettings.config file for the new server instance to use the tenant database.  
Set-NAVServerConfiguration -ServerInstance $tenantId -KeyName DatabaseName -KeyValue $tenantDatabaseName -WarningAction Ignore  
  
# Reconfigure the CustomSettings.config to use single-tenant mode.  
# Set-NAVServerConfiguration -ServerInstance $serverInstance -KeyName Multitenant -KeyValue false -WarningAction Ignore  
  
# Start the new server instance if it is not running.  
Set-NAVServerInstance -ServerInstance $tenantId -Start  
  
# Dismount all tenants on the new server instance that are not using the current tenant database.  
Get-NAVTenant -ServerInstance $tenantId | where {$_.Database -ne $tenantDatabaseName} | foreach { Dismount-NAVTenant -ServerInstance $tenantId -Tenant $_.Id }  
  
Write-Host "Operation complete." -foregroundcolor cyan  
  
```  
  
 The second script merges an application database and a tenant database that has not been mounted on a [!INCLUDE[server](../developer/includes/server.md)] instance as a tenant.  
  
```  
# PURPOSE: This sample script merges an application database and a tenant database that are not part of a multitenant deployment.  
### Modify these variables with values appropriate to your environment ###  
$serverInstance = ""  
$appDatabaseName = ""  
$tenantDatabaseName = ""  
### You should not need to modify any variables below this line ###  
  
# Stop the server instance if it is running.  
Set-NAVServerInstance -ServerInstance $serverInstance -Stop  
  
# Remove any application tables from the tenant database if these have not already been removed.  
Remove-NAVApplication -DatabaseName $tenantDatabaseName  
  
# Copy the application tables from the application database to the tenant database.  
Export-NAVApplication -DatabaseName $appDatabaseName -DestinationDatabaseName $tenantDatabaseName  
  
# Reconfigure the CustomSettings.config to use the tenant database.  
Set-NAVServerConfiguration -ServerInstance $serverInstance -KeyName DatabaseName -KeyValue $tenantDatabaseName -WarningAction Ignore  
  
# Reconfigure the CustomSettings.config to use single-tenant mode  
# Set-NAVServerConfiguration -ServerInstance $serverInstance -KeyName Multitenant -KeyValue false -WarningAction Ignore  
  
# Start the server instance.  
Set-NAVServerInstance -ServerInstance $serverInstance -Start  
  
# Dismount all tenants that are not using the current tenant database.  
Get-NAVTenant -ServerInstance $serverInstance | where {$_.Database -ne $tenantDatabaseName} | foreach { Dismount-NAVTenant -ServerInstance $serverInstance -Tenant $_.Id }  
  
Write-Host "Operation complete." -foregroundcolor cyan  
  
```  
  
 In both scenarios, you can create scripts that are based on these samples, provide value for the variables, run the script, and the review the output to make sure that you achieved the expected result.  
  
### Step 3: Change the client Connection Endpoints  
 The first sample script creates a new [!INCLUDE[server](../developer/includes/server.md)] instance with a name that is based on the specified tenant ID. The script only enables the management services endpoint in the [!INCLUDE[server](../developer/includes/server.md)] configuration settings. You must also configure the server instance to enable client services, SOAP web services, and OData web services. You must send the configuration changes to the users who access the reconfigured tenant. Otherwise, they are not able to connect to the database.  
  
 The second sample script illustrates a simpler scenario where you move the application tables to the only database that accessed the application database. As a result, all client endpoints continue as they did before, and you do not have to update any clients.  
  
### Step 4: Post-migration clean-Up  
 In the first scenario where you move a tenant from multitenancy to single-tenancy, you must update the [!INCLUDE[server](../developer/includes/server.md)] account and database permissions. Also, any tenant-specific files that have been saved to the original server location must be moved to the relevant location on the new server.  
  
## See Also  
 [Migrating to Multitenancy](Migrating-to-Multitenancy.md)   
 [Separating Application Data from Business Data](Separating-Application-Data-from-Business-Data.md)   
[Business Central Windows PowerShell Cmdlets](/powershell/business-central/overview)
