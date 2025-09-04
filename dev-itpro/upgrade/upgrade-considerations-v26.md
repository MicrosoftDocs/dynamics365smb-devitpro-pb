---
title: Important information and considerations when upgrading to Business Central
description: This article provides tips and considerations to prepare a solution when you're planning to upgrade to Business Central 2025 release wave 1 and later.
author: jswymer
ms.custom: bap-template
ms.topic: article
ms.date: 04/09/2025
ms.author: jswymer
ms.reviewer: jswymer
---
# Important information and considerations when upgrading to Business Central version 26 and later

This article provides important information and tips for things to consider when you prepare to upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2025 release 1 (version 26). The information that's relevant for you depends on which version you're upgrading from, and how much your solution differs from the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] base application.

## Deprecated or redesigned functionality

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] occasionally deprecates features in application and platform. In most cases, features are replaced by more modern and sustainable features. If you're upgrading a solution that depends on the deprecated or changes functionality, you might have to change application code as part of the upgrade process. 

For example, sometimes code is refactored so that fields are no longer used. Or the functionality is moved from the base application to an extension. Typically, if you have custom extension code that depends on these fields, you have to create a new version of the extension to handle the change.

Learn more about the deprecated features in:

- [Deprecated Features in Application](deprecated-features-w1.md)
- [Deprecated Features in the Platform - Clients, Server, and Database](deprecated-features-platform.md)
- [Obsoleted elements in system application 26.0](/dynamics365/business-central/application/system-application/obsoletion/obsolete_by_26.0)
- [Obsoleted elements in base application 26.0](/dynamics365/business-central/application/base-application/obsoletion/obsolete_by_26.0)
- [Obsoleted elements in base application 27.0](/dynamics365/business-central/application/base-application/obsoletion/obsolete_by_26.0)

## Deleted objects

> APPLIES TO: Upgrade from v25.0 only

Many tables and fields are deleted from the base application and other Microsoft extensions in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. These objects were in the **Obsolete::Removed** state for more than one major release. For a complete list of the deleted objects, consult [Deleted objects in 2025 release wave 1](deleted-objects-25w1.md).  

This change aligns with the cleanup cycle that occurs every fifth release. Learn more in the blog post [Essential cleanup guide for partners: 2025 release wave 1](https://www.microsoft.com/en-us/dynamics-365/blog/it-professional/2025/02/06/essential-clean-up-guide-for-partners-2025-release-wave-1/).

### Effect on upgrade

Complete these tasks before upgrading to version 26:  

1. Refactor custom code in non-Microsoft extensions, including upgrade code, to replace or remove references to these objects.  
2. Upgrade versions 24 or earlier to 25 before upgrading to version 26.0.  

 
<!--
We have updated the rules of the schema sync engine to support deleting tables & fields that have previously been synchronized with Obsolete State = Removed.
Because we rely on the Obsolete State of the previously synchronized extension version, you need to upgrade through a version where the table was marked as Obsolete Removed, as we cannot validate this if you go directly from no obsolete state delete table. This capability allows for deleting fields and tables while still having some form of validating that you are not deleting important data. --> 

## Schema changes in subscription billing extension

> APPLIES TO: Upgrade from v25.0 only

Version 25.0 introduced the **Subscription & Recurring Billing** extension. In version 26 and later, the extension is renamed to **Subscription Billing**. Several tables and fields in the extension are renamed, causing breaking changes when upgrading the extension from version 25.0 to 26.0 or later.

To upgrade the extension, you must synchronize the extension's database schema with the tenant database schema using a force sync operation. Force sync can cause data loss if custom code depends on the renamed tables and fields in the extension. To avoid data loss, refactor the custom code to match the extension's latest database schema before upgrading. For a list of renamed tables and fields, see [Renamed tables and fields](known-issues.md#renamed-tables-and-fields-in-subscription-billing-extension-cause-synch-errors-on-upgrade).

## Important deployment-related changes in version 23.0

This section includes important deployment changes that are helpful to know when from coming from a version 22 and earlier deployment. These changes were introduced in version 23.0. These changes don't affect the upgrade process, just the deployment.

- The default port for client services port for [!INCLUDE[server](../developer/includes/server.md)] changed to 7085 instead of 7046. You can still use 7046, but you have to change the port number in the [!INCLUDE[server](../developer/includes/server.md)] instance configuration. Learn more in [Configuring Business Central Server](../administration/configure-server-instance.md).
- NET Core no longer supports Server principle names (SPN). This change affects the delegation from the [!INCLUDE[webserver](../developer/includes/webserver.md)] to the [!INCLUDE[server](../developer/includes/server.md)] when they're on different computers.

  The affected scenarios are described in [Deploying Business Central in a Two-Computer Topology](../deployment/deploy-two-computer-environment.md) and [Deploying Business Central in a Three-Computer Topology](../deployment/deploy-three-computer-environment.md).

  Learn more about setting up delegation in [Configuring Delegation for Business Central Web Server](../deployment/configure-delegation-web-server.md). You can do this task anytime, but after upgrade, users won't be able to sign in to the web client until you do.

## Related information  

[Upgrading the Application Code](Upgrading-the-Application-Code.md)  
[Upgrading the Data](Upgrading-the-Data.md)  
[Deprecated Fields, and Fields Marked as Obsolete](deprecated-fields.md)  
