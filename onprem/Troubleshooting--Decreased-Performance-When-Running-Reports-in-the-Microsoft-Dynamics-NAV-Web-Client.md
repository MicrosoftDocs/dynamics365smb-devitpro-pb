---
title: "Troubleshooting: Decreased Performance When Running Reports in the Microsoft Dynamics NAV Web Client"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1949a696-6b97-4fbb-bc49-bc49942a0c52
caps.latest.revision: 2
---
# Troubleshooting: Decreased Performance When Running Reports in the Microsoft Dynamics NAV Web Client
When many users regularly run reports from the [!INCLUDE[nav_web](includes/nav_web_md.md)], the memory consumption by the Internet Information Server will grow slightly over time. If the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] and SQL Server are on the same computer, the report performance may degrade because the SQL Server computer becomes deprived of memory.  
  
## Resolution  
 To resolve this issue, you can do the following:  
  
1.  In SQL Server, increase the minimum server memory option for the server instance that is used by [!INCLUDE[navnow](includes/navnow_md.md)]. You can do this by using SQL Server Management Studio. By default, the minimum server memory is 0 MB. For example, start by increasing the minimum server memory to 512 MB. For more information, see [Server Memory Server Configuration Options](https://go.microsoft.com/fwlink/?LinkID=511489).  
  
2.  In IIS, change the recycle period of the application pool that is used by the [!INCLUDE[nav_web](includes/nav_web_md.md)]s. You can do this by using IIS Manager. Recycling the application pool restarts worker processes in an application pool, which can help recover valuable system memory resources. By default, the application pool is set to recycle every 1740 minutes \(29 hours\). For example, decrease the application pool to recycle once a day \(every 24 hours\) at a time that is outside of peak operating hours. For more information, see [Application Pools](https://go.microsoft.com/fwlink/p/?linkid=210456).  
  
## See Also  
 [Configuring the Microsoft Dynamics NAV Web Server and Client](Configuring-the-Microsoft-Dynamics-NAV-Web-Server-and-Client.md)
