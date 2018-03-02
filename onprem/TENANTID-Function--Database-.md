---
title: "TENANTID Function (Database)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 070737cc-4fda-4fa9-84c6-976473d7e2e0
caps.latest.revision: 3
---
# TENANTID Function (Database)
Gets the ID of the tenant that has started the current session.  
  
 Use this function when your code must be specific about which tenant database to access in a multitenant deployment. For example, if your code imports data into a cache, you can make a cache tenant-specific by using the tenant ID as a key. Also, if you want to write code that saves documents, you can include the tenant ID in the file name or location, for example. In those cases, you can use the TENANTID function in combination with the COMPANYNAME function to identify the company and the tenant database.  
  
## Syntax  
  
```  
  
ID := TENANTID  
```  
  
## Property Value/Return Value  
 Type: Text  
  
 The ID of the tenant that has started the current session.  
  
## See Also  
 [Multitenant Deployment Architecture](Multitenant-Deployment-Architecture.md)   
 [COMPANYNAME Function \(Database\)](COMPANYNAME-Function--Database-.md)   
 [Database](Database.md)