---
title: Add New Database Files
description: Expand a database in Dynamics NAV by creating a new database file  in the database, and it must be backed-up before proceeding to expand the database.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c63a68cb-3855-4ab9-9a35-99f02715a7de
caps.latest.revision: 8
---
# How to Add New Database Files in Dynamics NAV
You can expand a database by creating a new database file in the database.  
  
> [!NOTE]  
>  You must always make a backup of the database before you expand it. For more information, see [Create a Full Database Backup \(SQL Server\)](https://go.microsoft.com/fwlink/?LinkID=296465).  
  
### To add a new database file  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **File** menu, choose **Database**, and then choose **Alter**. The **Alter Database** window opens.  
  
2.  Choose the **Database Files** tab.  
  
3.  Select the first empty line in the window.  
  
4.  In the **Logical Name** field, enter a logical name for each database file.  
  
5.  In the **File Name** field, enter the full path and name of the database file.  
  
    > [!NOTE]  
    >  We recommend that primary database files have the file name extension .mdf and that secondary database files have the file name extension .ndf. The first data file that is listed is the primary file.  
  
6.  In the **Size \(MB\)** field, enter the initial size in megabytes of the database file.  
  
7.  In the **File Growth** field, enter the amount by which the database file will increase every time that it expands. This can be expressed in kilobytes \(KB\), megabytes \(MB\) or as a percentage \(%\).The default value is MB.  
  
     However, if you enter the value in megabytes, SQL Server will convert it to kilobytes. If you enter the value as a percentage, SQL Server will display it as a percentage.  
  
8.  Select the **Unrestricted Growth** check box if you want SQL Server to expand the database file when it must.  
  
9. In the **Maximum size \(MB\)** field, enter the maximum size to which the database file can grow.  
  
     You can either allow the database file to grow without restriction or you must specify a maximum file size. If you do not specify a maximum size, SQL Server will expand the database file as often as necessary. This expansion is limited only by the available disk space.  
  
## See Also  
 [How to: Increase the Size of Database Files](How-to--Increase-the-Size-of-Database-Files.md)
