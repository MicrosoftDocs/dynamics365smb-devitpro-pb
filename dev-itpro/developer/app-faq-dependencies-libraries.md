---
title: "FAQ about Library & Dependency Apps in Business Central"
description: "Get answers to some of your questions about library apps and dependency apps in Dynamics 365 Business Central"
author: rweigel
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: edupont
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: freddyk
---

# FAQ about Library and Dependency Apps in Business Central

This section contains answers to frequently asked questions about library apps and dependency apps in [!INCLUDE[prod_short](includes/prod_short.md)].

## What is a library app?

A library app contains common code that other apps depend on. If you are going to have multiple AppSource apps that all share common code, such as licensing, registration,and so on, you can put that common code into a library app and have the AppSource apps depend on the library app.

## How does the library app get installed to a tenant?

A library app does not appear on AppSource. It only lives in [!INCLUDE[prod_short](includes/prod_short.md)]. Our service is built to install the library apps behind the scenes. Here is how it works. Customers finds an app they want to install on AppSource. That customer does not know the app even has library app(s). When they click to install the app, our service looks into that apps json/manifest to see if it first needs to install any library/dependency apps it may depend on. If so, it installs them first before installing the main AppSource app.

## What is a dependency app?

A dependency app isn’t much different from a library app. A dependency app does have its own offer on AppSource. For example, you might have AppSource “App A” that serves a purpose on its own and is listed on AppSource. You then also have “App B” as its own offer on AppSource but it does depend on code within “App A” and needs “App A” to be installed before it can be installed. This is really the only difference though. Behind the scenes, library and dependency apps behave the same when it comes to walking that dependency chain and auto installing any app the top-level app depends on.

## Can I have multiple library apps for my AppSource app?

Yes. Just make sure you list all library apps as dependencies within the AppSource app json file/manifest.

## When I get the latest updated version of my app, why don't I get the updated library/dependency apps that my AppSource app depends on?

Currently, updating of apps does not handle the library/dependency chain. This work is planned for a future release. For now, you need to uninstall and reinstall the library/dependency apps as well.

## What are the validation requirements for library apps
Library apps only get validated technically, but don't go through any type of marketing validation. Also, the library apps are expected to be covered by the user scenarios and tests that you submit for the core app. The technical requirements are described [here](devenv-checklist-submission.md).  

## See also

[FAQ about Managing and Submitting your Business Central Offer](app-faq-offer.md)  
[FAQ about Updating your Business Central App](app-faq-update.md)  
[Update Lifecycle for AppSource Apps FAQ](devenv-update-app-life-cycle-faq.md)  
[The Lifecycle of Apps and Extensions for Business Central](devenv-app-life-cycle.md)  
