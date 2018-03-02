---
title: "Upgrade Considerations"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2017"
ms.assetid: ad358d83-9ef5-48e7-9ffb-a0912293705a
caps.latest.revision: 2
---
# Upgrade Considerations

**Applies to:** [!INCLUDE[nav2017](includes/nav2017.md)]. [See [!INCLUDE[nav2018_md](includes/nav2018_md.md)] version](Upgrade-Considerations.md).

Depending on which version you are upgrading from, and the degree to which your solution differs from the standard version of [!INCLUDE[navnow](includes/navnow_md.md)], you may want to prepare your solution for the upgrade. This topic provides tips for things to consider when you prepare to upgrade to [!INCLUDE[navnowlong](includes/navnowlong_md.md)].  

## Names of Variables  
 [!INCLUDE[navnowlong](includes/navnowlong_md.md)] introduces new functions and statements. If your solution includes variables where the name is now used by a standard C/AL function or statement such as REGISTERTABLECONNECTION or FOREACH, you must change the variables before you upgrade to [!INCLUDE[navnowlong](includes/navnowlong_md.md)]. Alternatively, you can enclose the variable names in quotation marks. If you do not, and you import an object that has this code in text format, you cannot compile the object. For more information, see [Changes in C/AL Behavior and Support from Earlier Versions of Microsoft Dynamics NAV](Changes-in-C-AL-Behavior-and-Support-from-Earlier-Versions-of-Microsoft-Dynamics-NAV.md).  

## Deprecated or Redesigned Functionality  
 If you are upgrading a solution that depends on functionality that is deprecated or changed in the default version of [!INCLUDE[navnowlong](includes/navnowlong_md.md)], you must verify that the upgrade codeunits migrate data correctly.

## Upgrade Codeunits  
 When you introduce changes to the database schema in [!INCLUDE[navnowlong](includes/navnowlong_md.md)], [!INCLUDE[navnow](includes/navnow_md.md)] will check if these changes are destructive or not. If the database check indicates that the change may lead to data deletion, such as if you are dropping a table column so that the contents of that column will be deleted, this is considered a destructive change. You will be prompted to handle the situation using upgrade codeunits. For more information, see [Upgrade Codeunits](Upgrade-Codeunits.md).  

## Company Names  
 If a company name includes a special character, an error may display during the upgrade. In this context, special characters include the following:   
\[ ~ @ \# $ % & \* \( \) . \! % - + / = ? \]  

 If you are going to upgrade a database where one or more company name includes a special character, we recommend that you rename the company before you start the upgrade process. After the upgrade is successfully finished, you can rename the company again.  

## System Tables with Non-English Names  
 In the oldest versions of [!INCLUDE[navnow](includes/navnow_md.md)], you could translate the columns in system tables to a language other than English. Starting with version 3.0, we advised heavily against this, and versions later than [!INCLUDE[navsicily](includes/navsicily_md.md)] require that all columns in all system tables are in English. As a result, if you try to open a database with non-English system tables in [!INCLUDE[navsicily](includes/navsicily_md.md)] or later, an error displays, saying that one or more columns do not exist.  

 Make sure that all objects where compiled in a development environment with the right .ETX and .STX files. You can verify that you are running in the correct environment with English \(US\) as the base language by opening the **ndo$dbproperty** table in SQL Server Management Studio. In the **Identifiers** column, the word `Object` must be written exactly as shown here.  

## See Also  
 [Upgrading to Microsoft Dynamics NAV 2017](Upgrading-to-Microsoft-Dynamics-NAV-2017.md)   
 [Upgrading the Application Code](Upgrading-the-Application-Code.md)   
 [Upgrading the Data](Upgrading-the-Data.md)   
 [Changes in C/AL Behavior and Support from Earlier Versions of Microsoft Dynamics NAV](Changes-in-C-AL-Behavior-and-Support-from-Earlier-Versions-of-Microsoft-Dynamics-NAV.md)   
