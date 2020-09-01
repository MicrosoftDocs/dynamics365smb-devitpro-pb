---
title: "Business Central virtual entities FAQ"
ms.custom: na
ms.date: 08/12/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---

# Business Central Virtual Entities FAQ

> [!IMPORTANT]
> This functionality requires version 17 of [!INCLUDE[prodshort](../developer/includes/prodshort.md)], while service update 189 is required for Common Data Service. The release information for Common Data Service is published on the [latest version availability page](https://docs.microsoft.com/business-applications-release-notes/dynamics/released-versions/dynamics-365ce#all-version-availability).

This topic is a collection of frequently asked questions about [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual entities. 

### What version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] do I need?

17.0 is needed. 17 contains v2.0 of the standard APIs and improvements to the OData stack that enable APIs to be exposed and consumed as virtual entities. 

### Can a solution from an independent software vendor (ISV) take a dependency on virtual entities? What does the application lifecycle management (ALM) look like?

Yes. The virtual entities are all generated in the MicrosoftBusinessCentralERPVE solution, which is API-managed. In other words, the items in the solution change as you make entities visible or hidden, but the solution is still a managed solution that you can take dependency on. The standard ALM flow just takes a standard reference to a virtual entity from this solution with the **Add existing** option in the ISV solution. Missing dependency of the solution will be checked when the solution is imported and during import, if a specified virtual entity doesn't yet exist, the virtual entity is automatically made visible.

### Which entities from [!INCLUDE[prodshort](../developer/includes/prodshort.md)] do users see in the catalog in Common Data Service?

Generally, users see all entities where **IsPublic** is set to **Yes**. These entities are the same entities that are currently exposed as API Pages.

### Do all Microsoft Power Platform users have to be users in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]?

Any user of Microsoft Power Platform who tries to access [!INCLUDE[prodshort](../developer/includes/prodshort.md)] data through a virtual entity must also exist as a user in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. Therefore, technically, not *all* users have to be users in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. Only those users who access [!INCLUDE[prodshort](../developer/includes/prodshort.md)] data through virtual entities must be users in [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

### Where do I find the catalog entity?

In the **Advanced find** window, the entity is named **Available [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Entities**.

### Can I change the prefix for the virtual entities?

No. All [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual entities should be generated in the MicrosoftBusinessCentralERPVE solution, and they all have the "mserp\_" prefix. This prefix will not be changed.

### How can I filter data in an app that is created by using Power Apps, based on the current user or any other dynamic criteria, such as today-10?

You can write a pre-operation plug-in on the RetrieveMultiple message of the entity and change the criteria on the query in it. Alternatively, you can write a post-operation plug-in to filter the results before they are returned. @lukasz

### Can I pin a model-driven app into [!INCLUDE[prodshort](../developer/includes/prodshort.md)]?

No, it isn't currently possible to pin a model-driven app into [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

### How can I show, in the same grid, data from multiple virtual entities that are joined to a physical entity record in Common Data Service?

This approach isn't currently possible in Common Data Service.

### If I want a default value to be entered in a field during pre-create, will an initValue on the data entity work?

Yes. Here is the order of calls:

1. Common Data Service sends a create or update message.
2. All the existing logic on the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entity and backing tables is invoked. This logic includes default value entry that might change values.
3. Common Data Service sends another Retrieve (single) message to get the latest copy of the data, including any fields that default values were entered for.
@lukasz

### Can I debug [!INCLUDE[prodshort](../developer/includes/prodshort.md)] when we do a create, read, update, and delete (CRUD) operation from Common Data Service? If so, which process do I have to attach?

Yes, to debug in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], open Visual Studio as an admin. Typically, [!INCLUDE[prodshort](../developer/includes/prodshort.md)] apps run under w3wp.exe as a process. However, when you open Visual Studio as an admin, IISExpress.exe is automatically opened, and [!INCLUDE[prodshort](../developer/includes/prodshort.md)] is hosted there. You can attach to IISExpress.exe (or to w3wp.exe if not running Visual Studio as an admin). To set breakpoints in the virtual entity code, find the **CDSVirtualEntityAdapter** and **CDSVirtualEntityController** classes. The adapter class is the first class that is called, and it only does serialization/deserialization. It then delegates to the controller class to do the actual queries. Therefore, the controller class is usually the easiest place to put breakpoints.
@lukasz


### Does the form business logic in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] get called through virtual entities?

business logic that resides on forms isn't invoked through virtual entities. Instead, you should expect the same behavior that you get through OData access to the same entities. The expectation is that an entity that is exposed to OData (that is, **IsPublic** is set to **Yes**) has appropriate protections to ensure that data can't be corrupted. If any entity lacks this protection, that situation represents a bug in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] API exposing the entity. If you see differences in entity behavior between OData and virtual entities, that situation represents a bug in the virtual entity feature.

### If I develop a new [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entity and want to see it in Common Data Service, do I have to select Refresh entity list in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]? Do I have to do anything in Common Data Service?

In theory, no, you don't have to refresh the entity list. At most, you might have to either reset Internet Information Services (IIS) or restart IIS Express, depending on where Application Object Server (AOS) is running. The fact that the list of entities is accurate is cached in SysGlobalObjectCache, which is a per-process cache. Any time that this cache doesn't indicate that the list is accurate, the list is rebuilt. The rebuild process takes about five seconds. Therefore, when you restart your AOS process (w3wp.exe or iisexpress.exe), the list will be accurate the next time that you query it from Common Data Service. Additionally, although recompilation *should* flush the SysGlobalObjectCache cache, it might not. In that case, an AOS restart will flush it.
