---
title: Copy a Business Central Environment
description: Create a copy of a Business Central production or sandbox environment in the admin center for troubleshooting, testing, or production use.
author: jswymer
ms.topic: how-to
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, copy
ms.date: 11/13/2026
ms.author: jswymer
ms.reviewer: jswymer
ai-usage: ai-assisted
---

# Copy a production or sandbox environment in the admin center

You can create an environment that is a copy of an existing environment, such as a sandbox that is based on production for troubleshooting, or a production environment that is based on a sandbox, for example. When you create an environment as a copy of another environment, the new environment is created on the same application version as the environment that you are copying. The new environment will contain all per-tenant extensions and Marketplace extensions that are installed and published in the original environment that is being copied. If the environment is [linked](tenant-admin-center-environments.md#linked-power-platform-environment) to a Power Platform environment, the linked Power Platform environment will not be copied and the newly created [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment will not be linked to any Power Platform environment.

## Copy an existing environment

1. In the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], select **Environments**, then select the environment that you want to copy.
1. On **Environment Details**, select **Copy**.
1. In the **Copy environment** pane, specify a name for the new environment.
1. Specify the type of environment that you want to create based on the current environment.
1. Select **Copy**, and then confirm the operation.

When the process starts, you can go to the list of your environments and see the status of the new environment. At first, you'll see the new environment with the state **Preparing**, and then **Active** once the new environment is fully up and running. Further status details of the copy operation can be found on the **Operations** page. The original environment that the new environment is based on remains active.

> [!NOTE]
> Sandbox environments that have Preview versions of Marketplace apps installed can't be copied to a Production environment. Update installed Preview apps to Public versions or uninstall Preview apps before copying a Sandbox environment to a Production environment.

## <a name="environment-copies"></a>Precautions for environment copies

[!INCLUDE [admin-env-sandbox-precautions](../developer/includes/admin-env-sandbox-precautions.md)]

## Related information

[Managing Production and Sandbox Environments in the Admin Center](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Managing Apps](tenant-admin-center-manage-apps.md)  
[Updating Environments](tenant-admin-center-update-management.md)  
[Managing Sessions](tenant-admin-center-manage-sessions.md)  
[Rename Environments](tenant-admin-center-environments-rename.md)  
[Restoring an Environment](tenant-admin-center-backup-restore.md)  
[Move an Environment to another Microsoft Entra organization](tenant-admin-center-environments-move.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)
[The Business Central Administration Center](tenant-admin-center.md)  
