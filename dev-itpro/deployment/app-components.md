---
title: Components and capabilities
author: jswymer
ms.topic: article
ms.author: jswymer
ms.date: 10/23/2026
description: Discover Dynamics 365 Business Central App Components & Deployment Steps - Microsoft's Base Application, Platform Updates, & Ecosystem Integrations.
ms.reviewer: jswymer
---

# Components and capabilities

When you build an app for [!INCLUDE [prod_short](../developer/includes/prod_short.md)], be it a Marketplace app or an [!INCLUDE[embedapp](../developer/includes/embedapp.md)], you must know which components and deployment steps are provided by Microsoft. Additionally, you must be aware of which components and steps you need to provide.

## Components

### Base application

[!INCLUDE [admin-baseapp](../developer/includes/admin-baseapp.md)]

Microsoft recommends that all partners move toward a model that doesn't use code customization for the base application. Visit the [AI at Work roadmap](https://aka.ms/AIatWorkroadmap) to discover upcoming capabilities, track rollout progress, and plan adoption.

### Platform

[!INCLUDE [msft-platform](../developer/includes/msft-platform.md)]

## Ecosystem

[!include[prod_short](../developer/includes/prod_short.md)] online is part of a rich ecosystem of other Microsoft and 3rd party, which partners and customers can decide to take advantage of.  

The following integration capabilities of the [!include[prod_short](../developer/includes/prod_short.md)] can be considered:

| Integration capability | Status |
| -- | -- |
| [Dynamics 365 API endpoint](../developer/devenv-develop-connect-apps.md) | Available if the base application objects are unchanged |
| [Outlook Add-in](/dynamics365/business-central/admin-outlook) | Available |
| [Power BI](/dynamics365/business-central/admin-powerbi) | Available if the customer has a Power BI license |
| [Power Automate](/dynamics365/business-central/across-how-use-financials-data-source-flow) | Available if the customer has a Power Automate license |
| [Power Apps](/dynamics365/business-central/across-how-use-financials-data-source-powerapps) | Available |
| Microsoft first-party integration apps included with [!include[prod_short](../developer/includes/prod_short.md)] ([Yodlee](/dynamics365/business-central/ui-extensions-yodlee-bank-feeds), [Quick Books](/dynamics365/business-central/ui-extensions-quickbooks-payroll), [OCR](/dynamics365/business-central/across-how-use-ocr-pdf-images-files), [AMC](/dynamics365/business-central/ui-extensions-amc-banking), and [others](/dynamics365/business-central/ui-extensions)) | Available, but often the partner must set up a separate agreement with these service providers |
| [Azure Machine Learning](/azure/machine-learning/studio/) | Available if the partner has an Azure Machine Learning subscription |
| [Integration with Dynamics 365 Sales](/dynamics365/business-central/admin-how-to-set-up-a-dynamics-crm-connection) | Available |
| [Microsoft Graph](/graph/overview) | Currently under evaluation |

## Related information

[Microsoft Responsibilities](microsoft-responsibilities.md)  
[[!INCLUDE[embedapp](../developer/includes/embedapp.md)] Overview](embed-app-overview.md)  
