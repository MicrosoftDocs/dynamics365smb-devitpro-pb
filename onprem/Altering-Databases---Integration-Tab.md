---
title: "Altering Databases - Integration Tab"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 97f21877-f8b1-4d61-ac6c-89be487cb489
caps.latest.revision: 10
---
# Altering Databases - Integration Tab
Specifies database settings that determine how [!INCLUDE[navnow](includes/navnow_md.md)] integrates with SQL Server and external tools.  
  
 To open this window, on the **File** menu, choose **Database**, choose **Alter**, and then choose the **Integration** tab.  
  
## Objects Options  
  
|[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Convert Identifiers**|Defines characters that you want to map to the underscore character in the names of all SQL Server objects, such as tables, columns, and constraints. If these characters occur in tables or fields in [!INCLUDE[navnow](includes/navnow_md.md)], then they are converted to underscores in the SQL Server names.<br /><br /> When the conversion is complete, you must close and reopen the database before you can use the new identifiers.|  
  
## License Options  
  
|[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Save license in database**|Specifies that the license file is uploaded and stored in the database instead of on the server. This is useful if you are hosting several databases with separate license files on the same server.|  
  
## See Also  
 [How to: Alter Databases](How-to--Alter-Databases.md)   
 [Altering Databases - General Tab](Altering-Databases---General-Tab.md)   
 [Altering Databases - Database Files Tab](Altering-Databases---Database-Files-Tab.md)   
 [Altering Databases - Transaction Log Files Tab](Altering-Databases---Transaction-Log-Files-Tab.md)   
 [Altering Databases - Collation Tab](Altering-Databases---Collation-Tab.md)   
 [Altering Databases - Options Tab](Altering-Databases---Options-Tab.md)   
 [Altering Databases - Advanced Tab](Altering-Databases---Advanced-Tab.md)
