---
title: "Open Database"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 54444e73-bd9f-46c8-ae39-9a1d7c20e8a6
caps.latest.revision: 7
manager: edupont
---
# Open Database
Specifies the database that you want to open.  

 To open this window, on the **File** menu, choose **Database**, and then choose **Open**.  

## General Tab  

|Field|Description|  
|-----------|-----------------|  
|**Server Name**|The name of the SQL Server instance. You can choose the up arrow to select the server from the [\Available Microsoft SQL Servers](-$-S_2341-Available-Microsoft-SQL-Servers-$-.md) window, or you can enter the server name manually.|  
|**Database Name**|The name of the database that you want to open. You can choose the up arrow to select the server from the [Available Databases](-$-S_2342-Available-Databases-$-.md) window, or you can enter the database name manually.|  
|**Authentication**|The authentication type that you want to use to connect to the server. You can select **Database Server Authentication** or **Windows Authentication**.|  
|**User ID**|If you have selected **Database Server Authentication** in the **Authentication** field, then you must enter a user ID.|  
|**Password**|If you have selected **Database Server Authentication** in the **Authentication** field, then you must enter a password.|  

## Advanced Tab  

|Field|Description|  
|-----------|-----------------|  
|**Net type**|The network type to use to connect to SQL Server.<br /><br /> You generally do not have to change the network type from the default setting. The Default network type setting enables [!INCLUDE[navnow](../includes/navnow_md.md)] to connect to a server by using the default client network type that is assigned by SQL Server. If you have installed SQL Server Client Utilities, then you can change the network type with the Client Network Utility, which is part of the SQL Server Client Utilities.|  
|**Attach file**|If you want to attach and open a detached database that consists of a single data file, excluding the transaction log file, then you must enter the complete path and file name of the database in the **Attach File** field. This file typically has the .mdf file name extension. You can give this single file database any name by entering it in the **Database Name** field on the **General** tab. If no transaction log file exists with the data file, it is automatically created when you attach the data file. The database file is attached when you open it.|  

## See Also  
 [How to: Open Databases](../How-to--Open-Databases.md)   
 [Configuring Microsoft SQL Server](../Configuring-Microsoft-SQL-Server.md)
