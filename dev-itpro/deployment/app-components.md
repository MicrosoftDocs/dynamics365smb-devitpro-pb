---
title: "Components and Capabilities"
author: jswymer

ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
ms.date: 10/01/2020
---

# Components and Capabilities

When you build an app for [!INCLUDE [prodshort](../developer/includes/prodshort.md)], be it an [!INCLUDE[embedapp](../developer/includes/embedapp.md)] or an AppSource app, you must be aware of which components and deployment steps are provided by Microsoft and which you must provide.

## Components

### Base application

[!INCLUDE [admin-baseapp](../developer/includes/admin-baseapp.md)]

Microsoft recommends all partners to move towards a model where the code-customization of the base application is not used. Keep track of new capabilities in the base application and platform in the [release plans](/dynamics365/release-plans/).  

### Platform

[!INCLUDE [msft-platform](../developer/includes/msft-platform.md)]

## Ecosystem

[!include[prodshort](../developer/includes/prodshort.md)] online is part of a rich ecosystem of other Microsoft and 3rd party services, which partners and customers can decide to take advantage of.  

The following integration capabilities of the [!include[prodshort](../developer/includes/prodshort.md)] can be considered:

|Integration capability  |Status  |
|------------------------|--------|
|[Dynamics 365 API endpoint](../developer/devenv-develop-connect-apps.md) |Available if the base application objects are unchanged |
|[Outlook Add-in](/dynamics365/business-central/admin-outlook) | Available  |
|[Power BI](/dynamics365/business-central/admin-powerbi) | Available if the customer has a Power BI license|
|[Power Automate](/dynamics365/business-central/across-how-use-financials-data-source-flow)| Available if the customer has a Power Automate license|
|[Power Apps](/dynamics365/business-central/across-how-use-financials-data-source-powerapps)| Available|
|Microsoft 1st party integration apps included with [!include[prodshort](../developer/includes/prodshort.md)] ([Yodlee](/dynamics365/business-central/ui-extensions-yodlee-bank-feeds), [Quick Books](/dynamics365/business-central/ui-extensions-quickbooks-payroll), [OCR](/dynamics365/business-central/across-how-use-ocr-pdf-images-files), [AMC](/dynamics365/business-central/ui-extensions-amc-banking), and [others](/dynamics365/business-central/ui-extensions))| Available, but in many cases the partner must set up a separate agreement with these service providers|
|[Azure machine learning](/azure/machine-learning/studio/)| Available if the partner has an Azure ML subscription|
|[Integration with Dynamics 365 Sales](/dynamics365/business-central/admin-how-to-set-up-a-dynamics-crm-connection)| Available|
|[Microsoft Graph](/graph/overview)  | Currently under evaluation        |
|[Accountant Hub](/dynamics365/accountants/)| Available in specific countries |

## See Also

[Microsoft Responsibilities](microsoft-responsibilities.md)  
[[!INCLUDE[embedapp](../developer/includes/embedapp.md)] Overview](embed-app-overview.md)  
