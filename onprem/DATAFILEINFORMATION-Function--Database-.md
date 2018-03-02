---
title: "DATAFILEINFORMATION Function (Database)"
author: edupont04
manager: edupont04
ms.custom: na
ms.date: 10/14/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 731a41c4-85c7-42c6-8dc6-00a7dcd090b2
caps.latest.revision: 3
---
# DATAFILEINFORMATION Function (Database)
Specifies data from a file that has been exported from a [!INCLUDE[navnow](includes/navnow_md.md)] database.  

 For an example of how to use this function, see page 9900, **Import Data**, in the [!INCLUDE[demolong](includes/demolong_md.md)].  

## Syntax  

```  
[Ok:=] DATAFILEINFORMATION(ShowDialog, FileName, Description, HasApplication, HasApplicationData, HasGlobalData, tenantId, exportDate, CompanyRecord)  
```  

#### Parameters  
 *ShowDialog*  
 Type: Boolean  

 Specifies if you want to display a dialog box where the user can confirm the action.  

 *FileName*  
 Type: Text  

 Specifies the name and location of the file that you want to read information from. The file must have been exported from a [!INCLUDE[navnow](includes/navnow_md.md)] database.  

 *HasApplication*  
 Type: Variable  

 Specifies if the file contains application objects.  

 Create a variable of type Boolean to specify this parameter.  

 *HasApplicationData*  
 Type: Variable  

 Specifies if the file contains the data that defines the application in the database. This includes the permissions, permission sets, profiles, and style sheets.  

 Create a variable of type Boolean to specify this parameter.  

 *HasGlobalData*  
 Type: Variable  

 Specifies if the file contains global, non-company specific data.  

 Create a variable of type Boolean to specify this parameter.  

 *tenantId*  
 Type: Variable  

 Specifies the tenant ID of the database that the data was exported from.  

 Create a variable of type Text to specify this parameter.  

 *exportDate*  
 Type: Variable  

 Specifies the date and time when the data was exported.  

 Create a variable of type DateTime to specify this parameter.  

 *CompanyRecord*  
 Type: Record  

 Specifies the company or companies in the file.  

## See Also  
[Exporting and Importing Companies and Other Data](Exporting-and-Importing-Companies-and-Other-Data.md)  
[Database](Database.md)  
