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

An extension can move from one scope to another under certain circumstances. For more information, see [Moving Between Extension Scopes](devenv-extensions-moving-scope.md).

## Global apps

The definition of a global app is that it fulfills one or more of the following:

- It is published by Microsoft  
- It is installed from the AppSource marketplace  
- It is provided by embed ISVs if your environment uses a code-customized base application. For more information, see [Publishing a Code-Customized Base Application](devenv-publish-code-customization.md).

AppSource apps are uniquely defined by their App ID / Version.

You cannot deploy a Global app with same the App ID and version but different content to multiple environments. 

You can choose to install, uninstall or upgrade AppSource apps, but you do not control when they are published or unpublished because they might be used by other environments in the service. It is not possible to force sync a Global app.

Global apps can only depend on other global apps.

### Environment types

Global apps can exist in PROD and in sandbox environments.

#### How to install

- From the AppSource marketplace, choose **Contact Me**, **Free Trial**, or **Get It Now** and follow the steps.
- From the **Extension Management** page in Business Central, you can navigate to the AppSource embed view, locate the app, and install it. For more information, see [Installing and Uninstalling Extensions in Business Central](/dynamics365/business-central/ui-extensions-install-uninstall).

> [!NOTE]  
> You must check that the app is available for the country/region of your environment.

### Behavior on environment upgrade

Global apps are preserved on upgrade for both PROD and sandboxes.

#### AppSource apps

- AppSource apps are never uninstalled unless they are preventing the tenant to upgrade. For more information, see [Maintain AppSource apps and per-tenant extensions](app-maintain.md).
- AppSource apps are updated to the latest version during upgrades to a new Business Central major version (for instance 19.5 to 20.0), but are preserved during minor version upgrade (for instance 19.0 to 19.1) - unless the app was marked as incompatible by the extension publisher.

#### Microsoft apps

- Microsoft apps are always updated to the latest compatible version during upgrades to a new Business Central version.

#### Embed apps

- Embed apps behavior is controlled by the partner deploying the apps.

## Per-Tenant Extensions (PTEs)
	
These apps are unique per environment. Per-tenant extensions are uniquely defined by their App ID, version, and environment. 

<!-- kberes: Maybe we should define the term Environment that we all mean the same. -->

You can deploy multiple PTEs with the same App ID and version, but different content to multiple environments. This might, however, cause you additional overhead when managing these environments.
	
You control when to publish, install, upgrade, uninstall, or unpublish the app because it is specific to your environment. You may also choose to force sync a PTE.
	
PTE can have dependencies on Global apps, on other PTEs, or on DEV extensions.
	
### Environment types
	
PTEs can exist in PROD and sandbox environments.
	
### How to install

From the **Extension Management** page in Business Central, you must upload the .app file. For more information, see [Installing and Uninstalling Extensions in Business Central](/dynamics365/business-central/ui-extensions-install-uninstall). <!-- publishing a pte is different on-prem -->
	
### Behavior on upgrade

PTEs are never uninstalled from a PROD environment, unless they are preventing the environment to upgrade. For more information, see [Maintain AppSource apps and per-tenant extensions](app-maintain.md). PTEs are uninstalled when the sandbox environment is relocated if they dependent on DEV extensions, but the data is not removed. And they can be upgraded to a newer version if a newer version has been staged on upgrade from the **Extension Management** page.

## DEV extensions

This includes extensions published from Visual Studio Code or created using Designer in Business Central.

You can deploy a DEV extension with the same App ID and version, but different content to multiple sandbox environments. You control when to publish, install, upgrade, uninstall, or unpublish the app because it is specific to your environment. You can also force sync the app.

DEV extensions can have dependencies on Global apps, on per-tenant extensions, or on other DEV extensions.

### Environment types

They can only exist in sandbox environments.

### How to install

For information on how to install, see the following [Using Designer](devenv-inclient-designer.md) and [Building your first sample extension that uses new objects and extension objects](devenv-extension-example.md).

### Behavior on upgrade

DEV extensions are uninstalled when the sandbox environment is relocated, but the data is not removed. Any PTE that depends on a DEV extension is also uninstalled in that case.

The `resourceExposurePolicy` applies differently to DEV extensions. For more information, see [Resource Exposure Policy Setting](devenv-security-settings-and-ip-protetion.md).

<!-- allow download property is the only property which is effective from the policy set in the manifest and the rest of properties are set to true 
Apps published as dev extensions ignore the resource exposure policy settings.-->

## See Also

[Developing Extensions](devenv-dev-overview.md)  
[Getting Started with AL](devenv-get-started.md)  