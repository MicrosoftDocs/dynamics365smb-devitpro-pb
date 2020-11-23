---
title: "Lifecycle of apps and extensions FAQ"
description: "Overview of the frequently asked questions about updating an app on AppSource."
author: SusanneWindfeldPedersen

ms.custom: na
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
ms.date: 10/01/2020
---

# Update Lifecycle for AppSource Apps FAQ
Please see the following sections for frequently asked questions regarding updating apps on AppSource.

## I want to submit an updated version of my app. What is the process for that?
For any updated version of your app (small or large changes), you follow the same submission as your original version. It must go through the same validation process. The following are the steps that you must follow:
- Increase the version number of your app within it’s json/manifest file.
- Do not change the app’s AppID within it’s json/manifest file. That needs to remain the same for life of the app
- Include an upgrade codeunit and ensure that it works. 
- Upload the app file to your existing Partner Center offer.
- In Partner Center, edit the version field to match what is now in your updated app file.
- Make any other edits in Partner Center as needed.
- Submit for validation.
- Validation takes place as normal (against current production version of Business Central at time of submission):
    - Code review is needed for avoiding violations and ensuring requirements are met.
    - Test validation is scaled back for updated versions.

## What happens when my updated app passes validation?
The app is checked into our service and becomes the active version for that current production release of Business Central. If a tenant is already upgraded to the current release, they can install this updated version of your app.

## Does Microsoft now update my app (to this latest updated version) on all tenants that already have a previous version?
Microsoft will only force update apps during the 2 major releases (release wave 1 and 2). For these releases, each tenant will have their AppSource apps force updated to the latest available versions in our service.

## How do I update the apps on my tenant for minor releases then?
If a tenant wants to update the apps on their tenant during the minor releases, the tenant admin needs to handle this. Here are the steps you follow to update your apps:
- Login to your Business Central Web client instance.
- Navigate to the **Extension Management** page.
- Find the app and uninstall it.
- Reinstall the app.

That gives you the latest available version in our service.

## How often should I submit updates of my app?
Our recommendation is to pack more bug fixes and features into less frequent updates. Try to avoid frequent submissions containing very few changes. Being on a more frequent cadence than Business Central (monthly) is not advised. This leads to lower churn to production tenants.

## What if a customer reports a critical bug in my app and needs an immediate hotfix version of my app?
We do have a fast track validation process for situations like this. These types of situations become top priority in our queue. A very quick validation takes place with the goal of having the hotfix in our service that same day. The following is the hotfix process:
- Fully test the hotfix version of your app to ensure it fixes the problem and to make sure no other issues are introduced.
- Submit the app via Partner Center per the normal process.
- Email [rweigel@microsoft.com](mailto:rweigel@microsoft.com) to notify him of the hotfix situation.
- Provide justification as to why this is critical. Some definitions of critical being:
    - App is causing the tenant to be unresponsive or unusable with no workaround
    - App is serving a critical business process and that process cannot be executed without a fix
- If justification proves to be critical, hotfix process can proceed.
- Quick Validation takes place ASAP and app is uploaded to our service.
- Tenants can now install this version of your app.

> [!NOTE]  
> Please ensure that you are only using this process for critical situations. Do not try to use it for minor bug fixes.

## Do you have any tips for us when submitting updates of our app?
Yes, we have some valuable tips we would like to share. These are tips that can save you time in the validation process. They will help lead to fewer (and possibly zero) failures during validation. Most importantly; they will lead to fewer issues being found in production by customers.

- Follow the checklist, for more information see [Technical Validation Checklist](devenv-checklist-submission.md). The checklist is ever evolving and requirements might change or be added. You might miss something from the checklist, leading to validation failure and delaying the passing of your updated app.
- Use AppSourceCop, for more information see [Using the Code Analysis Tool](devenv-using-code-analysis-tool.md). This helps to catch any missing prefix/suffix and DataClassification. Too often we see these fail the updated versions of apps.
- Sign your app. This fails many app validations. We try to publish the app during validation and it is not properly code-signed leading to failure to publish.
- Publish and install your app. This is another big validation failure we see too often.
- Test your app’s functionality with 100% coverage. You are the expert on the app and know it best. If you are only testing a small percentage of your app, customers will most likely find issues resulting in you having to update your app more often. And if customers are the ones finding your app issues, they may decide to uninstall it. You should have a vested interest in providing a quality app.
- Test the upgrade of your app. upgrade from the previous version to this latest. Your updated app will not pass validation until the upgrade works. If it fails in our validation, we will return it to you, leading to a delay in it going to our service.

> [!NOTE]  
> The tips that we provide above are for your benefit to pass validation the first time through each submission. And to emphasize these points, think of the delays that can arise when you do not follow these tips. If you submit, it can take a couple days before we validate the app. Once we validate it, if all is good, it should pass quickly. If we find issues that lead us to fail the validation, we send the app back to you as you have to make fixes. It could then take you days to properly fix. Next time you submit, your app does not go to the front of the queue. It begins at the bottom again which means it could be another couple days before we validate it again. By following our tips above, you can avoid those delays. Spend a bit more time up front finding those issues yourself, leading to a quicker path to our service.

## See Also
[Retaining table data after publishing](devenv-retaining-data-after-publishing.md)  
[Checklist for Submitting Your App](devenv-checklist-submission.md)  
[Upgrading Extensions](devenv-upgrading-extensions.md)  
[Using the Code Analysis Tool](devenv-using-code-analysis-tool.md)  
