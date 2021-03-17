---
title: Features not implemented in on-premises deployments
description: Some features work differently or not at all, depending on whether your Business Central solution is in the cloud or on-premises.
author: edupont04

ms.custom: na
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: edupont
ms.date: 03/10/2021
---
# Features not implemented in on-premises deployments of [!INCLUDE[prod_long](includes/prod_long.md)]

This article lists features that are available in [!INCLUDE[prod_short](includes/prod_short.md)] but not in on-premises deployments. The article is divided into two sections:

- The first section lists features that are available under specific circumstances in on-premises deployments.  
- The second section lists features that aren't intended for use with on-premises deployments. There are no plans to implement these features.  

## Features that require specific circumstances

The following features aren't available in all on-premises deployments because they require specific circumstances.  

|**Feature**  |**Description**  |
|---------|---------|
|Read/write data with Excel add-in  |The Excel add-in that enables update of data requires Azure Active Directory as the authentication mechanism.   |
|Excel financial reports | The Excel add-in that is used with the predefined Excel-based financial reports requires Azure Active Directory as the authentication mechanism.  |
|Coversheets for contact management |The integration with Word to create the coversheets requires Azure Active Directory as the authentication mechanism. |
|Built-in Power BI reports and charts |The integration with Power BI requires Azure Active Directory as the authentication mechanism. |
|Built-in Power Automate Management |You can use the built-in workflows in on-premises deployments of [!INCLUDE[prod_short](includes/prod_short.md)], provided that you connect to Power Automate using Azure Active Directory as the authentication mechanism. This can be done using the Azure Active Directory Assisted Setup guide in Business Central. Microsoft Azure and Microsoft Power Automate require Azure Active Directory authentication; however, your Business Central on-premises deployment does not have to use Azure Active Directory as the general authentication mechanism.|
|Built-in web services |A number pages and queries are exposed as web services. However, the default endpoint must be manually updated before the web services can be consumed. |
|Outlook add-in  |The Outlook add-in requires Dynamics NAV User/Password or Azure Active Directory as the authentication mechanism. |
|Standard REST API | [!INCLUDE[prod_short](includes/prod_short.md)] contains new standard REST APIs. However, on-premises deployments can't be reached through Microsoft Graph or the common endpoint, `https://api.businesscentral.dynamics.com/v1.0/api/beta`. Instead, you must connect directly to the on-premises deployment, just as when you connect to web services. |
|Sales and Inventory Forecast|This functionality requires an [Azure Machine Learning](/azure/machine-learning/) subscription.|
|Image Analyzer|This functionality requires an [Computer Vision](/azure/cognitive-services/computer-vision/) service.|
|Cortana Intelligence in Cash Flow Forecast|This functionality requires an [Azure Machine Learning](/azure/machine-learning/) subscription.|

## Features not intended for use in on-premises deployments

The following features aren't intended for use in on-premises deployments. There are no plans to implement these features in on-premises deployments.

|**Feature**  |**Description**  |
|---------|---------|
|Default Power BI reports |Automatic deployment and configuration of Power BI reports isn't supported in on-premises deployments of [!INCLUDE[prod_short](includes/prod_short.md)].  |
|Bulk Invoicing from Microsoft Bookings |Integration with the Bookings app that is available in certain Microsoft 365 subscriptions isn't supported.  |
|Create workflow from Power Automate |Power Automate does not integrate with on-premises workflow functionality. You can't create new workflows based on existing Power Automate templates in on-premises deployments of [!INCLUDE[prod_short](includes/prod_short.md)]. |
|Sandbox environments  |The sandbox environment that you can use to develop extensions against for the new developer experience can't connect to an on-premises deployment. For more information, see [Get started with the Container Sandbox Development Environment](developer/devenv-get-started-container-sandbox.md). |
|In-product search |In online deployments of [!INCLUDE[prod_short](includes/prod_short.md)], Tell Me, the in-product search, also searches in content on the docs.microsoft.com site. For on-premises deployments, this isn't supported.  |
|Late Payment Prediction|The Late Payment Prediction functionality isn't supported in on-premises deployments of [!INCLUDE[prod_short](includes/prod_short.md)].  |
|Use the company hub to manage work across multiple companies.|Integration with the company hub isn't supported in on-premises deployments of [!INCLUDE[prod_short](includes/prod_short.md)]. |
|Inviting the external accountant |Integration with the now deprecated [!INCLUDE[d365acc_long](includes/d365acc_long_md.md)] and the existing company hub isn't supported in on-premises deployments of [!INCLUDE[prod_short](includes/prod_short.md)].  |
|[!INCLUDE[prod_short](includes/prod_short.md)] app for Microsoft Teams|This app connects Teams to your business data in [!INCLUDE[prod_short](includes/prod_short.md)]. The app can't connect to [!INCLUDE[prod_short](includes/prod_short.md)] on-premises. For more information about [!INCLUDE[prod_short](includes/prod_short.md)] online and Teams, see [Business Central and Microsoft Teams Integration](/dynamics365/business-central/across-teams-overview).|

## See Also

[System Requirements](deployment/system-requirement-business-central.md)  
[How to: Create a Sandbox Environment](/dynamics365/business-central/across-how-create-sandbox-environment?toc=/dynamics365/business-central/dev-itpro/toc.json)  
