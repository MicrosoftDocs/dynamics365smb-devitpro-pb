---
title: "Lifecycle of Apps and Extensions FAQ"
description: "Learn how to submit Marketplace app updates for Business Central, manage compatible versions, test upgrades, and handle critical customer hotfixes."
author: SusanneWindfeldPedersen
ms.topic: faq
ai-usage: ai-assisted
ms.author: solsen
ms.date: 11/27/2026
ms.reviewer: jswymer
---

# Update lifecycle for Marketplace apps FAQ

Find answers about submitting Marketplace app updates for Business Central, making them available to customers, and handling critical fixes.

## I want to submit an updated version of my app. What is the process for that?

Submit an updated app through the same Partner Center offer as the original version:

1. Increase the app's `version` in its `app.json` manifest.
2. Keep the same app `id` across versions.
3. Include and test upgrade code when data changes require it. If no data changes require upgrade logic, you don't need an upgrade codeunit.
4. Upload the app package to your existing Partner Center offer.
5. Update the offer's version field to match the app package.
6. Make any other required changes to the offer.
7. Select **Review and publish**, review the included changes, and select **Publish** to submit.

Technical validation is automated. It checks the releases and countries/regions targeted by the submission, from the manifest-derived minimum release through the current production release. During the 30 days before a major release, submissions must also be compatible with the upcoming release.

Automated checks include compilation and AppSourceCop checks. Microsoft doesn't run your functional tests or manually validate your app's usage scenarios. You're responsible for functional and upgrade testing.

Learn more about [the technical validation process](devenv-checklist-submission-validation-process.md).

## What happens when my updated app passes validation?

After validation and preview creation, you can test the submitted version in supported sandbox environments. Select **Go Live** at **Publisher signoff** to approve publication. Once publishing finishes, the update becomes available to environments running releases for which it passed validation.

Learn more about [Marketplace app previews](devenv-checklist-submission-app-preview.md) and [version compatibility](app-faq-update.md#what-version-of-business-central-is-my-updated-app-compatible-with).

## Does Microsoft now update my app (to this latest updated version) on all tenants that already have a previous version?

Marketplace apps update to the latest compatible version during major environment updates. They also update during minor environment updates when **Apps Update Cadence** is set to **With minor and major updates**. Regardless of cadence, the service installs required compatible app updates when necessary for an environment update.

These updates occur as each environment updates, not simultaneously across all tenants. Learn more about [automatic app updates](../administration/tenant-admin-center-manage-apps.md#update-installed-apps-with-environment-updates).

## How do I update the apps on my tenant for minor releases then?

Administrators can update installed Marketplace apps from the Business Central administration center:

1. Sign in to the Business Central administration center.
2. Select **Environments**, and open the environment.
3. Select **Manage Apps**, and find the available compatible update.
4. Install the update immediately, or select **Schedule update in the next update window**.

This action updates the app without uninstalling it. Learn more about [managing app updates](../administration/tenant-admin-center-manage-apps.md#global-apps).

Alternatively, you can uninstall and reinstall the app:

1. Sign in to the Business Central web client.
2. Go to **Extension Management**.
3. Find the app and uninstall it.
4. Reinstall the app to get the latest available compatible version.

Uninstalling an app also requires uninstalling apps that depend on it. Retain application data if you need it for the reinstall, and plan the operation for a maintenance window.

> [!NOTE]
> For a per-tenant extension with breaking schema changes, use **Force** in **Schema Sync Mode** on **Upload and Deploy Extension**. This option uses `ForceSync`, a destructive synchronization mode that can delete data in removed tables or fields. It isn't a general override for every kind of breaking change. Test the update and its data effects before deployment. Learn more about [uploading a per-tenant extension (PTE)](/dynamics365/business-central/ui-extensions-install-uninstall).

## How often should I submit updates of my app?

For routine updates, bundle bug fixes and features into releases that are at least one month apart. Avoid frequent submissions that contain very few changes. This approach reduces the number of updates that customers need to manage. Plan critical hotfixes separately.

## What if a customer reports a critical bug in my app and needs an immediate hotfix version of my app?

Most submissions are processed within one business day. Automated technical validation often completes within a few minutes. The service expects it to complete within three hours, but large apps can take longer. The minutes-to-hours estimate covers technical validation, not the entire publication process.

For a critical bug, submit the fixed app through Partner Center and create a support ticket. Work with support and the Marketplace validation team on escalation. After validation and preview creation, select **Go Live** at **Publisher signoff**. When publication finishes, administrators can install the compatible update.

Before submission, complete the [technical validation checklist](devenv-checklist-submission.md), including self-validation. Learn more about [handling a critical bug in your app](devenv-app-life-cycle.md#scenario-4-critical-bug-in-your-app).

## Do you have any tips for us when submitting updates of our app?

These checks help you avoid validation failures and customer issues:

- Follow the [technical validation checklist](devenv-checklist-submission.md). Review it before each submission because requirements can change.
- Follow the [technical validation FAQ](devenv-checklist-submission-faq.md) for guidance based on partner questions and support cases.
- Use AppSourceCop to check requirements such as prefixes, suffixes, and `DataClassification`. Learn more about [using the code analysis tool](devenv-using-code-analysis-tool.md).
- Sign your app package with a valid code-signing certificate.
- Verify that your app publishes and installs successfully.
- Aim for 100% coverage of your app's functionality using automated and manual tests. This guidance is about quality, not a numerical coverage threshold for technical validation. Finding issues before publication reduces customer disruption and repeat updates.
- Test upgrades from previous versions with representative customer data. Automated technical validation doesn't replace testing your upgrade logic.
- [!INCLUDE[appsource-appinsights](includes/appsource-appinsights.md)]

> [!NOTE]
> The tips that we provide above are for your benefit to pass validation the first time through each submission. And to emphasize these points, think of the delays that can arise when you don't follow these tips. If you submit, it can take a couple days before we validate the app. Once we validate it, if all is good, it should pass quickly. If we find issues that lead us to fail the validation, we send the app back to you as you have to make fixes. It could then take you days to properly fix. Next time you submit, your app does not go to the front of the queue. It begins at the bottom again which means it could be another couple days before we validate it again. By following our tips above, you can avoid those delays. Spend a bit more time up front finding those issues yourself, leading to a quicker path to our service.

## Related information

[Retaining table data after publishing](devenv-retaining-data-after-publishing.md)  
[Checklist for submitting your app](devenv-checklist-submission.md)  
[Upgrading extensions](devenv-upgrading-extensions.md)  
[Using the code analysis tool](devenv-using-code-analysis-tool.md)  
