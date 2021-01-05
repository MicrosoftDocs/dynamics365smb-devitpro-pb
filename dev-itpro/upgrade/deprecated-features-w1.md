---
title: "Deprecated Features in W1"
description: describes the features that have been moved, removed, or replaced in the W1 version 
author: bholtorf
ms.custom: na
ms.date: 12/22/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: d60655a7-3e9b-4577-a2e3-d12427a656c2
caps.latest.revision: 16
---

# Deprecated Features in W1
This article describes the features that have been moved, removed, or replaced in the W1 version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. This information will change with future releases, and might not include each deprecated feature.

Deprecated features won't be available in future versions of [!INCLUDE[prod_short](../developer/includes/prod_short.md)], which can happen for different kinds of reasons. <!--Should we talk about how long we're obligated to provide support for previous versions? --> For example, a feature may no longer be relevant, or something better may have become available. If you use a feature that is listed, either the feature itself or an extension of it, you should look for or develop an alternative.

The next sections give a brief description of the deprecated features, state what happened to the feature, and explain why. The following table gives a few examples of what we mean by "moved, removed, or replaced."

|State  |Examples  |
|---------|---------|
|Moved     |The capability has been moved from local functionality to W1 because it was no longer specific to one or more country versions. The capability was combined with other related functionality to eliminate redundancy.|
|Removed| The capability will be removed from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] in a coming release.|
|Replaced  |Something better has become available, and will be used instead.|

## Changes in 2021 release wave 2

### Standard APIs, Beta version

The following feature will be **Removed** with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 2.


|Moved, Removed, or Replaced? |	Why?|
|-----------------------------|-----|
|Removed | Beta version of the standard APIs will be removed by 2021 release wave 2. At this point, Beta APIs will not be available in new releases of [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. There are many improvements to v1.0 and v2.0 of the standard APIs. Improvements include more APIs, better performance and improved OData capabilities. It's recommended that integrations move to v2.0 of the standard APIs.|

### Automation APIs, Beta version

The following feature will be **Removed** with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 2.


|Moved, Removed, or Replaced?|	Why?|
|----------------------------|------|
|Removed | Beta version of the Automation APIs will be removed by 2021 release wave 2. At this point, Automation Beta APIs will not be available in new releases of [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. It's recommended that integrations move to v2.0 of the Automation APIs.|


## Changes in 2021 release wave 1

### Expose UI pages as SOAP endpoints (Warning)

In [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1, a warning will be shown if you expose UI pages as SOAP endpoints. The capability of exposing UI pages as SOAP endpoints will be removed in a later release.

|Moved, Removed, or Replaced? |Why?|
|---------|---------|
|Replaced | SOAP has been superseded by OData V4. SOAP endpoints will be deprecated as of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1, but the feature won't be removed in this release. It's recommended that integrations are migrated to OData V4 as soon as possible.|

### OData V3

The following feature will be **Removed** with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1.

|Moved, Removed, or Replaced? |Why?|
|---------|---------|
|Removed | OData V3 has been superseded by OData v4. OData V3 is deprecated, and will be removed as of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1. It's recommended that integrations are migrated to OData v4 as soon as possible.  |

### Basic Auth / Web Service Access Keys for SaaS 
The following feature will be **Removed** with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1.

|Moved, Removed, or Replaced? |Why?|
|---------|---------|
|Removed (for SaaS)| The capability to access web services in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] using Basic Auth will be deprecated for SaaS. OAuth2 will be the only authentication option for SaaS. OAuth flows that are currently supported are **Implicit** and **Auth Token**. Efforts are being made for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2020 release wave 2, to support OAuth flows, that will support Service to Service auth flows. For on-premises, Basic Auth will remain an option for the time being. This change has no impact on how [!INCLUDE[prod_short](../developer/includes/prod_short.md)] connects to external services.|

## Deprecated Features in 2020 release wave 1
The following feature was marked as obsolete:pending in 2020 release wave 1.

### Best Price Calculations
When you have recorded special prices and line discounts for sales and purchases, Business Central ensures that your profit on item trade is always optimal by automatically calculating the best price on sales and purchase documents and on job and item journal lines.

|Moved, Removed, or Replaced?|Why?|
|----|----|
|Replaced|The functionality is replaced with new calculations that you can extend to include additional sources or calculation methods. The current capabilities will be available, and can be used in parallel with the new, until 2021 release wave 1. For more information, see [Extending Best Price Calculations](../developer/devenv-extending-best-price-calculations.md).|

## Deprecated Features in 2019 release wave 2
The following sections describe the features that were deprecated in 2019 release wave 2.

### The Bank Data Conversion Service
You can use the bank data conversion service from AMC to convert bank data from an XML file that you export from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] into a format that your bank can accept.

|Moved, Removed, or Replaced?|Why?|
|----|----|
|Moved|The functionality has been moved to an extension. It now ships as the AMC Banking 365 Fundamentals extension, which can convert bank data to formats that are used by more than 600 banks worldwide. For more information, see [Using the AMC Banking 365 Fundamentals extension](/dynamics365/business-central/ui-extensions-amc-banking).|

### The Windows Client
You can use [!INCLUDE[prod_short](../developer/includes/prod_short.md)] in the Windows client that is installed on your computer.

|Moved, Removed, or Replaced?|Why?|
|----|----|
|Removed| Business Central continues to evolve the modern client experiences where users work with Business Central in the browser, Windows 10 desktop app, or mobile apps on Android and iOS. The legacy Dynamics NAV Windows client is no longer available for deployment. Instead, users can switch to the modern experience in the browser, the Android/iOS mobile apps, or the Windows 10 desktop app (available through the respective stores). |

### Reports 204-207
You can generate external-facing documents, such as sales invoices and order confirmations, that you send to customers as PDF files.

The reports in the 204-207 range are replaced by the following updated reports in the 1304 to 1307 range:

- 204, Sales-Quote -> 1304, Standard Sales-Quote
- 205, Order-Confirmation -> 1305, Standard Sales-Order Conf.
- 206, Sales-Invoice -> 1306, Standard Sales-Invoice
- 207, Credit-Memo -> 1307, Standard Sales-Credit Memo

> [!NOTE]
> The **No. of Copies** field is removed from the new reports because of performance reasons and because selection of the quantity to print works differently on modern printers. To print a report more than once, users can list the same report multiple times on the **Report Selection** page for the document type in question.

|Moved, Removed, or Replaced? |Why?|
|---------|---------|
|Replaced|The reports in the 204-207 range are replaced by the reports in the 1304 to 1307 range. To avoid duplicated features, the reports in the 204-207 range will be removed.|
<!--This is just stubbed in. Need the actual names of the reports and a better description of the information they provided.-->

### User Personalizations and Profile Configurations
You can personalize pages and configure profiles by adding or removing fields, and [!INCLUDE[prod_short](../developer/includes/prod_short.md)] will save your changes.

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
Part of deprecating features is marking the objects that comprise them as "obsolete." Before we deprecate an object, we tag it as "obsolete:pending" to alert our partners of it's deprecation. The object will have the tag for one year before we remove it from [!INCLUDE[prod_short](../developer/includes/prod_short.md)].
<!--should probably mention the other tags too. For example, "after one year we will mark the object as "ObsoleteState:Removed."-->

## Breaking Changes
When we move, remove, or replace an object, breaking changes can result in other apps or extensions that use the object. To help our partners identify and resolve breaking changes, we have created a [Breaking Changes](https://github.com/microsoft/ALAppExtensions/blob/master/BREAKINGCHANGES.md) document that lists known issues and suggestions for what to do about them.

## Features that are available only in the online version
<!--Should we include a section about this?-->
Some features are available only under very specific circumstances, or not at all intended for use in on-premises versions of [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. For a list and descriptions of those features, see [Features not implemented in on-premises deployments](/dynamics365/business-central/dev-itpro/features-not-implemented-on-premises).

## See Also
[AlAppExtensions repository](https://github.com/microsoft/ALAppExtensions)
