---""''&copy;&trade;&reg;*
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

Every table in [!INCLUDE[prodshort](includes/prodshort.md)] includes the following four system fields, which can be used for auditing records:

- SystemCreatedAt

   Specifies the data and time that the record was created
- SystemCreatedBy

  Specifies security ID (SID) of the user that created the record 
- SystemLastModifiedAt

  Specifies the data and time that the record was last modified.
- SystemLastModifiedBy

  Specifies the SID of the user that last modified the record

Data audit fields are automatically added by the platform. The platform also exposes the fields in AL code, allowing developers to code against them.

## Static characteristics

The data audit fields have the following static characteristics:

|Field name (in AL) |Column name (in database)|Data type|Field number|
|----------------|----------------------|--------|------------|
|SystemCreatedAt|$SystemCreatedAt |DateTime|2000000001|
|SystemCreatedBy  |$SystemCreatedBy |GUID |2000000002|
|SystemLastModifiedAt|$SystemLastModifiedAt |DateTime|2000000003|
|SystemLastModifiedBy|$SystemLastModifiedBy |GUID|2000000004|

## Runtime characteristics

At runtime, the data audit fields have the following characteristics and behavior: 

-  The platform will automatically generate and assign values on the following  

   - After all  [OnBeforeInsert](triggers/devenv-onbeforeinsert-trigger.md) and [OnBeforeModify](triggers/devenv-onbeforemodify-trigger.md) triggers are run
   - After the [OnInsert](triggers/devenv-oninsert-trigger.md) and [OnModify](triggers/devenv-onmodify-trigger.md) triggers are run.
   - Before all [OnAfterInsert](triggers/devenv-onafterinsert-trigger.md) and [OnAfterModify](triggers/devenv-onaftermodify-trigger.md) triggers are run.

    You can't assign your own values to any of the audit fields.

- When a new record is created, before calling Insert, the audit fields are given blank GUIDs and blank dates as values.

- When a record is first inserted, the fields are populated with actual values.

    The SystemCreatedBy and SystemLastModifiedBy fields are given the same value. So are the SystemCreatedAt and SystemLastModifiedAt fields.

    The SystemCreatedBy and SystemCreatedAt won't change after this point.

- When a record is updated, the SystemLastModifiedBy and SystemLastModifiedAt fields are changed.

- The following operations won't change the values of audit fields:

  - Copy company. The values in the tables of the company being copied stay the same, and the values are copied to the tables of the new company.
  - Synchronizing the table schema with the application.

- Audit fields can't be imported with configuration packages.

## Working in AL

As a developer, the audit fields give you an easy and performant way to program against historical data. For example, you could write AL queries that return  data since a specific point in time. For example:

- If a record is copied into a temporary table, the audit field values are copied as well. The values aren't changed by the server when calling modify or insert.  
- It's possible to use audit fields in a key. The platform won't auto-index anything.

## See Also
