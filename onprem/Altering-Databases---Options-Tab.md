---
title: "Altering Databases - Options Tab"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e27315be-5303-4314-9298-6a32648cd794
caps.latest.revision: 10
---
# Altering Databases - Options Tab
Specifies database options that you set when you created the database. For example, you must select the **Single User** option before you perform any database tests. You must clear this option when the tests are completed.  
  
 To open this window, on the **File** menu, choose **Database**, choose **Alter**, and then choose the **Options** tab.  
  
## Access Section  
  
|[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Single user**|Specifies that only one user can access the database at a time. You can use this setting when you are performing administrative functions such as testing or restoring the database. By limiting access to the database to one user, you make sure that the database is not changed when you are testing it.<br /><br /> **Important:** Clear this check box when you are finished to give other users to access the database.|  
  
## Settings Section  
  
|[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Recovery Model**|Determines the kind of information that is written to the transaction log and therefore the kind of recovery model that you want to use in this database.<br /><br /> **Note:** The **Full** and **Bulk-logged** recovery models are similar, and many users of the **Full** recovery model will use the **Bulk-logged** recovery model occasionally.<br /><br /> [!INCLUDE[bp_tableoption](includes/bp_tableoption_md.md)]: <br />                        **Bulk-logged**<br /><br /> [!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]:<br /><br /> The transaction log will contain only limited information about certain large-scale or bulk copy operations. The **Bulk-logged** recovery model provides protection against media failure combined with the best performance and the minimal use of log space for certain large-scale or bulk copy operations.<br /><br /> The backup strategy for bulk-logged recovery consists of:<br /><br /> \* Database backups.<br /><br /> \* Differential backups \(optional\).<br /><br /> [!INCLUDE[bp_tableoption](includes/bp_tableoption_md.md)]: <br />                        **Full**<br /><br /> [!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]:<br /><br /> The details of every transaction are stored in the transaction log. This information can be used when you apply transaction log backups. The **Full** recovery model uses database backups and transaction log backups to provide complete protection against media failure. If one or more data files are damaged, media recovery can restore all the committed transactions. Incomplete transactions are rolled back.<br /><br /> Full recovery lets you recover the database to the point of failure or to a specific point in time. All operations are fully logged to guarantee that the database is recoverable. This includes bulk operations such as SELECT INTO, CREATE INDEX, and bulk loading data.<br /><br /> The backup strategy for full recovery consists of:<br /><br /> \* Database backups.<br /><br /> \* Differential backups \(optional\).<br /><br /> \* Transaction log backups.<br /><br /> [!INCLUDE[bp_tableoption](includes/bp_tableoption_md.md)]: <br />                      **Simple**<br /><br /> [!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]:<br /><br /> The database can be recovered to the point at which the last backup was made. However, you cannot restore the database to the point of failure or to a specific point in time. To do that, select either the **Full** or **Bulk-logged** recovery model.<br /><br /> The backup strategy for simple recovery consists of:<br /><br /> \* Database backups.<br /><br /> \* Differential backups \(optional\).|  
|**ANSI NULL default**|Specifies whether the database default NULL settings for column definitions and user-defined data types are to be applied. When you select this option, all user-defined data types or columns that have not been explicitly defined as NOT NULL are set to allow NULL entries. Columns that have been defined by using constraints follow the constraint rules, regardless of this setting.|  
|**Recursive triggers**|Specifies recursive trigger settings. Triggers can have direct recursion or indirect recursion. Direct recursion occurs when a trigger occurs and performs an action that causes the same trigger to be fired again. Indirect recursion occurs when a trigger occurs and performs an action that causes a trigger on another table to occur. This second trigger updates the original table which causes the first trigger to occur again.|  
|**Torn page detection**|Enables SQL Server to detect incomplete input/output operations that have been caused by power failures or other system outages.|  
|**Auto shrink**|Specifies whether SQL Server can periodically shrink data files and transaction log files.|  
  
## See Also  
 [How to: Alter Databases](How-to--Alter-Databases.md)   
 [Altering Databases - General Tab](Altering-Databases---General-Tab.md)   
 [Altering Databases - Database Files Tab](Altering-Databases---Database-Files-Tab.md)   
 [Altering Databases - Transaction Log Files Tab](Altering-Databases---Transaction-Log-Files-Tab.md)   
 [Altering Databases - Collation Tab](Altering-Databases---Collation-Tab.md)   
 [Altering Databases - Integration Tab](Altering-Databases---Integration-Tab.md)   
 [Altering Databases - Advanced Tab](Altering-Databases---Advanced-Tab.md)
