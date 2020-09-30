---
title:  Page View Telemetry | Microsoft Docs
description: Learn about the page views telemetry in Business Central  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 10/01/2020
ms.author: jswymer
---
# Analyzing Page View Telemetry

**INTRODUCED IN:** [!INCLUDE[prodshort](../developer/includes/prodshort.md)] 2020 release wave 1, version 16.3

Page view telemetry gathers data about the pages that users open in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] client. Each page view tells you how long it took to open the page, information about the user's environment, and more.

Use the data to gather statistics about system usage and also troubleshoot performance issues caused by the users' environments.

> [!NOTE]
> In Application Insights, telemetry about page views is logged to the **pageViews** table and not the **traces** table like other [!INCLUDE[prodshort](../developer/includes/prodshort.md)] traces. This also means that you can use the built-in pages in the **Usage** feature of the Application Insights to investigate how users interact with the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] environment. For more information, see [Usage analysis with Application Insights](/azure/azure-monitor/app/usage-overview).

## Page opened: {alObjectName}

Occurs when a page has been opened in the client.  

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alObjectId|Specifies the ID of the page object that was opened.|
|alObjectName|Specifies the name of the page object that was opened.|
|alObjectType|**Page**|
|clientType|Specifies the type of client that opened the page such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|The display name of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] company that was used when the page opened. |
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version number.|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|designerLevel|Specifies the design level in which the page was opened. This dimension provides additional insight when the `hostType` dimension is **Designer**. <ul><li>**None**<br /> The page  wasn't opened in a design mode. This value is shown when the `hostType` dimension is a value other than **Designer**</li><li>**Personalization**<br /> The page opened in the personalizing mode for tailoring the page in the user's workspace only. See [Personalize Your Workspace](/dynamics365/business-central/ui-personalization-user). </li><li>**Configuration** <br /> The page opened in customizing mode for tailoring the page for all users of a specific profile. See [Customizing Pages for Profiles](/dynamics365/business-central/ui-personalization-manage). </li><li>**Development** <br /> The page opened in design mode for developing and modifying the page from the client for all users. See [Using Designer](../developer/devenv-inclient-designer.md).</li><li>**Inspector**<br /> The page opened in page inspection mode for viewing page information like source table, source extension, and filters. See [Inspecting Pages](/dynamics365/business-central/across-inspect-page).</li><li>**All** - the page was opened in the personalization, configuration, development, and inspector modes.|
|deviceLocale|Specifies the preferred language that's configured for the device that opened the page. For example, this dimension could show the language setting of a browser used to view the page. The value is a language code, such as **en-US** or **da-DK**. |
|deviceScreenResolution|Specifies the display resolution of the device that opened the page. The value is given as {width}×{height}, with the units in pixels. For example, **1024×768** means the width is 1024 pixels and the height is 768 pixels.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|eventId|**CL0001**|
|expandedFastTabs|Specifies the FastTabs on the page that were expanded when the page opened.|
|factboxExpanded|Specifies whether the FactBox area was shown or hidden when the page was opened. **true** indicates that the FactBox was shown. **false** indicates that the FactBox was hidden.|
|hostType|Specifies the host that loads the page. <ul><li>**Device App**<br /> The page was loaded by a Business Central mobile app, from a desktop, tablet, or phone. </li><li>**Office add-in**<br /> The page was loaded by Office application, like Excel or Outlook.</li><li>**Designer** <br /> The page was loaded by the in-client designer, used for changing page layout. The designer has different modes. Each mode provides a different level of page customization, as specified in the `designerLevel` dimension.</li><li>**Shim Browser** <br /> The page was loaded by the UWP (Universal Windows Platform) application.</li><li>**Browser**<br /> The page was loaded by web browser, like Microsoft Edge or Google Chrome. </li></ul>|
|message|**Page opened: {alObjectName}**|
|pageIsModal|Specifies whether the page was opened as a modal page.  **true** indicates that the page was opened as a modal page; otherwise, **false**. |
|pageMode|Specifies whether the page was opened in one of the following modes: <ul><li>**View** indicates the page was opened for viewing only</li><li>**Edit** indicates the page was opened for making changes</li><li>**Create** indicates the page was opened for creating a new entity.</li><li>**Select** indicates the page was opened for selecting an existing entity.</li><li>**Delete** indicates the page was opened for deleting an entity.</li></ul>The mode in which a page opened determined by different things, like the [RunPageMode Property](../developer/properties/devenv-runpagemode-property.md) or the [URL](../developer/devenv-web-client-urls.md) used to open the page. |
|pageType|Specifies the type of page, such as **Card**, **List**, **Document**, and more. For a complete list of page types and descriptions, see [Page Types and Layouts](../developer/devenv-page-types-and-layouts.md).|
|refUri|Specifies the URI of the page.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema.|

## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enabling Application Insights for Tenant Telemetry On-Premises](telemetry-enable-application-insights.md)  
[Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights)  
