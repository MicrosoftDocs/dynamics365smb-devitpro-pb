---
title: Marketplace Technical validation process FAQ
description: Describes the most common questions about the validation process when submitting your app to Marketplace for Business Central.
author: qutreson
ms.date: 10/08/2025
ms.reviewer: solsen
ms.topic: faq
ms.author: qutreson
ms.custom: sfi-ropc-nochange
---

# Marketplace technical validation process FAQ

This article addresses some of the most frequently asked questions about how submissions are handled and how to address the most common scenarios.

## Against which releases are my apps validated?

The extensions in your submission are validated for all the releases targeted by your submission.

Based on the app.json file of your extension, the service automatically computes the minimum release targeted by your submission and the extensions are then validated for all releases from this minimum release to the current release in production. Learn more in the example in [Technical validation checklist](devenv-checklist-submission.md#against-which-releases-of-business-central-is-your-submission-validated). The 'Target Release' (Current, Next Minor, Next Major) available under 'Supplemental Content' in Partner Center is ignored and will be removed.

> [!IMPORTANT]  
> The minimum release computed for your submission also defines the availability in [!INCLUDE[prod_short](../includes/prod_short.md)] of all the extensions in your submission.
>
> For example, if the minimum release computed is 18.1, your extensions will be available starting from release 18.1.

> [!NOTE]  
> Thirty days before the release of a new [!INCLUDE[prod_short](../includes/prod_short.md)] major version, all submissions are validated against the upcoming release. The apps in your submission must then be compatible with the upcoming release. The goal is to ensure that your customers won't be blocked during the upgrade of their environment.

## Against which countries/regions are my apps validated?

The extensions in your submission are validated for all the countries/regions targeted by the submission, which are available in [!INCLUDE[prod_short](../includes/prod_short.md)]. You can see which countries/regions you've selected in Partner Center under `Availability > Edit Markets`. 

When you're adding new localizations in [!INCLUDE[prod_short](../includes/prod_short.md)], these can be added to Partner Center before they're ready in [!INCLUDE[prod_short](../includes/prod_short.md)]. If you're targeting a country/region marked as 'Planned' in [Country/regional availability](../compliance/apptest-countries-and-translations.md), depending on when your submission is processed, your apps might not be uploaded to [!INCLUDE[prod_short](../includes/prod_short.md)] if the localization isn't yet ready in [!INCLUDE[prod_short](../includes/prod_short.md)]. Generally, it's possible to upload apps for 'Planned' localizations a few weeks before they're officially released. When the localization becomes available, if you're experiencing issues installing your apps, you should increase the version in the app.json and submit the packages again in Partner Center. If you're using Azure Application Insights, you can check whether the country/region was validated using this [Troubleshooting Guide (TSG)](https://go.microsoft.com/fwlink/?linkid=2172328).

## Against which baselines are my apps validated?

The service verifies that your extensions don't introduce breaking changes by comparing them to the latest version available in Marketplace for each country/region validated.

You can know which versions of your extensions were used as baseline during the breaking change validation by enabling Azure Application Insights in your extension and running this [Troubleshooting Guide (TSG)](https://go.microsoft.com/fwlink/?linkid=2172328).

> [!IMPORTANT]  
> As soon as your app has been uploaded to the Marketplace, it will be used as a baseline during the technical validation of your next submissions. As a consequence, you won't be allowed to perform breaking changes without obsoleting the AL objects first and you won't be allowed to perform schema breaking changes; breaking changes on tables or table extensions. This applies also if your extension isn't used by customers yet. You should then not submit your app to the Marketplace if you're still developing it and expect to change it soon.

## Which apps are validated in my submission?

The main app and the libraries required by the main app are validated and uploaded to [!INCLUDE[prod_short](../includes/prod_short.md)]. If you have included libraries, which aren't required by the main app, they're ignored during the validation and aren't uploaded to the service.

For example, let's consider an app A, which has an offer in the Marketplace and A depends on a library named B, which doesn't have any dependencies. If you create a new submission with A as the main app and include B, C, and D as libraries, then only A and B are validated. C and D are ignored because they aren't required by the main app A. If B is updated to depend on C and D, then all apps in the submission are now validated by the service.

> [!NOTE]  
> If some apps in your submission already have been uploaded to [!INCLUDE[prod_short](../includes/prod_short.md)] with the same version for some countries/regions, then the app won't be validated again for these countries/regions.

> [!IMPORTANT]
> If one or more libraries in your submission have their own offer, their listings in the Marketplace won't be updated automatically. In order to keep the listings in sync with the version of the apps uploaded to [!INCLUDE[prod_short](../includes/prod_short.md)], you should submit a submission for their related offers.

## How long does the 'Automated application validation' take?

During 'Automated application validation', the apps in your submission are validated for each of the country/regions and each of the releases of [!INCLUDE[prod_short](../includes/prod_short.md)] targeted. If you already have a version of these extensions published to Marketplace, then it also runs the breaking change validation using the apps currently in Marketplace as baseline. Depending on the size of your app, the validation time can vary. Submissions are processed within a few minutes and we expect all submissions to be processed under 3 hours. However, if your app contains thousands of AL files, this process can take longer. We would then recommend splitting the app in smaller modules as it would also improve the development experience and the maintainability of your code base.

## How many automated tests do we need to run for validation and how high must the test coverage be?  

When setting up your offer in Partner Center, you must still include a test package in 'App Tests Automation', but it isn't used during the validation of the submission.

Test automation is something we expect you to run, to test your app, and to make sure that the quality of your app is high. We don't run tests of your apps, nor do we have a set value for a required code coverage. Instead, we rely on you to test your app properly to give your customers a good experience.

## When I submit an app to Marketplace; do you always make a manual validation based on the provided 'Key Usage Scenario' document?  

When setting up your offer in Partner Center, you must still include a document in 'Key Usage Scenario', but it isn't used during the validation of the submission.

We don't run a manual validation of the apps anymore. Instead, we rely on you to test that your app provides your customers with a good experience.

## When are my apps ready to be installed in my Business Central environment?

Shortly after the offer publishing process has been completed in Partner Center, your extensions will be available for installation on all [!INCLUDE[prod_short](../includes/prod_short.md)] environments from the Marketplace.

Before going public with the submitted app version, you can test it after the "Preview creation" step, either yourself as a publisher or with select customers. In order to trigger an install of the preview version, customers must receive and use the app preview install URL:

```	
`https://businesscentral.dynamics.com/[TenantID]/?noSignUpCheck=1&filter='ID' IS '[AppID]' AND 'PreviewKey' IS '[PreviewKey]'&page=2503` 
```

Where

- `[TenantID]` is the Microsoft Entra ID of the customer environment, 
- `[AppID]` is the app ID defined in the manifest of the main extension for this offer, and 
- `[PreviewKey]` is the key specified in Partner Center for your offer under `Availability > Preview Audience > Hide Key` at the time of submission.

Learn more about Marketplace app preview in the section [Questions about Marketplace app previews](devenv-checklist-submission-app-preview.md).

## When should I include my library apps as part of my submission?

You aren't required to always include the dependencies of your extension as part of your submission.

You're only required to include the dependencies for your extension as part of your submission if you're submitting a newer version for them. If you don't include them in your submission, they're downloaded automatically if they're publicly available in [!INCLUDE[prod_short](../includes/prod_short.md)] for the targeted countries/regions.

> [!NOTE]  
> If you include the dependencies of your extension as part of the submission, these dependency versions are used during the validation, even if there are higher versions already available in [!INCLUDE[prod_short](../includes/prod_short.md)].

If you didn't include the dependencies for your app and they aren't publicly available, your submission fails during the "Automated Application Validation" stage. Failing to find the dependencies for an extension results in error messages with the diagnostic codes `AVS0005` or `AVS0101`.

If you receive an error with the diagnostic code `AVS0107` and a message similar to `The extension 'MyApp' by 'MyPublisher' (version '1.2.3.4') has already been uploaded to Business Central for the country/region 'US'` for one of your library apps, it means that you already published another .app file for this extension to [!INCLUDE[prod_short](../includes/prod_short.md)] as part of a previous submission. This can happen if you submit a .app file with different content, or created by a different build (each .app file created has a specific build ID stamped, so building multiple times the same project results in .app files with different build IDs). If this version of the library is already available for all countries/regions targeted by your submission, you can just remove the extension from the submission. If you're making your library available in new countries/regions, you should use the .app file that is already uploaded to [!INCLUDE[prod_short](../includes/prod_short.md)] or increase the version number in the manifest of the extension (the app.json file). All submitted versions that passed the "Automated Application Validation" are considered in the content validation check, even if they weren't made publicly available.

## My app failed at the "Automated application validation" stage, what do I do next?

At this stage, your extensions are validated to assess whether they meet the requirements specified in the [Technical Validation Checklist](devenv-checklist-submission.md).

- If this stage failed with an error message similar to `The validation of the submission failed for X out of Y tasks`, you must investigate what caused the error. If you're using Azure Application Insights, information about the validation results is logged in Azure Application Insights. You can also use this [Troubleshooting Guide (TSG)](https://go.microsoft.com/fwlink/?linkid=2172328) in order to get started. If you're experiencing issues with Azure Application Insights, refer to [Questions about Azure Application Insights usage during Marketplace submissions](devenv-checklist-submission-app-insights.md).
- If this stage failed with an error message similar to `The extension 'MyApp' by 'MyPublisher' (version '1.2.3.4') has already been uploaded to Business Central for the country/region 'US'`, you must update the list of extensions submitted. Learn more in "When should I include my library apps as part of my submission?".
- If this stage failed with an error message similar to `The manifest property 'X' of the extension 'My App' by 'Publisher Name' (version '1.2.3.4') specifies 'Y' while the offer description specifies 'Z'.`, you should either change your app.json file or the offer description to match each other and submit a new version. Offer description changes in Partner Center can be made in the "Properties" section of your offer for the app version, "Offer listing" section for the app name, and your publisher name can be found in Partner Center under `Account Settings > Organizational Profile > Legal > Developer > Publisher Name` or by following [this link](https://partner.microsoft.com/dashboard/account/v3/organization/legalinfo#developer). When changing any of these, remember to consult the section on this page called "Questions about app identity".
- If this stage failed with an error message similar to `The submission must target at least one existing country/region of Business Central`, your submission doesn't target any country/region currently available in [!INCLUDE[prod_short](../includes/prod_short.md)]. If your submission targets a country/region marked as 'Planned' in [Country/regional availability](../compliance/apptest-countries-and-translations.md), you must wait for the localization to become available in [!INCLUDE[prod_short](../includes/prod_short.md)] and resubmit your offer. Generally, it's possible to upload apps for new localizations, a few weeks before they're made available to customers.
- If this stage failed with an error message similar to `The extension 'MyApp' by 'MyPublisher' (version '1.2.3.4') contains inconsistent information about the package id/name/publisher/version`, it means that something went wrong when the package included in your submission was built. In order to mitigate the issue, you must rebuild the package and submit it again.
- If this stage failed with an error message similar to `The App ID '<some-Guid>' is already used for Per-Tenant-Extensions in Business Central and cannot be used for the Marketplace extension with name 'MyApp' and publisher 'MyPublisher'`, this means that there exists one or many PTEs with the same App ID in the service. Since [!INCLUDE[prod_short](../includes/prod_short.md)] doesn't support having Marketplace apps and PTEs with the same App ID, it's then recommended to change the ID of your extension before submitting it in Partner Center. Learn more in [Moving a PTE to Marketplace](devenv-extension-moving-scope.md#moving-a-pte-to-marketplace). If the PTEs with that App ID aren't used in any customer environments anymore, you can create a support case in Partner Center to request an exception.

- If this stage failed with an error message similar to `The extension 'MyApp' by 'MyPublisher' (version '1.2.3.4') has not been signed.` or `The extension 'MyApp' by 'MyPublisher' (version '1.2.3.4') has been signed, but the root certificate authority (CA) is not trusted.`, your submission doesn't live up to the code signing requirement of Marketplace for [!INCLUDE[prod_short](../includes/prod_short.md)]. In order to correctly sign your app, check out [Questions about code-signing validation](devenv-checklist-submission-code-sign.md), and take a look at the article [Sign an app package file](devenv-sign-extension.md).

- If this stage failed with the following error message `The submitted package '{0}' by '{1}' was found to contain malware. If you believe this is an error, please retry your submission. If it fails again, follow the documentation to submit your app file for further investigation.`, your submission was flagged for containing malware. First, examine your included artifacts and resources to ensure that they're safe to include in the submission. Make sure you have the latest Windows updates and scan your files with Windows Defender to identify and mitigate the infected files. If you have reason to believe that the detection is a false positive, you can follow the documentation to [Submit a file for malware analysis](/defender-xdr/submission-guide#how-do-i-submit-a-file-to-microsoft-for-analysis) so that it can be manually reviewed.

- If this stage failed with the following error message `Automated validation of the submission has failed. Please retry the operation and contact Partner Center support if it fails again. `, you should create a new submission in Partner Center. If your submission fails again, you should create a support case in Partner Center as documented in this article.

> [!NOTE]
> Because the extensions in your submission are validated for each release and country/region targeted by the submissions, the validation results can be verbose and can't always be displayed in their full length in Partner Center. The error message will then end with `...(Truncated)`. If that happens for your submission, you should either enable Azure Application Insights in your extension, run the self-validation script, or fix the errors visible and iterate on your submission.

## My app failed at the "Certification" stage, what do I do next?

At this stage, your extensions are validated to assess whether they meet the requirements defined in the [Marketing Validation Checklist](readiness/readiness-checklist-marketing.md).

Review the Marketing requirements and the [Marketing Validation FAQ](readiness/readiness-marketing-validation-faq.md) in order to fix the errors reported.

## My app failed at the "Publish application with the service" stage, what do I do next?

At this stage, your extensions are being published to [!INCLUDE[prod_short](../includes/prod_short.md)].

If this stage failed with the following error message `Automated upload to Business Central of the extensions in the submission has failed. Please retry the operation and contact Partner Center support if it fails again.`, you should create a new submission in Partner Center. If it fails again, you should create a support case in Partner Center as documented in [Channels to ask questions or report issues](devenv-checklist-submission-channels.md).

## My app failed at another stage, what do I do next?

If your submission failed at another stage than "Automated application validation", "Certification", or "Publish application with the service", you should create a support case in Partner Center as documented in [Channels to ask questions or report issues](devenv-checklist-submission-channels.md).

## Related information

[Technical validation checklist](devenv-checklist-submission.md)
