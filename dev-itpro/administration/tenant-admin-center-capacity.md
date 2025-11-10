---
title: Managing Capacity
description: Learn how to monitor and optimize storage, manage environments, and stay within your quota using the administration center.
author: jswymer
ms.topic: concept-article
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, storage, capacity, quota, limit, database size
ms.date: 06/20/2025
ms.author: jswymer
ms.reviewer: jswymer
---

# Managing capacity

To help our customers manage and plan their storage costs on an ongoing basis, the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] includes the **Capacity** page. The **Capacity** page provides an overview of the total database storage usage, with details about the storage used by every environment. The page also displays the currently used and the maximum allowed number of production and sandbox environments available for the customer.  

[!INCLUDE [db-storage-limit](../includes/db-storage-limit.md)]

[!INCLUDE [db-storage-addons](../includes/db-storage-addons.md)]

## Number of environments

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] administrators can create multiple sandbox and production type environments for various purposes, like:

- Creating more business branches
- Moving into more countries/regions
- Expanding within their current country/region
- Developing
- Testing changes
- Learning new product capabilities

Every [!INCLUDE[prod_short](../developer/includes/prod_short.md)] customer with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Premium or Essential subscriptions can use one production environment and three sandbox environments, at no extra charge.  

Customers can also choose to purchase any number of extra production environments via their Cloud Solution Provider (CSP) partner. Each extra production environment you buy includes three more sandbox environments and increases the shared storage capacity for all environments in the tenant by 4 GB.

You can create and use production and sandbox environments in any country/region that the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] service is available, including where the default [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments are located.

Customers, administrators, and partners can create more environments using the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)].

When customer administrators create users in Microsoft 365 Admin Center and assign them [!INCLUDE[prod_short](../developer/includes/prod_short.md)] licenses, each user, by default, gets access to all [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments (sandbox and production) under the same license. Each user acts within the scope of their license in each environment. Administrators can limit users' access to any particular environment by [changing their permissions](/dynamics365/business-central/ui-define-granular-permissions), or by [removing users' access](/dynamics365/business-central/ui-how-users-permissions#to-remove-a-users-access-to-the-system) within that environment.

Partners using the [Partner Sandbox](environment-types.md#partnersandbox) license on their partner tenants can purchase additional sandbox environments by increasing the number of Partner Sandbox user licenses on their tenant. Like regular [!INCLUDE[prod_short](../developer/includes/prod_short.md)] licenses, the first five Partner Sandbox licenses grant one production environment and three sandbox environments on the tenant. Each additional five Partner Sandbox licenses automatically grant three additional sandbox environments on the tenant.

## Storage

Storage capacity usage of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is represented by **Database** on the **Capacity** page.  

[!INCLUDE [db-storage-limit](../includes/db-storage-limit.md)]

[!INCLUDE [admin-env-quota](../developer/includes/admin-env-quota.md)]

Apart from the default storage capacity, the customer is entitled to extra storage capacity based on the number of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] licenses they own:  

|License type|Extra storage (for each license of this type)|
|------|-----------|
|Premium| 3 GB|
|Essential| 2 GB|
|Device|1 GB|

[!INCLUDE [db-storage-addons](../includes/db-storage-addons.md)]

The **Storage capacity, by source** section shows how much capacity is available by default, how much extra capacity is added with user licenses, and how much extra capacity was purchased via CSP.  

> [!NOTE]
> The capacity occupied by the files or Blob data stored in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database&mdash;including the Tenant Media and Tenant Media Thumbnails tables&mdash;count towards the overall database storage capacity.  

The files and Blob data stored in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database—including the content of the Tenant Media and Tenant Media Thumbnails tables—count toward the customer's overall database storage capacity.

### Storage usage by environment

The **Storage usage by environment** section of the **Capacity** page provides a tenant-level view of where your organization is using storage capacity. Here you can see how much database storage is used by each environment. For each of your environments, you can also navigate to the [Table Information page](/dynamics365/business-central/admin-view-table-information) within [!INCLUDE[prod_short](../developer/includes/prod_short.md)], which let's you see the distribution of data size across tables.

The content of all nonsystem tables is counted towards the **Database usage** storage. 

> [!IMPORTANT]
> When you uninstall extensions, you have a choice of deleting or leaving the extension data in the database. If you don't delete the data when you uninstall extensions, the data counts toward your overall database storage.

## Exceeding capacity quota

Exceeding the paid database storage limit doesn't interrupt transaction processing within the existing environments. The existing environments that organically grow and eventually exceed the quota are still accessible and available for the customers to continue their business operations. You aren't automatically charged for the extra storage occupied by these environments.

But if customers exceed the capacity limits, they can't create new environments or copy existing environments until they reduce storage to fit the quota or buy more capacity.

These operations are also blocked for the customers who have more environments than they're entitled to, according to their subscription and purchased environment add-ons.  

## Reducing data stored in databases

There are a few things that you can do to reduce the amount of data stored in a database to keep it under its current limit. For more information, see [Reducing Data Stored in Databases](database-reduce-data.md).

## Related information

[Working with administration tools](administration.md)  
[The Business Central administration center](tenant-admin-center.md)  
[Managing environments](tenant-admin-center-environments.md)  
[Managing apps](tenant-admin-center-manage-apps.md)  
[Updating environments](tenant-admin-center-update-management.md)  
[Managing tenant notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
