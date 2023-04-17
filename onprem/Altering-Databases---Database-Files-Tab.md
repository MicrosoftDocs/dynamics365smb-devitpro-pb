---
title: "Altering Databases - Database Files Tab"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0ea30975-b1c4-4ac1-8497-2cc1891c3221
caps.latest.revision: 7
---
# Altering Databases - Database Files Tab
Increases the size of the database by either increasing the size of one or more of the database files or adding new data files to the database.  
  
 If you use secondary data files, then you must increase the size of the primary data file only when the catalog that it contains has become too large. When the catalog has become too large, new SQL Server objects, such as tables, cannot be created until you increase the size of the primary data file.  
  
 When you use secondary data files, you cannot create more space for storing [!INCLUDE[navnow](includes/navnow_md.md)] data by just increasing the size of the primary data file. You can create more space for storing data by increasing the size of the secondary data files that contain [!INCLUDE[navnow](includes/navnow_md.md)] information. You can also add new secondary data files in order to store more data.  
  
 To open this window, on the **File** menu, choose **Database**, choose **Alter**, and then choose the **Database Files** tab.  
  
> [!NOTE]  
>  The first data file that is listed on the **Database Files** tab is the primary file.  
  
## See Also  
 [How to: Increase the Size of Database Files](How-to--Increase-the-Size-of-Database-Files.md)   
 [How to: Add New Database Files](How-to--Add-New-Database-Files.md)   
 [How to: Alter Databases](How-to--Alter-Databases.md)   
 [Altering Databases - General Tab](Altering-Databases---General-Tab.md)   
 [Altering Databases - Transaction Log Files Tab](Altering-Databases---Transaction-Log-Files-Tab.md)   
 [Altering Databases - Collation Tab](Altering-Databases---Collation-Tab.md)   
 [Altering Databases - Options Tab](Altering-Databases---Options-Tab.md)   
 [Altering Databases - Integration Tab](Altering-Databases---Integration-Tab.md)   
 [Altering Databases - Advanced Tab](Altering-Databases---Advanced-Tab.md)
