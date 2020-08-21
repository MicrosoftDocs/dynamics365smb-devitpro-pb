---
title: "Data audit fields in Business Central"
ms.author: jswymer
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# Data Audit Fields in [!INCLUDE[prodshort](includes/prodshort.md)]

[!INCLUDE[2020_releasewave2](../includes/2020_releasewave2.md)]

[!INCLUDE[prodshort](includes/prodshort.md)] has four data audit fields present on all tables:

- SystemCreatedBy  
- SystemCreatedAt 
- SystemLastModifiedBy  
- SystemLastModifiedAt 

Data audit fields are exposed in the platform code and in AL code, allowing a developer to code against them.

## Static characteristics

The data audit fields have the following static characteristics:

|Field name (AL) |Column name (database)|Datatype|Field number|
|----------------|----------------------|--------|------------|
|SystemCreatedBy  |$SystemCreatedBy |GUID ||
|SystemCreatedAt|$SystemCreatedAt |Datetime||
|SystemLastModifiedBy|$SystemLastModifiedBy |GUID||
|SystemLastModifiedAt|$SystemLastModifiedAt |Datetime||

## Runtime characteristics

At runtime, the data audit fields have the following characteristics and behavior: 

-  The platform will automatically generate and assign values on 

  - After all OnBefore[Modify|Insert] events
  - After the Modify/Insert trigger 
  - Before all OnAfter[Modify|Insert] events

  You can't assign your own values to any of the audit fields.

- When a new record is created, before calling Insert, the audit fields are given blank GUIDs and blank dates as values.

- When a record is first inserted, the fields are populated with actual values. The SystemCreatedBy and SystemLastModifiedBy are given the same value at this point. So are the SystemCreatedAt and SystemLastModifiedAt fields.

    The SystemCreatedBy and SystemCreatedAt will not change after this point.

- When a record is updated, the SystemLastModifiedBy and SystemLastModifiedAt fields are changed.

- The following operations won't change the values of audit fields:

  - Copy company 

  - Sync operations (schema changes)

- Also note that audit fields can't be imported with configuration packages.

## In AL

As a developer, the audit fields gives you an easy and performant way to program against historical data. For example, you could write AL queries that return changed data since a specific point in time. For example: 

  - If a record is copied into a temporary table, the audit field values are copied in as well. The values aren't changed by the server when calling modify or insert.  
  - It is possible to use audit fields in a key. The BC Platform will not auto-index anything.

## See Also
 
