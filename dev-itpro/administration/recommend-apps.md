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
Microsoft AppSource offers a wide variety of apps from Microsoft and our partners that extend the value of [!INCLUDE[prod_short](../includes/prod_short.md)]. As a Microsoft partner, you can save yourself, and your customers, a bit of legwork by using the Recommended Apps extension to curate a list of apps that are right for your customers' businesses. Recommended Apps is a per-tenant extension (PTE), which means that you can make collections unique for each customer, or build collections specifically for certain types of businesses or industries and then reuse the collections when you're on-boarding those types of customers. For example, you can create one collection for customers who work in finance, and another for customers in the retail space. For more information, see [Maintain AppSource Apps and Per-Tenant Extensions in Business Central Online](../developer/app-maintain).

## Before you begin
You can only add apps that are available on AppSource to your collection. That is, you cannot host your own app and add it to the list. 

## Building a Collection of Recommended Apps
Building collections requires some development. To make that easier, [!INCLUDE[prod_short](../includes/prod_short.md)] provides the following objects:

* **Recommended Apps List** page
* **Recommended App Card** page
* **Recommended Apps** table
* **Recommend Apps** codeunit

You must use the **Recommend Apps** codeunit to build collections. The following table provides an overview of the methods in the codeunit. You can copy the information for the parameters from the listing for the app on AppSource.

|Method  |Description  |
|---------|---------|
|**InsertApp**|Add information about the apps from AppSource to the Recommended Apps table. When adding new apps, you can simply paste the URL for the app from AppSource for the `AppSourceUrl` parameter, and [!INCLUDE[prod_short](../includes/prod_short.md)] will add the relevant parts to the other parameters. However, you must manually complete the `Short Description`, `Long Description`, and `Recommended By` parameters.|
|**GetApp**|Get information from AppSource about the apps that are already added to the Recommended Apps table.|
|**UpdateApp**|Update the information about the apps that are already added to the Recommended Apps table.|
|**RefreshImage**|Update the logo for the app. When you insert an app, the image is downloaded automatically. Use if the logo has changed.|
|**DeleteApp**|Delete an app from the collection. You provide the app ID.|
|**DeleteAllApps**|Delete all apps from the collection.|
|**GetAppURL**|Get the URL for a specific app. You provide the app ID.|

## Providing the collection to customers 
When your collection is ready you can deploy it to customer tenants. For more information, see [Deploying a Tenant Customization](../developer/devenv-deploy-tenant-customization). Afterward, the **Recommended Apps** page will display the apps and your customer can install them. Customers can choose the app in the list to learn more about it, and the details include a link to install the app from AppSource.

## See Also
[Onboarding experiences in Business Central](/../administration/onboarding-experiences)