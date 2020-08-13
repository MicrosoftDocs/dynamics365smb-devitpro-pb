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

[!include[banner](../includes/banner.md)]

> [!IMPORTANT]
> This functionality requires version 10.0.12 for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] apps, while service update 189 is required for Common Data Service. The release information for Common Data Service is published on the [latest version availability page](https://docs.microsoft.com/business-applications-release-notes/dynamics/released-versions/dynamics-365ce#all-version-availability).

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] is a virtual data source in Common Data Service, and enables full create, read, update, delete (CRUD) operations from Common Data Service and Microsoft Power Platform. By definition, the data for virtual entities doesn't reside in Common Data Service. Instead, it continues to reside in the application where it belongs. To enable CRUD operations on [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entities from Common Data Service, entities must be made available as virtual entities in Common Data Service. The allows CRUD operations to be performed, from Common Data Service and Microsoft Power Platform, on data that resides in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] apps.

## Prerequisite reading

To understand the architecture of virtual entities for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] apps, you must understand how Common Data Service and virtual entities work. Therefore, the following documentation is a prerequisite:

- [What is Common Data Service?](https://docs.microsoft.com/powerapps/maker/common-data-service/data-platform-intro)
- [Entity overview](https://docs.microsoft.com/powerapps/maker/common-data-service/entity-overview)
- [Entity relationships overview](https://docs.microsoft.com/powerapps/maker/common-data-service/relationships-overview)
- [Create and edit virtual entities that contain data from an external data source](https://docs.microsoft.com/powerapps/maker/common-data-service/create-edit-virtual-entities)
- [What is Power Apps portals?](https://docs.microsoft.com/powerapps/maker/portals/overview)
- [Overview of creating apps in Power Apps](https://docs.microsoft.com/powerapps/maker/)

## Virtual entities for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] apps

All Open Data Protocol (OData) entities in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] are available as virtual entities in Common Data Service, and therefore also in Power Platform. Makers can now build experiences in customer engagement apps with data directly from [!INCLUDE[prodshort](../developer/includes/prodshort.md)] with full CRUD capability and without copying to Common Data Service. Power Apps Portals can be used to build external-facing websites that enable collaboration scenarios for business processes in [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

## Architecture

Virtual entities are a Common Data Service concept that is useful beyond [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. The following illustration shows how the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] provider for virtual entities is implemented. Six primary methods are implemented by the provider. The first five methods are the standard CRUD operations: **Create**, **Update**, **Delete**, **Retrieve**, and **RetrieveMultiple**. The last method, **PerformAction**, is used to call OData actions, as described later in this topic. Calls to the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Virtual Entity Data Provider (shown as "VE Plugin" in the illustration) will cause a Secure Sockets Layer (SSL)/Transport Layer Security (TLS) 1.2 secure web call to the CDSVirtualEntityService web API endpoint of [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. This web service then converts the queries into calls to the associated physical entities in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], and invokes CRUD or OData operations on those entities. Because a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entity is directly invoked in all operations, any business logic on the entity or its backing tables is also invoked.

[![Architecture of virtual entities for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] apps](../media/fovearchitecture.png)](../media/fovearchitecture.png)

During calls, there are two points of translation from Common Data Service to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] apps. The first point of translation occurs in the VE Plugin, which translates concepts such as entity physical names into [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entity names. It also converts some well-known concepts, such as Company references. The web service call still uses the EntityCollection, Entity, and QueryExpression objects to express the operations that are performed, by using the translated entity names and concepts from the VE Plugin. Finally, the CDSVirtualEntityAdapterService web API in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] completes the translation from QueryExpression to QueryBuildDataSource and other internal [!INCLUDE[prodshort](../developer/includes/prodshort.md)] language constructs.

All calls between Common Data Service and [!INCLUDE[prodshort](../developer/includes/prodshort.md)] as part of virtual entities are done as service-to-service (S2S) calls by using the Azure Active Directory (Azure AD) application that is specified in the configuration. The user of this application should have access *only* to the CDSVirtualEntityAdapterService web API and the Catalog entity, CDSVirtualEntityListEntity. These privileges are included in the out-of-box security role that is named CDSVirtualEntityApplication. During the S2S calls, Common Data Service provides the identity of the user in Common Data Service who is invoking the action. The CDSVirtualEntityAdapterService web API looks up the associated user in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] and runs the query in the context of that user. Therefore, the S2S call doesn't have to have explicit access to all the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entities. Instead, it can rely on the privileges of the user who is invoking the action to determine data access.

Power Apps Portal can also access virtual entities. Because Power Apps Portal authorization is based on contact records, a mapping between contact records and [!INCLUDE[prodshort](../developer/includes/prodshort.md)] users is maintained in the msdyn\_externalportalusermapping table in Common Data Service. This table should be editable only by highly privileged users in Common Data Service, who have the rights to control the security access of portal users to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual entities. Any [!INCLUDE[prodshort](../developer/includes/prodshort.md)] user who is set up for Power Apps Portal access must have the CDSVirtualEntityAuthorizedPortalUser security role assigned, and can't have the System administrator or Security administrator role assigned. Regardless of the Power Apps Portal security setting that is applied to virtual entities, the resulting query to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] apps is always run as the associated [!INCLUDE[prodshort](../developer/includes/prodshort.md)] user, and is subject to that user's entity and row security settings. Anonymous portal access is also supported. For information about this type of access and how it can be done, see [Power Apps Portal reference](power-portal-reference.md).
