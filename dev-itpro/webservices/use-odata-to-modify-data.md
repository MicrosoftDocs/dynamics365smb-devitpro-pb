---
title: OData Web Services Data Modification
description: Write to the database using an OData web service that exposes a writable page and implement it in on Microsoft SharePoint Online.
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
---
# Using OData Web Services to Modify Data
You can write to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database using an OData web service that exposes a writable page. For example, you can expose a page as an OData web service and implement it in a portal that is based on Microsoft SharePoint Online. Users of the portal can then modify the data.  
  
## Modifying Data Using OData Web Services  
 If an editable page is exposed as a web service, the data in the underlying table can be accessed and modified by an OData call. [!INCLUDE[prod_short](../developer/includes/prod_short.md)] supports the following OData operations for modifying data.  
  
|OData call|Data impact|Triggers run on page and table in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] |  
|----------------|-----------------|------------------------------------------------------------|  
|`POST`|Creates a new entity.|`OnNewRecord` and `OnInsert`|  
|`PATCH`|Modifies the specified existing entity.|`OnModify`|  
|`DELETE`|Deletes the specified existing entity.|`OnDelete`|  
  
 All calls fail if the user does not have the relevant permissions, and if the relevant property on the page, **InsertAllowed**, **ModifyAllowed**, or **DeleteAllowed**, is set to **No**.  
  
 You can use an OData web service in applications where you want users to be able to modify [!INCLUDE[prod_short](../developer/includes/prod_short.md)] data the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)]. For example, you can show fields from the **Customer** table on a mobile device or in a browser so that a user can create, update, or delete customers in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database.  

 PATCH operations requires the 'If-Match' header to be set, either with a retrieved ETag or with '*'.
  
### Company-Specific and Tenant-Specific OData Calls  
 In your implementation of the web service, you can specify which company in the database that a user can write to in the URIs that expose the web services. Similarly, you can specify the specific tenant that the change applies to if the database handles more than one tenant.  
  
 If you do not specify a company, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] will identify a default company. The default company is found in the following order of sequence:  
  
1.  The ServicesDefaultCompany setting in the Tenants.config file.  
  
2.  The ServicesDefaultCompany setting in the CustomSettings.config file for [!INCLUDE[server](../developer/includes/server.md)].  
  
3.  The company in the current tenant when there is only one company.  
  
     If the OData request is for modifying metadata, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] will return the first company in the tenant database because metadata applies to all companies in the database.  
  
 If no default company can be found based on the criteria, an error message appears.  
  
## See Also  
 [OData Web Services](OData-Web-Services.md)   
 [Using OData to Return-Obtain a JSON Document](return-obtain-json-document.md)   
