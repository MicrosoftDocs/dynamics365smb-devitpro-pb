---
title: Prepare for Major Updates with Preview Environments
description: Learn how to use preview sandboxes to help prepare for the next major update of Business Central online.
author: jswymer
ms.topic: how-to
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, update
ms.date: 11/26/2025
ms.author: jswymer
ms.reviewer: solsen
---

# Prepare for major updates with preview environments

New functionality can be previewed in preview environments. Preview environments are sandbox environments that you create on or update to a preview version of [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. When you create or update a sandbox environment in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], select the preview version marked as **(Preview)** from the version list.

Learn more about update cycles, including the preview period, in [Major Updates and Minor Updates for Business Central Online](update-rollout-timeline.md).

> [!IMPORTANT]
> Export any data, setup, and customizations in a preview environment that need to be kept before the end of the preview period. This practice ensures that nothing is lost once the preview period ends and preview environments are deleted.

Creating a new preview environment lets you review new functionality in a clean environment without customer data, setup, or customizations. To create a new preview environment, [create a new environment](tenant-admin-center-environments.md#create-a-new-environment), choose sandbox as environment type, choose a version marked with **(Preview)** as version, and select confirm.

Updating an existing sandbox environment to a preview version lets you review new functionality in an environment that might include your data, setup, and customizations, and lets you test the update with extensions installed. To update an existing sandbox to a preview version, [schedule an update](tenant-admin-center-update-management.md#schedule) on a sandbox environment and select a version marked with **(Preview)** as target version. It's only possible to schedule an update to a preview version after the preview period started; preview versions aren't visible in the list of target versions before the preview period starts.

> [!NOTE]
> Notification recipients registered in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] don't receive email notifications regarding availability of a new preview version or execution of an environment update to a preview version (scheduled, succeeded, or failed update). To view details on an environment update to a preview version, use the **Operations** page in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)].

## Public preview

The public preview period runs every March and September, the months before a new major update is due to be released. During the public preview, any tenant can create new sandbox environments on the preview version or update existing sandbox environments to the preview version. The system deletes preview environments 30 days after the preview version becomes generally available (GA). You can't update a preview environment to a different version.

## Early access preview

The early access preview period coincides with the [update period](update-rollout-timeline.md#update-period) for major versions, specifically:

- The early access preview for an upcoming **April** major version starts when the update period for the current **October** major version begins.
- The early access preview for an upcoming **October** major version starts when the update period for the current **April** major version begins.

During the early access preview period, only tenants that use the [Partner Sandbox](environment-types.md#partnersandbox) license can create new sandbox environments on the preview version. The only environment localizations supported for early access preview are DE, GB, and US.

As early access previews coincide with development, environments on the early access preview version are automatically updated to the latest build of the preview version every Sunday. It isn't possible to manage or reschedule this update. Environments that fail to update to the new preview build for any reason are automatically deleted and can't be recovered. Early access preview environments can only be [transferred](tenant-admin-center-environments-move.md) to another tenant if the destination tenant also has the Partner Sandbox license.

> [!NOTE]
> It's also possible to update an existing sandbox to a preview build. Be aware that once this update is done, the sandbox will automatically be updated with every new preview version and if not possible it will be deleted.

As in the public preview period, the system deletes preview environments 30 days after the preview version becomes generally available (GA). You can't update a preview environment to a different version.

## Practice and test

Sandbox environments on preview versions can be used to practice and test.

- Review new functionality. Try it out, and begin training employees on the new features that are coming. Updating a sandbox copy of your production environment enables reviews of new functionality with the data, setup, and customizations of the production environment.
- Validate your extensions.

  - Test whether your extensions can update to the new version of [!INCLUDE [prod_short](../developer/includes/prod_short.md)] by updating a sandbox environment with those extensions installed to the preview version.
  - Upload and install your extensions into the sandbox environments created on the preview version and run through the functionality. Verify that the customization continues to work and is compatible with the new version.
- Test the quality. If you run into issues related to the preview, provide feedback as described in the [next section](#provide-feedback-on-the-preview).

Finally, as always, if you have ideas for features you would like to see in future releases of [!INCLUDE [prod_short](../developer/includes/prod_short.md)], let us know at [https://aka.ms/bcideas](https://aka.ms/bcideas).

## Provide feedback on the preview

We need your feedback on the preview! Let us know about your experiences with the new version. There are two ways to contribute:

1. Give feedback and ask questions in the [Business Central public preview group](https://aka.ms/BCPublicPreviewGroup) on the Viva Engage.

   Use this group to share your thoughts, ask questions, participate in discussions, or seek clarifications on any aspect of the preview release.

   If you haven't joined the group yet, select **Join group** in Viva Engage. After you join, add your comment or question in the **Share something with this group** box and select **Post**. Or feel free to respond to another post.

   Learn more in [About Business Central partner community on Viva Engage](../join-viva-engage.md).

1. Report a bug at [https://aka.ms/bcpreviewbugs](https://aka.ms/bcpreviewbugs).

   If you encounter any issues or glitches during your testing, please help us by filling out and submitting the form.

## Related information

[Major Updates of Business Central Online](update-rollout-timeline.md)  
[Managing Major and Minor Updates of Business Central Online](tenant-admin-center-update-management.md)  
[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
