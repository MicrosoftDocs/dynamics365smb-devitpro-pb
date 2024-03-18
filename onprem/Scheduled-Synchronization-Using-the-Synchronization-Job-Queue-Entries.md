---
title: "Synchronizing Dynamics NAV and Dynamics 365 for Sales"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
---
# Synchronizing Dynamics NAV and Dynamics 365 for Sales
With [!INCLUDE[crm_md](includes/crm_md.md)] integration, you can decide whether to synchronize data between [!INCLUDE[crm_md](includes/crm_md.md)] and [!INCLUDE[navnow_md](includes/navnow_md.md)]. Synchronization is the process that makes the data in selected fields of [!INCLUDE[navnow_md](includes/navnow_md.md)] records \(such as customers, contacts, and sales people\) and the equivalent [!INCLUDE[crm_md](includes/crm_md.md)] records \(such as accounts, contacts, and users\) the same. Conceptually, synchronization copies data between [!INCLUDE[crm_md](includes/crm_md.md)] entities and [!INCLUDE[navnow_md](includes/navnow_md.md)] record types \(tables\). Depending on the record type, data can be synchronized from [!INCLUDE[crm_md](includes/crm_md.md)] to [!INCLUDE[navnow_md](includes/navnow_md.md)] and from [!INCLUDE[navnow_md](includes/navnow_md.md)] to [!INCLUDE[crm_md](includes/crm_md.md)]. As users work with data in [!INCLUDE[crm_md](includes/crm_md.md)] and [!INCLUDE[navnow_md](includes/navnow_md.md)], synchronization keeps the data in both systems up\-to\-date.  

You can synchronize [!INCLUDE[navnow_md](includes/navnow_md.md)] with [!INCLUDE[crm_md](includes/crm_md.md)] on scheduled intervals by setting up jobs in the job queue. The synchronization jobs synchronize data in [!INCLUDE[navnow_md](includes/navnow_md.md)] records and [!INCLUDE[crm_md](includes/crm_md.md)] records that have been previously coupled together. Or for records that are not already coupled, depending on the synchronization direction and rules, the synchronization jobs can create and couple new records in the destination system. There are several synchronization jobs that are available out\-of\-the\-box when you enable the default synchronization setup. The synchronization jobs are run by codeunit **5339 Integration synch Job Runner**.  

##  <a name="DefaultSyncJobs"></a> Default Synchronization Job Queue Entries  
 The following table describes the default synchronization jobs.  

|Job Queue Entry|Description|Direction|Integration Table Mapping|  
|---------------------|---------------------------------------|---------------|-------------------------------|  
|SALESPEOPLE \- Dynamics 365 for Sales synchronization job|Synchronizes [!INCLUDE[navnow_md](includes/navnow_md.md)] salespeople with [!INCLUDE[crm_md](includes/crm_md.md)] users.|From [!INCLUDE[crm_md](includes/crm_md.md)] to [!INCLUDE[navnow_md](includes/navnow_md.md)]|SALESPEOPLE|  
|CUSTOMERS \- Dynamics 365 for Sales synchronization job|Synchronizes [!INCLUDE[crm_md](includes/crm_md.md)] accounts and [!INCLUDE[navnow_md](includes/navnow_md.md)] customers.|Bidirectional|CUSTOMER|  
|CONTACTS \- Dynamics 365 for Sales synchronization job|Synchronizes [!INCLUDE[crm_md](includes/crm_md.md)] contacts entity data and [!INCLUDE[navnow_md](includes/navnow_md.md)] contacts.|Bidirectional|CONTACT|  
|CURRENCY \- Dynamics 365 for Sales synchronization job|Synchronizes [!INCLUDE[crm_md](includes/crm_md.md)] transactions currencies with [!INCLUDE[navnow_md](includes/navnow_md.md)] currencies.|From [!INCLUDE[navnow_md](includes/navnow_md.md)] to [!INCLUDE[crm_md](includes/crm_md.md)]|CURRENCY|  
|UNITOFMEASURE \- Dynamics 365 for Sales synchronization job|Synchronizes [!INCLUDE[crm_md](includes/crm_md.md)] unit groups with [!INCLUDE[navnow_md](includes/navnow_md.md)] units of measure.|From [!INCLUDE[navnow_md](includes/navnow_md.md)] to [!INCLUDE[crm_md](includes/crm_md.md)]|UNIT OF MEASURE|  
|RESOURCE\-PRODUCT \- Dynamics 365 for Sales synchronization job|Synchronizes [!INCLUDE[crm_md](includes/crm_md.md)] products with [!INCLUDE[navnow_md](includes/navnow_md.md)] resources.|From [!INCLUDE[navnow_md](includes/navnow_md.md)] to [!INCLUDE[crm_md](includes/crm_md.md)]|RESOURCE\-PRODUCT|  
|ITEM\-PRODUCT \- Dynamics 365 for Sales synchronization job|Synchronizes [!INCLUDE[crm_md](includes/crm_md.md)] products with [!INCLUDE[navnow_md](includes/navnow_md.md)] items.|From [!INCLUDE[navnow_md](includes/navnow_md.md)] to [!INCLUDE[crm_md](includes/crm_md.md)]|ITEM\-PRODUCT|  
|Customer Statistics \- Dynamics 365 for Sales synchronization|Updates [!INCLUDE[crm_md](includes/crm_md.md)] accounts with the latest [!INCLUDE[navnow_md](includes/navnow_md.md)] customer data. In [!INCLUDE[crm_md](includes/crm_md.md)], this information appears in **Dynamics NAV Account Statistics** quick view form of accounts that are coupled to [!INCLUDE[navnow_md](includes/navnow_md.md)] customers.<br /><br /> This data can also be updated manually from each customer record. For more information, see [How to: Couple and Synchronize Records Manually](How-to-Couple-and-Synchronize-Records-Manually.md). </BR></BR>**Note:**  This job queue entry is only relevant if the [!INCLUDE[navnow_md](includes/navnow_md.md)] integration solution is installed in [!INCLUDE[crm_md](includes/crm_md.md)]. For more information, see [How to: Prepare Dynamics 365 for Sales for Integration with Dynamics NAV](How-to-Prepare-Dynamics-CRM-for-Integration.md).|Not applicable.|Not applicable.|  

## Synchronization Process  
 Each synchronization job queue entry uses a specific integration table mapping that specifies which [!INCLUDE[navnow_md](includes/navnow_md.md)] table and [!INCLUDE[crm_md](includes/crm_md.md)] entity to synchronize. The table mappings also include some settings that control which records in the [!INCLUDE[navnow_md](includes/navnow_md.md)] table and [!INCLUDE[crm_md](includes/crm_md.md)] entity to synchronize.  

 To synchronize data, [!INCLUDE[crm_md](includes/crm_md.md)] entity records must be *coupled* to [!INCLUDE[navnow_md](includes/navnow_md.md)] records. For example, a [!INCLUDE[navnow_md](includes/navnow_md.md)] customer must be coupled to a [!INCLUDE[crm_md](includes/crm_md.md)] account. You can set up couplings manually, before running the synchronization jobs, or let the synchronization jobs set up couplings automatically. The following list describes how data is synchronized between [!INCLUDE[crm_md](includes/crm_md.md)] and [!INCLUDE[navnow_md](includes/navnow_md.md)] when you are using the synchronization job queue entries.  

-   By default, only records in [!INCLUDE[navnow_md](includes/navnow_md.md)] that are coupled to records in [!INCLUDE[crm_md](includes/crm_md.md)] are synchronized. You can change the table mapping between a [!INCLUDE[crm_md](includes/crm_md.md)] entity and a [!INCLUDE[navnow_md](includes/navnow_md.md)] table so that the integration synchronization jobs will create new records in the destination database for each record in the source database that is not coupled. The new records are also coupled to the corresponding records in the source. For example, when you synchronize customers with [!INCLUDE[crm_md](includes/crm_md.md)] accounts, a new account record is created for each customer in [!INCLUDE[navnow_md](includes/navnow_md.md)]. The new accounts are automatically coupled to customers in [!INCLUDE[navnow_md](includes/navnow_md.md)]. Because the synchronization in this case is bidirectional, a new customer is created and coupled for each [!INCLUDE[crm_md](includes/crm_md.md)] account that is not already coupled.  

    > [!NOTE]  
    >  There are additional rules and filters that determine which data are synchronized. For more information, see [Synchronization Rules](Synchronizing-Dynamics-NAV-and-Dynamics-CRM.md#SynchRules).  

-   When new records are created in [!INCLUDE[navnow_md](includes/navnow_md.md)], the records use the either the template that is defined for the integration table mapping or the default template that is available for the record type. Fields are populated with data from [!INCLUDE[navnow_md](includes/navnow_md.md)] or [!INCLUDE[crm_md](includes/crm_md.md)] depending on the synchronization direction. For more information, see [How to: Modify Table Mappings for Synchronization](How-to-Modify-Table-Mappings-for-Synchronization.md).  

-   With subsequent synchronizations, only records that have been modified or added after the last successful synchronization job for the entity will be updated.  

     For any new records in [!INCLUDE[crm_md](includes/crm_md.md)], records are added in [!INCLUDE[navnow_md](includes/navnow_md.md)]. If data in fields in [!INCLUDE[crm_md](includes/crm_md.md)] records has changed, the data is copied to the corresponding field in [!INCLUDE[navnow_md](includes/navnow_md.md)].  

-   With bidirectional synchronization, the job synchronizes from [!INCLUDE[navnow_md](includes/navnow_md.md)] to [!INCLUDE[crm_md](includes/crm_md.md)], and then from [!INCLUDE[crm_md](includes/crm_md.md)] to [!INCLUDE[navnow_md](includes/navnow_md.md)].  

## See Also  
 [Integrating Microsoft Dynamics 365 for Sales in Microsoft Dynamics NAV](Integrating-Dynamics-CRM-in-Dynamics-NAV.md)   
 [How to: Set Up Scheduled Synchronization by Using the Job Queue](How-to-Set-Up-Scheduled-Synchronization-by-Using-the-Job-Queue.md)   
 [How to: Set Up a Dynamics 365 for Sales Connection](How-to-Set-Up-a-Dynamics-CRM-Connection.md)
