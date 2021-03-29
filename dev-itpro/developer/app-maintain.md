---
title: "Maintain AppSource apps and per-tenant extensions"
description: "Learn about resources available to you as the publisher of an app or per-tenant extension for keeping your code in compliance with the base product."
author: edupont04
ms.custom: na
ms.date: 10/01/2020
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: edupont
---
# Maintain AppSource Apps and Per-Tenant Extensions in Business Central Online

As a partner, keeping your apps and per-tenant extensions (PTEs) up to date is your responsibility. [!INCLUDE [prod_short](includes/prod_short.md)] is regularly updated with major and minor releases. These updates provide customers with a business application that is always compliant, secure, and enriched with new platform and application functionality. Often customers choose [!INCLUDE [prod_short](includes/prod_short.md)] because of this promise of having an always up-to-date business solution.  

To not break this promise, developers that bring apps to Microsoft AppSource, and resellers that provide PTEs to respond to the unique needs of customers, have a responsibility to align their code to the Microsoft release rhythm.  

An inability for Microsoft to update tenants because of publishers incompatible code causes serious disruption in the service and must be avoided since it impacts the trustworthiness of the service and customer satisfaction.  

## Resources

To help app publishers keep up with their update responsibilities, Microsoft provides the following resources:

- Release plans about what's new and planned

    For more information, see [Dynamics 365 release plans](/dynamics365/release-plans/).  

- Access to pre-release bits

    Business Central partners have access to the next major, next minor, and daily pre-release bits in Docker. These bits can be used to test apps against upcoming updates.  

- Information about what will be deprecated

    With all [!INCLUDE [prod_short](includes/prod_short.md)] releases, Microsoft controls and regulates breaking changes with major releases and [communicates upcoming breaking changes](../upgrade/deprecated-features-w1.md) at least one year in advance. If developers missed this above info, the compiler in Visual Studio Code also [warns for potential controls that will become obsolete](analyzers/appsourcecop-as0074-obsoletetagdifferentfrombaselinenotallowed.md) in future versions and how to deal with them.  

- Policy definitions and terms

    The publisher agreement and [the commercial marketplace certification policies](/legal/marketplace/certification-policies#1400-dynamics-365-business-central) describe the responsibilities of app providers for how to publish and maintain apps in the Microsoft monthly rhythm.  

    When a PTE gets installed, the publisher also agrees to the terms to keep that code current and updatable.  

- Training and coaching

    Microsoft provides a set of tools, [training](/learn/browse/?WT.mc_id=dyn365bc_landingpage-docs&products=dynamics-business-central&roles=developer), and documentation to help partners find the info they need to keep up with these responsibilities on continuous integration and continuous deployment. External providers, including ISV Development Centers, MasterVARs, and training centers, can provide in-person training and coaching.  

- Service notifications

    [!INCLUDE [prod_short](includes/prod_short.md)] online will support app and PTE publishers with extra warnings about potential technical incompatibility. If publishers respond to these notifications in due timing and avoid incompatibilities repeatedly, Microsoft will stand with these publishers to help where needed. If a publisher includes a telemetry key in their app, then, starting with 2020 release wave 2, [!INCLUDE [prod_short](includes/prod_short.md)] also provides publishers with telemetry about upgrade failures that happen in production because of issues in the publisher's upgrade code.

If publishers lack to keep their code updatable, they risk that ultimately their apps or PTEs will be removed from the customer's tenant, and this will most likely result in important data not being captured as it should. For apps, this also means removal from the marketplace.  

Since resellers are the first line contact point for customers, they carry responsibility to explain what it means to load code in a customer's environment. The best way is to explain this is with terms.  

We advise these terms include topics like intellectual property rights, upgrade responsibilities, associated costs to keep code updatable, support options, data privacy, and so on.  

## Pre-release publisher support to keep apps and PTEs compatible and up-to date

Publishers have several tools available for them to keep their code in good shape. Not least, a Public Preview release is made available approximately one month before the announced release date for a major release. In that Public Preview release time frame, [!INCLUDE [prod_short](includes/prod_short.md)] will automatically test and notify publishers of existing apps and PTEs running in production on technical incompatibility with the upcoming release.  

> [!IMPORTANT]
> Microsoft tests code based on technical compatibility. As the publisher, you are still responsible for all functional and logical validation.

## When apps or PTEs cannot be updated by Microsoft

This section describes the processes that are initiated during and after upgrade attempts of code provided by publishers of apps or PTEs.  

- **T1 – T30**: Microsoft alerts administrators, resellers, and ISVs

    Shortly after a service update of [!INCLUDE [prod_short](includes/prod_short.md)] online (Day **T**), Microsoft will initiate daily updates attempts on all tenants. In these update attempts, the publisher's provided upgrade code is triggered and run. These attempts run repeatedly in a time frame of approximately one month until the upgrade is successful. For more information, see [Major Updates of Business Central Online](../administration/update-rollout-timelime.md).  

    With every unsuccessful upgrade attempt, stakeholders will receive notifications. Customers and their reselling partners can follow these notifications in the [!INCLUDE [prodadmincenter](includes/prodadmincenter.md)].  

    ISVs who provide third-party AppSource apps might not be listed in the customer's admin center. The reseller will in most cases have worked with the ISV to test compatibility, but after two weeks (Day **T+15**) of failed upgrade attempts, the Microsoft AppSource team will also send the app provider a warning message that action within the next few days is required.  

    This message will explain that if they fail to respond correctly, their app will be removed from AppSource at Day **T+30**.  

- **T30 – T60**: Microsoft alerts the customer

    After one month of failed upgrade attempts (Day **T+30**), the customers will be notified again that apps or PTEs are incompatible with the new version of [!INCLUDE [prod_short](includes/prod_short.md)], and that no further automatic upgrade attempts will be planned until further notice. Although the publisher's code continues to run on an outdated version of [!INCLUDE [prod_short](includes/prod_short.md)] online, the customer must work with their reseller to resolve these issues immediately so that the tenant can be updated. Next to messages in the [!INCLUDE [prodadmincenter](includes/prodadmincenter.md)], all users in the customer's tenant will also get more active warning about the incompatibilities when they use the product in the browser or their mobile device.  

    For AppSource apps, if no appropriate action or follow-up was taken by the publisher since the release (**T - T+30days**), the app will be removed from AppSource. This means no new customer will be able to install the app in a new tenant. The main reason for removing an app from the marketplace is to ensure that no new customers will be affected by incompatibilities with the latest version of the base product, [!INCLUDE [prod_short](includes/prod_short.md)].  

    If the publisher wants to have their app available again, they must mitigate all existing incompatibility issues and go through the full validation process again.  

    If the source of the incompatibility has been resolved by the publisher, they'll have to submit a support request to schedule a new set of upgrade attempts for any tenants that are blocked because of this incompatibility. They'll also have to work with their resellers to inform them about the compatibility resolution.  

- **T60 – T150**: Microsoft initiates the customer wind-down period

    If the incompatibility issues are not resolved at **T+60**, and the publisher remained unresponsive to the request to resolve the incompatibility, Microsoft may choose to send out a wind-down communication to the customer about removal of the publisher's code.  

    This communication will share that the code from the publisher will be removed in *90* days (**T+150**).  

    During this wind-down time, the customer and their reselling partner are fully responsible for finding a solution on how to proceed in this situation. If the customer decides to leave [!INCLUDE [prod_short](includes/prod_short.md)], or decides to use another publisher, they can access their data by [exporting the database](../administration/tenant-admin-center-database-export.md), use [RapidStart Services](/dynamics365/business-central/admin-migrate-customer-data), or copy data to Excel. For more information, see [Exporting Your Business Data to Excel](/dynamics365/business-central/about-export-data) in the business functionality content.  

    Microsoft may also choose to remove all existing apps by this publisher from AppSource and block the publisher from publishing new apps for [!INCLUDE [prod_short](includes/prod_short.md)].  

    If this wind-down period is initiated, and the customer was able to fix the incompatible issues with their reseller and potential publishers, it will be at Microsoft discretion if the publisher's code will be removed from [!INCLUDE [prod_short](includes/prod_short.md)] or not.  

### Get notified about incompatibilities by Microsoft

It is crucial for you to keep contact details correctly up to date. We advise you to use global team aliases instead of individual mail addresses. Here are the mail addresses that we'll use in the above process:  

- PTE publishers

    The mail addresses specified in the [!INCLUDE [prodadmincenter](includes/prodadmincenter.md)]; this could be both a customer user and a partner user.  

- App publishers

    The mail addresses specified during App publication in the partner center during app publication as support and engineering contact details.  

- Customers

    The mail addresses specified in the [!INCLUDE [prodadmincenter](includes/prodadmincenter.md)]; this could be both a customer and a partner user.  

## See also

[The Lifecycle of Apps and Extensions](devenv-app-life-cycle.md)  
[Update Lifecycle for Customizations](devenv-customization-update-lifecycle.md)  
[Microsoft Responsibilities for Apps on Business Central online](../deployment/microsoft-responsibilities.md)  
[Technical Support for Business Central online](../technical-support.md)  
[Sending Extension Telemetry to Azure Application Insights](devenv-application-insights-for-extensions.md)  
