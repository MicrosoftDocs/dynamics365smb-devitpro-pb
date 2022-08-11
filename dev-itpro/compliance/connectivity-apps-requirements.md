---
title: Requirements for connectivity apps
description: Learn about connectivity apps, what they can do to increase business productivity, and how to get your app listed as a connectivity app.
ms.date: 08/03/2022
ms.topic: conceptual
author: sorenfriisalexandersen
ms.author: soalex
ms.reviewer: edupont
---

# Requirements for Connectivity Apps

To get a connectivity app listed in [!INCLUDE [prod_short](../includes/prod_short.md)] online, the app publisher must follow certain requirements and best practices. This article explains these requirements and how to apply to have your connectivity app included.

## What are connectivity apps?

Connectivity apps in [!INCLUDE [prod_short](../includes/prod_short.md)] easily and securely connect to external services, such as banks, automating otherwise manual tasks and thereby improving business productivity. Connectivity apps as a feature are described here:

* Connect to banks (Available with [!INCLUDE [prod_short](../includes/prod_short.md)] 2022 release wave 2)
* Connect to payroll providers (not yet available)

## What connectivity app publishers need to know

Connectivity apps are AppSource apps for [!INCLUDE [prod_short](../includes/prod_short.md)] online purposely built by independent software vendors (ISVs) to provide customers with a truly connected experience. Such apps connect [!INCLUDE [prod_short](../includes/prod_short.md)] to various types of external providers and bring relevant functionality to running a business in the cloud. This is a sample list of types of apps for boosting productivity:

* Import bank transactions  
* Initiate payment transfers  
* Manage employee payroll  
* Send and receive electronic invoices  

Publishers of connectivity apps benefit from in-product visibility. They also have these responsibilities for their apps:

* Extra app compatibility requirements

    Publishers of connectivity apps must ensure continuous compatibility with the latest version of [!INCLUDE [prod_short](../includes/prod_short.md)], meaning they can be upgraded to the next minor and major version. In addition, publishers must be proactive in their approach to compatibility.

* Test coverage

    The connectivity app publisher also provides automated testing during Microsoft AppSource submission. These tests must cover more than 85 percent of the app's functionality.

* Sales volume requirements

    Sales volume requirements ensure the app provider is constantly serving a critical mass of customers per listed country, and is continuously growing its customer base. The concrete sales volume requirements may change over time and for various markets. 
    Currently, an app is eligible for review to be included as a Connectivity App if it has 10 paying customers in the primary country and the ISV commits to 25 paying customers in the country after a 6 months ramp-up period. The 6 months ramp-up period starts with the release of the [!INCLUDE [prod_short](../includes/prod_short.md)] update that includes the app in the listing of Connectivity Apps.

* Providing best-in-class experiences

    The connectivity app council, consisting of Microsoft experts and best-in-class app publishers, will a) review the user experience of aspiring connectivity apps, and b) perform recurring reviews of existing connectivity apps experiences. The council will comment on a submitted application's functionality, user experience, use of onboarding components, and other considerations that influence the customer experience with the app and the support experience. The guidance and feedback given by the council is expected to be implemented by the applying app publisher.  

* Functional app recommendations and requirements

    Publishers of connectivity apps are advised to follow these guidelines to get the best possible review from the connectivity apps council:

  * Use elements of the onboarding framework in your app. This ensures an assisted setup initiates after app installation is complete, or can easily be found in extensions management. Use of teaching tips for education of the user etc. Read more about [Onboarding Experiences](../administration/onboarding-experiences.md).
  * Include only the functionality that serves the core purpose of the app. To that end, if your app brings banking connectivity, it should not contain all other financial functionality that depends upon bank data. Stick to the core functionality and offer additional functionality in other apps.
  * Have either a **get it now** or **free trial** call to action when published on AppSource. No apps of requiring a customer to **contact me** is allowed.
  * Provide cloud connectivity to one or more banks if it's a bank connectivity app, and enable the [!INCLUDE [prod_short](../includes/prod_short.md)] user to retrieve account and transaction information and initiate single domestic payments. Connections can be made directly to the banks’ API or through an aggregator of bank APIs. This seamless integration is key to a positive user experience.

* Regulatory compliance

    Connectivity apps must comply with local regulatory, security, and data protection requirements such as PSD2. In markets where PSD2 and similar regulation are used, it's the publisher's responsibility to ensure the necessary licenses are in place, such as account information service provider (AISP) and payment information service provider (PISP) licenses. Many aggregators of bank APIs offer an agent model where the app publisher is an agent of the aggregator and uses the aggregator's AISP or PISP licenses. If that's not possible, as when integrating directly with banks' APIs, it's necessary for the app publisher to provide the licenses. Failure to comply not only results in rejection from the connectivity apps list, but also rejection by AppSource.

## Get the app listed as a connectivity app

If you fulfill the requirements outlined above, you can apply to get listed by sending an e-mail to [Business Central Connectivity Apps Requests](mailto:bc-connectivity-apps@microsoft.com).

Make sure you specify the following:

* App ID
* App Name
* Publisher Name
* Publisher ID
* Connectivity type, for example "banking"
* Country where you want your app to be listed

## How often is the list of connectivity apps updated?

ISVs may submit applications continuously, and quarterly reviews will be scheduled. If an app fulfills the requirements to become a connectivity app, the ISV is notified immediately and will coordinate with Microsoft for addition to the list at the earliest possible convenience. 

> [!NOTE]  
> The requirements to become a connectivity app as listed above may change over time. The changes will be reflected on this page, so make sure you follow the recommendations and requirements here to make sure your app complies with the current rules.
