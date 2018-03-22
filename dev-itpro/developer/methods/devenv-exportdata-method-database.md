---
title: "EXPORTDATA Method (Database)"
author: edupont04
manager: edupont04
ms.custom: na
ms.date: 10/14/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 90a14701-7468-4cc4-b01f-4859ae1be04b
caps.latest.revision: 4
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# EXPORTDATA Method (Database)
Exports data from the [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] database to a file. The data is not deleted from the database.  

 For an example of how to use this method, see page 9901, **Export Data**, in the [!INCLUDE[demolong](../includes/demolong_md.md)].  

## Syntax  

```  
[Ok:=] EXPORTDATA(ShowDialog, FileName[, Description][, IncludeApplication][, IncludeApplicationData][, IncludeGlobalData][, CompanyRecord])  
```  

#### Parameters  
 *ShowDialog*  
 Type: Boolean  

 Specifies if you want to display a dialog box where the user can confirm the action.  

 *FileName*  
 Type: Text  

 Specifies the name and location of the file that the data must be exported to. The file must have the .navdata extension.  

 *Description*  
 Type: Text  

 Specifies a description for the exported data.  

 *IncludeApplication*  
 Type: Variable  

 Specifies if you want to export the application objects.  

 Create a variable of type Boolean to specify this parameter.  

 *IncludeApplicationData*  
 Type: Variable  

 Specifies if you want to export the data that defines the application in the database. This includes the permissions, permission sets, profiles, and style sheets.  

 Create a variable of type Boolean to specify this parameter.  

 *IncludeGlobalData*  
 Type: Variable  

 Specifies if you want to export global, non-company specific data.  

 Create a variable of type Boolean to specify this parameter.  

 *CompanyRecord*  
 Type: Record  

 Specifies the company or companies that must be imported.  

## See Also  
<!--Links[Exporting and Importing Companies and Other Data](Exporting-and-Importing-Companies-and-Other-Data.md) -->   
[IMPORTDATA Method \(Database\)](devenv-IMPORTDATA-Method-Database.md)  
[Database Methods](devenv-database-methods.md)  
