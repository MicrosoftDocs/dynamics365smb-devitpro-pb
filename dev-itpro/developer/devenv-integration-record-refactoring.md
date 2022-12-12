---
title: Integration Management Refactoring Guidance
description: This article offers guidance for refactoring the code in your AppSource app or per-tenant extension to use system fields rather than integration records.
author: brentholtorf
ms.author: bholtorf
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.date: 12/08/2022
ms.custom: bap-template

---

# Refactor Integration Management

In 2023 release wave 1 (version 22.0) Microsoft will remove legacy integration records code from Business Central. The obsoletion was announced in-product in version 15.0. We expect that most AppSource apps or per-tenant extensions for [!INCLUDE [prod_short](../includes/prod_short.md)] already use integration records based on [System Fields](devenv-table-system-fields.md). For those that don't, this article offers guidance for refactoring your code to use system fields rather than integration records.

Using system fields instead of integration records offers the following benefits:

* Better overall performance. Code that subscribes to codeunit 49 GlobalTriggerManagement negatively impacts the performance of the entire system. In general, avoid these subscribers. Subscribing to global triggers disables the bulk SQL Insert, Modify, and Delete operations for this specific table. Each record will be processed separately. Also, for every modification of the main record we would need to update the integration record, increasing the number of SQL operations and growing transaction size.  
* Smaller table data sizes. The Integration Record table would often be one of the largest tables in the system. To reference this table in a performant way, we had to add fields to the other records. Refactoring away from the table means we don’t have to do that.
* Improved ability to audit changes. Integration records were only stored for selected tables. System fields, on the other hand, are automatically included in every table object by the platform. Integration records also stored the mutable RecordId field, whereas the SystemId field is a GUID (globally-unique identifier) data type field that specifies a unique, immutable (read-only) identifier for records in the table.

## Removed objects

The following list contains objects that will be removed in 2023 release wave 1.

* table 5151 "Integration Record"
* table 5152 "Integration Record Archive"
* table 5377 "Ext Txt ID Integration Record"
* codeunit 5150 "Integration Management"
* codeunit 5151 "Integration Service"
* codeunit 5515 "Integration Management Setup"

## Use audit fields to track changes

The following table lists and describes the fields to use to track changes in your app.
  
|Field  |Description  |
|---------|---------|
|SystemId ($systemId) | The SystemId field is a GUID data type field that specifies a unique, immutable (read-only) identifier for records in the table. The SystemId field has the following characteristics:<br>* All records must have a value in the SystemId field.<br>* You can assign your own value when a record is inserted in the database. Otherwise, the platform will automatically generate and assign a value.<br>* After the SystemId is set you can't change it.<br>* There's always a unique secondary key on the SystemId field to ensure records don't have identical field values. |
|Data audit fields | * SystemCreatedAt ($systemCreatedAt) specifies the data and time that the record was created.<br>* SystemCreatedBy ($systemCreatedBy) specifies the security ID (SID) of the user who created the record.<br>* SystemModifiedAt ($systemModifiedAt) specifies the data and time that the record was last modified.<br>* SystemModifiedBy ($systemModifiedBy) specifies the SID of the user that last modified the record. |
|Timestamp | * The timestamp field contains rowversion numbers for records, as maintained in SQL Server. In SQL server, timestamp is a synonym for the rowversion data type.<br>* The value of the timestamp field is an automatically generated unique binary number.<br>* Timestamp is a way to version-stamp table rows.<br>* The Timestamp field lets you identify records that have changed since the last synchronization.<br>* In AL code, the timestamp is available through the SystemRowVersion field. However, you cannot write to the field.|  

## Tracking deletions

There are several ways to track deletions.

1. Use SystemId to fetch a record. If the record isn’t found, it’s was deleted. The SystemId is immutable, so if it doesn’t find a record with the same ID the record was deleted. The disadvantage of this approach is that you can’t know when the record was deleted.
1. If you must track when the record was deleted, you have following options:

    * Subscribe to the `OnAfterGetDatabaseTableTriggerSetup` and `OnAfterOnDatabaseDelete` events from codeunit 49 GlobalTriggerManagement. From the subscriber, you can update the local table that you're using to track deletions. 
    * Enable the change log for the tables needed and use the records from change tracking to get deletes. Learn more at [Auditing Changes in Business Central](/dynamics365/business-central/across-log-changes).

## Refactor your APIs

Make sure your API pages use the `ODataKeyFields` property, and use the immutable systemId GUID as the key.

Instead of tracking last modification date on the table with a custom field, use the systemModifiedAt audit field and expose it on your API pages.

## Rebuild couplings for integrations to Dynamics 365 Sales

If your [!INCLUDE [prod_short](../includes/prod_short.md)] version 14 is integrated with Dynamics 365 Sales, after you upgrade to latest versions you must rebuild coupling tables. To do that, on the **Microsoft Dynamics 365 Connection Setup** page, choose **Cloud Migration**, and then choose the **Rebuild Coupling Table** action.

The Rebuild Coupling Table action will schedule the coupling table to be rebuilt. It'll also open the corresponding job queue entry so you can monitor its progress and restart the job if something goes wrong.

### Update custom Dataverse integration event subscribers

Previously, [Customizing an Integration with Microsoft Dataverse](../administration/administration-custom-cds-integration.md) had two subscribers:

* Integration Management codeunit, `OnIsIntegrationRecord` event
* Integration Management codeunit, `OnAfterAddToIntegrationPageList` event

These events are no longer used and you can delete them from your Dataverse integration apps.

## See Also

[Deprecated Features in the Platform - Clients, Server, and Database](../upgrade/deprecated-features-platform.md)  
[System Fields](devenv-table-system-fields.md)