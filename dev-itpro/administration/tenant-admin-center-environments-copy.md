---
title: Copy an environment
description: Learn how to create an environment that is a copy of a production or sandbox environment.
author: edupont04
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, copy
ms.date: 11/29/2021
ms.author: edupont
---

# Copy a Production or Sandbox Environment in the Admin Center

[!INCLUDE [2021_releasewave2](../includes/2021_releasewave2.md)]

You can create an environment that is a copy of an existing environment, such as a sandbox that is based on production for troubleshooting, or a production environment that is based on a sandbox, for example. When you create an environment as a copy of another environment, the new environment is created on the same application version as the environment that you are copying. The new environment will contain all per-tenant extensions and AppSource extensions that are installed and published in the original environment that is being copied.

## To copy an environment

1. In the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], select **Environments**, then select the environment that you want to copy.
2. On the **Environment Details** page, choose the **Copy** action.
3. In the **Copy environment** pane, specify the type of environment that you want to create based on the current environment.
4. Specify a name for the new environment.
5. Choose the **Create** action.

When the process starts, you can go to the list of your environments and see the status of the new environment. At first, you'll see the new environment with the state **Preparing**, and then **Active** once the new environment is fully up and running. Further status details of the copy operation can be found on the **Operations** page. The original environment that the new environment is based on remains active.

## Environment copies

[!INCLUDE [admin-env-sandbox-precautions](../developer/includes/admin-env-sandbox-precautions.md)]

## See also

[Managing Production and Sandbox Environments in the Admin Center](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Managing Apps](tenant-admin-center-manage-apps.md)  
[Updating Environments](tenant-admin-center-update-management.md)  
[Managing Sessions](tenant-admin-center-manage-sessions.md)  
[Rename Environments](tenant-admin-center-environments-rename.md)  
[Restoring an Environment](tenant-admin-center-backup-restore.md)  
[Move an Environment to another Azure Active Directory organization](tenant-admin-center-environments-move.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)
[The Business Central Administration Center](tenant-admin-center.md)  
