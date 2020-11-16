---
title: "Microsoft Power Platform integration with Business Central"
description: "Integration of Power Platform with Business Central"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---

# Microsoft Power Platform Integration with Business Central

[!INCLUDE[2020_releasewave2_preview](../includes/2020_releasewave2_preview.md)]

[!INCLUDE[cc_data_platform_banner](../includes/cc_data_platform_banner.md)]

> [!IMPORTANT]  
> This functionality requires version 17 for [!INCLUDE[prodshort](../developer/includes/prodshort.md)], while service update 189 is required for [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. The release information for [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] is published on the [latest version availability page](https://docs.microsoft.com/business-applications-release-notes/dynamics/released-versions/dynamics-365ce#all-version-availability).

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] Virtual table, which is published on AppSource, is a virtual data source in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)], and enables create, read, update, delete (CRUD) operations from [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] and Microsoft Power Platform. By definition, the data for virtual tables does not reside in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. Instead, it continues to reside in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. To enable operations on [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tables in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)], tables must be made available as virtual tables in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)].

## Prerequisite reading

To work with [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual tables, you must understand how [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] and virtual tables work. Therefore, the following documentation is a prerequisite:

- [What is [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]?](https://docs.microsoft.com/powerapps/maker/common-data-service/data-platform-intro)
- [Table overview](https://docs.microsoft.com/powerapps/maker/common-data-service/table-overview)
- [Table relationships overview](https://docs.microsoft.com/powerapps/maker/common-data-service/relationships-overview)
- [Create and edit virtual tables that contain data from an external data source](https://docs.microsoft.com/powerapps/maker/common-data-service/create-edit-virtual-tables)
- [Overview of creating apps in Power Apps](https://docs.microsoft.com/powerapps/maker/)

## Virtual tables for Business Central

Open Data Protocol (OData) tables exposed through API Pages in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] can be consumed in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] and virtual tables can be generated. 
Virtual tables in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] acts as regular tables and therefore also in Power Platform. Makers can now build experiences in customer engagement apps with data directly from [!INCLUDE[prodshort](../developer/includes/prodshort.md)] with full CRUD capability and without copying to [!INCLUDE[cds_long_md](../includes/cds_long_md.md)], and leverage all the logic already residing in [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

### Using Custom APIs as basis for virtual tables

Since the virtual tables depend on APIs exposed on [!INCLUDE[prodshort](../developer/includes/prodshort.md)], custom APIs can also used for generating virtual tables. For more information, see [Developing a Custom API](../developer/devenv-develop-custom-api.md).

## Known limitations

There are known limitations with [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual tables including:

- Flows are not triggered for virtual tables. Currently, [!INCLUDE[prodshort](../developer/includes/prodshort.md)] has no way to signal [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] about data change events.
- Virtual tables cannot be used in Charts. [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]s does not support virtual tables being using in Charts.
- Relations between native and virtual tables. This is currently a limitation of the **Preview** version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual tables solution.
- Virtual tables cannot be customized on [!INCLUDE[cds_long_md](../includes/cds_long_md.md)], for example, adding new columns. All modifications to virtual tables must happen in the API exposed on [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. But custom APIs can be developed and consumed as virtual tables.  
- Attachment and Images/Pictures are not supported for virtual tables.
- BLOB to multiline support is not supported in the preview.
- Advanced search has some limitations. Each query designed translates to an OData query against [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. 
  * The following predicates are not supported: **Does Not Equal**, **Does Not Contain**, **Does Not Begin With**, **Does Not End With**, **Does Not Contain Data**, and **Contains Data**.
  * Combining **And** and **Or** groups across columns.
  * Filtering on related tables.

## See Also

[Table Modeling](powerplat-entity-modeling.md)  
[Application Lifecycle Management for Solutions that use Virtual tables](powerplat-app-lifecycle-management.md)  
[Business Central and [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] Admin Reference](powerplat-admin-reference.md)  
[FAQ](powerplat-faq.md)  
[Developing a Custom API](../developer/devenv-develop-custom-api.md)  
