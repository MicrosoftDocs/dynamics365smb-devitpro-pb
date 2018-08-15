---
title: "Technical Upgrade Quick Reference"
ms.custom: na
ms.date: 15/08/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
ms.prod: "dynamics365-business-central"
author: jswymer
---
# Business Central Technical Upgrade Quick Reference 


## Prepare the old application database

|Done|Description| More info |
|----|-----------|--|
||Convert V1 extensions to V2 extensions.|[See...](converting-a-database.md#convertv1extensions)|
||Backup the database.|[See...](http://go.microsoft.com/fwlink/?LinkID=296465)|
||Uninstall all extensions.|[See...](converting-a-database.md#uninstallextensions)|
||Ensure all objects are complied, unlocked, and the tenent is in sync.||
||Upload [!INCLUDE[prodshort_md](../developer/includes/prodshort.md)] license.||
||Clear the **dbo.Server Instance** and  **dbo.Debugger Breakpoint** tables in SQL Server.|[See...](converting-a-database.md#clearsql)|


## Run the technical upgrade

|Done|Description| More info |
|----|-----------|--|
||(Azure SQL Database only) Add your user account to the **dbmanager** database role on the master database.||
||Install [!INCLUDEprodshort_md](../developer/includes/prodshort.md)] (Server, SQL Database Components, [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] minimum).||
||Open and convert the application database using [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md).||
||Connect[!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] to the application database and compile all objects.||
||Fix errors.||
||Repair extensions (multitenant only) .||
|| Mount the tenant database (multitenant only). ||
||Synchronize tenant database tables. ||


## See Also  
[Upgrading the Application Code](Upgrading-the-Application-Code.md)   
[Upgrading the Data](Upgrading-the-Data.md)   
[Upgrading to Microsoft Dynamics NAV 2017](Upgrading-to-Microsoft-Dynamics-NAV-2017.md)   
[Automating the Upgrade Process using Sample Windows PowerShell Scripts](Automating-the-Upgrade-Process-using-Sample-Windows-PowerShell-Scripts.md)
