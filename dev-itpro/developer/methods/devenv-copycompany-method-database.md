---
title: "COPYCOMPANY Method (Database)"
author: edupont04
manager: edupont04
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: dd8058d0-5b1e-4fd1-aeb1-7ef480fa581d
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# COPYCOMPANY Method (Database)
Creates a new company and copies all data from an existing company in the same database.  

## Syntax  

```  
[Ok:=] COPYCOMPANY(SourceName, DestinationName)  
```  

#### Parameters  
 *SourceName*  
 Type: Text  

 The name of the company that you want to copy data from.  

 *DestinationName*  
 Type: Text  

 The name of the company that you want to create and copy data to.  

 The company name can have a maximum of 30 characters. If the database collation is case-sensitive, you can have one company called COMPANY and another called Company. However, if the database is case-insensitive, you cannot create companies with names that differ only by case.  

## Example  
 The following example is based on the **Copy Company** batch job, which is part of the [!INCLUDE[demo](../includes/demo_md.md)]. The batch job takes the Company system table as a data item and uses the **Name** field as the value of the *SourceName* parameter. The value of the *DestinationName* parameter is specified in the **New Company Name** field in the request page, which is represented by the `NewCompanyName` variable.  

```  
COPYCOMPANY(Name, NewCompanyName);  
```  

## See Also  
 [Database Methods](devenv-database-methods.md)   
