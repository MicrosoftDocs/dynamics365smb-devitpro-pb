---
title: "Technical Validation FAQ"
description: Describing the most common questions when submitting your app to AppSource.
author: qutreson
ms.custom: na
ms.date: 10/27/2021
ms.reviewer: solsen
ms.suite: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: qutreson
---

# Technical Validation FAQ

This topic addresses some of the most frequently asked questions around validation of apps for AppSource submission.

## Questions about the validation process

In the following, you can read about how submissions are handled and learn how to address the most common scenarios.

### Against which releases are my apps validated?

The extensions in your submission are validated for all the releases targeted by your submission.

Based on the app.json file of your extension, the service automatically computes the minimum release targeted by your submission and the extensions are then validated for all releases from this minimum release to the current release in production. For more information, see the examples in [Technical Validation Checklist](devenv-checklist-submission.md).

> [!Important]  
> The minimum release computed for your submission also defines the availability in Business Central of all the extensions in your submission.
>
> For example, if the minimum release computed is 18.1, your extensions will be available starting from release 18.1.

### Against which countries/regions are my apps validated?

The extensions in your submission are validated for all the country/regions targeted by the submission. You can see which countries you have selected in Partner Center under `Availability > Edit Markets`.

### Against which baselines are my apps validated?

The service will verify that your extensions do not introduce breaking changes by comparing them to the latest version available in AppSource for each country validated.

You can know which versions of your extensions were used as baseline during the breaking change validation by enabling Azure Application Insights in your extension and running this [Troubleshooting Guide (TSG)](https://go.microsoft.com/fwlink/?linkid=2172328).

### When are my apps ready to be installed in my Business Central environment?

Shortly after the offer publishing process has been completed in Partner Center, your extensions will be available for installation in Business Central.

Business Central currently does not support installing offers at the "Preview creation" step.

### When should I include my library apps as part of my submission?

You are not required to always include the dependencies of your extension as part of your submission.

You are only required to include the dependencies for your extension as part of your submission if you are submitting a newer version for them. If you do not include them in your submission, they will be downloaded from the [App Management API](../administration/appmanagement/app-management-api.md) if they are available. 

If you did not include the dependencies for your app and they are not available, your submission will fail during the "Automated Application Validation". Failing to find the dependencies for an extension results in error messages with the diagnostic codes `AVS0005` or `AVS0101`.

If you receive an error message similar to `The extension 'MyApp' by 'MyPublisher' (version '1.2.3.4') has already been uploaded to Business Central for the country/region 'US'`, it means that you have already published another .app file for this extension to Business Central as part of a previous submission. If this version of the extension is already available for all countries targeted by your submission, you can just remove the extension from the library. If you are making your libraries available in new countries, you should increase the version number in the manifest of the extension (app.json).

### My app failed at the "Automated application validation" stage, what do I do next?

At this stage, your extensions are validated to assess whether they meet the requirements specified in the [Technical Validation Checklist](devenv-checklist-submission.md).

If this stage failed with an error message similar to `The validation of the submission failed for X out of Y tasks`, you must investigate what has caused the error. If you are using Azure Application Insights, information about the validation results are logged in Azure Application Insights. You can also use this [Troubleshooting Guide (TSG)](https://go.microsoft.com/fwlink/?linkid=2172328) in order to get started.

If this stage failed with an error message similar to `TODO(qutreson)`, you must update the list of libraries submitted. For more information, see "When should I include my library apps as part of my submission?".

If this stage failed with the following error message `Automated validation of the submission has failed. Please retry the operation and contact Partner Center support if it fails again. `, you should create a new submission in Partner Center. If your submission fails again, you should create a support case in Partner Center as documented in this article.

### My app failed at the "Certification" stage, what do I do next?

At this stage, your extensions are validated to assess whether they meet the requirements defined in the [Marketing Validation Checklist](eadiness/readiness-checklist-marketing.md).

Review the Marketing requirements and the [Marketing Validation FAQ](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/readiness/readiness-marketing-validation-faq) in order to fix the errors reported.

### My app failed at the "Publish application with the service" stage, what do I do next?

At this stage, your extensions are being published to Business Central.

If this stage failed with the following error message `Automated upload to Business Central of the extensions in the submission has failed. Please retry the operation and contact Partner Center support if it fails again.`, you should create a new submission in Partner Center. If it fails again, you should create a support case in Partner Center as documented in the dedicated section below.

### My app failed at another stage, what do I do next?

If your submission failed at another stage than "Automated application validation", "Certification", or "Publish application with the service", you should create a support case in Partner Center as documented in the dedicated section below.

## Questions about code-signing validation

This section contains frequently asked questions related to the code-signing requirement from the [Technical Validation Checklist](devenv-checklist-submission.md). For more information about code-signing, see [Signing an APP Package File](devenv-sign-extension.md).

### Can I use a self-signed certificate to sign my apps targeting AppSource?

No, it is not allowed to use a self-signed certificate. The .app package file must be signed using a certificate purchased from a Certification Authority that has its root certificates in Microsoft Windows. You can obtain a certificate from a range of certificate providers, including but not limited to GoDaddy, DigiCert, and Symantec.

### Do I need to use an EV code-signing certificate to pass the technical validation?

No, it is not required to use an EV code-signing certificate. Standard code-signing certificates can be used to satisfy the code-signing requirement.

### Can I re-use the same code-signing certificate to sign multiple apps?

Yes, you can re-use the same code-signing certificate for multiple extensions. Code-signing certificates have a validity period defined over time.

## Questions about affixes and ID ranges

In the following, you can read about how affixes and ID ranges are assigned.

### Do I need to register different affixes for each of my extensions?

No, you do not need to register affixes for each of your extensions.

The object affixes are registered per publisher so if your apps all have the same publisher, they can share the same affixes. The automated validation verifies that you are using the 3 letter affix registered by Microsoft in your extension, but this still allows you to create longer affixes per extension. For example, if you registered ABC as your affix, you can use ABCD as the prefix in Extension 1 and ABCE as the prefix in Extension 2. For more information, see [Prefix and suffix for naming in extensions](../compliance/apptest-prefix-suffix.md).

### Do I need to request a different ID range for each of my extensions?

No, you do not need to request a new ID range for each of your extensions.

The object IDs are registered per partner, not per extension. You can then use a subset of this range for each of your extensions. It is your responsibility to ensure that you are not defining objects with the same IDs in different extensions. If you are doing so, the extensions defining these objects cannot be installed together on the same environment. For more information, see [Get Started Building Apps](readiness/get-started.md#requesting-an-object-range).

## Questions about App identity changes

This section contains questions related to the identity of apps in AppSource. For more information, see the questions in [App Identity](devenv-app-identity.md).

### When is it okay to change the name of my extension?

Starting from [!INCLUDE[prod_short](../includes/prod_short.md)] 2021 release wave 2 (version 19.0), it is possible to change the name of your extensions.

When renaming an extension, you must:

- increment the version number in the manifest of your extension,
- make sure that your submission only targets releases of Business Central starting from 19.0.
- update the name of your offer in Partner Center - if your extension is the one for which the offer is created.

### When is it okay to change the publisher of my extension?

Starting from [!INCLUDE[prod_short](../includes/prod_short.md)] 2021 release wave 2 (version 19.0), it is possible to change the publisher name of your extensions.

When changing the publisher of an extension, you must:

- increment the version number in the manifest of your extension,
- make sure that your submission only targets releases of Business Central starting from 19.0,
- contact d365val@microsoft.com in order to register your affixes to your new publisher name.

## Channels to report issues

In the following, you can read about how you reach out for support most efficiently.

### When do I contact d365val@microsoft.com?

When registering affixes for your publisher, or adding a new publisher name to your affixes. For more information, see [Benefits and Guidelines for using a Prefix or Suffix](../compliance/apptest-prefix-suffix.md).

### When do I contact Partner Center customer support?

When your question is related to one of the following topics:

- Failed technical validation of the submission ('Automated application validation' stage),
- Failed marketing validation of the submission ('Certification' stage),
- Failed upload of the extensions in the submission ('Publish application with the service' stage),
- Requesting an exception for a breaking change.

> [!Important]  
> If you are using Azure Application Insights, before opening a support case for a failure at the 'Automated application validation', you must analyze the [signals](../administration/telemetry-appsource-submission-validation-trace.md) emitted in your Azure Application Insights storage. You can do so by using the [Troubleshooting Guide (TSG)](https://go.microsoft.com/fwlink/?linkid=2172328). When opening a support case, you must include the Kusto queries you used and the diagnostic messages you found. Including the results from the TSG is also recommended.

### When do I contact Business Central customer support?

When your submission has been successfully completed in Partner Center, but your customers are experiencing issues installing or using the app.

### When do I log an issue on NavContainerHelper on Github?

When you have questions or bugs regarding the self-validation script. For more information, see [https://github.com/microsoft/navcontainerhelper/issues](https://github.com/microsoft/navcontainerhelper/issues).

### When do I write on Yammer?

- When you have questions related to development (which code-signing certificate to use, best practices, etc.).
- Or, when you have other questions that pertain to this area - use [aka.ms/bcyammer](https://aka.ms/bcyammer).

## See also

[Technical Validation Checklist](devenv-checklist-submission.md)
