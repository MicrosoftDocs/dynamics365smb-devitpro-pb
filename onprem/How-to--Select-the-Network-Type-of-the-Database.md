---
title: "How to: Select the Network Type of the Database"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6a412e5f-fbc2-4092-accc-74c51ede17b7
caps.latest.revision: 5
---
# How to: Select the Network Type of the Database
The default setting allows [!INCLUDE[navnow](includes/navnow_md.md)] to connect to a server using the default client network type assigned by SQL Server. Initially, this is the **Named Pipes** protocol. However, if the SQL Server Client Utilities have been installed on the client computer, you can change the setting using the Client Network Utility.  

### To specify the network type  

1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **File** menu, choose **Database**, and then choose **Open**. The **Open Database** window opens.  

2.  Choose the **Advanced** tab.  

3.  In the **Net Type** field, choose the drop-down arrow to select one of the network types:  **Default**, **Named Pipes**, or **TCP/IP Sockets**.  

4.  Choose the **OK** button to save your selection and close the window.  

## See Also  
 [Open Database](uiref/-$-S_2335-Open-Database-$-.md)   
 [Troubleshooting: SQL Server Connection Problems](Troubleshooting--SQL-Server-Connection-Problems.md)
