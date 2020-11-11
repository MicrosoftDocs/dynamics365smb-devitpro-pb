---
title: "Business Central virtual entities FAQ"
description: "Frequently asked questions for working with Business Central virtual entities"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---

# Business Central Virtual Entities FAQ

[!INCLUDE[2020_releasewave2_preview](../includes/2020_releasewave2_preview.md)]

> [!IMPORTANT]  
> This functionality requires version 17 of [!INCLUDE[prodshort](../developer/includes/prodshort.md)], while service update 189 is required for [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. The release information for [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] is published on the [latest version availability page](https://docs.microsoft.com/business-applications-release-notes/dynamics/released-versions/dynamics-365ce#all-version-availability).

This topic is a collection of frequently asked questions about [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual entities. 

### What version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] do I need?

Version 17.0 of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] is needed. Version 17 contains v2.0 of the standard APIs and improvements to the OData stack that enable APIs to be exposed and consumed as virtual entities.  

### Can a solution from an independent software vendor (ISV) take a dependency on virtual entities? What does the application lifecycle management (ALM) look like?

Yes. The virtual entities are all generated in the **MicrosoftBusinessCentralERPVE** solution, which is API-managed. In other words, the items in the solution change as you make entities visible or hidden, but the solution is still a managed solution that you can take dependency on. The standard ALM flow just takes a standard reference to a virtual entity from this solution with the **Add existing** option in the ISV solution. Missing dependency of the solution will be checked when the solution is imported and during import, if a specified virtual entity does not yet exist, the virtual entity is automatically made visible.

### Which entities from [!INCLUDE[prodshort](../developer/includes/prodshort.md)] do users see in the catalog in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]?

Generally, users see all entities exposed as API pages with the exception of Microsoft legacy API pages: beta and v1.0.

### Do all Microsoft Power Platform users have to be users in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]?

Any user of Microsoft Power Platform who tries to access [!INCLUDE[prodshort](../developer/includes/prodshort.md)] data through a virtual entity must also exist as a user in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. Therefore, technically, not *all* users have to be users in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. Only those users who access [!INCLUDE[prodshort](../developer/includes/prodshort.md)] data through virtual entities must be users in [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

### Where do I find the catalog entity?

In the **Advanced find** window, the entity is named **Available [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Entities**.

### Can I change the prefix for the virtual entities?

No. All [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual entities should be generated in the **MicrosoftBusinessCentralERPVE** solution, and they all have the "dyn365bc\_" prefix. This prefix will not be changed.

### How can I show, in the same grid, data from multiple virtual entities that are joined to a physical entity record in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]?

This approach is not currently possible in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)].

### If I want a default value to be entered in a field during pre-create, will an initValue on the data entity then work?

Yes. Here is the order of calls:

1. [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] sends a create or update message.
2. All the existing logic on the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entity and backing tables is invoked. This logic includes default value entry that might change values.
3. [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] sends another Retrieve (single) message to get the latest copy of the data, including any fields that default values were entered for.

## See Also

[Microsoft Power Platform Integration with Business Central](powerplat-overview.md)  
[Entity Modeling](powerplat-entity-modeling.md)  
[Business Central and [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] Admin Reference](powerplat-admin-reference.md)  
[Application Lifecycle Management for Solutions that use Virtual Entities](powerplat-app-lifecycle-management.md)  
