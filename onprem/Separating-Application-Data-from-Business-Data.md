---
title: "Separating Application Data from Business Data"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: a66261d0-f8b8-418d-a8e4-22152a91e4c7
caps.latest.revision: 11
---
# Separating Application Data from Business Data
[!INCLUDE[navnowlong](includes/navnowlong_md.md)] separates tables that describe the application from the tables that contain business data. Depending on your deployment scenario, you can choose to store all [!INCLUDE[navnow](includes/navnow_md.md)] tables in one database, or you can export the application tables to a dedicated database. In multitenant deployments, the application must be stored in a dedicated database.  
  
## Application Database versus Business Data Databases  
 The application database contains tables that describe your application. This includes a description of the objects that your application consists of, and other data that is common to all tenants. The data that users enter in your application is stored in the business data database because this data is specific to their company. Optionally, you can create multiple business data databases, such as if you want to support your customers as tenants.  
  
 When you have exported the application tables to a separate database, you can no longer access the business database from the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)]. This is because the metadata for the tables in the business database is stored in the application database and modified in that database.  
  
 For example, if you want to modify a report, you modify the report object in the application database. Then, when you deploy the updated application to your production environment, when a user accesses the report, they see the modified report.  
  
 [!INCLUDE[navnow](includes/navnow_md.md)] includes [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets that help you export application tables to a dedicated database, and other cmdlets to help you maintain a multitenant deployment. For more information, see [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md).  
  
### Distribution of the System Tables in Each Database  
 The application tables are system tables that define the application. Other system tables remain in the business data database. The following table describes which system tables are moved to the application database when you run the Export-NAVApplication cmdlet and which tables remain in the business data database.  
  
|Application database|Business data database|  
|--------------------------|----------------------------|  
|**Chart**|**Access Control**|  
|**Client Add-in**|**Active Session**|  
|**Client Add-in Resources**|**Company**|  
|**Debugger Breakpoint**|**Device**|  
|**Debugger Watch**|**Document Service**|  
|**Object**|**Integration Page**|  
|**Object Metadata**|**Object Metadata Snapshot**|  
|**Object Tracking**|**Object Translation**|  
|**Permission**|**Page Data Personalization**|  
|**Permission Set**|**Printer Selection**|  
|**Profile**|**Record Link**|  
|**Profile Metadata**|**Report List Translation**|  
|**Send-To Program**|**Session Event**|  
|**Server Instance**|**User**|  
|**Style Sheet**|**User Default Style Sheet**|  
|**Web Service**|**User Metadata**|  
||**User Personalization**|  
||**User Property**|  
  
## See Also  
 [How to: Export the Application Tables to a Dedicated Database](How-to--Export-the-Application-Tables-to-a-Dedicated-Database.md)   
 [Migrating to Multitenancy](Migrating-to-Multitenancy.md)   
 [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)