---
title: "Maintain AppSource apps and per-tenant extensions"
description: "Learn about resources available to you as the publisher of an app or per-tenant extension for keeping your code in compliance with the base product."
author: solsen
ms.date: 02/28/2024
ms.topic: conceptual
ms.author: solsen
ms.reviewer: solsen
---

# Maintain AppSource apps and Per-Tenant extensions in Business Central online

As a partner, keeping your apps and per-tenant extensions (PTEs) up to date is your responsibility. [!INCLUDE [prod_short](includes/prod_short.md)] is regularly updated with major and minor releases. These updates provide customers with a business application that is always compliant, secure, and enriched with new platform and application functionality. Often customers choose [!INCLUDE [prod_short](includes/prod_short.md)] because of the promise of having an always up-to-date business solution.  

To not break this promise, developers that bring apps to Microsoft AppSource, and resellers that provide PTEs to respond to the unique needs of customers, have a responsibility to align their code to the Microsoft release rhythm. For more information, see [major updates and minor updates](../administration/update-rollout-timeline.md). An inability for Microsoft to update tenants because of publishers' incompatible code causes serious disruption in the service and must be avoided since it impacts the trustworthiness of the service and customer satisfaction.  

## Resources

To help app publishers keep up with their update responsibilities, Microsoft provides the following resources:

- Release plans about what's new and planned

    For more information, see [Dynamics 365 release plans](/dynamics365/release-plans/).  

- Access to pre-release bits

    Business Central partners have access to the next major, next minor, and daily pre-release bits in Docker available to all customers and partners through bcinsider artifacts. Use the pre-release bits to test apps against upcoming updates.  

    Learn about [the update lifecycle for apps and extensions](devenv-app-life-cycle.md) and [automated extension validation](devenv-customization-update-lifecycle.md#automated-extension-validation). Use the [AppSourceCop analyzer rules](analyzers/appsourcecop.md) to keep your code compliant. Get agile with [AL Go for GitHub](../al-go/algo-overview.md) and stay on top of changes that way.  

- Information about what will be deprecated

    With all [!INCLUDE [prod_short](includes/prod_short.md)] releases, Microsoft controls and regulates breaking changes with major releases and [communicates upcoming breaking changes](../upgrade/deprecated-features-w1.md) at least one year in advance. If developers missed this above info, the compiler in Visual Studio Code also [warns for potential controls that will become obsolete](analyzers/appsourcecop-as0074.md) in future versions and how to deal with them. Use the analyzers actively to make sure your code is ready for the next update.  

- Policy definitions and terms

    The publisher agreement and [the commercial marketplace certification policies](/legal/marketplace/certification-policies#1400-dynamics-365-business-central) describe the responsibilities of app providers for how to publish and maintain apps in the Microsoft monthly rhythm.  

    When a PTE gets installed, the publisher also agrees to the terms to keep that code current and updatable.  

- Training and coaching

    Microsoft provides a set of tools, [training](/learn/browse/?WT.mc_id=dyn365bc_landingpage-docs&products=dynamics-business-central&roles=developer), and documentation to help partners find the info they need to keep up with these responsibilities on continuous integration and continuous deployment. External providers, including ISV Development Centers, MasterVARs, and training centers, can provide in-person training and coaching.  

- Service notifications

    [!INCLUDE [prod_short](includes/prod_short.md)] online will support app and PTE publishers with extra warnings about potential technical incompatibility. If publishers respond to these notifications in due timing and avoid incompatibilities repeatedly, Microsoft will stand with these publishers to help where needed. If a publisher includes a telemetry key in their app, then, [!INCLUDE [prod_short](includes/prod_short.md)] also provides publishers with telemetry about upgrade failures that happen in production because of issues in the publisher's upgrade code.

If publishers lack to keep their code updatable, they risk that ultimately their apps or PTEs will be removed from the customer's tenant, and this will most likely result in important data not being captured as it should. For apps, this also means removal from the marketplace.  

Since resellers are the first line contact point for customers, they carry responsibility to explain what it means to load code in a customer's environment. The best way is to explain this is with terms.  

We advise these terms include articles like intellectual property rights, upgrade responsibilities, associated costs to keep code updatable, support options, data privacy, and so on.  

## When apps or PTEs can't be updated by Microsoft

This section describes the processes that are initiated during [major update cycles](../administration/update-rollout-timeline.md) of [!INCLUDE [prod_short](includes/prod_short.md)] with extensions installed provided by publishers of apps or PTEs. For information about handling a PTE that has conflicts with another extension, see [Upgrading Per-Tenant Extensions that Conflicts with Other Extensions](../upgrade/upgrade-pte-merge-conflict.md).

### Preview period
A preview release is made available approximately one month before the announced release date for a major release. During this period, administrators can create sandbox environments on the preview version to test new functionality and app compatibility, and [!INCLUDE [prod_short](includes/prod_short.md)] will automatically test PTEs running in production on technical incompatibility with the upcoming release and notify [notification recipients](../administration/tenant-admin-center-notifications.md) in case any incompatibilities are detected. For more information, see [prepare for major updates with preview environments](../administration/preview-environments.md).

> [!IMPORTANT]
> Microsoft tests code based on technical compatibility. As the publisher, you are still responsible for all functional and logical validation. For more information, see [The Lifecycle of Apps and Extensions for Business Central](devenv-app-life-cycle.md).

> [!NOTE]  
> If an app has been published through AppSource, it should not be tested, installed, or in other ways treated as a PTE since this will create conflicts.

### Update period
The update period starts when a new major version is generally available, typically the first workday of every April and October, and lasts for five months. Administrators can schedule the update to run on any day during this period. Should a scheduled update fail due to technical incompatibilities with installed apps, [notification recipients](../administration/tenant-admin-center-notifications.md) will receive a notification with failure details and recommended actions.

Technical incompatibilities with AppSource apps installed on the environment might not be visible in the customer's [!INCLUDE [prodadmincenter](includes/prodadmincenter.md)]. AppSource Apps that are incompatible with the latest generally available version of [!INCLUDE [prod_short](includes/prod_short.md)] may be removed from AppSource **30 days** after the release of that version. If an incompatible AppSource app, PTE, or Dev Extension is preventing the deployment of a critical security update, it may be uninstalled within **14 days** of the critical security update first becoming available.

> [!IMPORTANT]
> For 2024 release wave 2, the 5-month update period is in [public preview](/dynamics365/release-plan/2024wave2/smb/dynamics365-business-central/manage-environment-updates-more-flexibly.md) and only applies to [Microsoft-localized environments](../compliance/apptest-countries-and-translations.ms).
>
> Partner-localized environments have a 60-day update period for the 25.0 update which is expected to end in the first half of December 2024.

### Grace period
The grace period starts when the update period ends and lasts for one month, every September for the update period that starts in April and every March for the update period that starts in October. During the grace period the update cannot be rescheduled to a later date and will run. Should a scheduled update fail due to technical incompatibilities with installed apps, [notification recipients](../administration/tenant-admin-center-notifications.md) will receive a notification with failure details and recommended actions. Although the publisher's code continues to run on an outdated version of [!INCLUDE [prod_short](includes/prod_short.md)] online, the customer must work with their reseller to resolve these issues immediately so that the environment can be updated. Next to messages in the [!INCLUDE [prodadmincenter](includes/prodadmincenter.md)], all users in the customer's tenant may also get more active warnings about the incompatibilities when they use the product in the browser or their mobile device.

For AppSource apps, if no appropriate action or follow-up was taken by the publisher since the release, the app may be removed from AppSource. This means no new customer will be able to install the app in a new tenant. This ensures that no new customers will be affected by incompatibilities with the latest version of [!INCLUDE [prod_short](includes/prod_short.md)]. If the publisher wants to have their app available again, they must mitigate all existing incompatibility issues and go through the full validation process again. Once a compatible version of the app has been published, the update to the app will automatically be installed once environments are updated.

### Enforced update period
The enforced update period starts when the grace period ends. During this period any extensions that are causing the update to the next major version to fail, for example because of compatibility issues, may be uninstalled from the environment automatically in order for the update to succeed. Data belonging to extensions that are uninstalled automatically during this period is not deleted from the environment and can be recovered by installing a version of the extension that is compatible after the update succeeds. Once a compatible version of an app is made available it will not automatically be installed on each environment from which it was uninstalled as part of the enforced update period.

During this period, the customer and their reselling partner are fully responsible for finding a solution on how to proceed in this situation. Microsoft may also choose to remove all existing apps by this publisher from AppSource and block the publisher from publishing new apps for [!INCLUDE [prod_short](includes/prod_short.md)].  

## Get notified about incompatibilities by Microsoft

It's crucial for you to keep contact details correctly up to date. We advise you to use global team aliases instead of individual mail addresses. Here are the mail addresses that we'll use in the process that is described in the [When apps or PTEs can't be updated by Microsoft](#when-apps-or-ptes-cant-be-updated-by-microsoft) section:  

- PTE publishers

    The mail addresses specified in the [!INCLUDE [prodadmincenter](includes/prodadmincenter.md)]; this could be both a customer user and a partner user.  

- App publishers

    The mail addresses specified during app publication in the partner center during app publication as support and engineering contact details.  

- Customers

    The mail addresses specified in the [!INCLUDE [prodadmincenter](includes/prodadmincenter.md)]; this could be both a customer and a partner user.  

## See also

[The Lifecycle of Apps and Extensions](devenv-app-life-cycle.md)  
[Update Lifecycle for Customizations](devenv-customization-update-lifecycle.md)  
[Microsoft Responsibilities for Apps on Business Central online](../deployment/microsoft-responsibilities.md)  
[Technical Support for Business Central online](../technical-support.md)  
[Sending Extension Telemetry to Azure Application Insights](devenv-application-insights-for-extensions.md)  
[Major Updates and Minor Updates for Business Central Online](../administration/update-rollout-timeline.md)  

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
