---
title: Business Central Upgrade Planning and Considerations
description: Review application, customization, schema, and data considerations when upgrading a Dynamics NAV solution to Business Central on-premises.
author: jswymer
ms.reviewer: jswymer
ms.topic: upgrade-and-migration-article
ms.date: 11/17/2026
ms.author: jswymer
ai-usage: ai-assisted
---
# Considerations before upgrading Dynamics NAV to Business Central

Depending on which version you are upgrading from, and the degree to which your solution differs from the standard version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)], you may want to prepare your solution for the upgrade. This topic provides important information and tips for things to consider when you prepare to upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)].  

This article focuses on changes introduced in Business Central Spring 2019 (version 14) when upgrading from Dynamics NAV. For version-specific requirements and intermediate releases, learn more in [Supported upgrade paths to Business Central releases](upgrade-paths.md).

<a name="online"></a>

## Migrate from [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online

You can migrate to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online after upgrading your [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] solution to a supported Business Central on-premises version, provided that your application customizations are handled by compatible extensions. Legacy C/AL code can't run online. To retain custom data, prepare the destination tables and table extensions and define any required mappings. Learn more in [Define cloud migration table mappings](../administration/migration-table-mapping.md).

> [!NOTE]
> Upgrading to Business Central Spring 2019 (version 14) alone doesn't make a solution ready for full cloud migration. Check the [supported migration paths](../administration/migrate-data.md#supported-migration-paths) for any further on-premises upgrade requirements. Alternatively, the [Business Central 14 reimplementation tool](../administration/migrate-bc14-reimplementation.md) can migrate selected data directly from version 14.

The process consists of three parts:

- Upgrade from [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] through the required intermediate releases to a Business Central on-premises version supported for full cloud migration. The first stage might use the tools described in [Upgrading to Business Central on-premises (version 14)](upgrading-to-business-central-on-premises.md). Learn more in [Supported upgrade paths to Business Central releases](upgrade-paths.md).
- Convert nonstandard functionality and customizations to apps and per-tenant extensions. Learn more in [Deploy a per-tenant extension](../developer/devenv-deploy-tenant-customization.md).
- Run the cloud migration tool as described in [Migrate on-premises data to Business Central online](../administration/migrate-data.md), and then switch to use [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online going forward.

## Upgrading from [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)]

This section lists specific changes between [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] and [!INCLUDE [prod_short](../developer/includes/prod_short.md)].  

### Codeunit 1 has been deprecated and replaced

[!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] included codeunit 1 `ApplicationManagement`. In [!INCLUDE[prod_short](../developer/includes/prod_short.md)], this codeunit has been retired, and new system codeunits have been introduced in the 2 billion range.

Learn more in [Transitioning from codeunit 1 to system codeunits](transition-from-codeunit1.md).

### V1 extensions have been discontinued

With [!INCLUDE[prod_short](../developer/includes/prod_short.md)], extensions V1 are no longer supported for on-premises installations. As a result, any custom extensions V1 must be converted to extensions V2 in the old environment before upgrading to [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

Learn more in [Converting Extensions V1 to Extensions V2](../developer/devenv-upgrade-v1-to-v2-overview.md).

### MenuSuite not used for page and report search 

With [!INCLUDE[prod_short](../developer/includes/prod_short.md)], the MenuSuite is no longer used to control whether a page or report can be found in the search feature of the web client. Specific properties on the page and report objects determine searchability. As part of the application code upgrade process, you change these properties on existing pages and reports used by the MenuSuite to ensure that they are still searchable from the web client. Learn more in [Making pages and reports searchable after an upgrade](upgrade-pages-report-for-search.md).

<a name="CRM"></a>

## Upgrade [!INCLUDE[crm_md](../developer/includes/crm_md.md)] integration

Because of changes in [!INCLUDE[crm_md](../developer/includes/crm_md.md)] and the integration since previous releases, if your application is integrating with [!INCLUDE[crm_md](../developer/includes/crm_md.md)], then you must perform a full upgrade instead of just a technical upgrade.

## New and changed application features

There are several new and changed application features available in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] April 2019 for users, administrators, and developers. Learn more in [Overview of Dynamics 365 Business Central April '19 release](/business-applications-release-notes/April19/dynamics365-business-central).

To take advantage of all these features, you must perform an application code upgrade, not just a technical platform upgrade.

### Changes to profiles in the [!INCLUDE[demolong_md](../developer/includes/demolong_md.md)] and promoted actions

With the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] April 2019 release, profiles that are part of the [!INCLUDE[demolong_md](../developer/includes/demolong_md.md)], such as the **Sales Order Processor** profile, customize fewer pages compared to earlier releases. For customers that rely on these profiles, their users might experience slight differences in the layout of actions in the action bar on pages. Additionally, the layout of promoted actions on over 380 core application pages has been fine-tuned.

To ensure that users aren't disrupted by these changes, we recommend that administrators and partners who are upgrading a customer to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] April 2019 review the layout of promoted actions when combined with their own code and profile customization.

## Names of variables
  
 [!INCLUDE[prod_short](../developer/includes/prod_short.md)] introduces new methods and statements. If your solution includes variables where the name is now used by a standard AL method or statement such as `REGISTERTABLECONNECTION` or `FOREACH`, you must change the variables before you upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. Alternatively, you can enclose the variable names in quotation marks. If you don't, and you import an object that has this code in text format, you can't compile the object.

## Deprecated or redesigned functionality
  
 If you are upgrading a solution that depends on functionality that is deprecated or changed in the default version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)], you must verify that the upgrade codeunits migrate data correctly. The Related information section includes links to descriptions of deprecated functionality.

## Deprecated fields and fields marked as obsolete

Sometimes Microsoft will refactor code so that fields are no longer used, or the functionality is moved from the base application to an extension, for example. Typically, the upgrade toolkit will manage the upgrade impact, but for transparency, you can find a list of fields that are deprecated in the current release or marked to be obsolete in a later release. Learn more in [Deprecated Fields, and Fields Marked as Obsolete](deprecated-fields.md).

<a name="upgrade-codeunits"></a>

## Handle destructive schema changes
  
 When you introduce changes to the database schema, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] will check if these changes are destructive or not. If the database check indicates that the change may lead to data deletion, such as if you are dropping a table column so that the contents of that column will be deleted, this is considered a destructive change. You will be prompted to handle the situation using upgrade codeunits. <!-- For more information, see [Upgrade Codeunits]Upgrade-Codeunits.md.-->  

<a name="company-names"></a>

## Check company names
  
 If a company name includes a special character, an error may display during the upgrade. In this context, special characters include the following:   
\[ ~ @ \# $ % & \* \( \) . \! % - + / = ? \]  

 If you are going to upgrade a database where one or more company names include a special character, we recommend that you rename the company before you start the upgrade process. After the upgrade is successfully finished, you can rename the company again.

## System tables with non-English names
  
 In older versions of [!INCLUDE[navnow](../developer/includes/navnow_md.md)], you could translate the columns in system tables to a language other than English. Starting with version 3.0, we advised heavily against this, and versions later than [!INCLUDE[navsicily](../developer/includes/navsicily_md.md)] require that all columns in all system tables are in English. As a result, if you try to open a database with non-English system tables in [!INCLUDE[navsicily](../developer/includes/navsicily_md.md)] or later, an error displays, saying that one or more columns do not exist.  

 Make sure that all objects were compiled in a development environment with the right `.ETX` and `.STX` files. You can verify that you are running in the correct environment with English (US) as the base language by opening the `ndo$dbproperty` table in SQL Server Management Studio. In the `Identifiers` column, the word `Object` must be written exactly as shown here.

## Related information  

[Upgrading the Application Code](Upgrading-the-Application-Code.md)   
[Upgrading the Data](Upgrading-the-Data.md)   
[Deprecated Fields, and Fields Marked as Obsolete](deprecated-fields.md)  
