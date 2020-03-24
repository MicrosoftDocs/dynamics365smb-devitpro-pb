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

Updates are frequently made available for these apps by Microsoft, partners, and ISVs. App updates add new features and fix known problems. To keep your tenant up to date and running smoothly, you should check for and install the latest updates regularly.

To help you manage app updates, the administration center includes the **Manage Apps** page.

## View installed apps and available updates

You may hear about an update directly from a partner or ISV. Otherwise, you can always go to the **Manage Apps** page. To get to this page, select **Environments** > Your S**Sandbox** or **Production** > **Manage Apps**.

The **Manage Apps** lists all the apps installed on the environment, and indicates whether updates are available. If an update is available for an app, there are two indications:

- The **Latest version available** column contains the version number of the updated app.
- The **Available update action** column contains one of the following actions:

    |Actions|Descriptions|
    |-------|------------|
    |**Action required**|This action means that you have to do something before you install the update for the app. For example, you may have to first update another app or install a new app. Select the link and read the **Requirements for App Updates** pane to see what is required.|
    |**Install update**|This action means that the app is ready to install. Select the link to start the installation.|

## Install an app update

It's not good practice to install an app update directly on a production environment. First make sure the update won't disrupt the operational flow or cause problems. So before installing an app update on the production environment, install and test it on a Sandbox environment.

The following steps provide the general flow for upgrading an app.

1. If you don't have a sandbox environment, create one.

    For more information, see [Create a new sandbox environment](tenant-admin-center-environments.md#create-a-sandbox-environment)
2. Open the Sandbox environment, and select **Manage Apps**.
3. On the **Manage Apps**, find the app in the list that you want to update.
4. If **Available update action** column for the app shows the **Install updated** link to install the new version of the app. Go to step 5.
5. If **Available update action** column for the app shows the **Action required** link, select the link.

    - Read the **Requirements for App Updates** pane to see what the requirements are.
    - Return to the **Manage Apps** list and

5. Wait for the app to be installed.

    The new app version is automatically scheduled installation. When a time slot opens up, the app will be published, synchronized, and installed in the background. This process usually takes a few seconds, and users won't be interrupted.

    Select **Refresh** occasionally to check the status.
    - If the app installs successfully, the new version displays in the **Installed version** column and the **Available update action** column is **Up to date**.
    - If the installation failed the 

4. If the app update installs successfully, test it on the Sandbox environment.
5. If the app update works as expected, switch to the production environment, and repeat step 

## See also

[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Updating Environments](tenant-admin-center-update-management.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
