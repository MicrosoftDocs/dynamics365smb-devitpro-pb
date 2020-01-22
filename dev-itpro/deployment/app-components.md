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
ms.date: 01/22/2020
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
|Dynamics 365 API endpoint |Available if the base application objects are unchanged |
|Microsoft Office Outlook Add-in | Available  |
|Microsoft Power BI | Available if the customer has a Power BI license|
|Microsoft Power Automate| Available if the customer has a Power Automate license|
|Microsoft Power Apps| Available|
|Microsoft 1st party integration apps included with [!include[prodshort](../developer/includes/prodshort.md)] (Yodlee, Quick Books, OCR, AMC, and others)| Available, but in many cases the partner must set up a separate agreement with these service providers|
|Azure machine learning| Available i the partner has an Azure ML subscription|
|Integration with Dynamics 365 Sales| Available|
|Microsoft Graph     | Currently under evaluation        |
|Accountant Hub| Available in specific countries |

## See Also

[Microsoft Responsibilities](microsoft-responsibilities.md)  
[[!INCLUDE[embedapp](../developer/includes/embedapp.md)] Overview](embed-app-overview.md)  
