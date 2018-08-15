---
title: Features not implemented in on-premises deployments
author: edupont04
manager: edupont
ms.author: edupont
ms.custom: na
ms.date: 08/15/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics365-business-central"
---
# Features not implemented in on-premises deployments of [!INCLUDE[prodlong](includes/prodlong.md)]

This topic lists features that are available in [!INCLUDE[prodshort](includes/prodshort.md)] but not in on-premises deployments. The topic is divided into two sections:

- The first section lists features that are available under very specific circumstances in on-premises deployments.  
- The second section lists features that are not intended for use with on-premises deployments. There are no plans to implement these features.  

## Features that require specific circumstances

The following features are not available in all on-premises deployments because they require specific circumstances.  

| **Feature**                      |**Description**                                  |
|----------------------------------|-------------------------------------------------|
| Read/write data with Excel add-in       |The Excel add-in that enables update of data requires Azure Active Directory as the authentication mechanism. |
| Excel financial reports        |The Excel add-in that is used with the predefined Excel-based financial reports requires Azure Active Directory as the authentication mechanism. |
|Coversheets for contact management|The integration with Word to create the coversheets requires Azure Active Directory as the authentication mechanism.|
| Built-in Power BI reports and charts       |The integration with Power BI requires Azure Active Directory as the authentication mechanism. |
| Built-in Microsoft Flow Management |The integration with Microsoft Flow requires Azure Active Directory as the authentication mechanism.|
| Built-in web services |A number pages and queries are exposed as web services. However, the default endpoint must be manually updated before the web services can be consumed.|
| Outlook add-in |The Outlook add-in requires Dynamics NAV User/Password or Azure Active Directory as the authentication mechanism. |
|Standard REST API|[!INCLUDE[prodshort](includes/prodshort.md)] contains new standard REST APIs. However, on-premises deployments cannot be reached through Microsoft Graph or the common endpoint *https://
api.businesscentral.dynamics.com/
v1.0/api/beta*. Instead, you must connect directly to the on-premises deployment, just as when you connect to web services.|
|In-product search in Help| In online deployments of [!INCLUDE[prodshort](includes/prodshort.md)], you can extend an in-product search to also search in content on the docs.microsoft.com site, or another website that is specified in the configuration of the application by an extension. This is only supported for on-premises deployments where the legacy Help Server is not enabled.|

## Features not intended for use in on-premises deployments

The following features are not intended for use in on-premises deployments. There are no plans to implement these features in on-premises deployments.

| **Feature**                      |**Description**                                  |
|----------------------------------|-------------------------------------------------|

|Inviting the external accountant|Integration with [!INCLUDE[d365acc_long](includes/d365acc_long_md.md)] is not supported in [!INCLUDE[prodshort](includes/prodshort.md)].|
|Bulk Invoicing from Microsoft Bookings|Integration with the Bookings app in Office Business Premium is not supported.|
|Create Workflow from Flow|Microsoft Flow does not integrate with on-premises workflow functionality.|
|Sandbox environments|The sandbox environment that you can use to develop extensions against for the new developer experience cannot connect to an on-premises deployment. For more information, see [Get started with the Container Sandbox Development Environment](/developer/devenv-get-started-container-sandbox.md).|


## See Also
[Configuring Microsoft Dynamics NAV](Configuring-Microsoft-Dynamics-NAV.md)  
[How to: Create a Sandbox Environment](/dynamics365/business-central/across-how-create-sandbox-environment?toc=/dynamics-nav/toc.json)  