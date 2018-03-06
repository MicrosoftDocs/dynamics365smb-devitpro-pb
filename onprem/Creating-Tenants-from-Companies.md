---
title: "Creating Tenants from Companies"
author: edupont04
ms.custom: na
ms.date: 10/14/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b7d75e0a-7653-4b21-a522-13ecb688c40e
caps.latest.revision: 9
---
# Creating Tenants from Companies
If your [!INCLUDE[navnow](includes/navnow_md.md)] solution includes multiple companies in one database, you can choose to migrate to multitenancy where the [!INCLUDE[navnow](includes/navnow_md.md)] companies become tenants of your application database.  

## Companies in Multitenancy Deployments  
 In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], you can maintain multiple companies in each business database, and you can choose to export all or some of the companies to separate tenant databases. A tenant database can contain one or more companies. Therefore, you can deploy the number of tenants that suits your solution. This varies between solutions. You may prefer to have a dedicated tenant database for each legal entity in your deployment. Or you may prefer to have a tenant database for each group of legal entities where each legal entity is a [!INCLUDE[navnow](includes/navnow_md.md)] company in that tenant database. In this example, we assume that your current deployment consists of one or more databases with multiple companies in each database. If you migrate your solution as suggested by the examples in this section, you will have a deployment where your application is stored in a dedicated application database. Each company in the original database will be moved into a dedicated business database, which is mounted as tenants on a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  

> [!IMPORTANT]  
>  Before you can create tenants from [!INCLUDE[navnow](includes/navnow_md.md)] companies, you must have exported the application to a dedicated application database. For more information, see [Separating Application Data from Business Data](Separating-Application-Data-from-Business-Data.md).  

### Running a Windows PowerShell Script to Create Tenants from Companies  
 [!INCLUDE[navnow](includes/navnow_md.md)] includes a sample [!INCLUDE[wps_2](includes/wps_2_md.md)] script and a sample SQL script, HowTo-MoveCompanyToTenant.ps1 and HowTo-MoveCompanyToTenant.sql. These scripts illustrate how you can move company-specific data to new business databases and mount them as new tenants. You can modify the scripts and then run them in the [!INCLUDE[nav_shell](includes/nav_shell_md.md)]. For more information, see [Sample Windows PowerShell Scripts for Microsoft Dynamics NAV](Sample-Windows-PowerShell-Scripts-for-Microsoft-Dynamics-NAV.md).  

 The HowTo-MoveCompanyToTenant.ps1 script uses [!INCLUDE[navnow](includes/navnow_md.md)] cmdlets and SQL commands to copy data from a [!INCLUDE[navnow](includes/navnow_md.md)] company in a business database to a new tenant database. It mounts the tenant database on a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, and then deletes the data and the company from the original database. You can adapt the scripts to your solution and rename them so that they do not start with “HowTo-“. Then, you can run the MoveCompanyToTenant.ps1 script in Windows PowerShell with the relevant parameters as shown in the following example.  

```  
MoveCompanyToTenant -ServerInstance ‘DynamicsNAV’ -FromDatabase 'Demo Database NAV (10-0)' -CompanyName 'CRONUS International Ltd.' -OldTenantName default -NewTenantName CRONUS1 -ServiceAccount 'NT AUTHORITY\NETWORK SERVICE' -DatabaseServer MySQLServer  
```  

 In the example, the script will move the [!INCLUDE[demoname](includes/demoname_md.md)] company from the Demo Database NAV \(10-0\) database to a new tenant database, CRONUS1.The script also adds an account for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance in the new database and removes the company from the original database. All information that is stored in shared tables, but which is specific to the company, is copied to the new tenant. The following table describes the parameters and the parameter values in the example.  

|Parameter|Value|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------|-----------|---------------------------------------|  
|*ServerInstance*|**DynamicsNAV**|The name of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.|  
|*FromDatabase*|**Demo Database NAV \(10-0\)**|The name of the business database that the company must be moved from.<br /><br /> This database must have been upgraded to [!INCLUDE[navnowlong](includes/navnowlong_md.md)], and you must have exported the application tables to an application database. For more information, see [Separating Application Data from Business Data](Separating-Application-Data-from-Business-Data.md).|  
|*CompanyName*|**CRONUS International Ltd.**|The name of the company that you want to move to a new tenant database.|  
|*OldTenantName*|**default**|The name of the tenant in the database that you are exporting from.<br /><br /> In many cases, you are working with a single-tenant business database that contains multiple companies. If you did not specify another ID for the tenant when you created the tenant database, specify **default**. If you have added more tenants to the solution, you must specify the tenant name.|  
|*NewTenantName*|**CRONUS1**|The name of the new tenant database.<br /><br /> In the example, this is based on the name of the original company. But because this value will identify the tenant, the value must be unique.<br /><br /> For example, if the name of the company is Spotsmeyer’s Furnishings, the name of the new tenant database can be **SPOTSMEYERS**. Alternatively, you can use a naming scheme of your choice, such as **TENANT1**, **TENANT2**, and so on.|  
|*ServiceAccount*|**NT AUTHORITY\\NETWORK SERVICE**|The account that [!INCLUDE[nav_server](includes/nav_server_md.md)] uses to access SQL Server. In a default deployment, this is the NT AUTHORITY\\NETWORK SERVICE account.|  
|*DatabaseServer*|**MySQLServer**|The name of the database tier server where the current business database is located. The new tenant database for the exported company will be created on the same server.|  
|*RemoveCompanyWhenMoved*||Specifies if each company must be deleted in the original tenant database when it is created in the new tenant database. The default value is **true**. Therefore, you must set the parameter to **false** if you do not want the script to delete the companies.|  

 The script uses the **sqlcmd** utility to create the database, assign database permissions to the service account, and move the data. This utility is part of SQL Server. The script creates four temporary tables in the original database to handle user-specific data, company-specific data, tables that will not be moved, and user IDs. You must modify the MoveCompanyToTenant.sql script to change the default values.  

## See Also  
 [Migrating to Multitenancy](Migrating-to-Multitenancy.md)   
 [Multitenant Deployment Architecture](Multitenant-Deployment-Architecture.md)   
 [Sample Windows PowerShell Scripts for Microsoft Dynamics NAV](Sample-Windows-PowerShell-Scripts-for-Microsoft-Dynamics-NAV.md)
