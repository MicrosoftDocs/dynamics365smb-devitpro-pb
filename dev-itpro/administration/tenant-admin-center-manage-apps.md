---
title: Managing Apps | Microsoft Docs
description: Use the Business Central administration center to manage apps used by your tenant environments. 
author: jswymer
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox
ms.date: 12/10/2019
ms.author: jswymer
---

# Managing Apps

An [!INCLUDE[prodshort](../developer/includes/prodshort.md)] environment is built as a collection of apps. These apps include Microsoft apps and third-party apps, for example, apps from AppSource. The apps work together to provide customers with a broad set of features to address their various business, market, and industry needs.

To keep your tenant up-to-date and running smoothly, you'll occasionally have to do some maintenance work. The work falls into a couple categories:

- Installing updates to existing apps

    Occasionally, updates are made available for the apps. App updates can add new features and fix known problems. 
- Installing new apps

    Sometimes completely new apps are made available for fist-time installation.


To help you manage app updates, the administration center includes the **Manage Apps** page.

## Get an overview of apps and available updates

A partner or ISV might notify that there is an updated for an app. Otherwise, you can always go to the **Manage Apps** page to get an overview the apps that are running on the environment. To get to this page, select **Environments** > **Sandbox** > **Manage Apps**.

The **Manage Apps** lists not only all the apps, but indicates whether updates are available.

## Recommended update an app

1. Create a sandbox environment.

    You shouldn't install a new app or an app update directly on a production environment. You want to make sure that the any changes introduced by the version do not disrupt the operational flow or cause problems. So first, try it on a Sandbox environment.
2. 

## See also

[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Updating Environments](tenant-admin-center-update-management.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
