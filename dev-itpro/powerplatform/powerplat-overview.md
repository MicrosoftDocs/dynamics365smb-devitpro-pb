---
title: "Microsoft Power Platform integration with [!INCLUDE[prodshort](../developer/includes/prodshort.md)]"
ms.custom: na
ms.date: 08/12/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---

# Microsoft Power Platform Integration with [!INCLUDE[prodshort](../developer/includes/prodshort.md)]

> [!IMPORTANT]
> This functionality requires version 17 for [!INCLUDE[prodshort](../developer/includes/prodshort.md)], while service update 189 is required for Common Data Service. The release information for Common Data Service is published on the [latest version availability page](https://docs.microsoft.com/business-applications-release-notes/dynamics/released-versions/dynamics-365ce#all-version-availability).

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] is a virtual data source in Common Data Service, and enables create, read, update, delete (CRUD) operations from Common Data Service and Microsoft Power Platform. By definition, the data for virtual entities does not reside in Common Data Service. Instead, it continues to reside in Dynamcis 365 Business Central. To enable operations on [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entities in Common Data Service, entities must be made available as virtual entities in Common Data Service.

## Prerequisite reading

To work with [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual entities, you must understand how Common Data Service and virtual entities work. Therefore, the following documentation is a prerequisite:

- [What is Common Data Service?](https://docs.microsoft.com/powerapps/maker/common-data-service/data-platform-intro)
- [Entity overview](https://docs.microsoft.com/powerapps/maker/common-data-service/entity-overview)
- [Entity relationships overview](https://docs.microsoft.com/powerapps/maker/common-data-service/relationships-overview)
- [Create and edit virtual entities that contain data from an external data source](https://docs.microsoft.com/powerapps/maker/common-data-service/create-edit-virtual-entities)
- [Overview of creating apps in Power Apps](https://docs.microsoft.com/powerapps/maker/)

## Virtual entities for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] 

Open Data Protocol (OData) entities exposed through API Pages in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] are available can be consumed in Common Data Service and virtual entities can be generated. 
Virtual entities in Common Data Service acts as regular entities and therefore also in Power Platform. Makers can now build experiences in customer engagement apps with data directly from [!INCLUDE[prodshort](../developer/includes/prodshort.md)] with full CRUD capability and without copying to Common Data Service, and leverage all the logic already residing in [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

### Using Custom APIs as basis for Virtual Entities
Since the integration depends on APIs exposed on [!INCLUDE[prodshort](../developer/includes/prodshort.md)], custom APIs can used for generating virtual entities. 

## Known limitations
Theres known limitations with [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Virtual Entities.

-  Flows not triggered for virtual entities. Currently, Business Central currently has no way to signal Common Data Service about data change events
-  Virtual entities cannot be used in Charts. Common Data Services does not support Virtual Entities being using in Charts.
-  Relations between native and virtual entities. This is currently a limitation of the Preview version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Virtual Entities solution.
-  Virtual Entities cannot be customized on Common Data Service, e.g. adding new fields. All modifications to virtual entites needs to happen in the API exposed on Business Central. But custom APIs can be developed and consumed as virutal entities.  
-  Attachment and Images/Pictures are not supported for virtual entities.
-  Blob to Multiline support
-  Advanced search has some limitation. Each query designed translates to an OData query against Business Central. 
- The following predicates are not supported: Does Not Equal, Does Not Contain, Does Not Begin With, Does Not End With, Does Not Contain Data, Contains Data
- Combining 'And' and 'Or' groups across columns
- Filtering on related entities.

