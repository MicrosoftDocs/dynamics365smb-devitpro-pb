---
title: Microsoft Power Platform integration with Business Central via Virtual Tables
description: Learn about integration of Power Platform with Business Central via virtual tables.
ms.date: 09/17/2025
ms.reviewer: solsen
ms.topic: overview
author: SusanneWindfeldPedersen
---

# Microsoft Power Platform integration with Business Central via virtual tables

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] Virtual Table Plugin is a virtual data source in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)], published on AppSource at [Business Central Virtual Table](https://appsource.microsoft.com/en-us/product/dynamics-365/microsoftdynsmb.businesscentral_virtualentity). It enables creating, reading, updating, deleting (CRUD) operations on [!INCLUDE[prod_short](../developer/includes/prod_short.md)] data directly from [!INCLUDE[dataverse_short](../includes/dataverse_short.md)] and Microsoft Power Platform. Virtual tables don't store data in [!INCLUDE[dataverse_short](../includes/dataverse_short.md)]. The data stays in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. To use [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tables in [!INCLUDE[dataverse_short](../includes/dataverse_short.md)], you need to make them available as virtual tables.

## Prerequisite reading

Before working with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Virtual Tables, it's helpful to fully understand how [!INCLUDE[dataverse_short](../includes/dataverse_short.md)] and virtual tables work. We recommend getting started by reading more about [!INCLUDE[dataverse_short](../includes/dataverse_short.md)] and tables inside Dataverse. It gives you a smooth introduction so you can fully understand our [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Virtual Tables documentation. 

To work with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] virtual tables, you must understand how [!INCLUDE[cds_long_md](../includes/cds_short_md.md)] and virtual tables work. Therefore, the following documentation is a prerequisite:

- [What is [!INCLUDE[dataverse_short](../includes/dataverse_short.md)]?](/powerapps/maker/data-platform/data-platform-intro)
- [Table overview](/powerapps/maker/data-platform/entity-overview)
- [Table relationships overview](/powerapps/maker/data-platform/create-edit-entity-relationships)
- [Create and edit virtual tables that contain data from an external data source](/powerapps/maker/data-platform/create-edit-virtual-entities)
- [Overview of creating apps in Power Apps](/powerapps/maker/)

## Virtual tables for Business Central

API (v2.0) for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] can be consumed in [!INCLUDE[dataverse_short](../includes/dataverse_short.md)] as virtual tables. The response properties are transformed into table columns and APIs relations are transformed into table relations. Since the virtual tables depend on APIs exposed on [!INCLUDE[prod_short](../developer/includes/prod_short.md)] side, custom APIs can also be used for generating virtual tables.

[!INCLUDE[dataverse_short](../includes/dataverse_short.md)] can be used as a data source inside the Power Platform product family. It allows makers to build customer solutions containing data from multiple services and sources.  

:::image type="content" source="../developer/media/dataverse-virtual-tables.svg#lightbox" alt-text="Shows how data virtualization works between Business Central and Dataverse":::

Virtual tables in [!INCLUDE[dataverse_short](../includes/dataverse_short.md)] acts as regular tables and therefore also in Power Platform. Makers can now build experiences in customer engagement apps with data directly from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] with full CRUD capability and without copying to [!INCLUDE[dataverse_short](../includes/dataverse_short.md)]. , and apply all the logic already residing in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

## Known limitations

There are known limitations with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Virtual Tables plugin including:

- Virtual tables inside [!INCLUDE[dataverse_short](../includes/dataverse_short.md)] can't be used in Charts yet.  
- Attachment and Images/Pictures aren't supported inside virtual tables yet. 
- Multiline string (BLOB type field) isn't supported yet. 
- Advanced search has some limitations. Each query designed translates to an OData query against Business Central. 

  - The following predicates aren't supported:  **Does Not Equal**, **Does Not Contain**, **Does Not Begin With**, **Does Not End With**, **Does Not Contain Data**, and **Contains Data**.
  - Combining **And** and **Or** groups across columns.
  - Filtering on related tables.
  - Filtering on calculated fields.

## Related information

[Overview - Integrating Business Central with Microsoft Dataverse](../developer/dataverse-integration-overview.md)  
[Table Modeling](powerplat-entity-modeling.md)  
[Application Lifecycle Management for Solutions that use Virtual tables](powerplat-app-lifecycle-management.md)  
[Business Central and [!INCLUDE[dataverse_short](../includes/dataverse_short.md)]  Admin Reference](powerplat-admin-reference.md)  
[FAQ](powerplat-faq.md)  
[Developing a Custom API](../developer/devenv-develop-custom-api.md)  
