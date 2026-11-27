---
title: "FAQ about Library & Dependency Apps in Business Central"
description: "Learn how Business Central library and dependency apps are installed, validated, and updated, including manifest requirements and Marketplace offers."
author: SusanneWindfeldPedersen
ms.date: 11/27/2026
ms.reviewer: jswymer
ms.topic: faq
ai-usage: ai-assisted
ms.author: solsen
---

# FAQ about library and dependency apps in Business Central

Find answers about packaging, installing, validating, and updating library and dependency apps for [!INCLUDE[prod_short](includes/prod_short.md)].

## What is a library app?

A library app contains common code that other apps depend on. For example, multiple Marketplace apps can share licensing or registration code from a library app.

## How does the library app get installed to a tenant?

You can distribute a library app as a dependency without its own Marketplace offer. It can also have its own offer. When a customer installs your Marketplace app, the service checks the dependencies in its `app.json` manifest. It installs missing required dependency apps before installing the main app.

## What is a dependency app?

A dependency app is an app that another app requires. It can have its own Marketplace offer and serve a purpose on its own.

For example, App A has its own Marketplace offer. App B also has an offer, but depends on code in App A. App A must be installed before App B can be installed. In this scenario, App A is both a standalone app and a dependency of App B. A library app can also have its own offer. The service resolves required apps through the dependency chain.

## Can I have multiple library apps for my Marketplace app?

Yes. List the required library apps in the `dependencies` section of your Marketplace app's `app.json` manifest.

Learn more about [manifest settings](devenv-json-files.md#appjson-file).

## When I get the latest updated version of my app, why don't I get the updated library/dependency apps that my Marketplace app depends on?

Updating your main app doesn't necessarily update a dependency if the installed version already satisfies the minimum version in `app.json`. To require a newer library or dependency version when your main app is updated, increase that dependency's minimum version in your main app's manifest.

Administrators can also update installed dependency apps from **Manage Apps**. Dependencies can update during environment updates according to the app update cadence and compatibility requirements.

You can also uninstall and reinstall the library or dependency app to get the latest available compatible version. You must also uninstall apps that depend on it. Retain application data if you need it for the reinstall, and plan the operation for a maintenance window.

Learn more about [managing app updates](../administration/tenant-admin-center-manage-apps.md) and [uninstalling and reinstalling apps](devenv-app-life-cycle.md#how-microsoft-handles-your-app).

## What are the validation requirements for library apps

Required library apps included in your submission undergo technical validation. A library distributed only as a dependency without its own offer doesn't have a separate Marketplace listing to validate. If the library has its own offer, that offer is subject to marketing validation. Submitting the library through another app's offer doesn't automatically update the library's own listing.

Learn more about [technical validation requirements](devenv-checklist-submission.md) and [which apps are validated in a submission](devenv-checklist-submission-validation-process.md#which-apps-are-validated-in-my-submission).

## Related information

[FAQ about managing and submitting your Business Central offer](app-faq-offer.md)  
[FAQ about updating your Business Central app](app-faq-update.md)  
[Update lifecycle for Marketplace apps FAQ](devenv-update-app-life-cycle-faq.md)  
[The lifecycle of apps and extensions for Business Central](devenv-app-life-cycle.md)  
