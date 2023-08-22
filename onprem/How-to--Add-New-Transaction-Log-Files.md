---
title: Add New Transaction Log Files
description: Expland a transaction log by creating a new log file in the database; it contains the changes made to the database and used for database recovery.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 9e64e3b8-6702-4594-8fc4-ae74963c09e1
caps.latest.revision: 8
---
# How to Add New Transaction Log Files in Dynamics NAV
You can expand a transaction log by creating a new transaction log file in the database. The transaction log contains the changes that are made to the database and is used for database recovery.  
  
> [!NOTE]  
>  You must always make a backup of the database before you expand it. For more information, see [Create a Full Database Backup \(SQL Server\)](https://go.microsoft.com/fwlink/?LinkID=296465).  
  
### To add a new transaction log file  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **File** menu, choose **Database**, and then choose **Alter**. The **Alter Database** window opens.  
  
2.  Choose the **Transaction Log Files** tab.  
  
3.  Select the first empty line in the window.  
  
4.  In the **Logical Name** field, enter a logical name for each transaction log file. Logical names make it easier to manage transaction log files.  
  
5.  In the **File Name** field, enter the full path and name of each transaction log file.  
  
    > [!NOTE]  
    >  We recommend that the transaction log files have the file name extension .ldf.  
  
6.  In the **Size \(MB\)** field, enter the initial size in megabytes of the transaction log file.  
  
7.  In the **File Growth** field, enter the amount by which the transaction log file will increase every time that it expands. This can be expressed in kilobytes \(KB\), megabytes \(MB\) or as a percentage \(%\).The default value is MB.  
  
     However, if you enter the value in megabytes, SQL Server will convert it to kilobytes. If you enter the value as a percentage, SQL Server will display it as a percentage.  
  
8.  Select the **Unrestricted Growth** field if you want SQL Server to expand the transaction log file when it must.  
  
9. In the **Maximum size \(MB\)** field, enter the maximum size to which the transaction log file can grow.  
  
     You can either allow the transaction log file to grow without restriction or you must specify a maximum file size. If you do not specify a maximum file size, SQL Server will expand the transaction log file as often as necessary. This expansion is limited only by the available disk space.  
  
## See Also  
 [How to: Alter Databases](How-to--Alter-Databases.md)   
 [Altering Databases - Transaction Log Files Tab](Altering-Databases---Transaction-Log-Files-Tab.md)   
 [How to: Increase the Size of Transaction Log Files](How-to--Increase-the-Size-of-Transaction-Log-Files.md)
