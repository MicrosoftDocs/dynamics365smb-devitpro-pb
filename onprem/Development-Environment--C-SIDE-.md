---
title: "Development Environment (C/SIDE)"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0c5bad27-00dc-4123-9e28-0ea07f8dfbbb
caps.latest.revision: 20
author: SusanneWindfeldPedersen
---
# Development Environment (C/SIDE)
You use the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] to develop [!INCLUDE[navnow](includes/navnow_md.md)] applications. In earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)], this component was also an end-user client, but this changed in [!INCLUDE[nav7long](includes/nav7long_md.md)].  

 The administrator who installs [!INCLUDE[navnowlong](includes/navnowlong_md.md)] automatically has access to the [!INCLUDE[navnow](includes/navnow_md.md)] database in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]. To grant another user permission to work with a particular [!INCLUDE[navnow](includes/navnow_md.md)] database with [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], grant that user db\_owner role on the database in SQL Server Management Studio. To grant another user permission to create new databases in [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], grant that user the dbcreator and securityadmin Server Roles for the [!INCLUDE[navnow](includes/navnow_md.md)] SQL Server instance in SQL Server Management Studio. For information about how to grant these roles, see [Setting Database Owner and Security Administration Permissions](Setting-Database-Owner-and-Security-Administration-Permissions.md).  

> [!WARNING]  
>  If you install the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] on a 64-bit computer and you do not install any other [!INCLUDE[navnow](includes/navnow_md.md)] components, you may receive the following message:  
>   
>  The program cannot start because MSVCP100.dll is missing.  
>   
>  If you see this error message, download and install the [Microsoft Visual C++ 2010 Redistributable Package \(x86\)](https://go.microsoft.com/fwlink/?LinkId=253073). You can then run the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)].  

## Object Designer  
 When you open the development environment, you can open Object Designer, which gives you access to [!INCLUDE[navnow](includes/navnow_md.md)] objects. You use Object Designer to modify the application or to create new application areas. For more information, see [Object Designer)](uiref/-$-S_2051-Object-Designer-$-.md).  

 If you migrate your solution to a multitenant deployment architecture, [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] can only access the application database. For more information, see [Multitenant Deployment Architecture](Multitenant-Deployment-Architecture.md).  

## Debugging with the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)]  
 If you use the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] for debugging and want to be able to set breakpoints, the following must be true:  

-   You must be a [!INCLUDE[navnow](includes/navnow_md.md)] user. See [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md).  

-   You must have a Login for the [!INCLUDE[navnow](includes/navnow_md.md)] database. You must also assign that Login the db\_owner database role. Use SQL Server Management Studio to create logins and assign roles. See [Setting Database Owner and Security Administration Permissions](Setting-Database-Owner-and-Security-Administration-Permissions.md) for detailed information.  

 There are additional requirements exist if you are using **NavUserPassword** or **AccessControlService** authentication:  

-   Your Login for the [!INCLUDE[navnow](includes/navnow_md.md)] database must match your User Name in [!INCLUDE[navnow](includes/navnow_md.md)].  

-   You must connect to the database using Database Authentication.  

 See [Users and Credential Types](Users-and-Credential-Types.md) for an overview of authentication options for [!INCLUDE[navnow](includes/navnow_md.md)].  

## Other Uses  
 You use the development environment to create and manage [!INCLUDE[navnow](includes/navnow_md.md)] databases and to upload or change [!INCLUDE[navnow](includes/navnow_md.md)] licenses. However, you cannot use the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] to administrate your solution. Instead, you use the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] or the [!INCLUDE[navnow](includes/navnow_md.md)] Windows PowerShell cmdlets.  

## See Also  
[Developing Extensions Using the New Development Environment - Preview](developer/devenv-dev-overview.md)  
 [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md)   
 [Administration in the Development Environment](Administration-in-the-Development-Environment.md)   
 [Setting Database Owner and Security Administration Permissions](Setting-Database-Owner-and-Security-Administration-Permissions.md)   
 [License Types](License-Types.md)   
 [Breakpoints](Breakpoints.md)   
 [Walkthrough: Debugging the Microsoft Dynamics NAV Windows Client](Walkthrough--Debugging-the-Microsoft-Dynamics-NAV-Windows-Client.md)
