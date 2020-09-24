---
title: "FAQ for Partial Records"
description: Aswers some of the most typical questions about the partial records capability in Business Central
ms.author: jswymer
ms.custom: na
ms.date: 08/06/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# FAQ for Partial Records

This article answers some of the most typical questions about the partial records capability in [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

# Do I need to change any code to keep my solution functional? 

No. If a field that's not selected for loading is accessed, the data will be fetched automatically for the current record. The field will then be selected for loading on future requests by using this record instance. However, you may still get the message *Record has been modified by another user*, like you could before. But now, the message can also appear in read-only scenarios where the record isn't locked. 

## Where is "Partial Records" applied? To all records instances?

Currently, partial records capability is only used on report data items and web service pages. The behavior for all other record instances is as before, that is, all fields will be loaded. AL developers are, however, able to use it in their own code to improve performance in looping code. 

## What happens when accessing fields not selected for load?

The platform will load any fields not selected for loading when accessed, making it seem like the field was already loaded. 

## What happens if the record has been modified or deleted in between the original load and JIT load?

The platform will validate that either the record is unchanged, or no change has been made to read fields.

## What's a JIT load? 

The platform determines that a field, which isn't currently loaded, is needed. Then it loads the field.

## Can I optimize my code, so that I can avoid an extra database call to load my field?

Yes. You can add your field to the list of fields selected for loading, using the method AddLoadFields

## Which fields can be selected not to be loaded?

Any field that isn't a FlowField, FlowFilter, Primary Key, Timestamp, SystemId, Audit Fields, or Blobs.

## How do partial records interact with table extensions?

When no fields from a table extension are selected for loading, then table extension data isn't joined, which saves time.  

## What's the performance overhead of determining the fields necessary for a record? 

Currently, for reports a calculation takes place at compile time and once per data item instance.  For OData and API pages, the calculation takes place at compile time and once per request segment.

Compared to the time it takes to fetch data, the overhead is insignificant.

## Can I disable partial records in certain scenarios?

- With [!INCLUDE [prodshort](includes/prodshort.md)] on-premises, you can turn it off by using **Enable Partial Records** setting of [!INCLUDE [server](includes/server.md)]. 

- With [!INCLUDE [prodshort](includes/prodshort.md)] online, you can set the field selected for loading by calling the SetLoadFields method with no fields, which will revert it to previous behavior.

## See Also

[Performance Articles For Developers](../performance/performance-developer.md)  
[Get, Find, and Next Methods](devenv-get-find-and-next-methods.md)  
[Configuring Business Central Server](../administration/configure-server-instance.md)  