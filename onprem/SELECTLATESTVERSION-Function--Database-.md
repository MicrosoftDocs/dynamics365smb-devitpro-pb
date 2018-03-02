---
title: "SELECTLATESTVERSION Function (Database)"
ms.custom: na
ms.date: 06/04/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 35587c5b-6994-4183-8237-db5eae9ab568
caps.latest.revision: 9
---
# SELECTLATESTVERSION Function (Database)
Forces the latest version of the database to be used.  
  
## Syntax  
  
```  
  
SELECTLATESTVERSION  
```  
  
## Remarks  
 This function makes sure that the data displayed is the most current data in the database. The function clears all non-locked records from the client cache, thereby ensuring that you read the most recent data. The function also clears the current client session's cache for the CaptionClassTranslate strings. The strings will then be reevaluated by the **CaptionClassTranslate** function trigger \(ID 15\) in codeunit 1.  
  
> [!WARNING]  
>  Clearing the cache and reading data directly from the database adversely affects performance.  
  
## See Also  
 [Database](Database.md)   
 [CaptionClass Functionality](CaptionClass-Functionality.md)