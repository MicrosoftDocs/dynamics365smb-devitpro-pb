---
title: Complete Dynamics SL Migration to Business Central
description: Learn how to review Dynamics SL migration results, disable cloud migration, and set up Business Central online users and permissions before going live.
author: lcontreras
ms.author: jswymer 
ms.reviewer: jswymer
ms.topic: how-to 
ms.date: 11/17/2026
ms.custom: bap-template 
ai-usage: ai-assisted
---

# Complete Dynamics SL cloud migration to Business Central online

This article explains tasks to complete in the final phase of cloud migration&mdash;after replicating, upgrading data in the online environment, and testing the migration results.

> [!TIP]
> To track completed tasks, use the [Post Migration Checklist](https://businesscentral.dynamics.com/?page=4020) page.

[!INCLUDE [migrate-e2e-process](../developer/includes/migrate-e2e-process-sl.md)]

## Step 1: Disable the cloud migration

After migrating the desired data to [!INCLUDE [prod_short](../includes/prod_short.md)] online, complete cloud migration from the **Cloud Migration Management** page. Rerunning migration can overwrite changes made in the online target company. Finish data transformation, posting, historical migration, and testing before completing cloud migration.

When you disable cloud migration, the integration runtime remains installed. To migrate data again, run cloud migration setup again.

To disable cloud migration, follow these steps:

1. Open **Cloud Migration Management** and check **SL Cloud Migration Errors**, **Failed Companies**, **Posting Errors**, and **SL Cloud Migration Warnings**. Resolve issues and verify the migrated data before continuing.
1. Select **Complete migration**. You must have the **SUPER** permission set.
1. On the **Cloud Ready Checklist** page, read the information.
1. If you agree, turn on the **I have read and understand the recommended steps** switch.
1. Select **Disable Cloud Migration** > **Yes**.

> [!NOTE]
> The integration runtime remains installed on your on-premises machine. If not used for cloud migration within a couple of weeks, its cloud registration is automatically cleaned up. To migrate data again, you must go through cloud migration setup and might need to register the self-hosted integration runtime again.

## Step 2: Set up users and permissions

Dynamics SL user accounts and permissions aren't migrated to Business Central online. To give users access to the new online tenant, each user needs the following:

1. An account in the Microsoft 365 tenant with a Business Central license.

   Learn more in [Add users and assign licenses in Microsoft 365](/microsoft-365/admin/add-users/add-users).

1. An account in Business Central associated with their Microsoft 365 account email and assigned the proper permissions to data in Business Central.

   Learn more in [Create users according to licenses](/dynamics365/business-central/ui-how-users-permissions).

   > [!TIP]
   > Go directly to setting up permission sets from the **Cloud Ready Checklist** page by selecting **Permission Sets**.