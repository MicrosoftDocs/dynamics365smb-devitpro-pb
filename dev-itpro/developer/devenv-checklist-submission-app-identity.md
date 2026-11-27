---
title: Business Central Marketplace App Identity FAQ
description: Learn how to rename Marketplace apps, change publishers, and manage app IDs and dependencies when submitting extensions for Business Central.
author: SusanneWindfeldPedersen
ms.date: 11/27/2026
ms.reviewer: solsen
ms.topic: faq
ai-usage: ai-assisted
ms.author: solsen
ms.custom: sfi-ropc-nochange
---

# Marketplace app identity FAQ

This article answers questions about app identity when submitting apps to Marketplace. Learn when you can change an app's name, publisher, or app ID. Learn more in [Understand app identity for AL apps](devenv-app-identity.md).

## When is it okay to change the name of my extension?

Starting from [!INCLUDE[prod_short](../includes/prod_short.md)] 2021 release wave 2 (version 19.0), it's possible to change the name of your extensions without breaking dependent extensions.

When renaming an extension, you must:

- Increment the version number in the manifest of your extension.
- Ensure that your submission only targets releases of [!INCLUDE[prod_short](../includes/prod_short.md)] starting from 19.0.
- Update the name of your offer in Partner Center if your extension is the one for which you created the offer.

## When is it okay to change the publisher of my extension?

When changing the publisher of an extension, you must:

- Increment the version number in the manifest of your extension.
- Ensure that your submission only targets releases of [!INCLUDE[prod_short](../includes/prod_short.md)] starting from 19.0.
- Contact d365val@microsoft.com to register your affixes to your new publisher name.

## When is it okay to change the App ID of my extension?

> [!IMPORTANT]
> The app ID is a critical part of the identity of apps in [!INCLUDE[prod_short](../includes/prod_short.md)]. Changing it is a breaking change for all dependent extensions. Don't change the app ID of extensions installed for customers in Business Central online.

If you submit a new version of your extension with a different app ID for an existing offer, the new version is considered a different extension. All extensions that depend on the old app ID must be updated to reference the new app ID. Otherwise, customer environments can fail to upgrade. These failures must be fixed within the required time period. Learn more in [Maintain Marketplace apps and per-tenant extensions in Business Central online](app-maintain.md).

The app ID is part of how data is stored in [!INCLUDE[prod_short](../includes/prod_short.md)]. You must migrate data for all customers that have the extension with the old app ID installed. Changing the app ID doesn't automatically migrate data.

For supported Marketplace scenarios, you can move tables and fields between extensions by using `MovedTo` and `MovedFrom` and following the required upgrade and submission sequence. Learn more in [Move tables and fields between extensions](devenv-move-table-fields-between-extensions.md). Other scenarios might require a custom solution to export data from the old extension and reimport it after the extension change.

## Is it possible to have multiple apps with the same app ID in Marketplace?

Each distinct app must have a unique app ID. Versions of the same app retain that ID. If you have four apps in Marketplace, you need four unique IDs for these apps. Otherwise, you get conflicts.

## What if we already have an app on Marketplace but we need to create the same app for another country/region; can we then have the same app ID for two different apps targeting two different countries/regions?

Making the same app available in another country or region doesn't by itself require a new app ID. Separate apps should have different identities. Identity is used in app management, dependencies, support cases, and telemetry. Reusing an identity across different apps loses that uniqueness.

Another approach is to use a shared library app across countries/regions with one app identity. Add localized functionality in separate extensions, each with its own identity.

## Related information

[Technical validation checklist](devenv-checklist-submission.md)  
