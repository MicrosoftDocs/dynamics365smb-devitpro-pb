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

[!INCLUDE[2020_releasewave2](../includes/2020_releasewave2.md)] includes development features for tagging business data with specific classifications. Specifically, this includes data that is stored in table fields of the database and telemetry data that is emitted from the application.    

[!INCLUDE[prodshort](includes/prodshort.md)] has four data audit fields present on all tables:

- SystemCreatedBy  
- SystemCreatedOn 
- SystemLastModifiedBy  
- SystemLastModifiedOn 

## Data audit fields

The data audit fields have the following static characteristics:

|Field name (AL) |Column name (database)|Datatype|Field number|
|----------------|----------------------|--------|------------|
|SystemCreatedBy  |$SystemCreatedBy |GUID ||
|SystemCreatedOn|$SystemCreatedOn |Datetime||
|SystemLastModifiedBy|$SystemLastModifiedBy |GUID||
|SystemLastModifiedOn|$SystemLastModifiedOn |Datetime||

## Runtime

At runtime, the data audit fields have the following characteristics and behavior: 

- It is not possible to assign your own value to any of the audit fields. The platform will automatically generate and assign values 

  - After all OnBefore[Modify|Insert] events
  - After the Modify/Insert trigger 
  - Before all OnAfter[Modify|Insert] events

- When creating a new record (before calling Insert), all audit fields will have blank GUIDs and blank dates as values. 

- When a record is first inserted, the fields SystemCreatedBy and SystemCreatedOn are populated with values. They will then remain like that and cannot be changed. The values of the fields SystemLastModifiedBy and SystemLastModifiedOn will be populated with the same values as the  SystemCreated* fields.  

- Any subsequent updates to the record will only trigger an update to the fields SystemLastModifiedBy and SystemLastModifiedOn. 

- The following operations will not change the values of audit fields:

  - Copy company 

  - Sync operations (schema changes) 

- Also note that audit fields cannot be imported with configuration packages. 

- The data audit fields are exposed in the platform code and for AL code, allowing you to code against them. For example: 

  - If a record is copied into a temp table, the audit field values are copied in as well. The values are not changed by the server when calling modify/insert.  
  - It is possible to use audit fields in a key. The BC Platform will not auto-index anything 

## See Also
 
