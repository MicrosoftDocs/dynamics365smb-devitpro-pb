---
title: "SELECTLATESTVERSION Method (Database)"
ms.custom: na
ms.date: 04/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-business-central
ms.assetid: 35587c5b-6994-4183-8237-db5eae9ab568
caps.latest.revision: 9
redirect_url: /dynamics365/business-central/dev-itpro/developer/methods-auto/library
---

 

# SELECTLATESTVERSION Method (Database)
Forces the latest version of the database to be used.  
  
## Syntax  
  
```  
  
SELECTLATESTVERSION  
```  
  
## Remarks  
 This method makes sure that the data displayed is the most current data in the database. The method clears all non-locked records from the client cache, thereby ensuring that you read the most recent data. The method also clears the current client session's cache for the CaptionClassTranslate strings. The strings will then be reevaluated by the **CaptionClassTranslate** method trigger \(ID 15\) in codeunit 42.  
  
> [!WARNING]  
>  Clearing the cache and reading data directly from the database adversely affects performance.  
  
## See Also  
 [Database Methods](devenv-database-methods.md)   
 <!--Links [CaptionClass Functionality](CaptionClass-Functionality.md)-->  