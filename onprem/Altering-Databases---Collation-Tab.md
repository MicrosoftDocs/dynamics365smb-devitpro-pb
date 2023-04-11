---
title: "Altering Databases - Collation Tab"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b35da374-6a7b-4987-8dc2-b96f571bc216
caps.latest.revision: 19
---
# Altering Databases - Collation Tab
Changes the collation that is used by the database.  
  
 To open this window, on the **File** menu, choose **Database**, choose **Alter**, and then choose the **Collation** tab.  
  
 Before you change the collation, you have to select the **Single user** option on the **Options** tab.  
  
##  <a name="ChangeCollation"></a> Changing the Collation of a [!INCLUDE[navnow](includes/navnow_md.md)] Database  
 If you change the database collation, then the collation of objects in the database is changed except for tables that have the **LinkedObject** property set to **Yes**. You must manually re-create these objects. For example, you can script them in SQL Server Management Studio.  
  
 If you change the collation from a case-sensitive to a case-insensitive collation or from an accent-sensitive to an accent-insensitive collation, then duplicates can occur in the primary keys of the tables. Duplicates can be caused by the values of the character data stored in the primary keys. If duplicates occur, then you receive an error message and the database collation change is stopped. We recommend that you do not change these attributes of a collation.  
  
> [!NOTE]  
>  Changing the collation can be a lengthy process that depends on the size of the database and the number of companies in the database. The system tables and all user table indexes that contain character data must be rebuilt.  
  
 The **Language** drop-down list displays the friendly name of the language, not the full Windows collation name. For some languages, there are multiple collations that sort characters differently. For example, the Windows collation languages include multiple Scandinavian languages, some of which sort Aa after Z, Æ, Ø, and some of which sort Aa after A and before B. If you upgrade from [!INCLUDE[nav2009](includes/nav2009_md.md)] to [!INCLUDE[navnowlong](includes/navnowlong_md.md)], you upgrade the database to the Windows collations. If you used SQL collation in earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)], then after you upgrade, verify that the Windows collation sorts characters in the way that you expect.  
  
 If you set the **Validate Collation** check box, then collation languages that run with a different non-Unicode code page from your system non-Unicode code page are filtered out of the **Language** drop-down list. An example scenario of when you might want to choose a collation language that has a different code page from your system code page is if you want to prepare a Japanese database on a Danish computer.  
  
 You cannot change the collation directly in the current database. To change the collation, you must create a new database that uses the correct collation, and then export the data from the old database and import it to the new database. For more information, see [How to: Alter Databases](How-to--Alter-Databases.md)  
  
## See Also  
 [How to: Alter Databases](How-to--Alter-Databases.md)   
 [How to: Alter Databases](How-to--Alter-Databases.md)   
 [Altering Databases - General Tab](Altering-Databases---General-Tab.md)   
 [Altering Databases - Database Files Tab](Altering-Databases---Database-Files-Tab.md)   
 [Altering Databases - Transaction Log Files Tab](Altering-Databases---Transaction-Log-Files-Tab.md)   
 [Altering Databases - Options Tab](Altering-Databases---Options-Tab.md)   
 [Altering Databases - Integration Tab](Altering-Databases---Integration-Tab.md)   
 [Altering Databases - Advanced Tab](Altering-Databases---Advanced-Tab.md)
