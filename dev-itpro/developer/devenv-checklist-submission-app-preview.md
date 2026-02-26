---
title: Marketplace App Previews FAQ
description: Describes the most common questions about Marketplace previews for Business Central.
author: qutreson
ms.date: 10/08/2025
ms.reviewer: solsen
ms.topic: faq
ms.author: qutreson
ms.custom: sfi-ropc-nochange
---

# Marketplace app previews FAQ

This article addresses some of the most frequently asked questions around previews for Marketplace apps.

## What should I do to enable previews of my Marketplace apps?

Preview support is now enabled for all submissions of [!INCLUDE[prod_short](../includes/prod_short.md)] offers. It uses the hide key specified on your offer in Partner Center under `Availability > Preview Audience > Hide Key`. Partner Center automatically generates a key when creating a new offer, but you can override it with any string using only lowercase letters and/or numbers.

## On which environments can I install preview versions?

Preview versions can be installed on Sandbox environments running on [!INCLUDE[prod_short](../includes/prod_short.md)] 2023 release wave 2 (version 23.0), or newer.

## How can I install preview versions for selected customers?

Selected customers can install the preview version of the extensions in your submission after the "Preview creation" step of the submission flow in Partner Center. In order to trigger the install, customers must receive and use the preview app install URL:

`https://businesscentral.dynamics.com/[TenantID]/?noSignUpCheck=1&filter='ID' IS '[AppID]' AND 'PreviewKey' IS '[PreviewKey]'&page=2503` 

Where

- `[TenantID]` is the Microsoft Entra ID of the customer environment, 
- `[AppID]` is the app ID defined in the manifest of the main extension for this offer, and 
- `[PreviewKey]` is the key specified in Partner Center for your offer under `Availability > Preview Audience > Hide Key` at the time of submission.

After the "Preview creation", a preview listing of the offer is available in the Marketplace. This preview listing can be accessed from Partner Center by checking off the "Marketplace preview" option at the "Publisher signoff" step of the submission flow. However, installing the corresponding preview version of the extension from the preview listing isn't supported and the above mentioned preview app install URL must be used instead.

## How can I install preview versions of my library apps for selected customers?

When installing the preview version of an extension, the latest preview version of its dependencies is installed only if the minimum version required isn't satisfied by the extensions already installed on the customer environment.

You can ensure that your library apps are installed on your customer's environments by providing them with the install URL documented above using the app ID of your library app, or by increasing the dependency version in the manifest of the main app for your offer.

## How can I see if customers are using my preview versions?

If you're using Azure Application Insights for your extension, you can see which customers installed it as a preview version by selecting signals `LC0010` and `LC0022` where the custom dimension `extensionAvailability` is set to `Preview`. You can also see which customers used a preview key when installing your extensions by filtering on the custom dimension `extensionPreviewKeyProvided`. Learn more in [Analyzing extension lifecycle trace telemetry](../administration/telemetry-extension-lifecycle-trace.md).

> [!NOTE]  
> If you see some extensions installed with `extensionAvailability` set to `Public` even if `extensionPreviewKeyProvided` is set to `True`, this means that the customers used the preview key they received after you selected `Go Live` in Partner Center to make the extension public.

## How do I go live with my preview version?

You can make your preview version publicly available in the Marketplace by clicking "Go Live" at the "Publisher signoff" step of the submission flow in Partner Center.

## Is the preview key per submission or per offer?

The preview key specified in Partner Center under `Availability > Preview Audience > Hide Key` **at the time of the submission** is the one that must be used by customers to install this preview version. 

If you change the preview key for your offer in Partner Center, the submitted preview version isn't automatically updated and will still use the previous preview key. For example, if you submit version 1.0.0.0 with the preview key `key-1`, then version 1.0.0.0 can be installed by customer that adds the key `key-1` in the install URL. If you change the preview key for your offer in Partner Center to `key-2`, this key won't be used until you start a new submission. If you submit version 1.0.0.0 again, customers are able to install it using either `key-1` or `key-2`. If you submit version 2.0.0.0, then customers are able to install it with version `key-2` only.

Similarly, if you submitted the same library version 1.0.0.0 as part of two offers using two separate preview keys `key-1` and `key-2`, customers are able to use either `key-1` or `key-2` to install the library on their environment.

## Are preview versions also validated for breaking changes?

Preview versions are validated for breaking changes against the latest publicly available app. However, preview versions aren't used as baseline for validation of breaking changes of other submissions.

For example, if you have version 1.0.0.0 as publicly available in Marketplace and you submit version 2.0.0.0, then version 2.0.0.0 will be validated for breaking change against version 1.0.0.0. If you don't press "Go Live" for your submission of version 2.0.0.0, and decide to start a new submission with version 2.1.0.0, then version 2.1.0.0 is validated for breaking change against 1.0.0.0.

> [!NOTE]  
> Since there can be breaking changes between a preview version that was never made public and the next version of the app, the schema update mode `ForceSync` is used when upgrading **from** a preview version.

## Can the submission for one offer depend on preview versions of libraries from another offer?

Dependencies, which aren't included in the submission will be downloaded automatically if they're publicly available in [!INCLUDE[prod_short](../includes/prod_short.md)] for the targeted countries/regions. 

Your submission fails during the "Automated Application Validation" stage if you didn't include the dependencies for your app and they aren't publicly available. The submission will also fail if the dependencies are only available as Preview and aren't included in the submission. Failing to find the dependencies for an extension results in error messages with the diagnostic codes `AVS0005` or `AVS0101`.

## What happens to preview versions during environment upgrades?

During the upgrade of an environment to the next major, the latest publicly available version of Marketplace apps are installed on the customer environment. If there's a higher version is available for your preview app, this version is installed. If the preview version is the highest version, the preview version is preserved.

During the upgrade of an environment to the next minor, Marketplace apps versions are preserved unless the environment settings specify to update apps to the latest version available.

## Related information

[Technical validation checklist](devenv-checklist-submission.md)
