---
title: "How to: Export the Application Tables to a Dedicated Database"
author: edupont04
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 0f5cdab3-c8f9-4a02-9f81-837f2f1a39e8
caps.latest.revision: 14
---
# How to: Export the Application Tables to a Dedicated Database
In [!INCLUDE[prodshort](../developer/includes/prodshort.md)], you can export the tables that define the application to a dedicated database. To export the application tables from an existing database, [!INCLUDE[prodshort](../developer/includes/prodshort.md)] provides a [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] cmdlet as part of the [!INCLUDE[nav_shell](../developer/includes/nav_shell_md.md)].  

 The following procedure illustrates how you can separate the application tables in an existing database into two databases: an application database and a business data database. You can automate this process and combine it with the use of other cmdlets. For more information, see the samples in the Windows PowerShell scripts in the **…\\WindowsPowerShellScripts\\Multitenancy\\** folder on the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] product media.  

### To export the application tables to a dedicated database  

1.  Stop all [!INCLUDE[server](../developer/includes/server.md)] services that access the database that you are modifying.  

2.  Open the [!INCLUDE[nav_shell](../developer/includes/nav_shell_md.md)].  

    > [!IMPORTANT]  
    >  You must run the program as administrator. Also, you must ensure that scripting is enabled on the computer.  

     For more information, see [Business Central Windows PowerShell Cmdlets](/powershell/business-central/overview.md).  

3.  For an overview of the cmdlet, type the following command:  

    ```  
    get-help Export-NAVApplication  
    ```  

4.  To export the application tables, type the following command:  

    ```  
    Export-NAVApplication –DatabaseServer <server name> -DatabaseInstance <instance name> –DatabaseName <name of original database> –DestinationDatabaseName <name of new application database> -ServiceAccount <the account used by nav_server if not NT AUTHORITY\NETWORK SERVICE>  
    ```  

     For example, to run the cmdlet against the [!INCLUDE[demolong](../developer/includes/demolong_md.md)], type the following command:  

    ```  
    Export-NAVApplication –DatabaseServer ‘MyServer’ –DatabaseInstance ‘NavDemo’ –DatabaseName ‘Demo Database NAV (11-0)’ –DestinationDatabaseName ‘NAV App’  
    ```  

     In the example, the database server name is **MyServer** , and the SQL Server instance is **NavDemo**. The name of the new application database can be anything. You can specify a name that reflects your application.  

     The application database is created on the same SQL Server instance as the original database. In the example, if you connect to the **NavDemo** instance using SQL Server Management Studio you will see two databases: the original database, **Demo Database NAV \(11-0\)**, and the new application database, **NAV App**.  

     At this stage, the original database still contains the application tables, and you can still access it using the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)]. Next, you must remove the application tables from the original database to make it a tenant database.  

    > [!TIP]  
    >  Optionally, you can combine the Export-NAVApplication and Remove-NAVApplication cmdlets. For an example of how you can combine the two cmdlets, see the **Example** section.  

5.  To remove the application tables from the original database, type the following command:  

    ```  
    Remove-NAVApplication –DatabaseServer <server name> -DatabaseInstance <instance name> –DatabaseName <name of the original database>  
    ```  

     For example, to run the cmdlet against the [!INCLUDE[demolong](../developer/includes/demolong_md.md)] where you have exported the application tables, type the following command:  

    ```  
    Remove-NAVApplication –DatabaseServer ‘MyServer’ –DatabaseInstance ‘NavDemo’ –DatabaseName ‘Demo Database NAV (10-0)’  
    ```  

     You will be asked to confirm that you want to remove the tables.  

    > [!WARNING]  
    >  Running the **Remove-NAVApplication** cmdlet is not reversible. When you have removed the application tables from the database, you cannot import them again. Make sure that you have a full backup available.  

 At the end of the process, you have two databases. In the example earlier in this topic, the databases are as follows.  

|Database name|Database type|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
|-------------------|-------------------|---------------------------------------|  
|Demo Database NAV \(10-0\)|Business data database|Contains the data from the original database.|  
|NAV App|Application database|Contains the tables that define the application. For a list of tables, see [Separating Application Data from Business Data](Separating-Application-Data-from-Business-Data.md).|  

 You must take additional steps to get the final business data database operational. For an example of how you can write a script that runs the cmdlet for creating an application database, see the **…\\Windows PowerShell\\Multitenancy\\** folder on the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] product media. For an example of how to write individual commands in Windows PowerShell, see the **Example** section.  

 Next, you must restart the [!INCLUDE[server](../developer/includes/server.md)] service, and you must mount the two databases by using the **Mount-NAVApplication** and **Mount-NAVTenant** cmdlets. For more information, see [Business Central Windows PowerShell Cmdlets](/powershell/business-central/overview.md).  

## Example  
 The following code example illustrates how you can manually write commands in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] administration shell. The commands create an application database based on an existing [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database.  

 The sample commands are assumed to run in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] administration shell based on the [!INCLUDE[demolong](../developer/includes/demolong_md.md)] on a local computer.  

```  
Stop-NAVServerInstance –ServerInstance ‘nav_server_instance’ 
Export-NAVApplication –DatabaseServer ‘MyServer’ –DatabaseInstance ‘NAVDEMO’ –DatabaseName ‘Demo Database NAV (11-0)’ –DestinationDatabaseName ‘NAV App’| Remove-NAVApplication –DatabaseName ‘Demo Database NAV (11-0)’ -Force
Set-NAVServerConfiguration –ServerInstance ‘nav_server_instance’ –element appSettings –KeyName ‘DatabaseName’ –KeyValue ‘’
Start-NAVServerInstance –ServerInstance ‘nav_server_instance’
Mount-NAVApplication –ServerInstance ‘nav_server_instance’ –DatabaseServer ‘MyServer\NAVDEMO’ –DatabaseName ‘NAV App’
Mount-NAVTenant –ServerInstance ‘nav_server_instance’ -Id tenant1 –DatabaseServer ‘MyServer\NAVDEMO’ -DatabaseName ‘Demo Database NAV (11-0)’ -OverwriteTenantIdInDatabase  
```  

 In the example, the commands stop the [!INCLUDE[server](../developer/includes/server.md)] service, creates the application database, clears the default database name in the server configuration, and then restarts the service. Then, the application database and the tenant database are mounted, and the configuration is saved in the Tenants.config file on the server. As a result, you have an application database and a single-tenant deployment. When you try to open the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)], an error displays because you have not specified a tenant. So in the **Select Server** window, in the **Server Address** field, add the tenant ID to the address. In this example, the address is **localhost:7046/[!INCLUDE[serverinstance](../developer/includes/serverinstance.md)]/tenant1**.  

> [!TIP]  
>  For an example of how you can automate the process of transferring user accounts from the original database to the new application database, see the HowTo-ExportNAVApplicationDatabase.ps1 sample script. This and other sample scripts are in the **…\\Windows PowerShell\\Upgrade\\** folder on the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] product media. The ExportNAVApplicationDatabase.ps1 sample script can be run in the context of the NAVUpgradeSamples.psm1 script module file. When you call a script such as this, it will export the application tables to a new application database and copy all accounts and SQL Server user roles to the application database. To only transfer the account that the [!INCLUDE[server](../developer/includes/server.md)] instance uses, use the *–ServiceAccount* parameter for the **Export-NAVApplication** cmdlet. In the examples in this topic, this parameter has not been specified. As a result, the default account, NT AUTHORITY\\NETWORK SERVICE, is set up with the required user roles.  

## See Also  
 [Separating Application Data from Business Data](Separating-Application-Data-from-Business-Data.md)   
 [Migrating to Multitenancy](Migrating-to-Multitenancy.md)   
 [Business Central Windows PowerShell Cmdlets](/powershell/business-central/overview.md)   
 [Creating Tenants from Companies](Creating-Tenants-from-Companies.md)   
 [Merging an Application Database with a Tenant Database](Merging-an-Application-Database-with-a-Tenant-Database.md)
