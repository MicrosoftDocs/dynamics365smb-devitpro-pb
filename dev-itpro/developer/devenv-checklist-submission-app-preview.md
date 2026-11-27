---
title: Business Central Marketplace App Previews FAQ
description: Learn how to install and publish preview versions of Business Central Marketplace apps, manage preview keys, and validate preview dependencies.
author: SusanneWindfeldPedersen
ms.date: 11/27/2026
ms.reviewer: solsen
ms.topic: faq
ai-usage: ai-assisted
ms.author: solsen
ms.custom: sfi-ropc-nochange
---

# Marketplace app previews FAQ

This FAQ explains how to install and share Marketplace app previews, manage preview keys, interpret telemetry, and understand validation and upgrade behavior.

## What should I do to enable previews of my Marketplace apps?

Preview support is enabled for all submissions of [!INCLUDE[prod_short](../includes/prod_short.md)] offers. It uses the hide key specified on your offer in Partner Center under **Availability** > **Preview audience** > **Hide key**. Partner Center automatically generates a key when you create a new offer. You can replace it with a string that contains only lowercase letters or numbers.

## On which environments can I install preview versions?

Preview versions can be installed in sandbox environments running [!INCLUDE[prod_short](../includes/prod_short.md)] 2023 release wave 2 (version 23.0) or later.

## How can I install preview versions for selected customers?

Selected customers can install the preview version of the extensions in your submission after the **Preview creation** step in Partner Center. Customers must receive and use the preview app installation URL. To target a specific sandbox, include its environment name:

`https://businesscentral.dynamics.com/<TenantId>/<EnvironmentName>/?noSignUpCheck=1&filter='ID'%20IS%20'<AppId>'%20AND%20'PreviewKey'%20IS%20'<PreviewKey>'&page=2503`

Replace the placeholders as follows:

- `<TenantId>` is the Microsoft Entra tenant ID of the customer's organization, not the Business Central environment ID.
- `<EnvironmentName>` is the name of the sandbox environment where the preview version will be installed.
- `<AppId>` is the app ID defined in the manifest of the main extension for this offer.
- `<PreviewKey>` is the key specified for your offer under **Availability** > **Preview audience** > **Hide key** at the time of submission.

After **Preview creation**, a preview listing of the offer is available in Marketplace. To access it from Partner Center, select **Marketplace preview** at the **Publisher signoff** step. Installing the preview extension from this listing isn't supported. Use the preview app installation URL instead.

## How can I install preview versions of my library apps for selected customers?

When installing the preview version of an extension, the latest preview version of its dependencies is installed only if the minimum version required isn't satisfied by the extensions already installed on the customer environment.

You can ensure that your library apps are installed in your customers' environments in either of the following ways:

- Give customers the installation URL with the app ID of your library app.
- Increase the dependency version in the manifest of the main app for your offer.

## How can I see if customers are using my preview versions?

If you're using Azure Application Insights for your extension, you can see which customers installed it as a preview version by selecting signals `LC0010` and `LC0022` where the custom dimension `extensionAvailability` is set to `Preview`. You can also see which customers used a preview key when installing your extensions by filtering on the custom dimension `extensionPreviewKeyProvided`. Learn more in [Analyzing extension lifecycle trace telemetry](../administration/telemetry-extension-lifecycle-trace.md).

> [!NOTE]
> If `extensionAvailability` is `Public` even though `extensionPreviewKeyProvided` is `True`, customers might have used a preview key after you selected **Go Live** in Partner Center and the extension became public. A public version can also be installed if no higher compatible preview version is available.

## How do I go live with my preview version?

To make your preview version publicly available in Marketplace, select **Go Live** at the **Publisher signoff** step in Partner Center.

## Is the preview key per submission or per offer?

Customers must use the preview key that you specify under **Availability** > **Preview audience** > **Hide key** at the time of submission to install that preview version.

If you change the preview key for your offer in Partner Center, the submitted preview version doesn't automatically update and still uses the previous key. For example, if you submit version 1.0.0.0 with `previewkey1`, customers can install that version by adding `previewkey1` to the installation URL. If you change the offer key to `previewkey2`, the new key isn't used until you start a new submission. If you submit version 1.0.0.0 again, customers can install it with either `previewkey1` or `previewkey2`. If you submit version 2.0.0.0, customers can install it with `previewkey2` only.

Similarly, if you submit the same library version 1.0.0.0 as part of two offers with separate keys `previewkey1` and `previewkey2`, customers can use either key to install the library in their environment.

## Are preview versions also validated for breaking changes?

Preview versions are validated for breaking changes against the latest publicly available app. However, preview versions aren't used as baseline for validation of breaking changes of other submissions.

For example, if version 1.0.0.0 is publicly available in Marketplace and you submit version 2.0.0.0, version 2.0.0.0 is validated for breaking changes against version 1.0.0.0. If you don't select **Go Live** for version 2.0.0.0 and start a new submission with version 2.1.0.0, version 2.1.0.0 is still validated against 1.0.0.0.

> [!NOTE]
> Since there can be breaking changes between a preview version that you never made public and the next version of the app, the schema update mode `ForceSync` is used when upgrading **from** a preview version. `ForceSync` can cause data loss, for example, if the new version removes tables that contain data.

## Can the submission for one offer depend on preview versions of libraries from another offer?

Dependencies that you don't include in the submission are downloaded automatically if they're publicly available in [!INCLUDE[prod_short](../includes/prod_short.md)] for the targeted countries or regions.

Your submission fails during **Automated Application Validation** if you don't include dependencies that aren't publicly available. This condition includes dependencies available only as previews. Missing dependencies produce errors with the diagnostic codes `AVS0005` or `AVS0101`.

## What happens to preview versions during environment upgrades?

During an environment upgrade to the next major version, Marketplace apps update to the latest publicly available version compatible with the target Business Central version. If a higher compatible public version is available for your preview app, that version is installed. If the preview version is the highest version, it's preserved.

During an environment upgrade to the next minor version, Marketplace app versions are normally preserved. They update if environment settings request the latest available compatible version or if an update is required for compatibility with the target Business Central version.

## Related information

[Technical validation checklist](devenv-checklist-submission.md)  
