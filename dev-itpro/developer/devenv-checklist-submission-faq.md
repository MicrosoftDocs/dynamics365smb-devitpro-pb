---
title: "Technical Validation Checklist FAQ"
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

# Technical Validation Checklist FAQ

This topic addresses some of the most frequently asked questions around validation of apps for AppSource submission.

## Questions about the validation process

In the following, you can read about how submissions are handled.

### Against which releases are my apps validated?

The extensions in your submission are validated for all the releases targeted by your submission.

Based on the app.json of your extension, the service automatically computes the minimum release targeted by your submission and the extensions are then validated for all releases from this minimum release to the current release in production. For more information, see the examples in [Technical Validation Checklist](devenv-checklist-submission.md).

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

The offer publishing process must be completed in Partner Center before an extension/offer can be installed for a Business Central environment.
Business Central currently does not support installing offers in the "Preview creation" step.

### My app failed at the 'Automated Technical Validation' stage, what do I do next?

At this stage, your extensions are validated to assess whether they meet the requirements specified in the [Technical Validation Checklist](devenv-checklist-submission.md).

If this stage failed with an error message similar to `The validation of the submission failed for X out of Y tasks`, you must investigate what has caused the error. If you are using Azure Application Insights, information about the validation results are logged in Azure Application Insights. You can also use this [Troubleshooting Guide (TSG)](https://go.microsoft.com/fwlink/?linkid=2172328) in order to get started.

If this stage failed with the following error message `Automated validation of the submission has failed. Please retry the operation and contact Partner Center support if it fails again.`, you should create a new submission in Partner Center. If it fails again, you should create a support case in Partner Center as documented in the dedicated section below.

### My app failed at the 'Pushing app to the service' stage, what do I do next?

At this stage, your extensions are being published to Business Central.

If this stage failed with the following error message `Automated upload to Business Central of the extensions in the submission has failed. Please retry the operation and contact Partner Center support if it fails again.`, you should create a new submission in Partner Center. If it fails again, you should create a support case in Partner Center as documented in the dedicated section below.

## Questions about refactoring

### Can I move AL objects from my main app to a library?

- If tables, no because that's a migration and this is not supported, see migration.json
- Other objects, yes, if obsoleted first. Need to make sure that both the new library and new base are not installed together.
- This is possible, but can be risky - not advised if app is used.

## Questions about code-signing validation

This sections contains frequently asked questions related to the code-signing requirement from the [Technical Validation Checklist](devenv-checklist-submission.md).
For more information about code-signing, see [Signing an APP Package File](devenv-sign-extension.md).

### Can I use a Self-signed certificate to sign my apps targeting AppSource?

No, it is not allowed to use a self-signed certificate. The .app package file must be signed using a certificate purchased from a Certification Authority that has its root certificates in Microsoft Windows. You can obtain a certificate from a range of certificate providers, including but not limited to GoDaddy, DigiCert, and Symantec.

### Do I need to use an EV code-signing certificate to pass the technical validation?

No, it is not required to use an EV code-signing certificate. Standard code-signing certificates can be used to satisfy the code-signing requirement.

### Can I re-use the same code-signing certificate to sign multiple apps?

Yes, you can re-use the same code-signing certificate for multiple extensions. Code-signing certificate have a validity period defined over time.

## Questions about affixes and ID ranges

### Do I need to register different affixes for each of my extensions?

No, you do not need to register affixes for each of your extensions.

The object affixes are registered per publisher so if your apps all have the same publisher, they can share the same affixes. The automated validation verifies that you are using the 3 letter affix registered by Microsoft in your extension, but this still allows you to create longer affixes per extension. For instance, if you registered ABC as your affix, you can use ABCD as prefix in Extension 1 and ABCE as prefix in Extension 2. For more information, see: [Prefix and suffix for naming in extensions](../compliance/apptest-prefix-suffix.md).

### Do I need to request a different ID range for each of my extensions?

No, you do not need to request a new ID range for each of your extensions.

The object IDs are registered per partner, not per extension. You can then use a subset of this range for each of your extensions. It is your responsibility to ensure that you are not defining objects with the same IDs in different extensions. If you are doing so, the extensions defining these objects cannot be installed together on the same environment. For more information, see: [Get Started Building Apps](readiness/get-started.md#requesting-an-object-range).

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

- Failed technical validation of the submission,
- Failed marketing validation of the submission,
- Failed upload of the extensions in the submission,
- When requesting an exception for a breaking change.

### When do I contact Business Central customer support?

When your submission has been successfully completed in Partner Center, but your customers are experiencing issues installing or using the app.

### When do I log an issue on NavContainerHelper on Github?

When you have questions or bugs regarding the self-validation script. For more information, see [https://github.com/microsoft/navcontainerhelper/issues](https://github.com/microsoft/navcontainerhelper/issues).

### When do I write on Yammer?

- When you have questions related to development (which code-signing certificate to use, best practices, etc.).
- Or, when you have other questions that pertain to this area - use [aka.ms/bcyammer](https://aka.ms/bcyammer).

## See also

[Technical Validation Checklist](devenv-checklist-submission.md)