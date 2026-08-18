---
title: Extension types and scope
description: "Extension types for Business Central explained: global apps, per-tenant extensions, and DEV extensions. Learn how scope and environment affect each type."
ms.author: solsen
ms.date: 08/10/2026
ms.topic: concept-article
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---

# Extension types and scope

This article provides an overview of the different extension types and their scope. 

An extension can move from one scope to another under certain circumstances. For more information, see [Moving Between Extension Scopes](devenv-extension-moving-scope.md).

## Global apps

A global app is an app that meets one or more of the following criteria:

- Microsoft publishes it.  
- You install it from the Marketplace.  
- Embed ISVs provide it if your environment uses a code-customized base application. Learn more in [Publishing a code-customized Base Application](devenv-publish-code-customization.md).

Global apps are uniquely defined by their `id` and `version`.

You can't deploy a global app with the same `id` and `version`, but different content to multiple environments.

You can choose to install, uninstall, or upgrade global apps, but you don't control when they're published or unpublished, because other environments in the service might use them. You also can't force sync a global app.

Global apps can only depend on other global apps.

### Environment types

Global apps can exist in production and in sandbox environments. Learn more in [Production and sandbox environments](../administration/environment-types.md).

#### How to install

For Marketplace and Microsoft apps:

- From the Marketplace, choose **Contact Me**, **Free Trial**, or **Get It Now** and follow the steps.
- From the **Extension Management** page in [!INCLUDE[prod_short](../includes/prod_short.md)], you can navigate to the Marketplace embed view, locate the app, and install it. Learn more in [Installing and uninstalling extensions in Business Central](/dynamics365/business-central/ui-extensions-install-uninstall).

> [!NOTE]  
> The Marketplace offer listing contains the list of supported countries and regions. You must verify that the app is available for the country or region of your environment. If the app isn't available for the country or region of your environment, the installation fails.

For apps provided by Embed ISVs, the Embed ISV partner handles the installation.

### Behavior on environment upgrade

Upgrades preserve global apps in both production and sandbox environments.

#### Marketplace apps

- Upgrades never uninstall marketplace apps unless the apps prevent the tenant from upgrading during the [Enforced Update Period](../administration/update-rollout-timeline.md). Learn more in [Maintain Marketplace apps and per-tenant extensions](app-maintain.md).
- Upgrades update marketplace apps to the latest version during upgrades to a new [!INCLUDE[prod_short](../includes/prod_short.md)] major version (for example, 19.5 to 20.0), but preserve them during minor version upgrades (for example, 19.0 to 19.1) - unless the extension publisher marks the app as incompatible through a support request.

#### Microsoft apps

- Upgrades always update Microsoft apps to the latest compatible version for the corresponding major and minor version during upgrades to a new [!INCLUDE[prod_short](../includes/prod_short.md)] version.

#### Embed apps

- The partner deploying the apps controls embed apps behavior on environment upgrade.

## Per-tenant extensions (PTEs)

These apps are unique per environment. Per-tenant extensions are uniquely defined by their app `id`, `version`, and the `environment` where you deploy them. 

- You can deploy multiple PTEs with the same `id` and `version`, but different content to multiple environments. This deployment might, however, cause extra overhead when managing these environments.
- You control when to publish, install, upgrade, uninstall, or unpublish the app because it's specific to your environment. You might also choose to force sync a PTE.
- A PTE can have dependencies on global apps, on other PTEs, or on DEV extensions.

### Environment types

PTEs can exist in Production and sandbox environments. For more information, see [Production and sandbox environments](../administration/environment-types.md).

### How to install

Upload the .app file from the **Manage Apps** page in the [!INCLUDE[prod_short](../includes/prod_short.md)] Admin Center or the **Extension Management** page in the environment. For more information, see [Installing and uninstalling extensions in Business Central](/dynamics365/business-central/ui-extensions-install-uninstall).

[!INCLUDE[admin-install-pte-note](../includes/admin-install-pte-note.md)]

### Behavior on upgrade

The upgrade process never uninstalls PTEs from a production environment, unless they're preventing the environment from upgrading during the [Enforced Update Period](../administration/update-rollout-timeline.md). For more information, see [Maintain Marketplace apps and per-tenant extensions](app-maintain.md). The upgrade process uninstalls PTEs when the sandbox environment is relocated if they depend on DEV extensions, but the upgrade process doesn't remove the data. The upgrade process can update PTEs to a newer version during an environment update if a newer version is staged for the target version of the update.

## DEV extensions

Use DEV extensions for development purposes. This usage includes extensions published from Visual Studio Code or created by using [Designer](devenv-inclient-designer.md) in [!INCLUDE[prod_short](../includes/prod_short.md)].

You can deploy a DEV extension with the same `id` and `version`, but different content, to multiple sandbox environments. You control when to publish, install, upgrade, uninstall, or unpublish the app because it's specific to your environment. You can also force sync the app. Learn more in [Launch JSON file](devenv-json-launch-file.md) and [Retaining table data after publishing](devenv-retaining-data-after-publishing.md).

> [!NOTE]  
> The `resourceExposurePolicy` applies differently to DEV extensions. Learn more in [Resource exposure policy setting](devenv-security-settings-and-ip-protection.md).

<!-- allow download property is the only property which is effective from the policy set in the manifest and the rest of properties are set to true 
Apps published as dev extensions ignore the resource exposure policy settings.-->

DEV extensions can have dependencies on Global apps, on per-tenant extensions, or on other DEV extensions.

### Environment types

DEV extensions can only exist in sandbox environments. For more information, see [Production and sandbox environments](../administration/environment-types.md).

### How to install

For information on how to install, see [Use Designer](devenv-inclient-designer.md) and [Building your first sample extension that uses new objects and extension objects](devenv-extension-example.md).

### Behavior on upgrade

When you upgrade or relocate a sandbox environment within the service, the process uninstalls DEV extensions. However, the upgrade process doesn't remove the data of an app. To make the app available again, you just need to republish and install it. The upgrade process also uninstalls any PTE that depends on a DEV extension.

## Constraints on extension types

In general, the `id` uniquely defines extensions. The `id` and `version` define a specific version of an app. For per-tenant extensions, add `environment` to the definition.

- You can't deploy a **Global app** and a **PTE** with the same `id`. During the upload of a PTE, the system validates that there's no Global app with the same `id`. Currently, the Marketplace validation process doesn't detect all identity conflicts with PTEs. If you upload an app with the same ID as an existing PTE to Marketplace, you can't update the PTE anymore. Learn more in [Technical validation checklist](devenv-checklist-submission.md#technical-validation-checklist).

- You can't deploy a **Global app** and a **DEV** extension with the same `id` and `version`. When you deploy the DEV version of a Global app from Visual Studio Code to a sandbox environment, for example, for development or troubleshooting, make sure your DEV extension has a different `version` than what is published to Marketplace. Similarly, after you're done developing or testing your extension, increase the `version` before submitting to Marketplace. 

## Related information

[Developing extensions](devenv-dev-overview.md)  
[Get started with AL](devenv-get-started.md)  
