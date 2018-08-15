---
title: "Technical Upgrade Quick Reference"
ms.custom: na
ms.date: 10/07/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
ms.prod: "dynamics365-business-central"
author: jswymer
---
# [!INCLUDEprodshort_md](../developer/includes/prodshort.md)] Technical Upgrade Quick Reference 


## Prepare the old application database

|Step|Description|  |
|----|-----------|--|
|1|Convert V1 extensions to V2 extensions||
|2|Backup the database||
|3|Uninstall all extensions||
|4|Ensure all objects are complied, unlocked, and the tenent is in sync.||
|5|Upload [!INCLUDEprodshort_md](../developer/includes/prodshort.md)] license||
|6|Clear the **dbo.Server Instance** and  **dbo.Debugger Breakpoint** tables in SQL Server||


## Run the technical upgrade

|Step|Description|  |
|----|-----------|--|
|1|(Azure SQL Database only) Add your user account to the **dbmanager** database role on the master database.||
|2|Install [!INCLUDEprodshort_md](../developer/includes/prodshort.md)] (Server, SQL Database Components, [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] minimum)||
|3|Open and convert the application database using [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)||
|4|Connect[!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] to the application database and compile all objects.||
|5|Fix errors||
|6|(Multitenant only) Repair extensions||
|7|(Multitenant only) Mount the tenant database ||
|7|Synchronize tenant database (tables) ||


## See Also  
[Upgrading the Application Code](Upgrading-the-Application-Code.md)   
[Upgrading the Data](Upgrading-the-Data.md)   
[Upgrading to Microsoft Dynamics NAV 2017](Upgrading-to-Microsoft-Dynamics-NAV-2017.md)   
[Automating the Upgrade Process using Sample Windows PowerShell Scripts](Automating-the-Upgrade-Process-using-Sample-Windows-PowerShell-Scripts.md)
