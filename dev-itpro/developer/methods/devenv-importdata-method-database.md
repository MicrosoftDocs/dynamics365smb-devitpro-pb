---
title: "IMPORTDATA Method (Database)"
author: edupont04
manager: edupont04
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 1208c431-8d3d-4cc7-9696-98533d992ebb
caps.latest.revision: 3
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# IMPORTDATA Method (Database)
Imports data from a file that has been exported from a [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] database.  

 For an example of how to use this method, see page 9900, **Import Data**, in the [!INCLUDE[demolong](../includes/demolong_md.md)].  

## Syntax  

```  
[Ok:=] IMPORTDATA(ShowDialog, FileName[, IncludeApplicationData][, IncludeGlobalData][, CompanyRecord])  
```  

#### Parameters  
 *ShowDialog*  
 Type: Boolean  

 Specifies if you want to display a dialog box where the user can confirm the action.  

 *FileName*  
 Type: Text  

 Specifies the name and location of the file that must be imported. The file must have been exported from a [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] database.  

 *IncludeApplicationData*  
 Type: Variable  

 Specifies if you want to import the data that defines the application in the database. This includes the permissions, permission sets, profiles, and style sheets.  

 Create a variable of type Boolean to specify this parameter.  

> [!IMPORTANT]  
>  To import application objects, you must use the **Import-NAVData** Windows PowerShell cmdlet. For more information, see <!--Links[Exporting and Importing Companies and Other Data](Exporting-and-Importing-Companies-and-Other-Data.md) -->.  

 *IncludeGlobalData*  
 Type: Variable  

 Specifies if you want to import global, non-company specific data.  

 Create a variable of type Boolean to specify this parameter.  

 *CompanyRecord*  
 Type: Record  

 Specifies the company or companies that must be imported.  

## See Also  
<!--Links[Exporting and Importing Companies and Other Data](Exporting-and-Importing-Companies-and-Other-Data.md) -->  
[EXPORTDATA Method \(Database\)](devenv-EXPORTDATA-Method-Database.md)  
[Database Methods](devenv-database-methods.md)  
