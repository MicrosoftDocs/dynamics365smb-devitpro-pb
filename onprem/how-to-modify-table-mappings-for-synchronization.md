---
title: "How to: Modify Table Mappings for Synchronization"
ms.date: 10/01/2018
ms.topic: article
author: jswymer
---
# How to: Modify Table Mappings for Synchronization
An integration table mapping links the [!INCLUDE[navnow_md](includes/navnow_md.md)] table to the integration table for the [!INCLUDE[crm_md](includes/crm_md.md)] entity. For each entity in [!INCLUDE[crm_md](includes/crm_md.md)] that you want to synchronize with corresponding data in [!INCLUDE[navnow_md](includes/navnow_md.md)], there must be a corresponding integration table mapping. An integration table mapping includes several settings that enable you to control how records in a [!INCLUDE[navnow_md](includes/navnow_md.md)] table and a [!INCLUDE[crm_md](includes/crm_md.md)] entity are synchronized by the corresponding integration synchronization jobs.  

## Filtering Records  
 If you do not want to synchronize all records for a specific [!INCLUDE[crm_md](includes/crm_md.md)] entity or [!INCLUDE[navnow_md](includes/navnow_md.md)] table, you can set up filters to limit the records that are synchronized. You set up filters from the **Integration Table Mappings** window.  

#### To filter records for synchronization  

1.  In the **Search** box, enter **Integration Table Mappings**, and then choose the related link.  

2.  To filter the [!INCLUDE[navnow_md](includes/navnow_md.md)] records, set the **Table Filter** field.  

3.  To filter the [!INCLUDE[crm_md](includes/crm_md.md)] records, set the **Integration Table Filter** field.  

## Creating New Records  
 By default, only records in [!INCLUDE[navnow_md](includes/navnow_md.md)] and [!INCLUDE[crm_md](includes/crm_md.md)] that are coupled will be synchronized by the integration synchronization jobs. You can set up table mappings so that new records will be created in the destination \(for example, [!INCLUDE[navnow_md](includes/navnow_md.md)]\) for each record in the source \(for example, [!INCLUDE[crm_md](includes/crm_md.md)]\) that is not already coupled.  

 For example, the SALESPEOPLE - Dynamics 365 for Sales synchronization job uses the table mapping SALESPEOPLE. The synchronization job copies data from user records in [!INCLUDE[crm_md](includes/crm_md.md)] to salesperson records in [!INCLUDE[navnow_md](includes/navnow_md.md)]. If you set up the table mapping to create new records, for every user in [!INCLUDE[crm_md](includes/crm_md.md)] that is not already coupled to a salesperson in [!INCLUDE[navnow_md](includes/navnow_md.md)], a new salesperson record is created in [!INCLUDE[navnow_md](includes/navnow_md.md)].  

#### To create new records during synchronization  

1.  In the **Search** box, enter **Integration Table Mappings**, and then choose the related link.  

2.  In the table mapping entry in the list, clear the **Synch. Only Coupled Records** field.  

## Using Configuration Templates on Table Mappings  
 You can assign configuration templates to table mappings to use for new records that are created in [!INCLUDE[navnow_md](includes/navnow_md.md)] or [!INCLUDE[crm_md](includes/crm_md.md)]. For each table mapping, you can specify a configuration template to use for new [!INCLUDE[navnow_md](includes/navnow_md.md)] records and another template to use new [!INCLUDE[crm_md](includes/crm_md.md)] records.  

 If you install the default synchronization setup, most of the time, two configuration templates will be automatically created and used on the table mapping for [!INCLUDE[navnow_md](includes/navnow_md.md)] customers and [!INCLUDE[crm_md](includes/crm_md.md)] accounts: **CRMCUST** and **CRMACCOUNT**.  

-   **CRMCUST** is used to create and synchronize new customers in [!INCLUDE[navnow_md](includes/navnow_md.md)] based on an account in [!INCLUDE[crm_md](includes/crm_md.md)].  

     This template is created by copying an existing configuration template for customers in the application. The **CRMCUST** is only created if there is an existing configuration template and the **Currency Code** field in the template is blank. If a field in the configuration template contains a value, the value will be used instead of the value in the mapped field in [!INCLUDE[crm_md](includes/crm_md.md)] account. For example, if the **Country/Region** field in a [!INCLUDE[crm_md](includes/crm_md.md)] account is *U.S.* and the **Country/Region** field in the configuration template is *GB*, then *GB* is used as the **Country/Region** in the created customer in [!INCLUDE[navnow_md](includes/navnow_md.md)].  

-   **CRMACCOUNT** is used to create and synchronize new accounts in [!INCLUDE[crm_md](includes/crm_md.md)] based on an account in [!INCLUDE[navnow_md](includes/navnow_md.md)].  

#### To specify configuration templates on a table mapping  

1.  In the **Search** box, enter **Integration Table Mappings**, and then choose the related link.  

2.  In the table mapping entry in the list, set the **Table Config Template Code** field to the configuration template to use for new records in [!INCLUDE[navnow_md](includes/navnow_md.md)].  

3.  Set the **Int. Tbl. Config Template Code** field to the configuration template to use for new records in [!INCLUDE[crm_md](includes/crm_md.md)].  

## See Also  
[Setting Up Dynamics 365 for Sales Integration in Dynamics NAV](Setting-Up-Dynamics-CRM-Integration.md )   
[Synchronizing Microsoft Dynamics NAV and Dynamics 365 for Sales](Synchronizing-Dynamics-NAV-and-Dynamics-CRM.md)   
[How to: Set Up Scheduled Synchronization by Using the Job Queue](How-to-Set-Up-Scheduled-Synchronization-by-Using-the-Job-Queue.md)  
