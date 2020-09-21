---
title: Managing Capacity | Microsoft Docs
description: Use the Business Central administration center to manage your tenant managing capacity 
author: jswymer
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox
ms.date: 04/01/2020
ms.author: jswymer
---

#  Capacity

To help customers manage and plan their storage costs on an ongoing basis, the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] administration center includes the **Capacity** page. The **Capacity** page provides visibility of the total database and file storage usage, with details about the storage used by every particular environment. The page also displays the currently used and the maximum allowed number of Production and Sandbox environments available for the customer.  

Customers can purchase additional database capacity and environments via their reselling partner, using the following add-ons:  
- Dynamics 365 Business Central Database Capacity 
- Dynamics 365 Business Central Additional Environment Add-on

## Number of environments

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] administrators can create multiple Sandbox and Production type environments for various purposes like:
- creating more business branches
- moving into more countries
- expanding within their current country
- development
- testing changes
- learning new product capabilities
- and more. 

Every [!INCLUDE[prodshort](../developer/includes/prodshort.md)] customer with Business Central Premium or Essential subscriptions can use one production environment and three sandbox environments, at no extra charge.  

> [!NOTE]
> Existing customers with Business Central Essentials or Premium subscriptions purchased before October 1st 2020 will keep their existing environment entitlements for a period of 1 year until October 1st 2021, or until their subscription is renewed or ended, whichever occurs latest. This won't increase their overall database storage capacity and will not enable extra sandbox environments. These benefits are only activated with the production environments purchased by the customers separately. 

Customers can also choose to purchase an unlimited number of additional production environments, if needed, via their CSP partner. Each additionally purchased  production environment comes with three additional sandbox environments included with it.  

Production and sandbox environments can be created and used in any country where [!INCLUDE[prodshort](../developer/includes/prodshort.md)] service is available, also in the country where the default [!INCLUDE[prodshort](../developer/includes/prodshort.md)] environments are located. Additional environments can be created by the customers via the Business Central Admin Center. 

When customer administrators create users in Microsoft 365 Admin Center and assign them Business Central licenses, each user, by default, gets access to all [!INCLUDE[prodshort](../developer/includes/prodshort.md)] environments (Sandbox and Production) under the same single [!INCLUDE[prodshort](../developer/includes/prodshort.md)] license, still acting within the scope of their license within each of these environments. Administrators can limit users' access to any particular environment by [changing their permissions](https://docs.microsoft.com/en-us/dynamics365/business-central/ui-define-granular-permissions), or by [removing users' access](https://docs.microsoft.com/en-us/dynamics365/business-central/ui-how-users-permissions#to-remove-a-users-access-to-the-system) within that environment. 

## Storage 

Storage capacity of Business Central is represented by the Database and File storage.  

Business Central customers can use up to 80 Gb of database storage capacity across all of their environments (Production and Sandbox), meaning that the sum of database capacity usage of all of their environments must not exceed 80 Gb.  

Some businesses have unique scenarios that may require additional storage. For those organizations that need more space, there is an option to purchase extra database capacity as an add-on to their existing Business Central subscriptions via their reselling CSP partner.  Every add-on increases overall database capacity quota by 1 Gb.  

Every additional production environment purchased by the customer also increases tenant-wide database capacity quota by 4 Gb.  

The **Capacity** page provides a tenant-level view of where your organization is using storage capacity. On this page, you can see how much database and file storage is used by each environment. For each of your environments, you can also navigate to the [Table Information page](https://docs.microsoft.com/en-us/dynamics365/business-central/admin-view-table-information) within Business Central product, which let's you see the distribution of data size across tables. 

> [!NOTE]
> Only the environments running on version 17 (release Wave 2 2020) and up are included in the database capacity calculations.  

The File storage is calculated based on the size of the content of the following tables: 

- Tenant Media 
- Tenant Media Thumbnails 

The content of the other tables is counted towards the Database storage.  

> [!IMPORTANT]
> When you uninstall extensions, you have a choice of deleting or leaving the extension data in the database. If you decide not to delete the data when uninstalling extensions, this data will be counted in the overall database storage you use.  

## Exceeding capacity quotas 

Exceeding the paid database storage limit will not interrupt transaction processing within the existing environments. The existing environments, which organically grow and at one point exceed the quota will still be accessible and available for the customers to continue their business operations.   

However, once the capacity limits are exceeded, the customers will not be able to create new environments or copy their existing environments until the storage used by the existing environments is decreased to fit the quota or additional capacity is purchased.  

Administrative actions are currently not limited by the File storage, however similar restrictions will be applied to the File storage with one of the next releases of Business Central.

## See also

[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Apps](tenant-admin-center-manage-apps.md)  
[Updating Environments](tenant-admin-center-update-management.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
