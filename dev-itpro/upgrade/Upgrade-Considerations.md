---
title: Upgrade Considerations
description: This article provides tips and considerations to prepare a solution when you are planning to upgrade Microsoft Dynamics 365 Business Central.
ms.custom: na
ms.date: 11/29/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# Important Information and Considerations for Before Upgrading to [!INCLUDE[prodlong](../developer/includes/prodlong.md)]

Depending on which version you are upgrading from, and the degree to which your solution differs from the standard version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)], you may want to prepare your solution for the upgrade. This topic provides important information and tips for things to consider when you prepare to upgrade to [!INCLUDE[prodshort](../developer/includes/prodshort.md)].  

## Codeunit 1 has been deprecated and replaced

Codeunit **1 ApplicationManagement** codeunit has been retired, and new ‘system’ codeunits have been introduced in the 2 billion range.

For information, see [Transitioning from Codeunit 1 to System Codeunits](transition-from-codeunit1.md).

## V1 Extensions have been discontinued

With [!INCLUDE[prodshort](../developer/includes/prodshort.md)], extensions V1 are no longer supported for on-premise installations. As a result, any custom extensions V1 must be converted to extensions V2 in the old environment before before upgrading to [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

For information about how to convert to extensions V2, see [Converting Extensions V1 to Extensions V2](../developer/devenv-upgrade-v1-to-v2-overview.md).

## [!INCLUDE[crm_md](../developer/includes/crm_md.md)] integration

Because of changes in [!INCLUDE[crm_md](../developer/includes/crm_md.md)] and the  integration since pervious releases, if your application is integrating with [!INCLUDE[crm_md](../developer/includes/crm_md.md)], then you must perform a full upgrade instead of just a technical upgrade. 

## Names of variables
  
 [!INCLUDE[prodshort](../developer/includes/prodshort.md)] introduces new methods and statements. If your solution includes variables where the name is now used by a standard AL method or statement such as REGISTERTABLECONNECTION or FOREACH, you must change the variables before you upgrade to [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. Alternatively, you can enclose the variable names in quotation marks. If you do not, and you import an object that has this code in text format, you cannot compile the object. 

## Deprecated or redesigned functionality
  
 If you are upgrading a solution that depends on functionality that is deprecated or changed in the default version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)], you must verify that the upgrade codeunits migrate data correctly. See the See Also section for links to descriptions of deprecated functionality.

## Upgrade codeunits
  
 When you introduce changes to the database schema, [!INCLUDE[prodshort](../developer/includes/prodshort.md)] will check if these changes are destructive or not. If the database check indicates that the change may lead to data deletion, such as if you are dropping a table column so that the contents of that column will be deleted, this is considered a destructive change. You will be prompted to handle the situation using upgrade codeunits. For more information, see [Upgrade Codeunits](Upgrade-Codeunits.md).  

## Company names
  
 If a company name includes a special character, an error may display during the upgrade. In this context, special characters include the following:   
\[ ~ @ \# $ % & \* \( \) . \! % - + / = ? \]  

 If you are going to upgrade a database where one or more company name includes a special character, we recommend that you rename the company before you start the upgrade process. After the upgrade is successfully finished, you can rename the company again.  

## System tables with non-English names
  
 In older versions of [!INCLUDE[navnow](../developer/includes/navnow_md.md)], you could translate the columns in system tables to a language other than English. Starting with version 3.0, we advised heavily against this, and versions later than [!INCLUDE[navsicily](../developer/includes/navsicily_md.md)] require that all columns in all system tables are in English. As a result, if you try to open a database with non-English system tables in [!INCLUDE[navsicily](../developer/includes/navsicily_md.md)] or later, an error displays, saying that one or more columns do not exist.  

 Make sure that all objects where compiled in a development environment with the right .ETX and .STX files. You can verify that you are running in the correct environment with English \(US\) as the base language by opening the **ndo$dbproperty** table in SQL Server Management Studio. In the **Identifiers** column, the word `Object` must be written exactly as shown here.  

## Deprecated fields and fields Marked as obsolete
Sometimes Microsoft will refactor code so that fields are no longer used, or the functionality is moved from the base application to an extension, for example. Typically, the upgrade toolkit will manage the upgrade impact, but for transparency, you can find a list of fields that are deprecated in the current release or marked to be obsolete in a later release. For more information, see [Deprecated Fields, and Fields Marked as Obsolete](deprecated-fields.md).

## See Also  

[Upgrading the Application Code](Upgrading-the-Application-Code.md)   
[Upgrading the Data](Upgrading-the-Data.md)   
[Deprecated Fields, and Fields Marked as Obsolete](deprecated-fields.md)  
