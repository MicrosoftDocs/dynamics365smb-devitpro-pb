---
title: "How to: Start SQL Browser Service"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5b320128-af66-4045-8978-71b651dd7281
caps.latest.revision: 5
---
# How to: Start SQL Browser Service
When using a named database instance for [!INCLUDE[navnow](includes/navnow_md.md)], and the SQL Server is not on the same computer as [!INCLUDE[nav_server](includes/nav_server_md.md)], then the SQL Server Browser Service must be running on the SQL Server. If it is not, [!INCLUDE[nav_server](includes/nav_server_md.md)] cannot connect to the [!INCLUDE[navnow](includes/navnow_md.md)] database and an error occurs when you try to open a [!INCLUDE[rtc](includes/rtc_md.md)]. A database instanced named **NAVDEMO** is used when you install the [!INCLUDE[demolong](includes/demolong_md.md)] by using [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup.  
  
 You enable and start the SQL Server Browser Service by using the SQL Server Configuration Manager that is installed with Microsoft SQL Server 2008.  
  
### To start SQL Server Browser Service  
  
1.  On the computer running SQL Server, run the SQL Server Configuration Manager.  
  
     On the **Start** menu, in the **Search Programs and Files** box, type **SQL**, and then choose **SQL Server Configuration Manager**.  
  
2.  In SQL Server Configuration Manager, in the navigation pane on the left, choose **SQL Server Services**.  
  
3.  Right-click **SQL Server Browser**, and then choose **Properties**.  
  
4.  On the **Service** tab of the **SQL Server Browser** dialog box, set the **Start mode** to **Automatic**.  
  
5.  Choose **OK** to return to the SQL Server Configuration Manager main page.  
  
6.  Right-click **SQL Server Browser** again, and then choose **Start**.  
  
## See Also  
 [Installation Considerations for Microsoft SQL Server](Installation-Considerations-for-Microsoft-SQL-Server.md)   
 [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)   
 [Troubleshooting: SQL Server Connection Problems](Troubleshooting--SQL-Server-Connection-Problems.md)
