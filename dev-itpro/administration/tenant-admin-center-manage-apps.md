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

Updates are frequently made available for these apps by Microsoft, partners, and ISVs. App updates can add new features and fix known problems. To keep your tenant up to date and running smoothly, you should check for and install the latest updates.

To help you manage app updates, the administration center includes the **Manage Apps** page.

## Get an overview of apps and available updates

You may hear about an update directly from a partner or ISV. Otherwise, go to the **Manage Apps** page for overview the app running on the environment and possible updates.

To get to this page, select **Environments** > **Sandbox** or **Production** > **Manage Apps**.

The **Manage Apps** lists all the apps installed on the environment, and indicates whether updates are available. If an update is available for an app, there are two indications:

- The **Latest version available** column contains the version number of the update.
- The **Available update action** column contains one of the following actions:

    |Actions|Descriptions|
    |-------|------------|
    |**Action required**|This action means that you have to do something before you install the update for the app. For example, you may have to first update another app or install a new app. Select the link to see what is required.|
    |**Install update**|This action means that the app is ready to install. Select the link to start the installation.|

## Install an app update

We don't recommend installing app updates directly on a production environment. You want to make sure that changes introduced by the version don't disrupt the operational flow or cause problems. So first, try it on a Sandbox environment.

1. Create a sandbox environment.
2. Select Environment > Sandbox > Go the 
2. Find the app in the list that you want to update.
3. In the **Available update action** column for the app, select one of the following actions:

    - Select **Install update** to install the update.
    - Select **Action required** to see what needs to be done before you can install the update. Look at the **Requirements for App Updates** pane, and install the requirements.

4. Wait for the app to be installed.

    The new app version is scheduled installation. When a time slot opens up, the app will be published, synchronized, and installed automatically in background. This process usually takes a few seconds. Users won't be interrupted.

    Select **Refresh** occasionally to check the status. If the app installs successfully, the new version displays in the **Installed version** column and the **Available update action** column is **Up to date**.

4. If the app update installs successfully, test it on the Sandbox environment.
5. If the app update works as expected, switch to the production environment, and repeat step 3.  

## See also

[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Updating Environments](tenant-admin-center-update-management.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
