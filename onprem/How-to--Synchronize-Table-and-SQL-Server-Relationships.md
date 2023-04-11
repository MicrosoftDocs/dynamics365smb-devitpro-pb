---
title: "How to: Synchronize Table and SQL Server Relationships"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e75c2263-18c4-4266-ae1b-9c722967ab1b
caps.latest.revision: 6
---
# How to: Synchronize Table and SQL Server Relationships
The **TableRelation** property and SQL Server relationships are automatically synchronized when you create a table and when you redesign a table. However, there are some situations in which you may need to manually synchronize the relationships. Examples include after you have:  
  
-   Deleted a table in the Object Designer.  
  
-   Restored a database backup.  
  
-   Imported a .fob file.  
  
> [!NOTE]  
>  Table relationships are not generated or maintained when you import a .txt file.  
  
### To initiate the synchronization process manually  
  
1.  On the **File** menu, choose **Database**, and then choose **Alter**. The **Alter Database** window appears.  
  
2.  Choose the **Integration** tab.  
  
3.  Select the **Synchronize** check box and choose **OK**.  
  
     This check box is only enabled when there are table relationships that need to be synchronized because of inconsistencies in the **TableRelation** property.  
  
     If an error occurs during the synchronization process, you receive an error message informing you that a particular table has an invalid relationship. To correct this error, you must modify the **TableRelation** property of the table in question in the Table Designer and then manually synchronize the relationships again.  
  
## See Also  
 [Setting Relationships Between Tables](Setting-Relationships-Between-Tables.md)
