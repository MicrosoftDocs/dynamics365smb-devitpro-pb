---
title: AppSource App Identity FAQ
description: Describes the most common questions about app identity in your AppSource app for Business Central.
author: qutreson
ms.date: 10/08/2025
ms.reviewer: solsen
ms.topic: faq
ms.author: qutreson
ms.custom: sfi-ropc-nochange
---

# AppSource app identity FAQ

This article addresses some of the most frequently asked questions around validation of apps for AppSource submission. This section contains questions related to the identity of apps in AppSource. Learn more from the questions in [App identity](devenv-app-identity.md).

## When is it okay to change the name of my extension?

Starting from [!INCLUDE[prod_short](../includes/prod_short.md)] 2021 release wave 2 (version 19.0), it's possible to change the name of your extensions without breaking dependent extensions.

When renaming an extension, you must:

- increment the version number in the manifest of your extension,
- make sure that your submission only targets releases of [!INCLUDE[prod_short](../includes/prod_short.md)] starting from 19.0.
- update the name of your offer in Partner Center - if your extension is the one for which the offer is created.

## When is it okay to change the publisher of my extension?

When changing the publisher of an extension, you must:

- increment the version number in the manifest of your extension,
- make sure that your submission only targets releases of [!INCLUDE[prod_short](../includes/prod_short.md)] starting from 19.0,
- contact d365val@microsoft.com in order to register your affixes to your new publisher name.

## When is it okay to change the App ID of my extension?

> [!IMPORTANT]  
> The App ID is a critical part of the identity of apps in [!INCLUDE[prod_short](../includes/prod_short.md)], and changing it is a breaking change for all extensions depending on it. You should then not change the App ID of extensions which are installed for customers in Business Central Online.

If you're submitting a new version of your extension with a different App ID for an existing offer, then this new version is considered as a different extension. This means that all extensions that depend on the extension with the old app ID must be updated to reference the new App ID. If they aren't updated, this causes issues such as customer environment upgrade failures, which must be fixed within the required time period, see [Maintain AppSource Apps and Per-Tenant Extensions in Business Central Online](app-maintain.md). Since the app ID is part of how data is stored in [!INCLUDE[prod_short](../includes/prod_short.md)], this also means that you have to migrate the data for all customers that have the extension with the old App ID installed. We don't provide tools for performing data migration in SaaS, but you can create your own solution to export data from the old extension and reimport the data after the extension change.

## Is it possible to have multiple apps with the same App ID in AppSource? 

Each unique codebase has one unique ID. If you have four apps in AppSource, you need to have four unique IDs for these apps. Otherwise you get conflicts. 

## What if we already have an app on AppSource but we need to create the same app for another country/region; can we then have the same app ID for two different apps targeting two different countries/regions? 

If they're different apps (different code), they should have different identity. Identity is used in, for example, app management, dependencies, support cases, and telemetry. If reused across different apps, identity uniqueness is lost. Another approach could be a common shared (internal/library) app across countries/regions (with one app identity) and localized functionality as extensions on top (with their own identity). 

## Related information

[Technical validation checklist](devenv-checklist-submission.md)
