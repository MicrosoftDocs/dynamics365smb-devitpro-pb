---
title: "How to: Increase the Size of Transaction Log Files"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 97330892-fc4a-4413-91da-c22f5f19903e
caps.latest.revision: 6
---
# How to: Increase the Size of Transaction Log Files
You can expand your transaction log by increasing the size of one or more of its constituent files.  
  
> [!NOTE]  
>  You must always make a backup of the database before you expand it. For more information, see [Create a Full Database Backup \(SQL Server\)](https://go.microsoft.com/fwlink/?LinkID=296465).  
  
### To increase the size of a transaction log file  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **File** menu, choose **Database**, and then choose **Alter**. The **Alter Database** window opens.  
  
2.  Choose the **Transaction Log Files** tab.  
  
3.  Select the transaction log file that you want to expand.  
  
4.  In the **Size \(MB\)** field, enter the new size.  
  
    > [!NOTE]  
    >  If the **Unrestricted Growth** option is not selected and the transaction log has grown to its maximum size, then you can either select the **Unrestricted Growth** option or increase the maximum size of one of the transaction log files.  
  
5.  \(optional\) To increase the maximum size of a data file, in the **Maximum Size \(MB\)** field, enter the new maximum size.  
  
## See Also  
 [Altering Databases - Transaction Log Files Tab](Altering-Databases---Transaction-Log-Files-Tab.md)   
 [How to: Add New Transaction Log Files](How-to--Add-New-Transaction-Log-Files.md)
