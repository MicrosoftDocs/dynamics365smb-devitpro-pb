---
title: Couple and Synchronize Records Manually
description: Synchronizing an integration table mapping enables data syncing in all records of Dynamics NAV table and Dynamics 365 for Sales entity that coupled together.
ms.date: 10/01/2018
ms.topic: article
author: jswymer
---
# Couple and Synchronize Records Manually in Dynamics NAV
An integration table mapping associates a [!INCLUDE[navnow_md](includes/navnow_md.md)] table (record type), such as Customer, with a [!INCLUDE[crm_md](includes/crm_md.md)] entity, such as Account. Synchronizing an integration table mapping enables you to synchronize data in all records of the [!INCLUDE[navnow_md](includes/navnow_md.md)] table and [!INCLUDE[crm_md](includes/crm_md.md)] entity that coupled together. Additionally, depending on the configuration of the table mapping, synchronization can create and couple new records in the destination solution for uncoupled records in the source.

This topic describes how to couple [!INCLUDE[navnow_md](includes/navnow_md.md)] records with [!INCLUDE[crm_md](includes/crm_md.md)] records. The coupling enables users to view [!INCLUDE[crm_md](includes/crm_md.md)] records from the [!INCLUDE[navnow_md](includes/navnow_md.md)] client and [!INCLUDE[crm_md](includes/crm_md.md)] records from [!INCLUDE[navnow_md](includes/navnow_md.md)] records. You can use this procedure to couple a [!INCLUDE[navnow_md](includes/navnow_md.md)] record to an existing record in [!INCLUDE[crm_md](includes/crm_md.md)] or create and couple to a new record. The coupling also enables you to synchronize data between the records.  

## To couple a record  

1.  In the [!INCLUDE[navnow_md](includes/navnow_md.md)] client, open the record card, such as a customer or contact.  

    You can also just open the list page and select the record that you want to couple.  

2.  Choose the **Set Up Coupling** action.  

3.  Fill in the fields, and then choose the **OK** button.  

## To synchronize a single record  

1.  In the [!INCLUDE[navnow_md](includes/navnow_md.md)] client, open the record, such as a customer or contact.  

2.  Choose the **Synchronize Now** action.  

3.  If a record can be synchronized either from [!INCLUDE[navnow_md](includes/navnow_md.md)] to [!INCLUDE[crm_md](includes/crm_md.md)] or from [!INCLUDE[crm_md](includes/crm_md.md)] to [!INCLUDE[navnow_md](includes/navnow_md.md)], select the option that specifies the direction of data update, and then choose the **OK** button.  

## To synchronize multiple records  

1.  In the [!INCLUDE[navnow_md](includes/navnow_md.md)] client, open the list page for the record, such as the customers or contacts.  

2.  Select the records that you want to synchronize, and then choose the **Synchronize Now** action.  

4.  If records can be synchronized either from [!INCLUDE[navnow_md](includes/navnow_md.md)] to [!INCLUDE[crm_md](includes/crm_md.md)] or from [!INCLUDE[crm_md](includes/crm_md.md)] to [!INCLUDE[navnow_md](includes/navnow_md.md)], select the option that specifies the direction of data update, and then choose the **OK** button.  

## See Also  
[Synchronizing Microsoft Dynamics NAV and Dynamics 365 for Sales](Synchronizing-Dynamics-NAV-and-Dynamics-CRM.md)   
[Scheduled Synchronization Using the Synchronization Job Queue Entries](Scheduled-Synchronization-Using-the-Synchronization-Job-Queue-Entries.md)   
[Setting Up Dynamics 365 for Sales Integration in Dynamics NAV](Setting-Up-Dynamics-CRM-Integration.md)   
[How to: View Microsoft Dynamics 365 for Sales Synchronization Status](how-to-view-synchronization-status.md)  
