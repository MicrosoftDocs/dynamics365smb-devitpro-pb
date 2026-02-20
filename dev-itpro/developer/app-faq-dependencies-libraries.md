---
title: "FAQ about Library & Dependency Apps in Business Central"
description: "Get answers to some of your questions about library apps and dependency apps in Dynamics 365 Business Central"
author: freddyk
ms.date: 04/01/2021
ms.reviewer: jswymer
ms.topic: faq
ms.author: freddyk
---

# FAQ about Library and Dependency Apps in Business Central

This section contains answers to frequently asked questions about library apps and dependency apps in [!INCLUDE[prod_short](includes/prod_short.md)].

## What is a library app?

A library app contains common code that other apps depend on. If you're going to have multiple Marketplace apps that all share common code, such as licensing, registration, and so on, you can put that common code into a library app and have the Marketplace apps depend on the library app.

## How does the library app get installed to a tenant?

A library app doesn't appear on Marketplace. It only lives in [!INCLUDE[prod_short](includes/prod_short.md)]. Our service is built to install the library apps behind the scenes. Here's how it works. Customers find an app they want to install on Marketplace. That customer doesn't know the app even has library app(s). When they select to install the app, our service looks into that apps json/manifest to see if it first needs to install any library/dependency apps it may depend on. If so, it installs them first before installing the main Marketplace app.

## What is a dependency app?

A dependency app isn’t much different from a library app. A dependency app does have its own offer on Marketplace. For example, you might have Marketplace “App A” that serves a purpose on its own and is listed on Marketplace. You then also have “App B” as its own offer on Marketplace but it does depend on code within “App A” and needs “App A” to be installed before it can be installed. This is really the only difference though. Behind the scenes, library and dependency apps behave the same when it comes to walking that dependency chain and auto installing any app the top-level app depends on.

## Can I have multiple library apps for my Marketplace app?

Yes. Just make sure you list all library apps as dependencies within the Marketplace app json file/manifest.

## When I get the latest updated version of my app, why don't I get the updated library/dependency apps that my Marketplace app depends on?

Libraries are updated only when the new version of your app requires a higher version than the version currently installed in your environment. If you want your library app to be automatically updated when your Marketplace app is updated, you must increase the minimum version required in the manifest (app.json) of your Marketplace app. 

You can also uninstall and reinstall the library/dependency app to have it updated.

## What are the validation requirements for library apps
Library apps only get validated technically, but don't go through any type of marketing validation. The technical requirements are described [here](devenv-checklist-submission.md).  

## Related information

[FAQ about Managing and Submitting your Business Central Offer](app-faq-offer.md)  
[FAQ about Updating your Business Central App](app-faq-update.md)  
[Update Lifecycle for Marketplace Apps FAQ](devenv-update-app-life-cycle-faq.md)  
[The Lifecycle of Apps and Extensions for Business Central](devenv-app-life-cycle.md)  
