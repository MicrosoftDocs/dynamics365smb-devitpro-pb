---
title: Retain permissions during Dynamics SL cloud migration
description: Learn how to keep the permissions assigned to existing online users so they can continue to work as usual during Dynamics SLcloud migration.
author: jswymer 
ms.author: jswymer 
ms.reviewer: jswymer
ms.topic: how-to
ms.date: 12/13/2024
ms.custom: bap-template
---
# Retain permissions during Dynamics SL cloud migration

By default, when you set up cloud migration, the migration engine removes all permission sets from existing online users, except users with the SUPER permission set, and reassigns them to the Intelligent Cloud permission set. This change prevents users, other than SUPER users, from making data modifications.

However, you might want some users to keep their original permissions. For example, they might need to continue working on your data during replication, or you might use service-to-service apps that require specific permissions.

To keep users' permissions during cloud migration, you have the following options:

## Option 1: Use the Cloud Migration Management page in the client

1. Sign in to [Business Central online](https://businesscentral.dynamics.com/).
1. Search for and open the **Cloud Migration Management** page.
1. In the action bar, select **...** (Show the rest) > **More options** > **Actions** > **Enable/Disable Removing Permissions from Users**.

   - If the message **Setting for Keeping user permissions was set to: Yes.** appears, permission sets remain. Select **OK**.
   - If the message **Setting for Keeping user permissions was set to: No.** appears, users' permission sets are removed and replaced by the **Intelligent Cloud** permission set. Select **OK** and repeat this step to change to **Yes**.

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

[Run data migration setup](migration-setup-sl.md)

## Related information

[Dynamics SL migration to Business Central online: End-to-end overview](migrate-sl-overview.md)  
[Compare work in Dynamics SL to Business Central](migrate-dynamics-sl-videos.md)  
[FAQ about migrating to Business Central online from on-premises solutions](faq-migrate-data.md)
