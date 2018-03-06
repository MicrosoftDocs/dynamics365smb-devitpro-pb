---
title: "Automating the Upgrade Process using Sample Windows PowerShell Scripts"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2017"
ms.assetid: 91b2dbc0-7d66-49ce-811f-140e18c4412c
caps.latest.revision: 9
---
# Automating the Upgrade Process using Sample Windows PowerShell Scripts

**Applies to:** [!INCLUDE[nav2017](includes/nav2017.md)]. [See [!INCLUDE[nav2018_md](includes/nav2018_md.md)] version](Configuring-Microsoft-Dynamics-NAV-Server.md).

You can use [!INCLUDE[wps_2](includes/wps_2_md.md)] scripts to help you upgrade to the latest version of [!INCLUDE[navnow](includes/navnow_md.md)]. You can use automation to upgrade a single [!INCLUDE[navnow](includes/navnow_md.md)] database as well as multiple [!INCLUDE[navnow](includes/navnow_md.md)] databases that use the same application. [!INCLUDE[navnowlong](includes/navnowlong_md.md)] provides sample scripts that you can adapt for your deployment architecture.  

## Automating the Upgrade Process  
 When you upgrade to [!INCLUDE[navnowlong](includes/navnowlong_md.md)], you must first upgrade the application code, and then you upgrade the data. By using [!INCLUDE[wps_2](includes/wps_2_md.md)], you can automate both parts of the upgrade process. Also, you can use the same scripts to test each step in your upgrade process before you upgrade production databases.  

 Also, if you maintain multiple [!INCLUDE[navnow](includes/navnow_md.md)] databases, for example if you support multiple customers with the same [!INCLUDE[navnow](includes/navnow_md.md)] application, you can reduce the time that you spend upgrading each database by using [!INCLUDE[wps_2](includes/wps_2_md.md)] scripts. In that case, you can upgrade the application locally, and then use scripts to roll out the upgrade of each database with reduced unavailability for each database. You can combine this automated upgrade with a migration to multitenancy if this makes maintenance easier for you.  

### The Sample Scripts for Code Upgrade  
 [!INCLUDE[navnow](includes/navnow_md.md)] includes sample scripts that illustrate how you can use [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets to upgrade your application to the latest version of [!INCLUDE[navnow](includes/navnow_md.md)]. The sample scripts are located in the **ApplicationMergeUtilities** folder under the **WindowsPowerShellScripts** folder on the [!INCLUDE[navnow](includes/navnow_md.md)] product media. The sample scripts illustrate how you can create scripts that you run in the [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)] or the [!INCLUDE[wps_2](includes/wps_2_md.md)] Integrated Scripting Environment \(ISE\).  

 The sample scripts show different ways of merging application objects that can help you find the best approach to upgrade your application code. The **ApplicationMergeUtilities** folder contains four subfolders that can help you start working with the scripts. The demonstration data in the ORIGINAL, MODIFIED, and TARGET folders illustrate the text files that are the input to the cmdlets. The \_\_Run-Application-Merge-Utilities.ps1 script runs the sample scripts based on simplified demonstration data. For more information, see [Merging Application Objects using the Example Scripts](Merging-Application-Objects-using-the-Example-Scripts.md).  

### The Sample Scripts for Data Upgrade  
 [!INCLUDE[navnow](includes/navnow_md.md)] includes sample scripts that illustrate how you can automate the upgrade of data to the latest version of [!INCLUDE[navnow](includes/navnow_md.md)]. The sample scripts are located in the **Upgrade** folder under the **WindowsPowerShellScripts** folder on the [!INCLUDE[navnow](includes/navnow_md.md)] product media. The sample scripts include a HowTo script that illustrates how you can use the [!INCLUDE[navnow](includes/navnow_md.md)] cmdlets and sample scripts.  

 The HowTo-UpgradeNAVDatabase.ps1 script illustrates how you can create a script that upgrades a database from an earlier version of [!INCLUDE[navnow](includes/navnow_md.md)] to a new version through a set of upgrade tasks. You can run the sample script using a partner license or a customer license.  

 The **Upgrade** folder also contains the Set-PartnerSettings.ps1 where you can specify values for the input parameters that the HowTo-UpgradeNAVDatabase.ps1 script requires, such as the database that you want to upgrade. You must also specify the folder where the license is stored. Finally, you must specify the location of the .fob file with the upgraded application objects. Optionally, the upgrade toolkit objects can be part of that .fob file, or they can be stored in a separate .fob file and import them later.  

 The Example.ps1 script reads the upgrade parameters from the Set-PartnerSettings.ps1 script, calls the HowTo script, passing the upgrade parameters, and then shows the detailed information about each upgrade task. To run the sample script for the data upgrade of a [!INCLUDE[navnow](includes/navnow_md.md)] database, you must have a [!INCLUDE[nav7long](includes/nav7long_md.md)], [!INCLUDE[navsicily](includes/navsicily_md.md)], or [!INCLUDE[navcrete](includes/navcrete_md.md)] database that is available on a SQL Server instance and is ready to be upgraded. The Example.ps1 script runs the following main steps:  

1.  Loads the settings from the Set-PartnerSettings.ps1 file, and prepares the [!INCLUDE[wps_2](includes/wps_2_md.md)] session by importing the required modules.  

2.  Saves the current license from the [!INCLUDE[nav7long](includes/nav7long_md.md)], [!INCLUDE[navsicily](includes/navsicily_md.md)], or [!INCLUDE[navcrete](includes/navcrete_md.md)] database.  

3.  Creates a backup of the [!INCLUDE[nav7long](includes/nav7long_md.md)], [!INCLUDE[navsicily](includes/navsicily_md.md)], or [!INCLUDE[navcrete](includes/navcrete_md.md)] database, and then converts the database to [!INCLUDE[navnowlong](includes/navnowlong_md.md)].  

4.  Connects the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Server instance to the converted database, imports the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] license file, and then synchronizes the table schema.  

5.  Imports the application objects and upgrade toolkit objects from the specified .fob file, and then synchronizes the table schema again. This updates the SQL Server database based on the new table schema that is defined by the imported application objects. Data that must be mapped to another table is saved in upgrade tables.  

6.  Calls the Start-NAVDataUpgrade cmdlet to verify the data upgrade preconditions and transfer data from the upgrade tables to the destination tables.  

7.  Deletes all obsolete tables and the upgrade toolkit objects.  

8.  Initializes all companies in the upgraded database. If you specified a RapidStart package in the Set-PartnerSettings.ps1 file, the package is applied to all companies.  

 The sample script is intended to be run in the context of a [!INCLUDE[navnowlong](includes/navnowlong_md.md)] deployment, including the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. The [!INCLUDE[nav_server](includes/nav_server_md.md)] instance cannot be multitenant. When the sample script runs successfully, the result is a [!INCLUDE[navnowlong](includes/navnowlong_md.md)] database that is connected to a [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Server instance, and which uses a [!INCLUDE[navnowlong](includes/navnowlong_md.md)] license. The sample script also returns a list of statistics about the upgrade tasks, including information about whether the task ran or not. If a task failed, it is marked, and the information includes the error message and stack trace to help you identify the problem. You can resolve errors in the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], save changes, and then run the sample script again, using the database backup that you created earlier.  

## See Also  
 [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)   
 [Sample Windows PowerShell Scripts for Microsoft Dynamics NAV](Sample-Windows-PowerShell-Scripts-for-Microsoft-Dynamics-NAV.md)   
 [Merging Application Objects using the Example Scripts](Merging-Application-Objects-using-the-Example-Scripts.md)   
 [Upgrading the Application Code](Upgrading-the-Application-Code.md)   
 [Upgrading to Microsoft Dynamics NAV 2017](Upgrading-to-Microsoft-Dynamics-NAV-2017.md)
