---
title: Complete Dynamics GP Migration to Business Central
description: Learn how to validate Dynamics GP migration results, disable cloud migration, and set up Business Central online users and permissions before going live.
author: jswymer
ms.author: jswymer 
ms.reviewer: jswymer
ms.topic: how-to 
ms.date: 11/17/2026
ms.custom: bap-template 
ai-usage: ai-assisted
---

# Complete Dynamics GP cloud migration to Business Central online

This article explains tasks you do in the final phase of cloud migration&mdash;that is, after completing replication, upgrading the data in the online environment, and testing the result of the cloud migration.

> [!TIP]
> To keep track of which tasks you've done, use the [Post Migration Checklist](https://businesscentral.dynamics.com/?page=4020) page to check off tasks as you go along.

[!INCLUDE [migrate-e2e-process](../developer/includes/migrate-e2e-process-gp.md)]

## Step 0: Validate migrated data

Before completing the migration, verify that data migrated correctly by running migration validation tests. Validation compares replicated GP source data with migrated data in Business Central to identify discrepancies.

You can run validation manually from the **Cloud Migration Management** page by selecting **Validation Status** > **Run All Validation**. Review any validation errors and resolve them before proceeding to disable cloud migration.

Learn more in [Validate Dynamics GP data migration](migrate-gp-validation.md).

## Step 1: Disable the cloud migration

Once you migrate the desired data to [!INCLUDE [prod_short](../includes/prod_short.md)] online, you end the migration by disabling cloud migration from the **Cloud Migration Management** page. This step is important because rerunning migration can overwrite changes made in the online target company. Finish data transformation, posting, historical migration, and validation before disabling cloud migration.

When you disable cloud migration, the integration runtime remains installed. To migrate data again, run cloud migration setup again.

To disable cloud migration, complete the following steps:

1. Go to the **Cloud Migration Management** page and select **Disable Cloud Migration**. You must have the **SUPER** permission set.
1. On the **Cloud Ready Checklist** page, read the information.
1. If you agree, turn on the **I have read and understand the recommended steps** switch.
1. Select **Disable Cloud Migration** > **Yes**.

> [!NOTE]
> The integration runtime remains installed on your on-premises machine. However, if it's not used for cloud migration within a couple of weeks, its cloud registration is automatically cleaned up. If you want to migrate data again, you must go through cloud migration setup again and might need to register the self-hosted integration runtime again.

## Step 2: Set up users and permissions

Dynamics GP user accounts and permissions aren't migrated to Business Central online. To give users access to the new online tenant, each user needs the following:

1. An account in the Microsoft 365 tenant with a Business Central license.

   Learn more in [Add users and assign licenses in Microsoft 365](/microsoft-365/admin/add-users/add-users).

1. An account in Business Central that's associated with their Microsoft 365 account email and assigned the proper permissions to data in Business Central.

   Learn more in [Create users according to licenses](/dynamics365/business-central/ui-how-users-permissions).

   > [!TIP]
   > You can go directly to setting up permission sets from the **Cloud Ready Checklist** page by selecting **Permission Sets**.