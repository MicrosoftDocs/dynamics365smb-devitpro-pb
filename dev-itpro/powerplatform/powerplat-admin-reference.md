---
title: "Business Central and Common Data Service admin reference"
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

> [!IMPORTANT]
> This functionality requires version 17 of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] and service update 189 for Common Data Service. The release information for Common Data Service is published on the [latest version availability page](https://docs.microsoft.com/business-applications-release-notes/dynamics/released-versions/dynamics-365ce#all-version-availability).

This topic provides step-by-step instructions about how to set up and configure virtual entities for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] in Common Data Service.

## Getting the solution
The Common Data Service solution for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual entities must be installed from Microsoft AppSource virtual entity solution. For more information, see [[!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual entity](https://appsource.microsoft.com/en-us/product/dynamics-365/microsoftdynsmb.businesscentral_virtualentity).


The following solutions are installed in Common Data Service.

- **Dynamics365Company** - This adds the **cdm_company** entity, which is referenced by all [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual entities. All communication to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] requires the company id in the request. 

- **MicrosoftBusinessCentralVESupport** - This provides the core support for the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual entity feature.

- **MicrosoftBusinessCentralERPCatalog** - This provides a list of available [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

- **MicrosoftBusinessCentralVEAnchor** - This is the API-managed solution, which will contain the generated virtual entities as they are made visible.

## Authentication and authorization
After the solutions are installed in the Common Data Service environment, connection can be setup to a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] environment. *Both environments have to be in the same tenant*.  

The next step in the process is to provide Common Data Service with the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] environment and company to connect to. The following steps walk through this part of the process.

1.  In Common Data Service, go to the entity **Business Central Virtual Data Source Configuration** .

2.  Select and edit the data source named “[!INCLUDE[prodshort](../developer/includes/prodshort.md)]”.

3.  Fill in the information from the steps above. @kim

    - **Target URL** - The URL at which you can access [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

    - **OAuth URL** - https://login.windows.net/

    - **Tenant ID** - Your tenant, such as “contoso.com”.

    - **AAD Application ID** - The **Application (client) ID** created above.

    - **AAD Application Secret** - The secret generated above.

4.  Set the **Default Company** value. 
5.  Save the changes.

## Enabling virtual entities

Due to the large number of OData enabled entities available in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], by default, the entities are not available as virtual entities in Common Data Service. The following steps allow for enabling entities to be virtual, as needed.

1. In Common Data Service, go to **Data -> Entities** and search for *Available Business Central Entity*. Make sure to search for All and not just Default.

2. Choose **Data* in the horizontal menu to view the avaliable data.

3. Locate and open the entity that you want to enable.

4. Set **Visible** to **Yes** and save. This will generate the virtual entity, so that it will appear in all of the appropriate menus, and in advanced find dialog box.

## Refreshing virtual entity metadata

The virtual entity metadata can be force-refreshed when it is expected for the entity metadata in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] to have changed. This can be done by setting **Refresh** to **Yes** and saving. This will sync the latest entity definition from [!INCLUDE[prodshort](../developer/includes/prodshort.md)] to Common Data Service and update the virtual entity.

## Referencing virtual entities
@lukasz
The virtual entities are all generated in the MicrosoftBusinessCentralVE solution, which is API Managed. That means the items in the solution change as you make entities visible/hidden, but it is still a managed solution that you can take dependency on. The standard ALM flow would be to just take a standard reference to a virtual entity from this solution with the **Add existing** option
in the ISV solution. It will then show as a missing dependency of the solution and be checked at solution import time. During import if a specified virtual entity does not yet exist, it would automatically be made visible without needing additional work.

To consume virtual entities:

1.  Create a separate solution as usual in Common Data Service, which will contain the consuming logic.

2.  Select **Entities \> Add Existing**. Select the virtual entity that you want to reference from the list.

3.  When prompted to select assets to add, select any forms, views, or other elements that you want to customize, then select **Finish**.

From the development tooling, existing elements such as forms can be modified for the virtual entity. Additionally, new forms, views, and other elements can also be added.

When the solution is exported, it will contain hard dependencies on the virtual entity generated in the MicrosoftBusinessCentralVE solution.
