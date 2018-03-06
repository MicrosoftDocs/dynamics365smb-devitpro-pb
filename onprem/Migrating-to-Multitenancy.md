---
title: "Migrating to Multitenancy"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 4e96a4ec-3880-400f-bf32-e50fefcf28bc
caps.latest.revision: 11
---
# Migrating to Multitenancy
You can choose to migrate your [!INCLUDE[navnow](includes/navnow_md.md)] solution to a multitenant deployment architecture where you maintain a single application that is used by two or more companies that store their data in separate databases.  
  
 This can make maintenance of your solution easier if you support multiple customers with the same application functionality.  
  
## Tenants and Companies  
 When you upgrade your application and the data to [!INCLUDE[navnowlong](includes/navnowlong_md.md)], you have a database that has the same number of companies as you had before the upgrade. This database is considered a *tenant*. This does not mean that you have to turn your solution into a multitenant deployment. But it means that you can if you want to.  
  
 For example, your [!INCLUDE[navnow](includes/navnow_md.md)] deployment in the earlier version consisted of a database that has 20 companies. In other words, you support 20 companies that all share the same application functionality. In this example, the companies are separate companies that have nothing to do with each other except that they are supported by you in one database. In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], you can choose to extract the application-wide tables into a separate database and keep the data for all 20 companies in the original database. This becomes a single-tenant business data database. Then, you can choose to split the business data database into one for each company so that you run a truly multitenant environment. The application is stored separately in the application database, and you maintain application functionality centrally. When you modify the application, you make the changes available to one tenant at a time. As a result, if something goes wrong, all other tenants are not affected.  
  
 Compare this to earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)] where a database could contain several companies. These companies could be related or not, but they would all use the same application and write to the same database. Also, when you modified the application, it would affect all companies immediately. So if something went wrong, all companies would be affected.  
  
> [!NOTE]  
>  The email logging functionality in [!INCLUDE[navnow](includes/navnow_md.md)] requires the [!INCLUDE[nav_server](includes/nav_server_md.md)] service account to have access to the Exchange server. But in a multitenant deployment, this is not always possible.  
  
 In multitenant deployments of [!INCLUDE[navnow](includes/navnow_md.md)], permission sets are stored centrally in the application database, so only the administrator of the central application can add, remove, or modify permission sets. Instead, the tenants can use user groups to manage permissions. For more information, see [Managing User Groups](managing-user-groups.md).  
  
### Migration Process  
 If you decide to move to a multitenant architecture, you must complete the following steps:  
  
1.  If your current solution is based on an earlier version of [!INCLUDE[navnow](includes/navnow_md.md)], upgrade the database to [!INCLUDE[navnowlong](includes/navnowlong_md.md)]. For more information, see [Upgrading the Data](Upgrading-the-Data.md).  
  
     After this step, you have a database that contains the application-wide tables and the same companies as before. But it has been upgraded to the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] database schema.  
  
2.  Move the tables that describe the application to a separate database. For more information, see [Separating Application Data from Business Data](Separating-Application-Data-from-Business-Data.md).  
  
     After this step, you have two databases: an application database and a business data database.  
  
3.  Split the business data database into one for each company. For more information, see [Creating Tenants from Companies](Creating-Tenants-from-Companies.md).  
  
     After this step, you have an application database and a business data database for each company in the original database. The company-specific business data databases are tenants, and your solution is multitenant.  
  
 If you want to move back to storing application tables and business data in a single database, you can use the [!INCLUDE[navnow](includes/navnow_md.md)] Windows PowerShell cmdlets to merge the databases. For more information, see [Merging an Application Database with a Tenant Database](Merging-an-Application-Database-with-a-Tenant-Database.md).  
  
## See Also  
 [Separating Application Data from Business Data](Separating-Application-Data-from-Business-Data.md)   
 [Creating Tenants from Companies](Creating-Tenants-from-Companies.md)   
 [Upgrading the Application Code](Upgrading-the-Application-Code.md)   
 [Upgrading the Data](Upgrading-the-Data.md)   
 [Upgrading to Microsoft Dynamics NAV 2017](Upgrading-to-Microsoft-Dynamics-NAV-2017.md)   
 [Merging an Application Database with a Tenant Database](Merging-an-Application-Database-with-a-Tenant-Database.md)