---
title: "How to: Open Databases"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---
# Open a Database
In order to work in the application, you must always open a database and a company, in that order. After you have done this once, or if the choices are on the command line that starts the program, this will happen automatically when you choose a company. Therefore, you will only need to follow this procedure to open a different database than the one currently open.  

1.  In the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)], on the **File** menu, choose **Database**, and then choose **Open**.  

2.  In the **Server Name** field, enter the name of the SQL Server instance. You can choose the up arrow to select the server from a list of available Microsoft SQL Servers, or you can enter the server name manually.  

     To connect to a database on Azure SQL Database, specify the name in the format *SQLDatabaseServerName.database.windows.net*, where *SQLDatabaseServerName* is the name of Azure SQL Database server. You can only connect to a database on Azure SQL Database if the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] is installed on a the same virtual machine in Azure as the [!INCLUDE[server](../developer/includes/server.md)].  

3.  In the **Database Name** field, enter the name of the database. Choose the up arrow to select from the list of databases that are available on the selected server.  

4.  In the **Authentication** field, enter the type of authentication that you require. Choose the drop-down arrow to select **Database Server Authentication** or **Windows Authentication**.  

    -   If you select **Database Server Authentication**, then your authentication is performed by the SQL Server instance that you have selected.  

    -   If you select **Windows Authentication**, then authentication is performed by the Windows domain controller.  

5.  In the **User ID** field, enter your User ID if you have selected **Database Server Authentication**.  

6.  In the **Password** field, enter your password if you have selected **Database Server Authentication**.  

7.  To set the network type to be used when connecting to the server, choose the **Advanced** tab and select the net type from the drop down list box in the **Net Type** field. However, it is not usually necessary to change the network type from the default setting. The **Default** net type setting allows [!INCLUDE[prod_short](../developer/includes/prod_short.md)] to connect to a server using the default client network type assigned by SQL Server. You can change the net type with the Client Network Utility, which is part of the SQL Server Client Utilities, if they have been installed on the client computer.  

8.  If you would like to attach and open a detached database that consists of a single data file, excluding the transaction log file, you must enter the complete path and file name of the database in the **Attach File** field. This file will typically have the .mdf file name extension. You can give this single file database any name by entering it in the **Database Name** field on the **General** tab. If no transaction log file exists alongside the data file, it will be created automatically when you attach the data file. The database file is attached when you open it.  

9. Choose the **OK** button to open the database.  

> [!NOTE]  
>  [!INCLUDE[prod_short](../developer/includes/prod_short.md)] will automatically open the database and company that you were last working on when you reopen the program.  

