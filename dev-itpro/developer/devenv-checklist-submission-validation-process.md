---
title: Marketplace Technical Validation Process FAQ
description: Describes the most common questions about the validation process when submitting your app to Marketplace for Business Central.
author: qutreson
ms.date: 11/27/2026
ms.reviewer: solsen
ms.topic: faq
ms.author: solsen
ms.custom: sfi-ropc-nochange
ai-usage: ai-assisted
---

# Marketplace technical validation process FAQ

This article addresses some of the most frequently asked questions about how submissions are handled and how to address the most common scenarios.

## Against which releases are my apps validated?

The extensions in your submission are validated for all the releases targeted by your submission.

Based on the `app.json` file of your extension, the service automatically computes the minimum release targeted by your submission and the extensions are then validated for all releases from this minimum release to the current release in production. Learn more in the example in [Technical validation checklist](devenv-checklist-submission.md#against-which-releases-of-business-central-is-your-submission-validated). The **Target Release** setting (**Current**, **Next Minor**, **Next Major**) available under **Supplemental Content** in Partner Center is ignored and will be removed.

> [!IMPORTANT]
> The minimum release computed for your submission also defines the availability in [!INCLUDE[prod_short](../includes/prod_short.md)] of all the extensions in your submission.
>
> For example, if the minimum release computed is 18.1, your extensions will be available starting from release 18.1.

> [!NOTE]
> Thirty days before the release of a new [!INCLUDE[prod_short](../includes/prod_short.md)] major version, all submissions are validated against the upcoming release. The apps in your submission must then be compatible with the upcoming release. The goal is to ensure that your customers won't be blocked during the upgrade of their environment.

## Against which countries/regions are my apps validated?

The extensions in your submission are validated for all the countries/regions targeted by the submission that are available in [!INCLUDE[prod_short](../includes/prod_short.md)]. Select the target markets in Partner Center. For listing-only offers, use **Availability** > **Edit markets**. For transactable offers, configure markets on the offer's plans.

When you're adding new localizations in [!INCLUDE[prod_short](../includes/prod_short.md)], these can be added to Partner Center before they're ready in [!INCLUDE[prod_short](../includes/prod_short.md)]. If you're targeting a country/region marked as **Planned** in [Country/regional availability](../compliance/apptest-countries-and-translations.md), depending on when your submission is processed, your apps might not be uploaded to [!INCLUDE[prod_short](../includes/prod_short.md)] if the localization isn't yet ready in [!INCLUDE[prod_short](../includes/prod_short.md)]. Generally, it's possible to upload apps for planned localizations a few weeks before they're officially released. When the localization becomes available, if you're experiencing issues installing your apps, increase the version in `app.json` and submit the packages again in Partner Center. If you're using Azure Application Insights, you can check whether the country/region was validated using the [submission troubleshooting guide](https://go.microsoft.com/fwlink/?linkid=2172328).

## Against which baselines are my apps validated?

The service verifies that your extensions don't introduce breaking changes by comparing them to the latest publicly available version in Marketplace for each validated country or region. The service doesn't use preview-only versions as baselines for subsequent submissions. Learn more in [Marketplace app previews FAQ](devenv-checklist-submission-app-preview.md).

You can find which versions of your extensions the service used as baselines during breaking-change validation by enabling Azure Application Insights in your extension and running the [submission troubleshooting guide](https://go.microsoft.com/fwlink/?linkid=2172328).

> [!IMPORTANT]
> Once your app is publicly available in Marketplace, it becomes a baseline for subsequent submissions, even if no customers use it yet. You must preserve compatibility with that version. Obsoleting AL symbols doesn't permit every breaking change. Changes to tables and table extensions must follow the supported schema compatibility rules and their documented exceptions. Learn more in [AppSourceCop rules](analyzers/appsourcecop.md). We recommend that you don't make your app publicly available while you're still developing it and expect incompatible changes.

## Which apps are validated in my submission?

The main app and the libraries required by the main app are validated and uploaded to [!INCLUDE[prod_short](../includes/prod_short.md)]. If you have included libraries, which aren't required by the main app, they're ignored during the validation and aren't uploaded to the service.

For example, let's consider an app A, which has an offer in the Marketplace and A depends on a library named B, which doesn't have any dependencies. If you create a new submission with A as the main app and include B, C, and D as libraries, then only A and B are validated. C and D are ignored because they aren't required by the main app A. If B is updated to depend on C and D, then all apps in the submission are now validated by the service.

> [!NOTE]
> If an app version in your submission is already validated for some countries or regions, the service doesn't validate it again for those countries or regions. Learn more about package-content conflicts involving an app version submitted previously in [When should I include my library apps as part of my submission?](#when-should-i-include-my-library-apps-as-part-of-my-submission)

> [!IMPORTANT]
> If one or more libraries in your submission have their own offer, the service doesn't automatically update their listings in Marketplace. To keep the listings in sync with the version of the apps uploaded to [!INCLUDE[prod_short](../includes/prod_short.md)], submit an update for each library's offer.

## How long does the 'Automated application validation' take?

During **Automated application validation**, the service validates the apps in your submission for each of the countries or regions and each of the releases of [!INCLUDE[prod_short](../includes/prod_short.md)] targeted. If you already have a version of these extensions published to Marketplace, the service also runs breaking-change validation by using the apps currently in Marketplace as baselines. Depending on the size of your app, the validation time can vary. The service processes submissions within a few minutes and expects to process all submissions in under three hours. However, if your app contains thousands of AL files, this process can take longer. Split the app into smaller modules because it also improves the development experience and the maintainability of your code base.

## How many automated tests do we need to run for validation and how high must the test coverage be?

When you set up your offer in Partner Center, you must still include a test package in **App Tests Automation**, but the validation process doesn't use it.

Test automation is something we expect you to run, to test your app, and to make sure that the quality of your app is high. We don't run tests of your apps, nor do we have a set value for a required code coverage. Instead, we rely on you to test your app properly to give your customers a good experience.

## When I submit an app to Marketplace, is the Key Usage Scenario document used for manual validation?

When you set up your offer in Partner Center, you must still include a document in **Key Usage Scenario**, but automated technical validation doesn't use it.

Business Central automated technical validation doesn't manually execute your app's usage scenarios. Marketplace certification is a separate process. Rely on your own testing to ensure your app provides a good customer experience.

## When are my apps ready to be installed in my Business Central environment?

Shortly after the offer publishing process finishes in Partner Center, you can install your extensions in supported [!INCLUDE[prod_short](../includes/prod_short.md)] online environments in the markets and releases targeted by the submission.

Before you make the submitted app version public, you can test it after the **Preview creation** step, either yourself as a publisher or with selected customers. Preview installation requires a sandbox environment running Business Central version 23.0 or later. To install the preview version, customers must receive and use the app preview install URL:

```text
https://businesscentral.dynamics.com/<TenantId>/<SandboxEnvironmentName>/?noSignUpCheck=1&filter='ID'%20IS%20'<AppId>'%20AND%20'PreviewKey'%20IS%20'<PreviewKey>'&page=2503
```

Replace the placeholders as follows:

- `<TenantId>` is the Microsoft Entra tenant ID of the customer's organization.
- `<SandboxEnvironmentName>` is the name of the customer's sandbox environment. URL-encode spaces as `%20`.
- `<AppId>` is the app ID defined in the manifest of the main extension for this offer.
- `<PreviewKey>` is the key for your offer under **Availability** > **Preview audience** > **Hide key** in Partner Center at the time of submission.

Learn more about Marketplace app previews in [Marketplace app previews FAQ](devenv-checklist-submission-app-preview.md).

## When should I include my library apps as part of my submission?

You aren't required to always include the dependencies of your extension as part of your submission.

You're only required to include the dependencies for your extension as part of your submission if you're submitting a newer version for them. If you don't include them in your submission, they're downloaded automatically if they're publicly available in [!INCLUDE[prod_short](../includes/prod_short.md)] for the targeted countries/regions.

> [!NOTE]
> If you include the dependencies of your extension as part of the submission, these dependency versions are used during the validation, even if there are higher versions already available in [!INCLUDE[prod_short](../includes/prod_short.md)].

If you don't include the dependencies and they're not publicly available, your submission fails during the **Automated application validation** stage. Missing dependencies result in error messages with the diagnostic codes `AVS0005` or `AVS0101`.

If you receive an error with the diagnostic code `AVS0107` and a message similar to `The extension 'MyApp' by 'MyPublisher' (version '1.2.3.4') has already been uploaded to Business Central for the country/region 'US'` for one of your library apps, it means that you already published another `.app` file for this extension to [!INCLUDE[prod_short](../includes/prod_short.md)] as part of a previous submission. This can happen if you submit an `.app` file with different content or create it in a different build. Each new build creates an `.app` file with a new package ID. If this version of the library is already available for all countries/regions targeted by your submission, you can remove the extension from the submission. If you're making your library available in new countries/regions, use the `.app` file that is already uploaded to [!INCLUDE[prod_short](../includes/prod_short.md)] or increase the version number in the manifest of the extension, the `app.json` file. All submitted versions that passed **Automated application validation** are considered in the content validation check, even if they weren't made publicly available.

## My app failed at the "Automated application validation" stage, what do I do next?

At this stage, your extensions are validated to assess whether they meet the requirements specified in the [Technical validation checklist](devenv-checklist-submission.md).

- If this stage failed with an error message similar to `The validation of the submission failed for X out of Y tasks`, investigate what caused the error. If you're using Azure Application Insights, it logs information about the validation results. You can also use the [submission troubleshooting guide](https://go.microsoft.com/fwlink/?linkid=2172328) to get started. If you're experiencing issues with Azure Application Insights, learn more in [Questions about Azure Application Insights usage during Marketplace submissions](devenv-checklist-submission-app-insights.md).
- If this stage failed with an error message similar to `The extension 'MyApp' by 'MyPublisher' (version '1.2.3.4') has already been uploaded to Business Central for the country/region 'US'`, update the list of extensions submitted. Learn more in [When should I include my library apps as part of my submission?](#when-should-i-include-my-library-apps-as-part-of-my-submission)
- If this stage failed with an error message similar to `The manifest property 'X' of the extension 'My App' by 'Publisher Name' (version '1.2.3.4') specifies 'Y' while the offer description specifies 'Z'.`, change either your `app.json` file or the offer description to match each other and submit a new version. In Partner Center, use **Properties** for the app version and **Offer listing** for the app name. Find your publisher name under **Account settings** > **Organizational profile** > **Legal** > **Developer** > **Publisher name**, or go to [Partner Center legal information](https://partner.microsoft.com/dashboard/account/v3/organization/legalinfo#developer). Before changing any identity values, review [Marketplace app identity FAQ](devenv-checklist-submission-app-identity.md).
- If this stage failed with an error message similar to `The submission must target at least one existing country/region of Business Central`, your submission doesn't target any country/region currently available in [!INCLUDE[prod_short](../includes/prod_short.md)]. If your submission targets a country/region marked as 'Planned' in [Country/regional availability](../compliance/apptest-countries-and-translations.md), you must wait for the localization to become available in [!INCLUDE[prod_short](../includes/prod_short.md)] and resubmit your offer. Generally, it's possible to upload apps for new localizations, a few weeks before they're made available to customers.
- If this stage failed with an error message similar to `The extension 'MyApp' by 'MyPublisher' (version '1.2.3.4') contains inconsistent information about the package id/name/publisher/version`, the package metadata is inconsistent. Rebuild the package and submit it again.
- If this stage failed with an error message similar to `The App ID '<AppId>' is already used for Per-Tenant-Extensions in Business Central and cannot be used for the Marketplace extension with name 'MyApp' and publisher 'MyPublisher'`, one or more per-tenant extensions (PTEs) use the same app ID in the service. [!INCLUDE[prod_short](../includes/prod_short.md)] doesn't support Marketplace apps and PTEs with the same app ID. Review the identity and data-migration requirements before changing the ID of your extension. Learn more in [Moving a PTE to Marketplace](devenv-extension-moving-scope.md#moving-a-pte-to-marketplace). If the PTEs with that app ID aren't used in any customer environments anymore, you can create a support case in Partner Center to request an exception.

- If this stage failed with an error message similar to `The extension 'MyApp' by 'MyPublisher' (version '1.2.3.4') has not been signed.` or `The extension 'MyApp' by 'MyPublisher' (version '1.2.3.4') has been signed, but the root certificate authority (CA) is not trusted.`, your submission doesn't meet the code-signing requirement of Marketplace for [!INCLUDE[prod_short](../includes/prod_short.md)]. Learn more in [Questions about code-signing validation](devenv-checklist-submission-code-sign.md) and [Sign an app package file](devenv-sign-extension.md).

- If this stage failed with the following error message `The submitted package '{0}' by '{1}' was found to contain malware. If you believe this is an error, please retry your submission. If it fails again, follow the documentation to submit your app file for further investigation.`, your submission was flagged for containing malware. First, examine your included artifacts and resources to ensure that they're safe to include in the submission. Ensure you have the latest Windows updates and scan your files with Microsoft Defender Antivirus to identify and fix infected files. If you have reason to believe that the detection is a false positive, follow the guidance in [Submit a file for malware analysis](/defender-xdr/submission-guide#how-do-i-submit-a-file-to-microsoft-for-analysis) to request a manual review.

- If this stage failed with the following error message `Automated validation of the submission has failed. Please retry the operation and contact Partner Center support if it fails again. `, create a new submission in Partner Center. If your submission fails again, create a support case in Partner Center. Learn more in [Channels to ask questions or report issues](devenv-checklist-submission-channels.md).

> [!NOTE]
> Because the extensions in your submission are validated for each release and country/region targeted by the submission, the validation results can be verbose and can't always be displayed in their full length in Partner Center. The error message then ends with `...(Truncated)`. If that happens for your submission, enable Azure Application Insights in your extension, run the self-validation script, or fix the visible errors and iterate on your submission.

> [!NOTE]
> To reduce the validation time, the same validation result can be reported for several releases of [!INCLUDE[prod_short](../includes/prod_short.md)] or several countries/regions. In that case, an error message can mention a release of [!INCLUDE[prod_short](../includes/prod_short.md)] or a country/region other than the one it's reported for.

## My app failed at the "Certification" stage, what do I do next?

Marketplace certification is separate from automated technical validation. It includes checks of your offer's content and eligibility. Review the [Marketing validation checklist](readiness/readiness-checklist-marketing.md) for the Business Central marketing requirements.

Review the marketing requirements and the [Marketing validation FAQ](readiness/readiness-marketing-validation-faq.md) to fix the errors reported.

## My app failed at the "Publish application with the service" stage, what do I do next?

At this stage, your extensions are being published to [!INCLUDE[prod_short](../includes/prod_short.md)].

If this stage failed with the following error message `Automated upload to Business Central of the extensions in the submission has failed. Please retry the operation and contact Partner Center support if it fails again.`, you should create a new submission in Partner Center. If it fails again, you should create a support case in Partner Center as documented in [Channels to ask questions or report issues](devenv-checklist-submission-channels.md).

## My app failed at another stage, what do I do next?

If your submission failed at another stage than "Automated application validation", "Certification", or "Publish application with the service", you should create a support case in Partner Center as documented in [Channels to ask questions or report issues](devenv-checklist-submission-channels.md).

## Related information

[Technical validation checklist](devenv-checklist-submission.md)
