---
title: "Application lifecycle management for solutions that use virtual entities"
ms.custom: na
ms.date: 08/12/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---

# Application lifecycle management for solutions that use virtual entities

[!include[banner](../includes/banner.md)]

> [!IMPORTANT]
> This functionality requires version 10.0.12 for Business Central apps, while service update 189 is required for Common Data Service. The release information for Common Data Service is published on the [latest version availability page](https://docs.microsoft.com/business-applications-release-notes/dynamics/released-versions/dynamics-365ce#all-version-availability).

The application lifecycle for an end-to-end solution using Business Central virtual entities will encompass both Business Central as well as Common Data Service. This topic explains this in detail.

## Solution management

Virtual entities for Business Central don't exist in Common Data Service until they are created. Virtual entities must be created inside a solution. The MicrosoftOperationsERPVE solution is used for this purpose. This solution will contain all the virtual entities that are created from an instance of Business Central.

MicrosoftOperationsERPVE is a [managed solution](https://docs.microsoft.com/powerapps/developer/common-data-service/introduction-solutions). By definition, a managed solution can't be modified after it has been generated. However, MicrosoftOperationsERPVE is a managed solution that grants privileges to update the components (that is, virtual entities) that are inside it. Therefore, new virtual entities can be added to the solution as they are created, and existing virtual entities can be updated as required. Nevertheless, the privileges to modify the managed solution are available only to the platform itself. Users can't make changes directly to the solution.

Because MicrosoftOperationsERPVE is a managed solution, solutions from customers, partners, and independent software vendors (ISVs) can take a dependency on it. This capability allows for consistent application lifecycle management (ALM) for solutions that use and depend on the virtual entities for Business Central.

When a solution that depends on MicrosoftOperationsERPVE is exported, placeholders for the virtual entities that are used in the solution are added in the exported solution. When that solution is imported into another Common Data Service environment, the import process also generates the dependent Business Central virtual entities in the MicrosoftOperationsERPVE solution for the Business Central instance that is connected to the Common Data Service environment. Therefore, MicrosoftOperationsERPVE must already exist before a solution that depends on it is imported. Otherwise, an error message is shown. Additionally, if a dependent entity isn't available in the Business Central instance, the virtual entity for that entity won't be generated. Virtual entities are generated only for entities that are available.

The following list describes other solutions that Business Central virtual entities require to work, and that must be available in the Common Data Service environment:

- **MicrosoftOperationsERPCatalog** – This solution provides a catalog of the available entities in a Business Central instance. It also provides the connection that is used to set up a configuration. For more information, see the later sections of this topic.
- **MicrosoftOperationsVESupport** – This solution provides the virtual entity provider for Business Central apps. The provider can communicate with Business Central apps and Common Data Service. For more information, see the next section.
- **Dynamics365Company** – This solution adds the Company entity, which is referenced by all Business Central entities that have a **PrimaryCompanyContext** metadata value.

All these solutions must be present in an environment. Otherwise, virtual entities won't work with Business Central apps. These solutions are packaged together to allow for easier portability across environments.

## Managing entities from multiple environments

The MicrosoftOperationsVESupport solution consists of the **msdyn\_financeandoperationsvirtualentity** entity. This entity represents the virtual entity data source for Business Central that captures connection setup information. Each record in this entity represents a connection to a Business Central instance.

A catalog is used to list all the entities in a Business Central instance that are available for virtualization in Common Data Service (in other words, all the entities in Business Central that are enabled for Open Data Protocol \[OData\]). The catalog is part of the default MicrosoftOperationsERPCatalog solution and is applicable to a Business Central instance.

Note that each Common Data Service environment must point to only one Business Central instance at any time, and each Business Central environment must point to only one Common Data Service environment. Therefore, there should be only one record in the **msdyn\_financeandoperationsvirtualentity** entity.

The **mserp\_financeandoperationsentity** entity that represents the catalog can be queried to list the entities in a Business Central instance. Because this entity is a virtual entity, the catalog is never persisted in Common Data Service.

Notice that the name of the catalog entity has the "mserp\_" prefix. This prefix identifies the entities in the catalog as Business Central entities. The same prefix is also added to the system names of the virtual entities that are generated for Business Central in the MicrosoftOperationsERPVE solution. Therefore, the maker can distinguish Business Central virtual entities from other entities. The prefix is set in the managed solution and can't be changed.

### Managing entities from multiple ISV solutions

One or more ISV solutions will take a dependency on the MicrosoftOperationsERPVE solution to use virtual entities for Business Central. Because custom entities in Business Central use the same catalog as out-of-box entities in Business Central, the virtual entities for custom Business Central entities will also be generated in the MicrosoftOperationsERPVE solution.

The established guidelines and ALM for entity development in Business Central ensure that there are no conflicting entity names across ISV solutions. Therefore, no conflicts of this type can occur when virtual entities are generated in Common Data Service for custom Business Central entities from multiple ISV solutions. All virtual entities for Business Central entities, including custom entities, will have the "mserp\_" prefix that was mentioned earlier.

### Managing a Finance and Operation instance in a Common Data Service environment for virtual entities

One Business Central instance must be linked to a Common Data Service environment for virtual entities. The connection setup information that is required is captured in a virtual entity data source for Business Central. This data source is included in the MicrosoftOperationsERPCatalog solution.
