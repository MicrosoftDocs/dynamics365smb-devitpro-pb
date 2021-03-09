---
title: "Separating Application Data from Business Data"
description: Learn how to create an split your database into an application database and business database
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Separating Application Data from Business Data

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] separates tables that describe the application from the tables that contain business data. Depending on your deployment scenario, you can choose to store all [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tables in one database, or you can export the application tables to a dedicated database. In multitenant deployments, the application must be stored in a dedicated database.  
  
## Application Database versus Business Data Databases

 The application database contains tables that describe your application. This includes a description of the objects that your application consists of, and other data that is common to all tenants. The data that users enter in your application is stored in the business data database because this data is specific to their company. Optionally, you can create multiple business data databases, such as if you want to support your customers as tenants.  
  
 When you have exported the application tables to a separate database, you can no longer access the business database from the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)]. This is because the metadata for the tables in the business database is stored in the application database and modified in that database.  
  
 For example, if you want to modify a report, you modify the report object in the application database. Then, when you deploy the updated application to your production environment, when a user accesses the report, they see the modified report.  
  
 [!INCLUDE[prod_short](../developer/includes/prod_short.md)] includes [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] cmdlets that help you export application tables to a dedicated database, and other cmdlets to help you maintain a multitenant deployment. For more information, see [Business Central Windows PowerShell Cmdlets](/powershell/business-central/overview).  
  
### Distribution of the System Tables in Each Database
  
The application tables are system tables that define the application. Other system tables remain in the business data database. For example, the following table lists some of the system tables that are moved to the application database when you run the Export-NAVApplication cmdlet and other tables that remain in the business data database. This is a partial list to give an idea of how tables are distributed: 
  
|Application database|Business data database|  
|--------------------------|----------------------------|  
|**Add-in**|**Access Control**|
|**Application Dependency**|**Active Session**|
|**Application Object Metadata**|**API Webhook Notification**|
|**Application Resource**|**API Webhook Notification Aggr**|
|**Chart**|**API Webhook Subscription**|  
|**Configuration Package File**|**Company**|
|**Debugger Breakpoint**|**Device**| 
|**Debugger Watch**| **Data Sensitivity**|
|**Entitlement**|**Document Service**|
|**Entitlement Set**|**Intelligent Cloud**|
|**Installed Application**|**Intelligent Cloud Status** 
|**Media**|**Isolated Storage**|
|**Media Resources**| **Object Options**|
|**Media Set**|**Object Metadata Snapshot**|
|**Membership Entitlement**|**Object Translation**|
|**Object**|**Integration Page**|  
|**Object Metadata**|**Object Metadata Snapshot**|
|**Object Tracking**|**Object Translation**|  
|**OData Edm Type**|**Object Access Intent Override**|
|**Page Documentation**|**Page Data Personalization**|
|**Power BI Blob**|**Printer Selection**|
|**Power BI Selection**|**Record Link**|
|**Permission**|**Report List Translation**|  
|**Permission Set**|**Session Event**|  
|**Profile**|**Scheduled Task**|  
|**Profile Metadata**|**Tenant Media**|  
|**Profile Page Metadata**|**Tenant Permission**| 
|**Published Application**|**Tenant Profile**|
|**Report Layout**| **Tenant Profile Extension**|
|**Send-To Program**|**Tenant Web Service**|  
|**Server Instance**|**User**|  
|**Style Sheet**|**User Default Style Sheet**|  
|**Upgrade Blob Storage**|**Web Hook Notification**|
|**Web Service**|**Web Hook Subscription**|  

<!--
||**User Personalization**|  
||**User Property**|  
|**Client Add-in**||  
|**Client Add-in Resources**||  -->

## <a name="exportapplication"></a>Exporting the Application Tables to a Dedicated Application Database

To export the application tables from an existing database to another database, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] provides a [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] cmdlet as part of the [!INCLUDE[adminshell](../developer/includes/adminshell.md)].  

The following procedure illustrates how you can separate the application tables in an existing database into two databases: an application database and a business data database. You can automate this process and combine it with the use of other cmdlets. For more information, see the samples in the Windows PowerShell scripts in the **…\\WindowsPowerShellScripts\\Multitenancy\\** folder on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] product media.  

### Export the application tables to a dedicated database  

1. Stop all [!INCLUDE[server](../developer/includes/server.md)] services that access the database that you are modifying. This includes the [!INCLUDE[server](../developer/includes/server.md)] instance.

2. Back up your databases.

3. Run the [!INCLUDE[admin shell](../developer/includes/adminshell.md)] as an administrator.

    > [!IMPORTANT]  
    >  You must run the program as administrator. Also, you must ensure that scripting is enabled on the computer.  

     For more information, see [Business Central Windows PowerShell Cmdlets](/powershell/business-central/overview).
 
4. Uninstall the extensions.

    To uninstall an extension, you use the [Uninstall-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/uninstall-navapp) cmdlet.

    ```powershell 
    Uninstall-NAVApp -ServerInstance <server instance name> -Tenant default -Name <extensions name> -Version <extension version> 
    ```

    Replace  `<extension name>` and `<extension version>` with the exact name and version the installed extension. Set `<tenant ID>` to `default` or omit the `-Tenant` parameter.

    For example, together with the Get-NAVApp cmdlet, you can uninstall all extensions with a single command:

    ```powershell 
    Get-NAVAppInfo -ServerInstance <server instance name> -Tenant default | % { Uninstall-NAVApp -ServerInstance <server instance name> -Tenant default -Name $_.Name -Version $_.Version -Force}
    ```

4. To export the application tables, type the following command:  

    ```  
    Export-NAVApplication –DatabaseServer <server name> -DatabaseInstance <instance name> –DatabaseName <name of original database> –DestinationDatabaseName <name of new application database> -ServiceAccount <the account used by server instance if not NT AUTHORITY\NETWORK SERVICE>  
    ```  

     For example, to run the cmdlet against the [!INCLUDE[demolong](../developer/includes/demolong_md.md)], type the following command:  
    
    ```powershell
    Export-NAVApplication –DatabaseServer 'MyServer' –DatabaseInstance 'BCDemo' –DatabaseName 'Demo Database BC' –DestinationDatabaseName 'Business Central App'  
    ```  

     In the example, the database server name is **MyServer** , and the SQL Server instance is **BCDemo**. The name of the new application database can be anything. You can specify a name that reflects your application.  

     The application database is created on the same SQL Server instance as the original database. In the example, if you connect to the **BCDemo** instance using SQL Server Management Studio you will see two databases: the original database, **Demo Database BC**, and the new application database, **Business Central**.  

    At this stage, the original database still contains the application tables, and you can still access it using the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)]. Next, you must remove the application tables from the original database to make it a tenant database.  

    > [!TIP]  
    >  Optionally, you can combine the Export-NAVApplication and Remove-NAVApplication cmdlets. For an example of how you can combine the two cmdlets, see the **Example** section.  

5. To remove the application tables from the original database, run the [Remove-NAVApplication](/powershell/module/microsoft.dynamics.nav.management/remove-navapplication) cmdlet as follows:  

    ```powershell  
    Remove-NAVApplication –DatabaseServer <server name> -DatabaseInstance <instance name> –DatabaseName <name of the original database>  
    ```  

    For example, to run the cmdlet against the [!INCLUDE[demolong](../developer/includes/demolong_md.md)] where you have exported the application tables, type the following command:  

    ```powershell  
    Remove-NAVApplication –DatabaseServer 'MyServer' –DatabaseInstance 'BCDEMO' –DatabaseName 'Demo Database BC'  
    ```  

    You will be asked to confirm that you want to remove the tables.  

    > [!WARNING]  
    >  Running the **Remove-NAVApplication** cmdlet is not reversible. When you have removed the application tables from the database, you cannot import them again. Make sure that you have a full backup available.  

    At the end of the process, you have two databases. In the example earlier in this topic, the databases are as follows.  

    |Database name|Database type|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
    |-------------------|-------------------|---------------------------------------|  
    |Demo Database BC|Business data database|Contains the data from the original database.|  
    |Business Central App|Application database|Contains the tables that define the application.|  

    <!--
    You must take additional steps to get the final business data database operational. For an example of how you can write a script that runs the cmdlet for creating an application database, see the **…\\Windows PowerShell\\Multitenancy\\** folder on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] product media. For an example of how to write individual commands in Windows PowerShell, see the **Example** section.
    
    -->  
6. Clear the `DatabaseName` setting in the [!INCLUDE[server](../developer/includes/server.md)] instance configuration file by using the [Set-NAVServerConfiguration](/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration) cmdlet: 

    ```powershell
    Set-NAVServerConfiguration –ServerInstance <server instance name> –element appSettings –KeyName 'DatabaseName' –KeyValue '' 
    ```

7. Start the [!INCLUDE[server](../developer/includes/server.md)] instance by using the [Start-NAVServerInstance](/powershell/module/microsoft.dynamics.nav.management/start-navserverinstance) cmdlet: 

    ```powershell
    Start-NAVServerInstance –ServerInstance <server instance name>
    ```
8. Mount the application database on the [!INCLUDE[server](../developer/includes/server.md)] instance by using the [Mount-NAVApplication](/powershell/module/microsoft.dynamics.nav.management/mount-navapplication) cmdlet:

    ```powershell
    Mount-NAVApplication –ServerInstance <server instance name> –DatabaseServer <server name\instance name> –DatabaseName <application database name>
    ```

9. Mount the business data database (tenant) on the server instance by using the [Mount-NAVTenant](/powershell/module/microsoft.dynamics.nav.management/mount-navtenant) cmdlet: 

    ```powershell
    Mount-NAVTenant –ServerInstance <server instance name> -Id <tenant name> –DatabaseServer <server name\instance name> -DatabaseName <business data database> -OverwriteTenantIdInDatabase  
    ```

10. Reinstall extensions.

    In this step, you reinstall the same extensions that were installed on the tenant before. To install an extension, you use the [Install-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/install-navapp).

    1. It can be helpful to get a list of the published extensions and their version. To get a list of all published extensions, use the [Get-NAVAppInfo cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/get-navappinfo):

        ```powershell  
        Get-NAVAppInfo -ServerInstance <server instance> | Repair-NAVApp  
        ```

    2. If your solution uses the System Application, install this first.

        ```powershell 
        Install-NAVApp -ServerInstance <server instance> -Name "System Application" -Version <extension version>
        ```

        Replace `<extension version>` with the exact version of the published System Application.

    3. Install the Base Application.

        ```powershell
        Install-NAVApp -ServerInstance <server instance> -Name "Base Application" -Version <extension version>
        ```

        Replace `<extension version>` with the exact version of the published Base Application.

    4. Install the Application extension. This extension is required to install Microsoft extensions.

        ```powershell
        Install-NAVApp -ServerInstance <server instance> -Name "Application" -Version <extension version>
        ```

        Replace `<extension version>` with the exact version of the published Application extension.
    5. Install other extensions, including Microsoft and third-party extensions.

        ```powershell
        Install-NAVApp -ServerInstance <server instance name> -Name <extension name> -Version <extension version>
        ```

For more information, see [Business Central Windows PowerShell Cmdlets](/powershell/business-central/overview).  

## Example
  
 The following code example illustrates how you can manually write commands in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] administration shell. The commands create an application database based on an existing [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database.  

 The sample commands are assumed to run in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] administration shell based on the [!INCLUDE[demolong](../developer/includes/demolong_md.md)] on a local computer.  

```  
Stop-NAVServerInstance –ServerInstance 'businesscentral_server_instance' 
Export-NAVApplication –DatabaseServer 'MyServer' –DatabaseInstance 'BCDEMO' –DatabaseName 'Demo Database BC' –DestinationDatabaseName 'Business Central App'| Remove-NAVApplication –DatabaseName 'Demo Database BC' -Force
Set-NAVServerConfiguration –ServerInstance 'businesscentral_server_instance' –element appSettings –KeyName 'DatabaseName' –KeyValue ''
Start-NAVServerInstance –ServerInstance 'businesscentral_server_instance'
Mount-NAVApplication –ServerInstance 'businesscentral_server_instance' –DatabaseServer 'MyServer\BCDEMO' –DatabaseName 'Business Central App'
Mount-NAVTenant –ServerInstance 'businesscentral_server_instance' -Id tenant1 –DatabaseServer 'MyServer\BCDEMO' -DatabaseName 'Demo Database BC' -OverwriteTenantIdInDatabase  
```  

In the example, the commands stop the [!INCLUDE[server](../developer/includes/server.md)] service, creates the application database, clears the default database name in the server configuration, and then restarts the service. Then, the application database and the tenant database are mounted, and the configuration is saved in the Tenants.config file on the server. As a result, you have an application database and a single-tenant deployment. When you try to open the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)], an error displays because you have not specified a tenant. So in the **Select Server** window, in the **Server Address** field, add the tenant ID to the address. In this example, the address is **localhost:7046/[!INCLUDE[serverinstance](../developer/includes/serverinstance.md)]/tenant1**.  

> [!TIP]  
>  For an example of how you can automate the process of transferring user accounts from the original database to the new application database, see the HowTo-ExportNAVApplicationDatabase.ps1 sample script. This and other sample scripts are in the **…\\Windows PowerShell\\Multitenancy\\** folder on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] product media. The ExportNAVApplicationDatabase.ps1 sample script can be run in the context of the NAVUpgradeSamples.psm1 script module file. When you call a script such as this, it will export the application tables to a new application database and copy all accounts and SQL Server user roles to the application database. To only transfer the account that the [!INCLUDE[server](../developer/includes/server.md)] instance uses, use the *–ServiceAccount* parameter for the **Export-NAVApplication** cmdlet. In the examples in this topic, this parameter has not been specified. As a result, the default account, NT AUTHORITY\\NETWORK SERVICE, is set up with the required user roles.  

## See Also

 [Migrating to Multitenancy](Migrating-to-Multitenancy.md)  
 [Business Central Windows PowerShell Cmdlets](/powershell/business-central/overview)