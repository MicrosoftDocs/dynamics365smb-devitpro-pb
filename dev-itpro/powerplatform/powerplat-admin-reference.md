---
title: "Business Central and Common Data Service admin reference"
description: "The admin reference for working with Business Central and Common Data Service entities"
ms.custom: na
ms.date: 08/12/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---

# Business Central and Common Data Service Admin Reference

[!INCLUDE[2020_releasewave2_preview](../includes/2020_releasewave2_preview.md)]

> [!IMPORTANT]  
> This functionality requires version 17 of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] and service update 189 for Common Data Service. The release information for Common Data Service is published on the [latest version availability page](https://docs.microsoft.com/business-applications-release-notes/dynamics/released-versions/dynamics-365ce#all-version-availability).

This topic provides step-by-step instructions on how to set up and configure virtual entities for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] in Common Data Service.

## Getting the solution

The following solutions are installed in Common Data Service once the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual entities is installed.

The following solutions are installed in Common Data Service:

- **Dynamics365Company** - This adds the **cdm_company** entity, which is referenced by all [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual entities. All communication to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] requires the company ID in the request. 
- **MicrosoftBusinessCentralVESupport** - This provides the core support for the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual entity feature.
- **MicrosoftBusinessCentralERPCatalog** - This provides a list of available [!INCLUDE[prodshort](../developer/includes/prodshort.md)].
- **MicrosoftBusinessCentralVEAnchor** - This serves as a container, holding information needed for AppSource. 
- **MicrosoftBusinessCentralERPVE** - Virtual entities generated for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] will be contained in this solution. Entities are added at runtime once they are made visible.

## Authentication and authorization

After the solutions are installed in the Common Data Service environment, connection can be set up to a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] environment. *Both environments have to be in the same tenant*.  

The next step in the process is to provide Common Data Service with the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] environment and company to connect to. The following steps walk through this part of the process.

0. In [!INCLUDE[prodshort](../developer/includes/prodshort.md)], go to the page 'AAD Applications' and toggle the app 'Dynamics 365 Business Central for Virtual Entities' to **Enabled**. This will allow Common Data Service to communicate with [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

1. In Common Data Service, go to the entity **Business Central Virtual Data Source Configuration**.

2. Select and edit the data source named “[!INCLUDE[prodshort](../developer/includes/prodshort.md)]”.

3. On the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Virtual Data Source Configuration, set the environment name. Unless changed, [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenants will have an default environment called 'production'.

4. Set the **Default Company** value. 

5. Save the changes.

## Making virtual entities visible

Due to the large number of OData enabled entities available in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], by default, the entities are not available as virtual entities in Common Data Service. The following steps allow for enabling entities to be virtual, as needed.

1. In Common Data Service, go to **Data -> Entities** and search for *Available Business Central Entity*. Make sure to search for All and not just Default.

2. Choose **Data* in the horizontal menu to view the available data.

3. Locate and edit the entity that you want to enable.

4. Set **Visible** to **Checked** and save. This will generate the virtual entity, so that it will appear in all of the appropriate menus, and in advanced find dialog box.

## Refreshing virtual entity metadata

The virtual entity metadata can be force-refreshed when it is expected for the entity metadata in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] to have changed. This can be done by setting **Refresh** to **Checked** and saving. This will sync the latest entity definition from [!INCLUDE[prodshort](../developer/includes/prodshort.md)] to Common Data Service and update the virtual entity.

## Referencing virtual entities

The virtual entities are all generated in the **MicrosoftBusinessCentralERPVE** solution. That means the items in the solution change as you make entities visible/hidden, but it is still a managed solution that you can take dependency on. The standard ALM flow would be to just take a standard reference to a virtual entity from this solution with the **Add existing** option in the ISV solution. It will then show as a missing dependency of the solution and be checked at solution import time. During import if a specified virtual entity does not yet exist, it would automatically be made visible without needing additional work.

To consume virtual entities:

1. Create a separate solution as usual in Common Data Service, which will contain the consuming logic.

2. Select **Entities \> Add Existing**. Select the virtual entity that you want to reference from the list.

3. When prompted to select assets to add, select any forms, views, or other elements that you want to customize, then select **Finish**.

From the development tooling, existing elements such as forms can be modified for the virtual entity. Additionally, new forms, views, and other elements can also be added.

When the solution is exported, it will contain hard dependencies on the virtual entity generated in the MicrosoftBusinessCentralVE solution.

## See Also

[Microsoft Power Platform Integration with Business Central](powerplat-overview.md)  
[Entity Modeling](powerplat-entity-modeling.md)  
[Application Lifecycle Management for Solutions that use Virtual Entities](powerplat-app-lifecycle-management.md)  
[FAQ](powerplat-faq.md)  
