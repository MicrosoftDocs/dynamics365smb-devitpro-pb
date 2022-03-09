---
title: "Extension Types and Scope"
description: ""
ms.custom: na
ms.author: solsen
ms.date: 02/24/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: SusanneWindfeldPedersen
---

# Extension Types and Scope

This topic provides an overview of the different extension types and their scope. 

An extension can move from one scope to another under certain circumstances. For more information, see [Moving Between Extension Scopes](devenv-extension-moving-scope.md).

## Global apps

The definition of a global app is that it fulfills one or more of the following:

- It is published by Microsoft  
- It is installed from the AppSource marketplace  
- It is provided by embed ISVs if your environment uses a code-customized base application. For more information, see [Publishing a Code-Customized Base Application](devenv-publish-code-customization.md).

Global apps are uniquely defined by their `id` and `version`.

You cannot deploy a Global app with same the `id` and `version`, but different content to multiple environments.

You can choose to install, uninstall or upgrade Global apps, but you do not control when they are published or unpublished because they might be used by other environments in the service. It is not possible to force sync a Global app.

Global apps can only depend on other global apps.

### Environment types

Global apps can exist in Production and in sandbox environments. For more information, see [Production and Sandbox Environments](../administration/environment-types.md).

#### How to install

For AppSource and Microsoft apps:

- From the AppSource marketplace, choose **Contact Me**, **Free Trial**, or **Get It Now** and follow the steps.
- From the **Extension Management** page in [!INCLUDE[prod_short](../includes/prod_short.md)], you can navigate to the AppSource embed view, locate the app, and install it. For more information, see [Installing and Uninstalling Extensions in Business Central](/dynamics365/business-central/ui-extensions-install-uninstall).

> [!NOTE]  
> The AppSource offer listing contains the list of supported countries. You must verify that the app is available for the country/region of your environment. If it isn't available for the country/region of your environment, the installation will fail.

For apps provided by Embed ISVs, installation is handled by the Embed ISV partner.


### Behavior on environment upgrade

Global apps are preserved on upgrade for both Production and sandboxes.

#### AppSource apps

- AppSource apps are never uninstalled unless they are preventing the tenant to upgrade. For more information, see [Maintain AppSource apps and per-tenant extensions](app-maintain.md).
- AppSource apps are updated to the latest version during upgrades to a new [!INCLUDE[prod_short](../includes/prod_short.md)] major version (for instance 19.5 to 20.0), but are preserved during minor version upgrade (for instance 19.0 to 19.1) - unless the app was marked as incompatible by the extension publisher.

#### Microsoft apps

- Microsoft apps are always updated to the latest compatible version for the corresponding major/minor during upgrades to a new [!INCLUDE[prod_short](../includes/prod_short.md)] version.

#### Embed apps

- Embed apps behavior on environment upgrade is controlled by the partner deploying the apps.

## Per-Tenant Extensions (PTEs)

These apps are unique per environment. Per-tenant extensions are uniquely defined by their app `id`, `version`, and the `environment` where they are deployed. 

You can deploy multiple PTEs with the same `id` and `version`, but different content to multiple environments. This might, however, cause you additional overhead when managing these environments.
	
You control when to publish, install, upgrade, uninstall, or unpublish the app because it is specific to your environment. You may also choose to force sync a PTE.
	
PTE can have dependencies on Global apps, on other PTEs, or on DEV extensions.
	
### Environment types
	
PTEs can exist in Production and sandbox environments. For more information, see [Production and Sandbox Environments](../administration/environment-types.md).
	
### How to install

From the **Extension Management** page in [!INCLUDE[prod_short](../includes/prod_short.md)], you must upload the .app file. For more information, see [Installing and Uninstalling Extensions in Business Central](/dynamics365/business-central/ui-extensions-install-uninstall). <!-- publishing a pte is different on-prem -->
	
### Behavior on upgrade

PTEs are never uninstalled from a Production environment, unless they are preventing the environment to upgrade. For more information, see [Maintain AppSource apps and per-tenant extensions](app-maintain.md). PTEs are uninstalled when the sandbox environment is relocated if they dependent on DEV extensions, but the data is not removed. PTEs can be upgraded to a newer version during the environment upgrade if a newer version has been staged from the **Extension Management** page.

## DEV extensions

DEV extensions are used for development purposes. This includes extensions published from Visual Studio Code or created using [Designer](devenv-inclient-designer.md) in [!INCLUDE[prod_short](../includes/prod_short.md)].

You can deploy a DEV extension with the same `id` and `version`, but different content to multiple sandbox environments. You control when to publish, install, upgrade, uninstall, or unpublish the app because it is specific to your environment. You can also force sync the app. For more information, see [JSON Files](devenv-json-files.md#launch-json) and [Retaining table data after publishing](devenv-retaining-data-after-publishing.md).

The `resourceExposurePolicy` applies differently to DEV extensions. For more information, see [Resource Exposure Policy Setting](devenv-security-settings-and-ip-protetion.md).

<!-- allow download property is the only property which is effective from the policy set in the manifest and the rest of properties are set to true 
Apps published as dev extensions ignore the resource exposure policy settings.-->

DEV extensions can have dependencies on Global apps, on per-tenant extensions, or on other DEV extensions.

### Environment types

DEV extensions can only exist in sandbox environments. For more information, see [Production and Sandbox Environments](../administration/environment-types.md).

### How to install

For information on how to install, see the following [Using Designer](devenv-inclient-designer.md) and [Building your first sample extension that uses new objects and extension objects](devenv-extension-example.md).

### Behavior on upgrade

DEV extensions are uninstalled when the sandbox environment is upgraded or relocated wihin our service. However, the data of an app is not removed, so you only have to re-publish and install the app to make it available. Any PTE that depends on a DEV extension is also uninstalled in that case.

## Constraints on extension types

In general, extensions are uniquely defined by their `id`. A specific version of an app is defined by the `id` and `version`, adding Environment for per-tenant extensions.

- It is not possible to deploy a **Global app** and a **PTE** with the same `id`. During the upload of a PTE, we are validating that there is not a Global app app with the same `id`. Currently, the AppSource validation process allows you to upload an app with the same `id` as an existing PTE to AppSource, but this means that it won't be possible to update the PTE anymore.

- It is not possible to deploy an **Global app** and a **DEV** extension with the same `id` and `version`. When deploying the DEV version of a Global app from Visual Studio code to a sandbox environment, for example, for development or troubleshooting, you must make sure that your DEV extension has a different `version` than what is published to AppSource. Similarly, after you are done developing/testing your extension, you should increase the `version` before submitting to AppSource. We also recommend changing the `id` of the app.

- Due to some current limitations in our service, it is not possible to have an **Global app** and a **PTE** or **DEV** extension with the same `name`, `publisher`, and `version`, even if they have a different `id`.

## See Also

[Developing Extensions](devenv-dev-overview.md)  
[Getting Started with AL](devenv-get-started.md)  