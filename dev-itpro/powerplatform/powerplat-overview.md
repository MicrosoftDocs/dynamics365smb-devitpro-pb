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
> This functionality requires version 10.0.12 for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] apps, while service update 189 is required for Common Data Service. The release information for Common Data Service is published on the [latest version availability page](https://docs.microsoft.com/business-applications-release-notes/dynamics/released-versions/dynamics-365ce#all-version-availability).

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] is a virtual data source in Common Data Service, and enables full create, read, update, delete (CRUD) operations from Common Data Service and Microsoft Power Platform. By definition, the data for virtual entities does not reside in Common Data Service. Instead, it continues to reside in Dynamcis 365 Business Central. To enable CRUD operations on [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entities from Common Data Service, entities must be made available as virtual entities in Common Data Service. The allows CRUD operations to be performed, from Common Data Service and Microsoft Power Platform, on data that resides in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] apps.

## Prerequisite reading

To understand the architecture of virtual entities for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] apps, you must understand how Common Data Service and virtual entities work. Therefore, the following documentation is a prerequisite:

- [What is Common Data Service?](https://docs.microsoft.com/powerapps/maker/common-data-service/data-platform-intro)
- [Entity overview](https://docs.microsoft.com/powerapps/maker/common-data-service/entity-overview)
- [Entity relationships overview](https://docs.microsoft.com/powerapps/maker/common-data-service/relationships-overview)
- [Create and edit virtual entities that contain data from an external data source](https://docs.microsoft.com/powerapps/maker/common-data-service/create-edit-virtual-entities)
- [Overview of creating apps in Power Apps](https://docs.microsoft.com/powerapps/maker/)

## Virtual entities for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] 

All Open Data Protocol (OData) entities exposed through API Pages in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] are available as virtual entities in Common Data Service, and therefore also in Power Platform. Makers can now build experiences in customer engagement apps with data directly from [!INCLUDE[prodshort](../developer/includes/prodshort.md)] with full CRUD capability and without copying to Common Data Service.

### Custom APIs
