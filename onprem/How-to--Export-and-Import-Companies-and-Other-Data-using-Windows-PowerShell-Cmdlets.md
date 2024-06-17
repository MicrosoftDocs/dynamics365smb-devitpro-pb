---
title: "How to: Export and Import Companies and Other Data using Windows PowerShell Cmdlets"
author: jswymer
ms.date: 10/01/2018
ms.topic: article
---
# How to: Export and Import Companies and Other Data using Windows PowerShell Cmdlets
You can export data such as a company or an application from a [!INCLUDE[navnow](includes/navnow_md.md)] database from the [!INCLUDE[nav_shell](includes/nav_shell_md.md)]. You can also use [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets to import data into a [!INCLUDE[navnow](includes/navnow_md.md)] database.  

 The cmdlets take different parameter sets depending on how you connect to the database that you want to export data from or import data into. You can access the database through the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, or you can access the database directly. The procedures in this topic illustrate both approaches. For more information, see [Exporting and Importing Companies and Other Data](Exporting-and-Importing-Companies-and-Other-Data.md).  

### To export data using Windows PowerShell cmdlets  

1.  Open the [!INCLUDE[nav_shell](includes/nav_shell_md.md)].  

    > [!IMPORTANT]  
    >  You must run the program as administrator. Also, you must ensure that scripting is enabled on the computer. You must also have write access to the location that you specify in the *–FilePath* parameter.  

2.  For an overview of the cmdlet, type the following command:  

    ```  
    get-help Export-NAVData  
    ```  

3.  To export a single company from a tenant database that is mounted against a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, type the following command:  

    ```  
    Export-NAVData -ServerInstance <service name> -Tenant <tenant ID> -CompanyName "<Company name>" -FilePath <location>  
    ```  

     For example, to run the cmdlet against the [!INCLUDE[demolong](includes/demolong_md.md)], type the following command:  

    ```  
    Export-NAVData -ServerInstance nav_server_instance -Tenant Tenant1 -CompanyName "CRONUS International Ltd." -FilePath c:\Data\mytenantcompany.navdata  
    ```  

     In the example, the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is [!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)], the tenant database is Tenant1, and the company name is [!INCLUDE[demoname](includes/demoname_md.md)]. The example is based on a multitenant deployment where you want to export a specific company from the specified tenant database. In a single-tenant deployment, you do not specify the tenant, and the example will export the company from the database that the specified [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is configured for.  

     For an example of how to export data directly from a database that is not mounted against a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, see the next step.  

4.  To export global data, application data, and application objects directly from a database, type the following command:  

    ```  
    Export-NAVData -DatabaseServer <service name> -Database <database name> -IncludeGlobalData -IncludeApplicationData –IncludeApplication -FilePath <location>  
    ```  

     For example, to run the cmdlet against the [!INCLUDE[demolong](includes/demolong_md.md)], type the following command:  

    ```  
    Export-NAVData - DatabaseServer localhost -DatabaseName 'Demo Database NAV (11-0)' –AllCompanies -IncludeGlobalData -IncludeApplicationData -IncludeApplication -FilePath c:\Data\myappanddata.navdata  
    ```  

     In the example, the database server is the local computer, the database is the demonstration database, and the export includes global data, application data, and the application objects, and all companies in the database. The example is based on a single-tenant deployment where you have chosen to specify the *–DatabaseServer* and *–DatabaseName* parameters. Alternatively, you can specify the *–ServerInstance* parameter as illustrated in the previous step. In a multitenant deployment, you must also specify the tenant database.  

 For another example of how to export companies and other data, see the Example section.  

 You have exported a [!INCLUDE[navnow](includes/navnow_md.md)] company into a file. Now, you can import the company into another [!INCLUDE[navnow](includes/navnow_md.md)] database.  

### To import data using Windows PowerShell cmdlets  

1.  Open the [!INCLUDE[nav_shell](includes/nav_shell_md.md)].  

    > [!IMPORTANT]  
    >  You must run the program as administrator. Also, you must ensure that scripting is enabled on the computer.  

2.  To see what a .navdata file contains, type the following command:  

    ```  
    Get-NAVDataFile -FilePath <location>  
    ```  

     For example, to run the cmdlet against one of the files that were exported in the previous procedure, type the following command:  

    ```  
    Get-NAVDataFile -FilePath c:\Data\myappanddata.navdata  
    ```  

     In the example, the command returns the following information:  

    ```  
    ExportVersion                    : 1  

    DatabaseVersion                  : 70730  

    Description                      : All companies and all other data from a database.  

    IncludeApplication               : True  

    IncludeApplicationData           : True  

    TenantId                         :    

    IncludeGlobalData                : True  

    CompanyName                      : {CRONUS International Ltd.}   

    ExportDateTime                   : 28-08-2017 11:17:16  
    ```  

3.  To import a single company into a tenant database that is mounted against a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, type the following command:  

    ```  
    Import-NAVData -ServerInstance <server name> -Tenant <tenant ID> -CompanyName "<Company name>" -FilePath <location>  
    ```  

     For example, to run the cmdlet based on the data that you exported in the previous procedure, type the following command:  

    ```  
    Export-NAVData -ServerInstance nav_server_instance -Tenant Tenant2 -CompanyName "CRONUS International Ltd." -FilePath c:\Data\mytenantcompany.navdata  
    ```  

     In the example, the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is [!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)], the tenant database is Tenant2, and the company name is [!INCLUDE[demoname](includes/demoname_md.md)]. The example is based on a multitenant deployment where you want to move a company from one tenant database to another tenant database. In a single-tenant deployment, you do not specify the tenant, and the example will import the company into the database that the specified [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is configured for.  

     For an example of how to import data directly into a database, see the next step.  

    > [!IMPORTANT]  
    >  To import an application, you must use the Import-NAVData cmdlet using the *–DatabaseServer* and *–Database* parameters, and you must make sure no users are accessing the database. Also, the database must be empty.  

4.  To import an application directly into a [!INCLUDE[navnow](includes/navnow_md.md)] database, type the following command:  

    ```  
    Import-NAVData -DatabaseServer <server name> -Database <database name> -IncludeApplication -FilePath <location>  
    ```  

     For example, to run the cmdlet based on the data that you exported in the previous procedure, type the following command:  

    ```  
    Import-NAVData - DatabaseServer localhost -DatabaseName 'My Application Database' -IncludeApplication -FilePath c:\Data\myappanddata.navdata  
    ```  

     In the example, the database server is the local computer, the database is My Application Database, and the command imports the application objects that you exported from the [!INCLUDE[demolong](includes/demolong_md.md)]. Because you want to import an application, you specify the *–DatabaseServer* and *–DatabaseName* parameters. If you want to import other types of data, you can choose to specify the *–ServerInstance* parameter as illustrated in the previous step. In a multitenant deployment, you must also specify the tenant database.  

 For another example of how to import companies and data, see the Example section.  

## Example  
 The following code example illustrates a Windows PowerShell script that you can use to export data from a [!INCLUDE[navnow](includes/navnow_md.md)] database and import data into another database.  

```  
Export-NAVData –ServerInstance ProductionServer –AllCompanies –FilePath MyFile.navdata |  

Import-NAVData –ServerInstance TestServer -AllCompanies  
```  

 In the example, you export all companies from the database in a production environment. You then import the companies into a database in a test environment. This example illustrates how you can use the [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets to copy data to a database for debugging or maintenance, for example.  

## See Also  
 [Exporting and Importing Companies and Other Data](Exporting-and-Importing-Companies-and-Other-Data.md)   
 [How to: Export and Import Companies and Other Data in Clients](How-to--Export-and-Import-Companies-and-Other-Data-in-Clients.md)   
 [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)
