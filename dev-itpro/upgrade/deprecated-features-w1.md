---
title: "Deprecated Features in W1"
author: bholtorf
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: d60655a7-3e9b-4577-a2e3-d12427a656c2
caps.latest.revision: 16
---

# Deprecated Features in W1
This topic describes the features that have been moved, removed, or replaced in the W1 version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. This information will change with future releases, and might not include each deprecated feature.

Deprecated features will not be available in future versions of [!INCLUDE[prodshort](../developer/includes/prodshort.md)], which can happen for a variety of reasons. <!--Should we talk about how long we're obligated to provide support for previous versions? --> For example, a feature may no longer be relevant, or something better may have become available. If you use a feature that is listed in this topic, either the feature itself or an extension of it, you should look for or develop an alternative. 

The next sections in this topic give a brief description of the deprecated features, state what happened to the feature, and explain why. The following table gives a few examples of what we mean by "moved, removed, or replaced."

|State  |Examples  |
|---------|---------|
|Moved     |The capability has been moved from local functionality to W1 because it was no longer specific to one or more country versions. The capability was combined with other, related functionality, to eliminate redundancy.|
|Removed| The capability will be removed from [!INCLUDE[prodshort](../developer/includes/prodshort.md)] in a coming release.|
|Replaced  |Something better has become available, and will be used instead.|

## Deprecated Features in 2019 release wave 2
The following sections describe the features that were deprecated in 2019 release wave 2.

### The Bank Data Conversion Service
You can use the bank data conversion service from AMC to convert bank data from an XML file that you export from [!INCLUDE[prodshort](../developer/includes/prodshort.md)] into a format that your bank can accept.

|Moved, Removed, or Replaced?|Why?|
|----|----|
|Moved|The functionality has been moved to an extension. It now ships as the AMC Banking 365 Fundamentals extension, which can convert bank data to formats that are used by more than 600 banks worldwide. For more information, see [Using the AMC Banking 365 Fundamentals extension](/dynamics365/business-central/ui-extensions-amc-banking).|

### The Windows Client
You can use [!INCLUDE[prodshort](../developer/includes/prodshort.md)] in the Windows client that is installed on your computer. 

|Moved, Removed, or Replaced?|Why?|
|----|----|
|Removed| Business Central continues to evolve the modern client experiences where users work with Business Central in the browser, Windows 10 desktop app, or mobile apps on Android and iOS. The legacy Dynamics NAV Windows client is no longer available for deployment. Instead, users can switch to the modern experience in the browser, the Android/iOS mobile apps, or the Windows 10 desktop app (available through the respective stores). |

### Reports 204-207
You can generate external-facing documents, such as sales invoices and order confirmations, that you send to customers as PDF files.

|Moved, Removed, or Replaced? |Why?|
|---------|---------|
|Replaced|The reports in the 204-207 range are replaced by the reports in the 1304 to 1307 range. To avoid duplicated features, the reports in the 204-207 range will be removed.|
<!--This is just stubbed in. Need the actual names of the reports and a better description of the information they provided.-->

### User Personalizations and Profile Configurations
You can personalize pages and configure profiles by adding or removing fields, and [!INCLUDE[prodshort](../developer/includes/prodshort.md)] will save your changes. 

|Moved, Removed, or Replaced? |Why?|
|---------|---------|
|Replaced|The shift to AL caused the legacy personalization and profile configuration features to become outdated, so we have introduced new tooling. In this release, existing personalizations and configurations are discarded, and you must use the new tools to recreate them. Your new changes will be kept in future releases.|

### Excel COM Add-In
You can export data to an Excel workbook.

|Moved, Removed, or Replaced? |Why?|
|---------|---------|
|Removed| The Excel COM add-in was installed along with the Windows client. Now that the Windows Client is no longer available, neither is the add-in. To export data to Excel, use the **Edit in Excel** action.|

### Printing Programmatically
You can print documents such as invoices automatically, without prompting the user or without the user choosing to do so.

|Moved, Removed, or Replaced? |Why?|
|---------|---------|
|Removed| This feature was tied to the Windows Client, which is no longer available. |

## Objects that have been marked as obsolete
Part of deprecating features is marking the objects that comprise them as "obsolete." Before we deprecate an object, we tag it as "obsolete:pending" to alert our partners of it's deprecation. The object will have the tag for one year before we remove it from [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. 
<!--should probably mention the other tags too. For example, "after one year we will mark the object as "ObsoleteState:Removed."-->

## Breaking Changes
When we move, remove, or replace an object, breaking changes can result in other apps or extensions that use the object. To help our partners identify and resolve breaking changes, we have created a [Breaking Changes](https://github.com/microsoft/ALAppExtensions/blob/master/BREAKINGCHANGES.md) document that lists known issues and suggestions for what to do about them.

## Features that are available only in the online version 
<!--Should we include a section about this?-->
Some features are available only under very specific circumstances, or not at all intended for use in on-premises versions of [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. For a list and descriptions of those features, see [Features not implemented in on-premises deployments](/dynamics365/business-central/dev-itpro/features-not-implemented-on-premises).

## See Also
[AlAppExtensions repository](https://github.com/microsoft/ALAppExtensions)