---
title: "table modeling"
description: "Relational modeling between Microsoft Dataverse tables used in Business Central"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---

# table Modeling

[!INCLUDE[2020_releasewave2_preview](../includes/2020_releasewave2_preview.md)]

> [!IMPORTANT]  
> This functionality requires version 17 for [!INCLUDE[prodshort](../developer/includes/prodshort.md)], while service update 189 is required for [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. The release information for [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] is published on the [latest version availability page](https://docs.microsoft.com/business-applications-release-notes/dynamics/released-versions/dynamics-365ce#all-version-availability).

Building an app requires capabilities to perform relational modeling between tables that are being used in the app. In the context of virtual tables, there will be scenarios where virtual tables and native tables in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] must work together to enable the desired user experience. This topic explains concepts of relational modeling that can be implemented using virtual tables for [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

## Generating virtual tables

By default, virtual tables for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] do not exist in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. A user must query the catalog table to view the tables that are available in the linked instance of [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. From the catalog, the user can select one or more tables, and then request that [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] generates the virtual tables. This procedure is explained in later sections.

## table fields

When a virtual table is generated for a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] table, the system tries to create each field in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] table in the corresponding virtual table in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. In an ideal case, the total number of fields will be the same in both tables, unless there is a mismatch in supported data types between [!INCLUDE[prodshort](../developer/includes/prodshort.md)] and [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. For data types that are supported, the field properties in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] are set based on the properties in [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

The rest of this section describes supported and unsupported data types. For more information about fields in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)], see [Fields overview](https://docs.microsoft.com/powerapps/maker/common-data-service/fields-overview).

| Data type in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] | Modeled data type in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] |
|-------------------------------------|------------------------------------------|
| Real                                | Decimal<br><br>For information about the possible mismatch, see the next table.</p> |
| Long                                | Decimal, where the precision equals 0 (zero) |
| Int                                 | Integer |
| String (non-memo), String (memo)    | String – single line of text, String – multiple lines of text |
| UtcDateTime                         | DateTime (DateTimeFormat.DateAndTime, DateTimeBehavior.TimeZoneIndependent)<br><br>An empty date (January 1, 1900) in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] is surfaced as a null value in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. |
| Date                                | DateTime - (DateTimeFormat.DateOnly, DateTimeBehavior.TimeZoneIndependent)<br><br>An empty date (January 1, 1900) in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] is surfaced as an empty value in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. |
| Enum                                | Picklist<br><br>[!INCLUDE[prodshort](../developer/includes/prodshort.md)] enumerations (enums) are generated as global OptionSets in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. Matching between the systems is done by using the **External Name** property of values. Enum integer values in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] are not guaranteed to be stable between the systems. Therefore, you should not rely on them, especially in the case of extensible enums in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], because these enums do not have a stable ID either. OptionSet metadata is updated when an table that uses the OptionSet is updated.| 

Fields of the *real* and *long* data types in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] are modeled as the *decimal* data type in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. Because of the mismatch in precision and scale between the two data types, the following behavior must be considered.

| Use case                                     | Resulting behavior |
|----------------------------------------------|--------------------|
| [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] has higher precision.    | This use case should never occur unless the metadata is out of sync. |
| [!INCLUDE[prodshort](../developer/includes/prodshort.md)] has higher precision. | During a read operation, the value is rounded to the closest precision value in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. If the value is edited in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)], it is rounded to the closest precision value in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. During a write operation, the value that is specified in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] is written, because [!INCLUDE[prodshort](../developer/includes/prodshort.md)] supports higher precision. |
| [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] has higher scale.        | Not applicable. |
| [!INCLUDE[prodshort](../developer/includes/prodshort.md)] has higher scale.     | [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] shows the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] value, even if it exceeds 100 billion. However, there will be a loss of precision. For example, 987,654,100,000,000,000 is shown in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] as "987,654,099,999,999,900". If the value of this field is edited in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)], [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] validation throws an error that the value exceeds the maximum value before that value is sent to [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. |

The following data types in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] are not supported in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. Fields of these data types in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tables will not be made available in the corresponding virtual tables in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. If fields of these data types are used as parameters in Open Data Protocol (OData) actions, those actions will not be available for use in the corresponding virtual tables. For more information about OData actions, see the [OData actions](powerplat-table-modeling.md#odata-actions) section later in this topic.


## table key - primary key

In [!INCLUDE[prodshort](../developer/includes/prodshort.md)], tables use the SystemId (GUID) as the primary key, which uniquely identifies a record in a [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. In [!INCLUDE[cds_long_md](../includes/cds_long_md.md)], the SystemId exposed by the table is used as the primary key.

## Primary field

In [!INCLUDE[cds_long_md](../includes/cds_long_md.md)], each table must have a primary field. This field must be a single field of the string type. The primary field is used in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] in the following scenarios:

- The default views that are created for an table include the primary field.
- The quick view form for an table includes the primary field.
- A lookup to another table is added to a page and shows the data from the primary field.

The primary field for a virtual table for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] is designed to use **displayname** field on table if present. If this field is not present the first string field is chosen as the primary field.

## Relations

> [!IMPORTANT]  
> A write transaction that spans a virtual table and a native table is not supported. Using this form of transaction is not recommended, as there is no way to ensure consistency.

Relations in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tables are modeled as one-to-many (1:n) or many-to-one (n:1) relations. These relations are modeled as relationships in the virtual table in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. Note that many-to-many (n:n) relations are not supported in [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

For example, in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], if table A has a foreign key to table B, this relation will be modeled as an n:1 relationship in virtual table table A in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. The schema name of this relationship in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] uses the naming convention **dyn365bc\_\<source table name\>\_\<target_table name\>**. This naming convention has a maximum string length of 120 characters. Any relation where the schema name will produce a name that exceeds 120 characters will not be generated in the virtual table in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. It is required that the foreign key is a SystemId (GUID). If the foreign key is of a different type then the relation will not be generated.

The external name of this relationship uses the naming convention **\<relation name\>**. The external name is used to determine the relation in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] when the query that is sent to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] is built.

When a relationship is generated for a virtual table in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)], a new field of the lookup type is also added to the source table. In the preceding example, when the relationship is created, a new lookup field that uses the naming convention **dyn365bc\_\<target\_table\>\_id** is added to source table table A. Because there can be several relations in an table in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], the same number of lookup fields (one per related table) will be created in the source virtual table. When this lookup field is added to a page or a view, it will show the primary field value from the related table.

A relationship in the virtual table in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] will be generated only if the related table in the relation already exists as a virtual table in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. In the preceding example, if table B does not exist as a virtual table in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)], the relation to table B will not be created in table A when table A is generated as a virtual table. This relation will be added to table A only when table B is generated as a virtual table. Therefore, when a virtual table is generated for [!INCLUDE[prodshort](../developer/includes/prodshort.md)], validations are done to ensure that only relationships that can be complete and functional are generated in the virtual table that is being generated.

In summary, a relationship to another [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual table might not exist in the virtual table for either of the following reasons:

- The [!INCLUDE[prodshort](../developer/includes/prodshort.md)] table that is participating in the relationship does not exist as a virtual table.
- The foreign key is not SystemId (GUID).
- The length of the name of the relationship exceeds 120 characters.

> [!NOTE]  
> If an error is encountered when any part of a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual table is generated in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)], the virtual table will not be created at all. If relationships do not exist for either of the preceding reasons, the situation is not considered an error.

### Native table–to–native table relationships

Native table–to–native table relationships are the standard [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] functionality, where relationships are resolved by using the GUID of the related table. (This GUID is the table key.) The GUID identifies the unique table record in the related table.

### Virtual table–to–virtual table relationships

The relationships between two [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual tables are driven by the relation metadata in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tables. As was explained earlier, these relations are generated as relationships in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] when the virtual table is generated. As in the behavior for native tables in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)], these relationships use the GUID to identify the unique record of the table in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. Semantically, the GUID on the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual table behaves like the GUID on the native [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] table. For information about the implementation of the GUID in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual tables, see the [table key/primary key](powerplat-table-modeling.md#table-key---primary-key) section earlier in this topic.

In the preceding example, the GUID of the related table is the table key of table B and will be used to build queries to identify a record in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. The relation that table A has to table B will be used.

Therefore, in effect, the table name is the only information that is used in a relation that comes from [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. The table name gives access to the primary field in the related table, so that it can be shown in the lookup. It also gives access to the GUID of the related table, so that it can be used in other queries, as was explained earlier. The actual field that the relation is built on in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] table is not used at all.


### Virtual table–to–native table relationship

The relationship between [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual table and native table is not supported in the preview version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual table solution.

## Enums

Enums in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] are modeled as OptionSets in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. When a virtual table for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] is generated, the required enums are generated as OptionSets. If an OptionSet already exists, it is used instead.

## Company

If [!INCLUDE[prodshort](../developer/includes/prodshort.md)] has multiple companies, the default company must be selected. This can be done either on a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual table configuration page or on a User table page.

Furthermore, every virtual table for a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] table have a relationship to the cdm\_company table in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. The cdm\_company table is a native table in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] and is part of the Dynamics365Company solution. As always, when a relationship is created, a lookup field is also created in the virtual table for the related table (cdm\_company in this case). This lookup field is named **Company**, and it must be used to provide an optimal user experience where users can select a value in a list or go to the details of the related record. A field that is named **Company Code** is also added in the virtual table. This field must be used in programming.

## OData actions

OData actions in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tables are made available as custom actions in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. For more information about custom actions and what they enable in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)], see [Custom actions](https://docs.microsoft.com/powerapps/developer/common-data-service/custom-actions).

OData actions generated for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] have only one parameter which is the table. There is no output parameter.

## Labels and localization

Labels that are defined on metadata, such as table names and field names in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], are retrieved when virtual tables are generated in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. The labels are retrieved using an API on [!INCLUDE[prodshort](../developer/includes/prodshort.md)] called **tableDefinitions**. This API is available on every API route, and will serve translations and other table metadata, not suited for OData `$metadata`. But with both the tableDefinition and `$metadata` [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] has all it needs to generate localized virtual tables.  

Any runtime labels are returned in the language of the current user context. In other words, they are returned in the language that is specified on that user's UserInfo record in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. This behavior also applies to error messages.

## Error handling

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] create, read, update, and delete (CRUD) business logic on tables and backing tables is run when it is called through the virtual table in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. If any exception is thrown on the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] side, the last message in the error log is returned to [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] and is thrown as an InvalidPluginExecutionException exception that contains the message from [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. Because the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] code runs in the context of the user, the language of the error message is based on the language that is specified on the UserInfo record in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. If any messages that are written to the info log in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] do not result in an exception, they are not shown in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)].

## Calculated/unmapped fields

Calculated and unmapped fields in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tables are also available in the corresponding virtual tables in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)].

## See Also

[Microsoft Power Platform Integration with Business Central](powerplat-overview.md)  
[Application Lifecycle Management for Solutions that use Virtual tables](powerplat-app-lifecycle-management.md)  
[Business Central and [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] Admin Reference](powerplat-admin-reference.md)  
[FAQ](powerplat-faq.md)  
