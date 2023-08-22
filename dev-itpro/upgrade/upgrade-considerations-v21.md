---
title: General Information and Considerations When Upgrading to Business Central 2022 Release Wave 2
description: This article provides tips and considerations to prepare a solution when you're planning to upgrade to Business Central 2022 release wave 2.
author: jswymer
ms.custom: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.date: 04/01/2021
ms.author: jswymer
---
# Important Information and Considerations When Upgrading to Business Central 2022 Release Wave 2

This article provides important information and tips for things to consider when you prepare to upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2022 Release Wave 2, version 21. The information that's relevant for you will depend on which version you're upgrading from, and how much your solution differs from the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] base application.

## <a name="online"></a>Migrate from [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online

You can upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online from supported versions of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises, as long as your application customization is handled by extensions. 

The process consists of two parts:

- Convert non-standard functionality and customizations to apps and per-tenant extensions. For more information, see [Deploying a Tenant Customization](../developer/devenv-deploy-tenant-customization.md).
- Run the cloud migration tool as described in [Migrate On-Premises Data to Business Central Online](../administration/migrate-data.md), and then switch to use [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online going forward.

## New and changed application and platform features

There are several new and changed application features available in version 21 for users, administrators, and developers. For an overview of these features, see [What's new and planned for Dynamics 365 Business Central](/dynamics365-release-plan/2022wave2/smb/dynamics365-business-central/planned-features).

To take advantage of all these features, you'll have to perform an application code upgrade, not just a technical (platform) upgrade.  

## Deprecated or redesigned functionality

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] occasionally deprecates features in application and platform. In most cases, features are replaced by more modern and sustainable features. If you're upgrading a solution that depends on the deprecated or changes functionality, you may have to change application code as part of the upgrade process. 

For example, sometimes code has been refactored so that fields are no longer used. Or the functionality is moved from the base application to an extension. Typically, if you have custom extension code that depends on these fields, you'll have to create a new version of the extension to handle the change. 

Learn more about the deprecated features at:
- [Deprecated Features in Application](deprecated-features-w1.md)
- [Deprecated Features in the Platform - Clients, Server, and Database](deprecated-features-platform.md)
- [Deprecated Fields, and Fields Marked as Obsolete](deprecated-fields.md)

## Important deployment-related changes

- The default port for client services port for [!INCLUDE[server](../developer/includes/server.md)] has been changed to 7085 instead of 7046. You can still use 7046, but you'll have to change the port number in the [!INCLUDE[server](../developer/includes/server.md)] instance configuration. For more information, see [Configuring Business Central Server](../administration/configure-server-instance.md).
- Server principle names (SPN) are no longer supported by .NET Core. This change has affected the delegation from the [!INCLUDE[webserver](../developer/includes/webserver.md)] to the [!INCLUDE[server](../developer/includes/server.md)] when they're on different computers.

  The affected scenarios are described in [Deploying Business Central in a Two-Computer Topology](../deployment/deploy-two-computer-environment.md) and [Deploying Business Central in a Three-Computer Topology](../deployment/deploy-three-computer-environment.md).

  For more information about how to set up delegation, see [Configuring Delegation for Business Central Web Server](../deployment/configure-delegation-web-server.md). You can do this task anytime, but after you upgrade, users won't be able to sign in to the web client until you do.

## Permissions and permission sets

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1 (v18) introduced a new model for permissions. In previous versions, permission sets and permissions are defined only as data, which means they're stored in the tables of the application and tenant databases. Permission sets and permissions can now be defined in AL code as objects and packaged in extensions. This new model is the recommended model. To learn more, see [Entitlements and Permissions](../developer/devenv-entitlements-and-permissionsets-overview.md).

- If you've already made the transition to the new permissions model in your current solution, then there's no extra work related to permission sets required for upgrade.
- If you're upgrading solution that hasn't transitioned to the new permissions model, we recommend that you do. However, you can continue using the legacy model. Whichever model you choose, there's permission-related tasks you'll have to complete as part of upgrade. Learn more at [Upgrading Permissions Sets and Permissions](upgrade-permissions.md)

## Report platform

Version 20 introduced a new report rendering model. Previously, report rendering was done by the application. Now, by default, report rendering is done by the platform. In support of this new model, various changes have been made tht affect upgrade from version 19 and earlier. If you're upgrading from version 20, the solution should already include the necessary changes.

Learn more at [Upgrading reports](upgrade-reports.md).



<!--
## Upgrade codeunits
  
When you introduce changes to the database schema, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] will check if these changes are destructive or not. If the database check indicates that the change may lead to data deletion, such as if you are dropping a table column so that the contents of that column will be deleted, this is considered a destructive change. You will be prompted to handle the situation using upgrade codeunits. For more information, see [Upgrade Codeunits](../developer/devenv-upgrading-extensions.md).  

## Company names
  
If a company name includes a special character, an error may display during the upgrade. In this context, special characters include the following:   
\[ ~ @ \# $ % & \* \( \) . \! % - + / = ? \]  

If you are going to upgrade a database where one or more company name includes a special character, we recommend that you rename the company before you start the upgrade process. After the upgrade is successfully finished, you can rename the company again.  -->

## See Also  

[Upgrading the Application Code](Upgrading-the-Application-Code.md)   
[Upgrading the Data](Upgrading-the-Data.md)   
[Deprecated Fields, and Fields Marked as Obsolete](deprecated-fields.md)  
