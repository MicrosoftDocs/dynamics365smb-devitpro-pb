---
title: "Entity modeling"
description: "Relational modeling between Common Data Service entities used in Business Central"
ms.custom: na
ms.date: 08/12/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---

# Entity Modeling

[!INCLUDE[2020_releasewave2_preview](../includes/2020_releasewave2_preview.md)]

> [!IMPORTANT]
> This functionality requires version 17 for [!INCLUDE[prodshort](../developer/includes/prodshort.md)], while service update 189 is required for Common Data Service. The release information for Common Data Service is published on the [latest version availability page](https://docs.microsoft.com/business-applications-release-notes/dynamics/released-versions/dynamics-365ce#all-version-availability).

Building an app requires capabilities to perform relational modeling between entities that are being used in the app. In the context of virtual entities, there will be scenarios where virtual entities and native entities in Common Data Service must work together to enable the desired user experience. This topic explains concepts of relational modeling that can be implemented using virtual entities for [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

## Generating virtual entities

By default, virtual entities for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] do not exist in Common Data Service. A user must query the catalog entity to view the entities that are available in the linked instance of [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. From the catalog, the user can select one or more entities, and then request that Common Data Service generate the virtual entities. This procedure is explained in later sections.

## Entity fields

<!-- @lukasz - please look at the entire section -->

When a virtual entity is generated for a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entity, the system tries to create each field in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entity in the corresponding virtual entity in Common Data Service. In an ideal case, the total number of fields will be the same in both entities, unless there is a mismatch in supported data types between [!INCLUDE[prodshort](../developer/includes/prodshort.md)] and Common Data Service. For data types that are supported, the field properties in Common Data Service are set based on the properties in [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

This rest of this section describes supported and unsupported data types. For more information about fields in Common Data Service, see [Fields overview](https://docs.microsoft.com/powerapps/maker/common-data-service/fields-overview).

| Data type in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] | Modeled data type in Common Data Service |
|-------------------------------------|------------------------------------------|
| Real                                | Decimal<br><br>For information about the possible mismatch, see the next table.</p> |
| Long                                | Decimal, where the precision equals 0 (zero) |
| Int                                 | Integer |
| String (non-memo), String (memo)    | String – single line of text, String – multiple lines of text |
| UtcDateTime                         | DateTime (DateTimeFormat.DateAndTime, DateTimeBehavior.TimeZoneIndependent)<br><br>An empty date (January 1, 1900) in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] is surfaced as a null value in Common Data Service. |
| Date                                | DateTime - (DateTimeFormat.DateOnly, DateTimeBehavior.TimeZoneIndependent)<br><br>An empty date (January 1, 1900) in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] is surfaced as an empty value in Common Data Service. |
| Enum                                | Picklist<br><br>[!INCLUDE[prodshort](../developer/includes/prodshort.md)] enumerations (enums) are generated as global OptionSets in Common Data Service. Matching between the systems is done by using the **External Name** property of values. Enum integer values in Common Data Service are not guaranteed to be stable between the systems. Therefore, you should not rely on them, especially in the case of extensible enums in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], because these enums do not have a stable ID either. OptionSet metadata is updated when an entity that uses the OptionSet is updated. <!-- @lukasz - how do we handle enums?-->| 
| Blob | Multiline | 

Fields of the *real* and *long* data types in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] are modeled as the *decimal* data type in Common Data Service. Because of the mismatch in precision and scale between the two data types, the following behavior must be considered.

| Use case                                     | Resulting behavior |
|----------------------------------------------|--------------------|
| Common Data Service has higher precision.    | This use case should never occur unless the metadata is out of sync. |
| [!INCLUDE[prodshort](../developer/includes/prodshort.md)] has higher precision. | During a read operation, the value is rounded to the closest precision value in Common Data Service. If the value is edited in Common Data Service, it is rounded to the closest precision value in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. During a write operation, the value that is specified in Common Data Service is written, because [!INCLUDE[prodshort](../developer/includes/prodshort.md)] supports higher precision. |
| Common Data Service has higher scale.        | Not applicable |
| [!INCLUDE[prodshort](../developer/includes/prodshort.md)] has higher scale.     | Common Data Service shows the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] value, even if it exceeds 100 billion. However, there will be a loss of precision. For example, 987,654,100,000,000,000 is shown in Common Data Service as "987,654,099,999,999,900". If the value of this field is edited in Common Data Service, Common Data Service validation throws an error that the value exceeds the maximum value before that value is sent to [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. |

The following data types in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] are not supported in Common Data Service. Fields of these data types in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entities won't be made available in the corresponding virtual entities in Common Data Service. If fields of these data types are used as parameters in Open Data Protocol (OData) actions, those actions won't be available for use in the corresponding virtual entities. For more information about OData actions, see the [OData actions](#odata-actions) section later in this topic.

<!-- @antino which datatypes in BC is not supported in CDS? -->

## Entity key - primary key

In [!INCLUDE[prodshort](../developer/includes/prodshort.md)], entities uses the SystemId (GUID) as the primary key, which uniquely identifies a record in a [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. In Common Data Service, the SystemId exposed by the entity is used as the primary key.

## Primary field

<!-- @lukasz, please look through this section. How do we set the primary field. We use displayName when possible. For ducuments we use No. But, what do we use when displayName/No. is not there? -->

In Common Data Service, each entity must have a primary field. This field must be a single field of the string type. The primary field is used in Common Data Service in the following scenarios:

- The default views that are created for an entity include the primary field.
- The quick view form for an entity includes the primary field.
- A lookup to another entity is added to a page and shows the data from the primary field.

Based on this use of the primary field in Common Data Service, the primary field for a virtual entity for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] is designed to use the entity key of the corresponding entity in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. 

Because the primary field in Common Data Service is expected to have only one field of the string type, whereas the entity key in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] can have multiple fields of various data types, the entity key fields are converted to strings. The strings are concatenated and separated by a pipe (\|), to a maximum length of 255 characters. Any value that exceeds 255 is truncated. This virtual entity field that represents the primary field is named **mserp\_primaryfield**.

## Relations

> [!IMPORTANT]
> A write transaction that spans a virtual entity and a native entity is not supported. We do not recommend using this form of transaction, as there is no way to ensure consistency.

Relations in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entities are modeled as one-to-many (1:n) or many-to-one (n:1) relations. These relations are modeled as relationships in the virtual entity in Common Data Service. Note that many-to-many (n:n) relations are not supported in [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

For example, in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], if Entity A has a foreign key to Entity B, this relation will be modeled as an n:1 relationship in virtual entity Entity A in Common Data Service. The schema name of this relationship in Common Data Service uses the naming convention **mserp\_FK\_\<source entity name\>\_\<relation name\>**. This naming convention has a maximum string length of 120 characters. Any relation where the schema name will produce a name that exceeds 120 characters won't be generated in the virtual entity in Common Data Service.

The external name of this relationship uses the naming convention **FK\_\<relation name\>**. The external name is used to determine the relation in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] when the query that is sent to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] is built.

When a relationship is generated for a virtual entity in Common Data Service, a new field of the lookup type is also added to the source entity. In the preceding example, when the relationship is created, a new lookup field that uses the naming convention **mserp\_fk\_\<target\_entity\>\_id** is added to source entity Entity A. Because there can be several relations in an entity in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], the same number of lookup fields (one per related entity) will be created in the source virtual entity. When this lookup field is added to a page or a view, it will show the primary field value from the related entity.

A relationship in the virtual entity in Common Data Service will be generated only if the related entity in the relation already exists as a virtual entity in Common Data Service. In the preceding example, if Entity B does not exist as a virtual entity in Common Data Service, the relation to Entity B will not be created in Entity A when Entity A is generated as a virtual entity. This relation will be added to Entity A only when Entity B is generated as a virtual entity. Therefore, when a virtual entity is generated for [!INCLUDE[prodshort](../developer/includes/prodshort.md)], validations are done to ensure that only relationships that can be complete and functional are generated in the virtual entity that is being generated.

In summary, a relationship to another [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual entity might not exist in the virtual entity for either of the following reasons:

- The [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entity that is participating in the relationship does not exist as a virtual entity.
- The length of the name of the relationship exceeds 120 characters.

Note that if an error is encountered when any part of a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual entity is generated in Common Data Service, the virtual entity will not be created at all. If relationships do not exist for either of the preceding reasons, the situation is not considered an error.

### Native entity–to–native entity relationships

Native entity–to–native entity relationships are the standard Common Data Service functionality, where relationships are resolved by using the GUID of the related entity. (This GUID is the entity key.) The GUID identifies the unique entity record in the related entity.

### Virtual entity–to–virtual entity relationships

The relationships between two [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual entities are driven by the relation metadata in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entities. As was explained earlier, these relations are generated as relationships in Common Data Service when the virtual entity is generated. As in the behavior for native entities in Common Data Service, these relationships use the GUID to identify the unique record of the entity in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. Semantically, the GUID on the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual entity behaves like the GUID on the native Common Data Service entity. For information about the implementation of the GUID in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual entities, see the [Entity key/primary key](powerplat-entity-modeling.md#entity-key---primary-key) section earlier in this topic.

In the preceding example, the GUID of the related entity is the entity key of Entity B and will be used to build queries to identify a record in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. The relation that Entity A has to Entity B will be used.

Therefore, in effect, the entity name is the only information that is used in a relation that comes from [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. The entity name gives access to the primary field in the related entity, so that it can be shown in the lookup. It also gives access to the GUID of the related entity, so that it can be used in other queries, as was explained earlier. The actual field that the relation is built on in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entity is not used at all.


<!-- ### Virtual entity–to–native entity relationship
@lukasz scenario description in here is good.

As was explained earlier, the GUID is the only information that is used to uniquely identify a record in a native Common Data Service entity (including in native entity–to–native entity relationships) or in a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual entity (including in virtual entity–to–virtual entity relationships). However, consider an example where you want to show sales orders from [!INCLUDE[prodshort](../developer/includes/prodshort.md)] for Account A in Common Data Service. The query that is sent to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] for this relationship will have a WHERE clause on the GUID of the entity key of the native accounts entity in Common Data Service, because the sales orders must be filtered for a specific account in Common Data Service. However, because [!INCLUDE[prodshort](../developer/includes/prodshort.md)] does not have any information about the GUID of the entity in Common Data Service, the query won't return any sales orders. The query will be successful only if the WHERE clause has conditions that are based on the fields that [!INCLUDE[prodshort](../developer/includes/prodshort.md)] understands.

Therefore, how can the GUID of the accounts entity in Common Data Service be replaced with fields that are in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], in such a way that the query that is sent to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] will return the correct list of sales orders?

To solve this issue and enable a rich set of scenarios that allows for virtual entity–to–native entity relationships, relationships can be added to this type of entity. The relation will appear as a relationship when the virtual entity is synced.

In the above example, the relationship between the SalesOrderHeader virtual entity and the Account native entity should be based on the Account Number and Company fields. By default, the native account entity in Common Data Service does not have a company field. For this example, we will add a company lookup field named new_testcompany to the native Account entity.

Next, we add a new key named new_accountcompanyidx, which specifies that (accountnumber, new_testcompany) together represent a unique row in the account entity in Common Data Service.

The next step is to define this relationship in X++. The following example shows sample X++ code. The names of the fields, index, and mapping information should match the names of the fields and indexes created in Common Data Service. In this example, a relationship named “synthaccount” will be created between the virtual SalesorderHeader entity and the native account entity in Common Data Service. The mapped fields make up the new_accountcompanyidx index. The display name for the relationship will be @SYS11307. Note the backslash at the start of the display name. This ensures that the label defines the relationship, so that it is appropriately translated.

The field mapping indicates which field on the virtual entity maps to the field on the native entity. In the field mapping, the key is the virtual entity field, and the value is the native entity field.

```x++
[CDSVirtualEntitySyntheticRelationshipAttribute('synthaccount', 'account', 'accountcompanyidx', '\@SYS11307')]
    public static Map syntheticAccountRelationship()
    {
        Map fieldMapping = new Map(Types::String, Types::String);

        // Assumes the Common Data Service account entity has a key on [msdyn_accountnumber, msdyn_companyid]
        // Also assumes that the Common Data Service cdm_Company entity has a key on [msdyn_companycode]
        fieldMapping.insert(fieldStr(CDSVirtualEntityTestEntity, StringField), 'msdyn_accountnumber');
        fieldMapping.insert(fieldStr(CDSVirtualEntityTestEntity, DataAreaId), 'msdyn_companyid');

        return fieldMapping;
    }
```
The next step is to generate or refresh the virtual entity to get the new relationship. Note that relationships between a virtual entity and a native entity cannot be updated in Common Data Service once it is created. The only way to make an update is to physically remove the relationship, refresh the entity, and then physically re-add the relationship in order to resolve the issue.

This relationship looks like a typical GUID-based relationship, but has extra metadata to translate query filters on the relationship into restrictions on the backing fields. The query that is now generated will have a WHERE clause that is based on the fields that [!INCLUDE[prodshort](../developer/includes/prodshort.md)] apps recognize. That query will then return the filtered list of sales orders, as expected. -->


<!--
### Native entity–to–virtual entity relationships

Native entity–to–virtual entity relationships works much like native entity–to–native entity relationships. Users associate native records with virtual records in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], and the GUID of the virtual entity is saved on the native entity record. As was explained earlier, the entities that participate in a relationship will have the GUID field of the related entity on them. Therefore, when a quotation in Common Data Service is associated with a customer in a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual entity, the GUID of the customer virtual entity will be saved in the quotation entity. This behavior enables records to be retrieved as expected, by using standard Common Data Service functionality.
-->
## Enums

Enums in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] are modeled as OptionSets in Common Data Service. When a virtual entity for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] is generated, the required enums are generated as OptionSets. If an OptionSet already exists, it is used instead.

## Company

An entity in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] can be bound to a company, or it can be global. The virtual entity for a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entity that is bound to a company will have a relationship to the cdm\_company entity in Common Data Service. The cdm\_company entity is a native entity in Common Data Service and is part of the Dynamics365Company solution. As always, when a relationship is created, a lookup field is also created in the virtual entity for the related entity (cdm\_company in this case). This lookup field is named **Company**, and it must be used to provide an optimal user experience where users can select a value in a list or go to the details of the related record. A field that is named **Company Code** is also added in the virtual entity. The value is a four-character string. This field must be used in programming.

## Attachments

Attachments in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entities are supported on a per-entity basis. For example, an invoice header entity will implement an invoice-related attachments entity to enable attachments via entities.

Entities of this type will have relations with the corresponding attachments entity in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. Therefore, they will follow the same pattern as the other relations that were discussed earlier. In other words, [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entities that have implemented attachments functionality will also make attachments available by using virtual entities. [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entities that do not support attachments also will not support attachments when they are virtualized in Common Data Service.

Note that [!INCLUDE[prodshort](../developer/includes/prodshort.md)] virtual entities support only the reading of attachments. They do not currently support the creation, update, or deletion of attachments by using virtual entities.

## OData actions

OData actions in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entities are made available as custom actions in Common Data Service. For more information about custom actions and what they enable in Common Data Service, see [Custom actions](https://docs.microsoft.com/powerapps/developer/common-data-service/custom-actions).

Input and output parameters of the following types are supported. If an input or output parameter is of a different type, the OData action does not appear as the SDK message in Common Data Service.

- Integer
- String
- Guid
- Boolean
- Date/Datetime

Here are some examples of OData actions that are supported in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entities, but that are not supported in the corresponding virtual entities in Common Data Service:

- RetailStoreTenderTypeTable.queryDistinctTenderTypeIdAndName (a collection of RetailStoreTenderTypeTable entity)
- DocumentRoutingClientApp.syncPrinters (DocumentRoutingClientApp entity)
- DocumentRoutingClientApp.updateJobStatus (DocumentRoutingJobStatus enum)
- DimensionCombination.getCombinationDisplayValue (LedgerJournalACType enum)

## Labels and localization

Labels that are defined on metadata, such as entity names and field names in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], are retrieved when virtual entities are generated in Common Data Service. The labels are retrieved using an API on [!INCLUDE[prodshort](../developer/includes/prodshort.md)] called **entityDefinitions**. This API is available on every API route, and will serve translations and other entity metadata, not suited for OData $metadata. But with both the entityDefinition and $metadata Common Data Service has all it needs to generate localized virtual entities.  

Any runtime labels are returned in the language of the current user context. In other words, they are returned in the language that is specified on that user's UserInfo record in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. This behavior also applies to error messages.

## Error handling

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] create, read, update, and delete (CRUD) business logic on entities and backing tables is run when it is called through the virtual entity in Common Data Service. If any exception is thrown on the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] side, the last message in the error log is returned to Common Data Service and is thrown as an InvalidPluginExecutionException exception that contains the message from [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. Because the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] code runs in the context of the user, the language of the error message is based on the language that is specified on the UserInfo record in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. If any messages that are written to the info log in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] do not result in an exception, they are not shown in Common Data Service.

## Calculated/unmapped fields

Calculated and unmapped fields in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] entities are also available in the corresponding virtual entities in Common Data Service.

## See Also

[Microsoft Power Platform Integration with Business Central](powerplat-overview.md)  
[Application Lifecycle Management for Solutions that use Virtual Entities](powerplat-app-lifecycle-management.md)  
[Business Central and Common Data Service Admin Reference](powerplat-admin-reference.md)  
[FAQ](powerplat-faq.md)  