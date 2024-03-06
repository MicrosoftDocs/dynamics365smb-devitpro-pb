---
title: Prepare for major updates with preview environments
description: Learn how to use preview sandboxes to help prepare for the next major update of Business Central online.
author: jswymer
ms.topic: conceptual
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, update
ms.date: 01/08/2024
ms.author: jswymer
---

# Prepare for major updates with preview environments

About one month before a major update, you can try out new functionality in preview environments. Preview environments are [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online sandbox environments that you create on a preview version of the application. When you create the new sandbox environment, choose the preview version marked as (Preview) from the version list. This way, you get a new sandbox environment with a preview version of the application. 

The following figure illustrates the suggested steps for getting a preview of a major update with example dates for the two release waves in any given calendar year.  

![Generic timeline for steps to get a preview of a major update with sample dates for the two release waves each year.](../media/update-rollout-timeline-preview.png)

For more information, see [Major Updates and Minor Updates for Business Central Online](update-rollout-timeline.md). 

## Practice and test

Once you have the preview, start using it:

1. Review the new functionality. Try it out, and begin training employees on the new features that are coming.

2. Validate your extensions.

    Upload and install your extensions into the sandbox environments created on the preview version and run through the functionality. Verify that the customization continues to work and is compatible with the new version.  

    In rare cases, if you discover any changes required for your per-tenant extension to become compatible with the next release, apply the changes to your app, test it again on a sandbox environment running on a preview version. Then, if tests complete successfully, upload the app into your production environment, setting the **Deploy to** field to *Next major version*. This way, the compatible version of your app will be used when you schedule the upgrade of your production environment to the new major update once it becomes available.

3. Test the quality. If you run into issues related to the preview, please provide [feedback](#provide-feedback-on-the-preview).

Finally, as always, if you have ideas for features you would like to see in future releases of [!INCLUDE [prod_short](../developer/includes/prod_short.md)], let us know at [https://aka.ms/bcideas](https://aka.ms/bcideas).

## Provide feedback on the preview

We need your feedback on the preview! Let us know about your experiences with the new version. You can provide feedback on Viva Engage (formerly Yammer) by following these steps:

1. Go to [Public preview 2024 release wave 1](https://www.yammer.com/dynamicsnavdev/#/threads/inGroup?type=in_group&feedId=177710096384) group on Viva Engage.
2. If you haven't joined the group yet, select **Join group**. [Learn more about Business Central partner community on Viva Engage](../join-viva-engage.md).
3. Share your thoughts, ask questions, or seek clarifications on any aspect of the preview release. Just add your comment or question in the **Share something with this group** box and select **Post**. Or feel free to respond to another post.
4. If you encounter any issues or glitches during your testing, please help us by posting them as bugs. Just include the hashtag `#Bug`in your post along with the following information, if you can:

    - **Description of the problem:** Clearly describe the issue you encountered.
    - **Repro steps:** Provide step-by-step instructions on how to reproduce the problem.
    - **Screenshots:** If possible, attach screenshots to help illustrate the issue.

## Guidelines for how to get started

The newly created preview sandbox environment contains demonstration company data. Trying the preview on a copy of your current production data isn't yet supported; nor is testing the upgrade from your current version to the preview. However, you can use the newly created sandbox environment for exploring and learning the new product capabilities. You can also use the preview environment to validate that any per-tenant extensions are still working as expected.

If you run your tests on a preview environment one month before the announced major release of Business Central, it's more likely that the coming updates of your production environments go smoother. This way, you, your customers, and your code are better prepared for the official release.

We expect to update the preview version only if we discover critical issues before the major update is generally available for production environments. Apart from these potential fixes, we don't expect any further changes to the product between the preview and the official release. You can start your testing and learning activities immediately, without waiting for the official release.

> [!NOTE]
> You will be able to test the update on a copy of your production data in a sandbox environment when we release the new update in production in April or October, respectively. When the official release becomes available, you can continue your tests on that version. You will no longer be able to create new preview sandboxes.

> [!IMPORTANT]
> The preview version as well as all sandbox environments that are based on it will be removed 30 days after the official release becomes available. 


## See also

[Major Updates of Business Central Online](update-rollout-timeline.md)  
[Managing Major and Minor Updates of Business Central Online](tenant-admin-center-update-management.md)  
[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Step 4: Getting access to preview bits](../developer/readiness/get-started.md#step-4-getting-access-to-preview-bits)  
