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
Microsoft AppSource offers a wide variety of apps from Microsoft and our partners that extend the value of Business Central. As a Microsoft partner, you can save yourself, and your customers, a bit of legwork by using the Recommended Apps extension to curate a list of apps that are right for your customers' businesses. You can make collections unique for each customer, or build collections specifically for certain types of businesses or industries and then reuse the collections when you're on-boarding those types of customers. For example, you can create one collection for customers who work in finance, and another for customers in the retail space.

## Before you begin
You can only add apps that are available on AppSource to your collection. That is, you cannot host your own app and add it to the list. 

## Building a Collection of Recommended Apps
Building collections requires some development. You will need to create a new list page (4750) and a card page (4751). For more information, see [Pages Overview](../developer/devenv-pages-overview.md).

To add an app to the collection, find the app on AppSource, and then copy the URL to the `AppSourceURL` parameter on your new pages.

## Providing the Collection to Customers 
After you publish your collection, a Recommended Apps tile will display on customer Home pages. The tile will indicate the number of apps that are available for installation, and will open the **Recommended Apps** page so that the customer can install the apps they want. Customers can choose the app in the list to learn more about it, and get a link to install it from AppSource.

## See Also
[Onboarding experiences in Business Central](/../administration/onboarding-experiences)