---
title: "How to: Increase the Size of Database Files"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ddf5bdf8-cbb1-4d27-97af-4d6217597549
caps.latest.revision: 6
---
# How to: Increase the Size of Database Files
You can expand your [!INCLUDE[navnow](includes/navnow_md.md)] SQL Server database by increasing the size of one or more of its constituent database files.  
  
> [!WARNING]  
>  You must always make a backup of your database before expanding it. For more information, see [Create a Full Database Backup \(SQL Server\)](https://go.microsoft.com/fwlink/?LinkID=296465).  
  
### To increase the size of a database file  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **File** menu, choose **Database**, and then choose **Alter**. The **Alter Database** window opens.  
  
2.  Choose the **Database Files** tab.  
  
3.  Select the data file that you want to expand.  
  
4.  Choose the **Size \(MB\)** field and enter the new size.  
  
    > [!NOTE]  
    >  If the **Unrestricted Growth** option is not selected and the database has grown to its maximum size, then you can either select the **Unrestricted Growth** option or increase the maximum size of one of the secondary data files.  
  
5.  \(optional\) To increase the maximum size of a data file, in the **Maximum Size \(MB\)** field, enter the new maximum size.  
  
 You can also delete existing data files that are empty. The first data file that is listed is the primary file, and cannot be deleted.  
  
## See Also  
 [Altering Databases - Database Files Tab](Altering-Databases---Database-Files-Tab.md)
