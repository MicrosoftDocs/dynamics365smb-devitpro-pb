---
title: "Update Lifecycle for Tenant Customizations"
description: Learn how to keep per-tenant extensions compatible with Business Central online updates, receive validation notifications, and resolve update failures.
author: jaredha

ms.topic: reference
ms.author: jaredha
ms.date: 11/05/2026
ms.reviewer: jswymer
---

# Update lifecycle for customizations of Business Central online

When you create a *per-tenant extension* for a [!INCLUDE[prod_short](includes/prod_short.md)] online environment, plan how to maintain it as the application changes. Learn more about events that can cause incompatibilities in [The lifecycle of apps and extensions for Business Central](devenv-app-life-cycle.md).

You are responsible for updating your extension and providing upgrade code when schema changes require it. Keep both Marketplace apps and per-tenant extensions compatible with upcoming versions of the base application. Incompatible extensions can cause scheduled environment updates to fail.

This article explains how automated validation and notifications help you maintain update compatibility for per-tenant extensions.

## Automated extension validation

During the preview period for a major release, [!INCLUDE[prod_short](includes/prod_short.md)] automatically tests per-tenant extensions running in production for technical incompatibilities with the upcoming release. This validation helps identify changes in the application and its dependencies that affect your extension.

Technical validation doesn't replace functional and logical testing. Test your extension in a preview sandbox to confirm that business processes still work. Learn more in [Prepare for major updates with preview environments](../administration/preview-environments.md).

If validation detects an incompatible per-tenant extension, an email notification is sent to the recipients configured on the **Notification recipients** page of the [!INCLUDE[prodadmincenter](includes/prodadmincenter.md)]. Learn more in [Managing tenant notifications](../administration/tenant-admin-center-notifications.md).

> [!IMPORTANT]
> Configure at least one notification recipient to receive email notifications. If no notification recipient is configured, no email is sent.

The notification provides details about the incompatible extension and recommended actions. Use these details to identify and fix the compatibility issue.

## Update failure notifications

If a scheduled environment update fails because an extension is incompatible, the configured notification recipients receive failure details and recommended actions.

As with automated validation notifications, use the failure details to update the extension and resolve the incompatibility. Learn more about scheduling and monitoring updates in [Updating environments](../administration/tenant-admin-center-update-management.md).

## Automatic extension removal

Publishers must maintain compatibility with new releases. During the enforced update period, extensions that prevent an update might be uninstalled automatically so that the update can proceed. Data belonging to these extensions isn't deleted. You can recover the data by installing a compatible version after the update succeeds.

An incompatible extension that blocks a critical security update might be uninstalled within 14 days of that update becoming available. Learn more about the update periods and removal policy in [Maintain Marketplace apps and per-tenant extensions](app-maintain.md#when-microsoft-cant-update-apps-or-ptes).

## Related information

[Retaining table data after publishing](devenv-retaining-data-after-publishing.md)  
[Upgrading extensions](devenv-upgrading-extensions.md)  
[Updating environments](../administration/tenant-admin-center-update-management.md)  
