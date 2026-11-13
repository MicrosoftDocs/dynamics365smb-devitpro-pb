---
title: Managing Sessions in the Admin Center
description: View and cancel active sessions in the Business Central admin center. Restart an environment when canceling sessions doesn't resolve a problem.
author: jswymer
ms.topic: how-to
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, sessions
ms.date: 11/13/2026
ms.author: jswymer
ms.reviewer: jswymer
ai-usage: ai-assisted
---

# Manage sessions in the admin center

For each environment in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], you can use the **Manage Sessions** page to view information about active sessions on an environment and cancel selected sessions.

To open the page, select an environment, and then select **Sessions**. Use the **Show session details** checkbox to show more or fewer details. Select **Refresh** to retrieve the latest session information.

## Cancel sessions that block work

Canceling a session is sometimes the only way to unblock a customer. For example, a long-running report is locking data in a table, preventing warehouse employees from working.

To cancel sessions, select them from the list, select **Cancel selected sessions**, and then confirm the cancellation.

## <a name="restart-environment"></a>Restart an environment

In some cases, canceling the sessions does not solve the problem. In those cases, you may want to restart the environment.  

To restart an environment, go to the **Manage sessions** page, select the relevant environment, select **Restart Environment**, and confirm the restart. The restart action is available only when the environment is **Active**.

> [!IMPORTANT]
> Make sure that all users are signed out of all companies in the environment before you restart it.

## Related information

[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Managing Apps](tenant-admin-center-manage-apps.md)  
[Updating Environments](tenant-admin-center-update-management.md)  
[Rename Environments](tenant-admin-center-environments-rename.md)  
[Restoring an Environment](tenant-admin-center-backup-restore.md)  
[Move an Environment to another Microsoft Entra organization](tenant-admin-center-environments-move.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
