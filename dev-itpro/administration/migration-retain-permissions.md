---
title: Retain User Permissions During Cloud Migration
description: Learn how to keep the permissions assigned to existing online users so they can continue to work as usual during cloud migration.
author: jswymer 
ms.author: jswymer 
ms.reviewer: jswymer
ms.topic: how-to
ms.date: 11/17/2026
ms.custom: bap-template
ai-usage: ai-assisted
---
# Retain permissions during cloud migration

By default, once you set up cloud migration, Business Central removes system-scope permission set assignments from existing online users, except users with the **SUPER** permission set, and assigns the **INTELLIGENT CLOUD** permission set. The **LOCAL** permission set is retained. This change is done to prevent users, other than **SUPER** users, from making data modifications.

The Business Central 14 migration retains user permissions automatically.

However, you might want some users to keep their original permissions, for various reasons. For example, you want them to continue working on your data while it's being replicated, or you want to use service-to-service apps that require specific permissions.

If you want users to keep their permissions during cloud migration, you have the following options:

## Option 1: Use the Cloud Migration Management page in the client

Before setting up cloud migration, use an account with the **SUPER** permission set to change this setting. Changing the setting doesn't restore permissions that were already removed.

1. Sign in to [Business Central online](https://businesscentral.dynamics.com/).
1. Search for and open the **Cloud Migration Management** page.
1. In the action bar, select **Actions** > **Enable/Disable Removing Permissions from Users**. If **Actions** isn't visible, select **More options** first.

   - If the message **Setting for Keeping user permissions was set to: Yes.** appears, then permission sets remain. Select **OK**.
   - If the message **Setting for Keeping user permissions was set to: No.** appears, then the default permission-reset behavior applies when migration is set up. Select **OK** and repeat this step to change to **Yes**.

## Option 2: Use a custom extension

Before setting up cloud migration, create and install a per-tenant extension that includes the following code:

```al
[EventSubscriber(ObjectType::Codeunit, Codeunit::"Hybrid Deployment", 'OnBeforeResetUsersToIntelligentCloudPermissions', '', false, false)]
local procedure HandleBeforeResetUsersToIntelligentCloudPermissions(var Handled: Boolean)
begin
    Handled := true;
end;
```

## Next steps

[Run data migration setup](migration-setup.md).

## Related information

[Dynamics GP migration to Business Central online: End-to-end overview](migrate-gp-overview.md)  
[Compare work in Dynamics GP to Business Central](migrate-dynamics-gp-videos.md)  
[FAQ about migrating to Business Central online from on-premises solutions](faq-migrate-data.md)  