---
title: "Using Application Family in Embed App"
author: jswymer
ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
ms.date: 07/29/2020
---

# Using Application Family in [!INCLUDE[embed app](../developer/includes/embedapp.md)]

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] service is a part of rich ecosystem of surrounding applications and services. One of the prominent [!INCLUDE[embed app](../developer/includes/embedapp.md)] capabilities is to promote and use the ISV [brand](embed-app-overview.md#partner-branding) in various places of the overall service experience.

During onboarding, the ISV provides the application family name. The application family helps identify their solution among other [!INCLUDE[prodshort](../developer/includes/prodshort.md)] apps and [!INCLUDE[embed app](../developer/includes/embedapp.md)]'s of other ISVs.  

The following table describes different aspects of using the application family when interacting with Business Central components and surrounding services.  

|Area|How to use with the Embed application family|Additional details|
|----|--------------------------------------------|------------------|
|[!INCLUDE[webclient](../developer/includes/webclient.md)] |Use the application family in the URL:<br /><br />`[application family].bc.dynamics.com` |[Web Client URL](../developer/devenv-web-client-urls.md) |
|[!INCLUDE[prodshort](../developer/includes/prodshort.md)] web services|Use the application family in the URL:<br /><br />`[application family].api.bc.dynamics.com`|[Introduction to automation APIs](../administration/itpro-introduction-to-automation-apis.md)|
|[!INCLUDE[prodshort](../developer/includes/prodshort.md)] mobile app|Use the application family in the URL:<br /><br />`ms-businesscentral://[application family].bc.dynamics.com/` |[Getting Business Central on Your Mobile Device](/dynamics365/business-central/install-mobile-app) |
|[!INCLUDE[prodshort](../developer/includes/prodshort.md)] administration center|Application family is displayed for each environment |[The Business Central Administration Center](../administration/tenant-admin-center.md) |
|In-code URL generation (GETURL) |GETURL returns the branded endpoint, including the application family. |[GetUrl Method](../developer/methods-auto/system/system-geturl-clienttype-string-objecttype-integer-table-boolean-method.md)|
|Development endpoint for Visual Studio Code|To publish and debug apps in a Sandbox environment, use the "applicationFamily" property in the launch.json file |[JSON Files](../developer/devenv-json-files.md) |
|Microsoft AppSource|To install AppSource apps, use the branded URL with the following parameters:<br /><br />`https://[application family].bc.dynamics.com/?noSignUpCheck=1&filter=%27ID%27%20IS%20%27[APP ID]%27&page=2503` |Installing apps by selecting a direct app link in AppSource (for example, "Get it now" or "Free trial") isn't supported. This action redirects to the standard Business Central URL. |
|Microsoft Power BI|Supported for connecting to the environment data from Power BI and embedding Power BI pages in the [!INCLUDE[webclient](../developer/includes/webclient.md)].  |[Enabling Your Business Data for Power BI](/dynamics365/business-central/admin-powerbi) |
|Outlook Add-in | Not supported | [Using Business Central as your Business Inbox in Outlook](/dynamics365/business-central/admin-outlook)|
|Excel Add-in|Supported|[Setting up the Excel Add-In for Editing Business Central Data](../administration/configuring-excel-addin.md)|
|CDS integration| Supported  |[Integrating with Common Data Service](/dynamics365/business-central/admin-common-data-service)|
|Power Automate, Power Apps, Logic apps |[!INCLUDE[prodshort](../developer/includes/prodshort.md)] standard connector currently can't be used (support is coming soon). The ISV needs to build a custom connector. The custom connector is required anyway, also for the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] environments, if you want to include data from other tables that aren't included with the standard [!INCLUDE[prodshort](../developer/includes/prodshort.md)] connector. |[Custom connector FAQ for Azure Logic Apps, Power Automate, and Power Apps](/connectors/custom-connectors/faq)|  
|Cloud Migration Tool|Supported|[Migrating On-Premises Data to Business Central Online](../administration/migrate-data.md)|


## See Also

[[!INCLUDE[embedapp](../developer/includes/embedapp.md)] Overview](embed-app-overview.md)  
[Licensing in Dynamics 365 Business Central](licensing.md)  
[Components and Capabilities](app-components.md)  
[Microsoft Responsibilities for Apps on Business Central online](microsoft-responsibilities.md)  
[Preparing Demonstration Environments of [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](../administration/demo-environment.md)  
[Preparing Test Environments of [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](../administration/test-environment.md)  
