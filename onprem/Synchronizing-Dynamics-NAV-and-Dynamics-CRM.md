---
title: Synchronization and Data Integration
description: The synchronization copies data between Microsoft Dynamics 365 for Sales entries and Dynamics NAV records, and keeps the data in both systems up-to-date.
ms.date: 10/01/2018
ms.topic: article
author: jswymer
ms.author: jswymer
---
# Synchronizing Dynamics NAV and Dynamics 365 for Sales
With [!INCLUDE[crm_md](includes/crm_md.md)] integration, you can decide whether to synchronize data between [!INCLUDE[crm_md](includes/crm_md.md)] and [!INCLUDE[navnow_md](includes/navnow_md.md)]. Synchronization is the process that makes the data in selected fields of [!INCLUDE[navnow_md](includes/navnow_md.md)] records \(such as customers, contacts, and sales people\) and the equivalent [!INCLUDE[crm_md](includes/crm_md.md)] records \(such as accounts, contacts, and users\) the same. Conceptually, synchronization copies data between [!INCLUDE[crm_md](includes/crm_md.md)] entities and [!INCLUDE[navnow_md](includes/navnow_md.md)] record types \(tables\). Depending on the record type, data can be synchronized from [!INCLUDE[crm_md](includes/crm_md.md)] to [!INCLUDE[navnow_md](includes/navnow_md.md)] and from [!INCLUDE[navnow_md](includes/navnow_md.md)] to [!INCLUDE[crm_md](includes/crm_md.md)]. As users work with data in [!INCLUDE[crm_md](includes/crm_md.md)] and [!INCLUDE[navnow_md](includes/navnow_md.md)], synchronization keeps the data in both systems up\-to\-date.  

Synchronization is accomplished using three main elements: integration table mappings, integration field mappings, and record couplings. For a description of these elements, see [Integration Concepts and Terminology](Dynamics-CRM-Integration-Concepts-and-Terminology.md).  

Before you can start to synchronize data, you must enable the synchronization setup, if not already enabled. For more information, see how [How to: Enable Default Dynamics 365 for Sales Synchronization Setup](how-to-enable-default-dynamics-crm-synchronization-setup.md). After synchronization is enabled, the next step is to couple [!INCLUDE[navnow_md](includes/navnow_md.md)] records to [!INCLUDE[crm_md](includes/crm_md.md)] records. Once records are coupled, their data can be synchronized. The synchronization process can be initiated manually and\/or on a scheduled basis. The following table provides on overview of the ways you can synchronize records in [!INCLUDE[navnow_md](includes/navnow_md.md)] tables and records in [!INCLUDE[crm_md](includes/crm_md.md)] entities.  

|  Type  |  Method  |  See  |  
|--------|----------|-------|  
|Manual synchronization|Synchronize on a record basis.<br /><br /> You can synchronize individual [!INCLUDE[navnow_md](includes/navnow_md.md)] records, such as a customer, with a corresponding [!INCLUDE[crm_md](includes/crm_md.md)] record, such as an account. This is typically how end\-users will work with [!INCLUDE[crm_md](includes/crm_md.md)] data in the [!INCLUDE[navnow_md](includes/navnow_md.md)] client.|<!-- For general instructions:<br /><br /> -->[How to: Couple and Synchronize Records Manually](How-to-Couple-and-Synchronize-Records-Manually.md)<!-- <br /><br /> <!-- For detailed end\-user instructions:<br /><br /> [Working with Dynamics 365 for Sales Data in Microsoft Dynamics NAV](../Topic/Working-with-Dynamics-CRM-Data-in-Microsoft-Dynamics-NAV.md)-->|  
|  |Synchronize on a table mapping basis.<br /><br /> You can synchronize all records in a [!INCLUDE[navnow_md](includes/navnow_md.md)] table and [!INCLUDE[crm_md](includes/crm_md.md)] entity.|[Synchronize Individual Table Mappings](manual-synchronization-of-table-mappings.md#SyncTableMappings)|  
||Synchronize all table mappings.<br /><br /> You can synchronize records in all [!INCLUDE[navnow_md](includes/navnow_md.md)] tables that are mapped to [!INCLUDE[crm_md](includes/crm_md.md)] entities.|[Synchronize Records for All Tables](manual-synchronization-of-table-mappings.md#SyncAllRecords)|  
||Full synchronization of all table mappings.<br /><br /> You can synchronize all [!INCLUDE[navnow_md](includes/navnow_md.md)] tables and [!INCLUDE[crm_md](includes/crm_md.md)] entities that are mapped together, and create new records in the destination solution for uncoupled records in the source solution. You will typically run a full synchronization when you initially set up integration between [!INCLUDE[navnow_md](includes/navnow_md.md)] and [!INCLUDE[crm_md](includes/crm_md.md)] and only one of solutions contains data. A full synchronization can be useful in a demonstration environment.|[Run a Full Synchronization](manual-synchronization-of-table-mappings.md#FullSync)|  
|Scheduled synchronization|Full synchronization of all table mappings.<br /><br /> You can synchronize [!INCLUDE[navnow_md](includes/navnow_md.md)] with [!INCLUDE[crm_md](includes/crm_md.md)] on scheduled intervals by setting up jobs in the job queue.|[Scheduled Synchronization Using the Synchronization Job Queue Entries](Scheduled-Synchronization-Using-the-Synchronization-Job-Queue-Entries.md)|  

## Standard [!INCLUDE[crm_md](includes/crm_md.md)] Entity Mappings for Synchronization  
 The following table lists the [!INCLUDE[navnow_md](includes/navnow_md.md)] record types \(tables\) and corresponding [!INCLUDE[crm_md](includes/crm_md.md)] entities that can be synchronized out\-of\-the\-box.  

|[!INCLUDE[navnow_md](includes/navnow_md.md)]|[!INCLUDE[crm_md](includes/crm_md.md)]|Synchronization Direction|Default Filter|  
|--------------------------|-----------------------|-------------------------------|--------------------|  
|Salesperson\/Purchaser|User|From [!INCLUDE[crm_md](includes/crm_md.md)] to [!INCLUDE[navnow_md](includes/navnow_md.md)]|[!INCLUDE[crm_md](includes/crm_md.md)] contact filter: Status is **No**.|  
|Customer|Account|From [!INCLUDE[navnow_md](includes/navnow_md.md)] to [!INCLUDE[crm_md](includes/crm_md.md)] and from [!INCLUDE[crm_md](includes/crm_md.md)] to [!INCLUDE[navnow_md](includes/navnow_md.md)].|[!INCLUDE[crm_md](includes/crm_md.md)] account filter: Relationship type is **Customer** and status is **Active**.|  
|Contact|Contact|From [!INCLUDE[navnow_md](includes/navnow_md.md)] to [!INCLUDE[crm_md](includes/crm_md.md)] and from [!INCLUDE[crm_md](includes/crm_md.md)] to [!INCLUDE[navnow_md](includes/navnow_md.md)].|[!INCLUDE[navnow_md](includes/navnow_md.md)] contact filter: Type is **Person** and the contact is assigned to a company.<br /><br /> [!INCLUDE[crm_md](includes/crm_md.md)] contact filter: Contact is assigned to a company and the parent customer type is **Account**.|  
| Currency|Transaction Currency|From [!INCLUDE[navnow_md](includes/navnow_md.md)] to [!INCLUDE[crm_md](includes/crm_md.md)].||  
|Unit of Measure|Unit Group|From [!INCLUDE[navnow_md](includes/navnow_md.md)] to [!INCLUDE[crm_md](includes/crm_md.md)].||  
|Item |Product|From [!INCLUDE[navnow_md](includes/navnow_md.md)] to [!INCLUDE[crm_md](includes/crm_md.md)].||  
|Resource||From [!INCLUDE[navnow_md](includes/navnow_md.md)] to [!INCLUDE[crm_md](includes/crm_md.md)].||  
  

The [!INCLUDE[crm_md](includes/crm_md.md)] entities and [!INCLUDE[navnow_md](includes/navnow_md.md)] tables that are synchronized are defined by table mapping entries are defined in table **5335 Integration Table Map**. You can view the mappings and set up filters from page **5335 Integration Table Map**. The mapping between the fields in [!INCLUDE[navnow_md](includes/navnow_md.md)] records and the fields in [!INCLUDE[crm_md](includes/crm_md.md)] entities are defined by field mapping entries in the table **5336 Integration Field Map** and additional mapping logic. For more information, see [Integration Table Mappings](Dynamics-CRM-Integration-Concepts-and-Terminology.md#IntegTblMappingsOverview) and [Integration Field Mappings](Dynamics-CRM-Integration-Concepts-and-Terminology.md#IntegFieldMappingsOverview).  

##  <a name="SynchRules"></a> Synchronization Rules  
 The following table describes rules that control the synchronization between [!INCLUDE[crm_md](includes/crm_md.md)] entities and [!INCLUDE[navnow_md](includes/navnow_md.md)] tables.  

|  |  |  
|--|--|  
|General|Modifications to data in [!INCLUDE[crm_md](includes/crm_md.md)] that are performed by the [!INCLUDE[crm_md](includes/crm_md.md)] connection account are ignored. The changes will not be synchronized. Therefore, it is a recommended that you do not modify data by using the [!INCLUDE[crm_md](includes/crm_md.md)] connection account.<br />Deleting a coupled record on either end will create error messages that the product is unable to update the deleted records. In order to avoid such situations, make sure that you decouple coupled records before deleting them in either [!INCLUDE[crm_md](includes/crm_md.md)] or  [!INCLUDE[navnow_md](includes/navnow_md.md)] . |  
|Customers|-   Before a customer can be synchronized to an account, the salesperson that is assigned to customer must be coupled to a user in [!INCLUDE[crm_md](includes/crm_md.md)]. Therefore, when you are running the CUSTOMERS \- Dynamics 365 for Sales synchronization job and you set it up to create new records, make sure that you synchronize salespeople with [!INCLUDE[crm_md](includes/crm_md.md)] users before you synchronize customers with [!INCLUDE[crm_md](includes/crm_md.md)] accounts.<br />-   The CUSTOMERS \- Dynamics 365 for Sales synchronization job only synchronizes [!INCLUDE[crm_md](includes/crm_md.md)] accounts that have the relationship type **Customer**.|  
|Contacts|Only contacts in [!INCLUDE[crm_md](includes/crm_md.md)] that are associated with an account will be created in [!INCLUDE[navnow_md](includes/navnow_md.md)].|  
|Currencies|Currencies are coupled to transaction currencies in [!INCLUDE[crm_md](includes/crm_md.md)] based on ISO codes. Only currencies that have a standard ISO code will be coupled and synchronized with transaction currencies.|  
|Unit of Measures|Unit of measures are synchronized with unit groups in [!INCLUDE[crm_md](includes/crm_md.md)]. There can be only one unit of measure defined in the unit group.|  
|Items|When synchronizing items with [!INCLUDE[crm_md](includes/crm_md.md)] products, [!INCLUDE[navnow_md](includes/navnow_md.md)] automatically creates a price list in [!INCLUDE[crm_md](includes/crm_md.md)]. To avoid synchronization errors, you should not modify this price list manually.|  

## See Also  
 [How to: Couple and Synchronize Records Manually](How-to-Couple-and-Synchronize-Records-Manually.md)   
 [How to: Set Up Scheduled Synchronization by Using the Job Queue](How-to-Set-Up-Scheduled-Synchronization-by-Using-the-Job-Queue.md)   
 [How to: Set Up a Dynamics 365 for Sales Connection](How-to-Set-Up-a-Dynamics-CRM-Connection.md)  
