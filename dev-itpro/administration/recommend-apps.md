---
title: Using the Recommended Apps Extension
description: Curate a collection of Dynamics 365 apps that your customers can choose from. 
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: bholtorf
---

# The Recommended Apps Extension
Microsoft AppSource offers a wide variety of apps from Microsoft and our partners that extend the value of Business Central. As a Microsoft partner, you can save yourself, and your customers, a bit of legwork by using the Recommended Apps extension to curate a list of apps that are right for your customers' businesses. Recommended Apps is a per-tenant extension (PTE), which means that you can make collections unique for each customer, or build collections specifically for certain types of businesses or industries and then reuse the collections when you're on-boarding those types of customers. For example, you can create one collection for customers who work in finance, and another for customers in the retail space. For more information, see [Maintain AppSource Apps and Per-Tenant Extensions in Business Central Online](../developer/app-maintain).

## Before you begin
You can only add apps that are available on AppSource to your collection. That is, you cannot host your own app and add it to the list. 

## Building a Collection of Recommended Apps
Building collections requires some development. To make that easier, Business Central provides the following objects:

* Page 4750 "Recommended Apps List"
* Card page (4751)
* Codeunit 4750 "RecommendApp"

You can use the pages that are provided, or create your own. For more information, see [Pages Overview](../developer/devenv-pages-overview.md). However, you must use Codeunit 4750 "RecommendApp" to build collections. The following table provides an overview of the methods in codeunit 4750. You can copy the information for the parameters from the app listing on AppSource.

|Method  |Description  |
|---------|---------|
|**InsertApp**|Add information about the app from AppSource. Use when adding new apps.|
|**GetApp**|Get information from AppSource about the apps that are already added.|
|**UpdateApp**|Update the information about the apps that are already added.|
|**RefreshImage**|Update the logo for the app. When you insert an app, the image is downloaded automatically. Use if the logo has changed.|
|**DeleteApp**|Delete an app from the list. You provide the appId.|
|**DeleteAllApps**|Delete all apps from the list.|
|**GetAppURL**|Get the URL for a specific app. You provide the appId.|

## Providing the Collection to Customers 
When your collection is ready you can deploy it to your customer's tenant. For more information, see [Deploying a Tenant Customization](../developer/devenv-deploy-tenant-customization). Afterward, the **Recommended Apps** page will display the apps and your customer can install them. Customers can choose the app in the list to learn more about it, and the details include a link to install the app from AppSource.

## See Also
[Onboarding experiences in Business Central](/../administration/onboarding-experiences)