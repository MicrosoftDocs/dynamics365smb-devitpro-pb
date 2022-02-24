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

#### How to install them

- From the AppSource marketplace, choose **Contact Me**, **Free Trial**, or **Get It Now** and follow the steps.
- From the **Extension Management** page in Business Central, you can navigate to the AppSource embed view, locate the app, and install it. For more information, see [Installing and Uninstalling Extensions in Business Central]().

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


## See Also

[Developing Extensions](devenv-dev-overview.md)  
[Getting Started with AL](devenv-get-started.md)  