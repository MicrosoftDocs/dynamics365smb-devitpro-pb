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

|Step|More info| Done |
|----|-----------|--|
|Convert V1 extensions to V2 extensions.|[See...](converting-a-database.md#convertv1extensions)||
|Backup the database.|[See...](http://go.microsoft.com/fwlink/?LinkID=296465)|
|(Single tenant only) Uninstall all extensions.|[See...](converting-a-database.md#uninstallextensions)||
|Ensure all objects are complied, unlocked, and tables are synchronized.|[See...](converting-a-database.md#compilesync)||
|Upload [!INCLUDE[prodshort_md](../developer/includes/prodshort.md)] license.|[See...](converting-a-database.md#uploadlicense)||
|Clear the **dbo.Server Instance** and  **dbo.Debugger Breakpoint** tables in SQL Server.|[See...](converting-a-database.md#clearsql)||


## Run the technical upgrade

|Step|More info| Done |
|----|-----------|--|
|Install [!INCLUDE[prodshort_md](../developer/includes/prodshort.md)] (Server, SQL Database Components, [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] minimum)].||
|Open and convert the application database using [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)].|[See...](converting-a-database.md#convertdb)||
|Add custom control add-ins to server instance.|[See...](converting-a-database.md#controladdins)||
|Connect [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] to the application database and compile all objects. **Important:** Choose to synchronize schema Later)|[See...](converting-a-database.md#connectserver)||
|Fix errors.|[See...](converting-a-database.md#fixerrors)||
|(single tenant only) Install the V2 extensions previously uninstalled|[See...](converting-a-database.md#installv2extensions)|
|Repair V2 extensions.|[See...](converting-a-database.md#repairextensions)||
|(Multitenant only) Mount the tenant database. |[See...](converting-a-database.md#mounttenant)||
|Synchronize tenant database tables. |[See...](converting-a-database.md#synctenant)||
|Upload customer license. |||


## See Also  
[Upgrading the Application Code](Upgrading-the-Application-Code.md)   
[Upgrading the Data](Upgrading-the-Data.md)   
[Upgrading to Microsoft Dynamics NAV 2017](Upgrading-to-Microsoft-Dynamics-NAV-2017.md)   
[Automating the Upgrade Process using Sample Windows PowerShell Scripts](Automating-the-Upgrade-Process-using-Sample-Windows-PowerShell-Scripts.md)
