---
title: "Altering Databases - Advanced Tab"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 121a43fb-8514-4d0d-a20d-331c413bd77c
caps.latest.revision: 12
---
# Altering Databases - Advanced Tab
Specifies how locking is handled in the database and specifies the start ID for elements on new objects.  
  
 To open this window, on the **File** menu, choose **Database**, choose **Alter**, and then choose the **Advanced** tab.  
  
## Locking Options  
  
|[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Lock timeout**|Specifies whether a session waits to place a lock on a resource that has already been locked by another session.<br /><br /> If you clear this field, then the session waits indefinitely.|  
|**Timeout duration \(sec\)**|Specifies the maximum length of time that a session waits to place a lock on a resource that has already been locked by another session. The default value is 10 seconds.|  
  
## Designer Options  
  
|[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Start ID \(UidOffset\)**|Specifies the start ID for elements on new objects. When you create a new table, page, report, codeunit, query, or XMLport, the elements have IDs that are offset by the **Start ID \(UidOffset\)** value that you specify. Object elements include containers, groups, fields, parts, DataItems, columns, filters, variables, functions, or text constants.<br /><br /> You must specify an Integer that is greater than or equal to 0.<br /><br /> The default value is 1.|  
  
## See Also  
 [How to: Alter Databases](How-to--Alter-Databases.md)   
 [Altering Databases - General Tab](Altering-Databases---General-Tab.md)   
 [Altering Databases - Database Files Tab](Altering-Databases---Database-Files-Tab.md)   
 [Altering Databases - Transaction Log Files Tab](Altering-Databases---Transaction-Log-Files-Tab.md)   
 [Altering Databases - Collation Tab](Altering-Databases---Collation-Tab.md)   
 [Altering Databases - Options Tab](Altering-Databases---Options-Tab.md)   
 [Altering Databases - Integration Tab](Altering-Databases---Integration-Tab.md)   
 [How to: Specify the Start ID Offset of Elements on Objects](How-to--Specify-the-Start-ID-Offset-of-Elements-on-Objects.md)
