---
title: "Application lifecycle management for solutions that use virtual tables"
description: "Lifecycle management for Microsoft Dataverse tables end-to-end solutions"
ms.custom: na
ms.date: 11/26/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: solsen
---

# Application Lifecycle Management for Solutions that use Virtual Tables

[!INCLUDE[2020_releasewave2_preview](../includes/2020_releasewave2_preview.md)]

[!INCLUDE[cc_data_platform_banner](../includes/cc_data_platform_banner.md)]

> [!IMPORTANT]  
> This functionality requires version17 for [!INCLUDE[prod_short](../developer/includes/prod_short.md)], while service update 189 is required for [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. The release information for [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] is published on the [latest version availability page](/business-applications-release-notes/dynamics/released-versions/dynamics-365ce#all-version-availability).

The application lifecycle for an end-to-end solution using [!INCLUDE[prod_short](../developer/includes/prod_short.md)] virtual tables will encompass both [!INCLUDE[prod_short](../developer/includes/prod_short.md)] as well as [!INCLUDE[cds_long_md](../includes/cds_long_md.md)].

## Solution management

Virtual tables for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] do not exist in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] until they are created. Virtual tables must be created inside a solution. The **MicrosoftBusinessCentralERPVE** solution is used for this purpose. This solution will contain all the virtual tables that are created from an instance of [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

**MicrosoftBusinessCentralERPVE** is a [managed solution](/powerapps/developer/common-data-service/introduction-solutions). By definition, a managed solution cannot be modified after it has been generated. However, **MicrosoftBusinessCentralERPVE** is a managed solution that grants privileges to update the components (that is, virtual tables) that are inside it. Therefore, new virtual tables can be added to the solution as they are created, and existing virtual tables can be updated as required. Nevertheless, the privileges to modify the managed solution are available only to the platform itself. Users cannot make changes directly to the solution.

Because **MicrosoftBusinessCentralERPVE** is a managed solution, solutions from customers, partners, and independent software vendors (ISVs) can take a dependency on it. This capability allows for consistent application lifecycle management (ALM) for solutions that use and depend on the virtual tables for [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

When a solution that depends on **MicrosoftBusinessCentralERPVE** is exported, placeholders for the virtual tables that are used in the solution are added in the exported solution. When that solution is imported into another [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] environment, the import process also generates the dependent [!INCLUDE[prod_short](../developer/includes/prod_short.md)] virtual tables in the **MicrosoftBusinessCentralERPVE** solution for the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] instance that is connected to the [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] environment. Therefore, **MicrosoftBusinessCentralERPVE** must already exist before a solution that depends on it is imported. Otherwise, an error message is shown. Additionally, if a dependent table is not available in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] instance, the virtual table for that table will not be generated. Virtual tables are generated only for tables that are available.

The following list describes other solutions that [!INCLUDE[prod_short](../developer/includes/prod_short.md)] virtual tables require to work, and that must be available in the [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] environment:

- **MicrosoftBusinessCentralERPVE** - Solution that contains the generated virtual tables. 
- **MicrosoftBusinessCentralERPCatalog** – This solution provides a catalog of the available tables in a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] instance. It also provides the connection that is used to set up a configuration. For more information, see the later sections of this topic.
- **MicrosoftBusinessCentralVESupport** – This solution provides the virtual table provider for [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. The provider can communicate with [!INCLUDE[prod_short](../developer/includes/prod_short.md)]  and [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. For more information, see the next section.
- **Dynamics365Company** – This solution adds the Company table, which is referenced by all [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tables that have a **PrimaryCompanyContext** metadata value.

All these solutions must be present in an environment. Otherwise, virtual tables will not work with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] apps. These solutions are packaged together to allow for easier portability across environments.

## Managing tables from multiple environments

The **MicrosoftBusinessCentralVESupport** solution consists of the **msdyn\_ businesscentralvirtualtable** table. This table represents the virtual table data source for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] that captures connection setup information. Each record in this table represents a connection to a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] instance.

A catalog is used to list all the tables in a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] instance that are available for virtualization in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] (in other words, all the tables in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] that are enabled for Open Data Protocol \[OData\]). The catalog is part of the default **MicrosoftBusinessCentralERPCatalog** solution and is applicable to a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] instance.

Note that each [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] environment must point to only one [!INCLUDE[prod_short](../developer/includes/prod_short.md)] instance at any time, and each [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment must point to only one [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] environment. Therefore, there should be only one record in the **msdyn\_businesscentralvirtualtable** table.

The **mserp\_businesscentralvirtualtable** table that represents the catalog can be queried to list the tables in a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] instance. Because this table is a virtual table, the catalog is never persisted in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)].

Notice that the name of the catalog table has the "mserp\_" prefix. This prefix identifies the tables in the catalog as [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tables. The same prefix is also added to the system names of the virtual tables that are generated for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] in the **MicrosoftBusinessCentralERPVE** solution. Therefore, the maker can distinguish [!INCLUDE[prod_short](../developer/includes/prod_short.md)] virtual tables from other tables. The prefix is set in the managed solution and cannot be changed.

### Managing tables from multiple ISV solutions

One or more ISV solutions will take a dependency on the **MicrosoftBusinessCentralERPCatalog** solution to use virtual tables for [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. Because custom tables in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] use the same catalog as out-of-box tables in [!INCLUDE[prod_short](../developer/includes/prod_short.md)], the virtual tables for custom [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tables will also be generated in the **MicrosoftBusinessCentralERPVE** solution.

The established guidelines and ALM for table development in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] ensure that there are no conflicting table names across ISV solutions. Therefore, no conflicts of this type can occur when virtual tables are generated in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] for custom [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tables from multiple ISV solutions. All virtual tables for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tables, including custom tables, will have the "mserp\_" prefix that was mentioned earlier.

### Managing a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] instance in a [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] environment for virtual tables

One [!INCLUDE[prod_short](../developer/includes/prod_short.md)] instance must be linked to a [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] environment for virtual tables. The connection setup information that is required is captured in a virtual table data source for [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. This data source is included in the **MicrosoftBusinessCentralERPCatalog** solution.

## See Also

[Microsoft Power Platform Integration with Business Central](powerplat-overview.md)  
[Table Modeling](powerplat-entity-modeling.md)  
[Business Central and [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] Admin Reference](powerplat-admin-reference.md)  
[FAQ](powerplat-faq.md)