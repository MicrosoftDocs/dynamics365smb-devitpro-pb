---
title: Retain permissions
description: Learn how to keep the permissions assigned to existing online users so they can continue to work as usual during cloud migration.
author: jswymer 
ms.author: jswymer 
ms.reviewer: jswymer 
ms.topic: how-to
ms.date: 02/19/2024
ms.custom: bap-template
---
# Retain permissions during cloud migration

By default, once you set up cloud migration, the migration engine removes all permission sets assigned to existing online users, except users with the SUPER permission set, and reassigns users the Intelligent Cloud permission set. This change is done to prevent users, other than SUPER users, from making any data modifications.

However, you might want some users to keep their original permissions, for various reasons. For example, you want them to continue working on your data while it's being replicated, or you want to use service-to-service apps that require specific permissions.

If you want users to keep their permissions during cloud migration, you have the following options:

## Option 1: Use the Cloud Migration Management page in the client

1. Sign in to [Business Central online](https://businesscentral.dynamics.com/).
1. Search for and open the **Cloud Migration Management** page.
1. In the action bar, select **...** (Show the rest) > **More options** > **Actions** > **Enable/Disable Removing Permissions from Users**.

   - If the message **Setting for Keeping user permissions was set to: Yes.** appears, then permission sets remain. Select **OK**.
   - If the message **Setting for Keeping user permissions was set to: No.** appears, then users' permission sets are removed and replaced by the **Intelligent Cloud** permission set. Select **OK** and repeat this step to change to **Yes**.

## Option 2: Use a custom extension

Create and install a per-tenant extension that includes the following code:

```al
[EventSubscriber(ObjectType::Codeunit, Codeunit::"Hybrid Deployment", 'OnBeforeResetUsersToIntelligentCloudPermissions', '', false, false)] 

local procedure HandleBeforeResetUsersToIntelligentCloudPermissions(var Handled: Boolean) 
begin 
    Handled := true; 
end 
```

## Next steps

[Run data migration setup](migration-setup.md)

## See also

[Migrate Data](migrate-data.md)  
