---
title: "Multitenant Deployment Architecture"
description: Get an overview of a multitenant deployment
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Multitenant Deployment Architecture in Business Central

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] supports deployments where several different companies access a centrally maintained [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application. By using this *multitenancy* support, you can add new customers to your solution easily, and you can roll out updates quickly with limited downtime for your customers.  

![Multitenant architecture overview](../developer/media/architecture-multitenant.png "Multitenant architecture overview")  
  
> [!NOTE]  
>  You don't have to turn your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] solution into a multitenant deployment. You can install and run [!INCLUDE[prod_short](../developer/includes/prod_short.md)] as a classic one-server-one-database deployment.  
  
 In a multitenant deployment, information about the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application is stored in a separate application database. Your customers’ data is stored in separate business databases, each of which is a *tenant* in your deployment. By separating application from data, you can deploy the same solution to many customers with centralized maintenance of the application and isolation of each tenant. The application database contains the tables that define an application, such as the **Object** table and other system tables.  
  
 For example, if your current solution contains 10 companies in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database, you can choose to create separate [!INCLUDE[prod_short](../developer/includes/prod_short.md)] databases to store each company’s business data. The knowledge about the shared application is then stored in a dedicated application database. [!INCLUDE[prod_short](../developer/includes/prod_short.md)] includes [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] cmdlets that create an application database, and other cmdlets that enable you to create and administer tenant-specific databases.  
  
 You can choose to upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] and not change your deployment so that you still have a single database that has one or more companies in it. You can also choose to extract the application tables to an application database but still have one business data database that has one or more companies in it. In both scenarios you have not migrated to multitenancy, but in the second scenario you have prepared your solution so that you can move to multitenancy at a later point.  
  
## Tenants, Companies, and Databases  
 A tenant is an entity that uses your solution and stores data in a business database. This is often either a business or a group of legal entities whose data can be stored in one database. In practical terms, a tenant is a database that stores business data for one or more [!INCLUDE[prod_short](../developer/includes/prod_short.md)] companies. Each tenant is connected to a [!INCLUDE[server](../developer/includes/server.md)] instance, but the [!INCLUDE[server](../developer/includes/server.md)] instance can support multiple tenants.  
  
 When you deploy and maintain a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] solution, you must activate the relationship between the [!INCLUDE[server](../developer/includes/server.md)] instance by mounting the tenant to the [!INCLUDE[server](../developer/includes/server.md)] instance. You can do this by using the [!INCLUDE[admintool](../developer/includes/admintool.md)] or by running the **Mount-NAVTenant** and **Sync-NAVTenant** cmdlets from the [!INCLUDE[adminshell](../developer/includes/adminshell.md)]. Similarly, to disconnect a tenant, you can use the [!INCLUDE[admintool](../developer/includes/admintool.md)] or run the **Dismount-NAVTenant** cmdlet. For more information, see [How to: Mount or Dismount a Tenant on a Microsoft Dynamics Server Instance](../administration/mount-dismount-tenant.md).  
  
 When tenants are mounted, the tenant configurations are stored in the **dbo.$ndo$tenants** table of the application database that is connected to the [!INCLUDE[server](../developer/includes/server.md)] instance. If you connect additional [!INCLUDE[server](../developer/includes/server.md)] instances to the same application database, the added server instances will automatically inherit the tenant configurations from the application database. This means that existing tenants will be automatically mounted to the new server instance. In addition, if you must mount or dismount a tenant, you only have to perform the operation on one of the [!INCLUDE[server](../developer/includes/server.md)] instances. The other server instances will automatically detect and update to the changes.  
  
 When you refer to a tenant, you refer to it by the tenant ID. The first tenant that is mounted against a [!INCLUDE[server](../developer/includes/server.md)] instance has the tenant ID **default**. However, you can choose to set up host names for the tenants in your deployment. For example, if you want a tenant to access [!INCLUDE[prod_short](../developer/includes/prod_short.md)] through a URL, you can set up a tenant-specific subdomain. The users in that tenant will then access [!INCLUDE[prod_short](../developer/includes/prod_short.md)] through a URL such as *https://mytenant.myservice.com*. The tenant host name, *mytenant.myservice.com*, must be specified as an alternative ID in the tenant configuration. You can specify alternative IDs for a tenant by using the **Mount-NAVTenant** Windows PowerShell cmdlet.  
  
### Companies  
 A tenant database can contain one or more [!INCLUDE[prod_short](../developer/includes/prod_short.md)] companies. It's not the number of companies in a database that determines whether you are running a multitenant environment. The deciding factor is whether you have created an application database, and if you have more than one tenant database connected to the application database.  
  
### Databases  
 When information about the application is stored in a separate application database, you maintain the application centrally without affecting the various tenants that use the application. Each tenant database contains the business data for one or more specific companies and doesn't contain all of the application metadata.  
  
 For example, if you want to modify a report, and your solution is used by 25 customers, you modify the report in the application database. When each customer then accesses the report, they see the modified report.  
  
### Deployment Scenarios Supported in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]  
 The following table compares deployment scenarios.  
  
|Includes application database|No. of business databases per application database|No. of companies in business database|Multitenant deployment|  
|-----------------------------------|--------------------------------------------------------|-------------------------------------------|----------------------------|  
|No|1|1|No|  
|Yes|1|1|No|  
|Yes|1|2|No|  
|Yes|2|1|Yes|  
|Yes|2|2|Yes|  
  
 In the table, the number of companies and business databases are shown as either 1 or 2. But most of the time there are either 1 or more than 2.  
  
 The table describes different deployments of a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] solution. For example, a deployment with one database and a single company versus a deployment with two or more business databases for each application database. Of those two scenarios, only the second is a multitenant deployment because it connects multiple tenant databases \(the business databases\) with a single application database. The table also illustrates that you can have multiple companies in a business database. Finally, you can have an application database and a single business database that contains multiple companies. This is a single-tenant deployment.  
  
## The Application in Multitenant Deployments  
 In a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application that is used in a multitenant deployment, some areas require you to set up web services. Since web services are created in the application database, you must create at least one tenant that has write access to the application database. This setting is determined by the *Allow application database writes* parameter when you mount a tenant against a [!INCLUDE[server](../developer/includes/server.md)] instance. For more information, see [How to: Mount or Dismount a Tenant on a Microsoft Dynamics Server Instance](../administration/mount-dismount-tenant.md).  
  
 For example, you can create a dedicated administration tenant that you mount against the [!INCLUDE[server](../developer/includes/server.md)] instance when you create web services for an application.  
  
 If you have an existing [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application that you want to use in a multitenant deployment, there are a number of changes that you have to make. This includes setting up the permission sets in a way that supports all tenants that use that application.  
  
### URLs and Tenants  
 In multitenant deployments, URLs must specify the tenant that the URL applies to. If you have C/AL code that constructs URLs, you must update the code to include the tenant. Alternatively, update your code with the [GETURL Function](../developer/methods/devenv-GETURL-method.md) to get the URLs calculated for you. The same applies to hyperlinks in report objects, for example.  
  
 The URL can specify the tenant ID or the tenant host name if you specify host names as alternative IDs for tenants. For example, the following URL consumes the **Customer** ODATA web service for a specific tenant:  
  
```  
https://localhost:7048/BC/OData/Company('CRONUS-International-Ltd.')/Customer?Tenant=Tenant1  
```  
  
 If the *mytenant.myservice.com* host name has been specified as an alternative ID for the tenant Tenant1, then the following URL returns the same ODATA web service:  
  
```  
https://mytenant.myservice.com:7048/BC/OData/Company('CRONUS-International-Ltd.')/Customer  
```  
  
## See Also  
 [Migrating to Multitenancy](Migrating-to-Multitenancy.md)   
 [Microsoft Dynamics 365 Windows PowerShell Cmdlets](/powershell/business-central/overview)   
 [How to: Mount or Dismount a Tenant on a Microsoft Dynamics Server Instance](../administration/mount-dismount-tenant.md)