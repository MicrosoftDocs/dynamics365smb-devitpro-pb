---
title: "How to: Set Up Scheduled Synchronization by Using the Job Queue"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
---
# How to: Set Up Scheduled Synchronization by Using the Job Queue

You can synchronize [!INCLUDE[navnow_md](includes/navnow_md.md)] and [!INCLUDE[crm_md](includes/crm_md.md)] on scheduled intervals by setting up jobs in the job queue. There are several synchronization jobs that are available out\-of\-the\-box when you enable the default synchronization setup. The synchronization jobs are run by codeunit **5339 Integration synch Job Runner**. For more information about the default [!INCLUDE[crm_md](includes/crm_md.md)] synchronization jobs, see [Scheduled Synchronization Using the Synchronization Job Queue Entries](Scheduled-Synchronization-Using-the-Synchronization-Job-Queue-Entries.md).  

 By default, the [!INCLUDE[crm_md](includes/crm_md.md)] synchronization jobs are in the **Ready** status.  

### To prepare the integration table mappings for synchronization  

-   If you do not want to synchronize all records for a specific [!INCLUDE[crm_md](includes/crm_md.md)] entity or [!INCLUDE[navnow_md](includes/navnow_md.md)] table, you can set up filters on table mappings to limit the records that are synchronized. By default, some of the [!INCLUDE[crm_md](includes/crm_md.md)] synchronization job queue entries are configured with filters. For example, in the CUSTOMER \-Dynamics 365 for Sales synchronization job, [!INCLUDE[crm_md](includes/crm_md.md)] accounts have a filter to synchronize only accounts that have a customer relationship type of customer.  

-   By default, only records in [!INCLUDE[navnow_md](includes/navnow_md.md)] and [!INCLUDE[crm_md](includes/crm_md.md)] that are coupled will be synchronized by the integration synchronization jobs. You can set up table mappings so that new records will be created in the destination \(for example, [!INCLUDE[navnow_md](includes/navnow_md.md)]\) for each record in the source \(for example, [!INCLUDE[crm_md](includes/crm_md.md)]\) that is not already coupled. The new record is then coupled to the source record.  

For more information, see [How to: Modify Table Mappings for Synchronization](How-to-Modify-Table-Mappings-for-Synchronization.md).  

### To run the [!INCLUDE[crm_md](includes/crm_md.md)] synchronization jobs  

1.  Open the **Job Queue Entries** window.  

     You can also access the [!INCLUDE[crm_md](includes/crm_md.md)] synchronization job queue entries from the **Microsoft Dynamics 365 for Sales  Connection Setup** window. In the **Search** box, enter **Microsoft Dynamics 365 for Sales  Connection Setup**, and then choose the related link. On the **Navigate** tab, in the **General** group, choose **Synch. Job Queue Entries**.  

2.  In the **Job Queue Entries** window, set the status of the [!INCLUDE[crm_md](includes/crm_md.md)] synchronization jobs to **Ready** and make any other changes to the jobs as needed.  

    > [!IMPORTANT]  
    >  If you have set up the synchronization jobs to create new records, then when you enable synchronization for the first time, we recommend that you run the jobs in the following order to avoid dependency errors:  
    >   
    > 1.  CURRENCY \- Dynamics 365 for Sales synchronization job  
    > 2.  SALEPEOPLE \- Dynamics 365 for Sales synchronization job  
    > 3.  UNITOFMEASURE \- Dynamics 365 for Sales synchronization job  
    > 4.  CUSTOMER \- Dynamics 365 for Sales synchronization job  
    > 5.  CONTACTS \- Dynamics 365 for Sales synchronization job  
    > 6.  RESOURCE\-PRODUCT \- Dynamics 365 for Sales synchronization job  
    > 7.  ITEM\-PRODUCT \- Dynamics 365 for Sales synchronization job  

<!-- removed for NAV 2017 3.  Activate a job queue to run the synchronization jobs.  

     For more information, see [How to: Set Up Job Queues](../Topic/How-to:-Set-Up-Job-Queues.md).  -->

The jobs are now ready to run and scheduled synchronization with [!INCLUDE[crm_md](includes/crm_md.md)] is now fully enabled. For more information, see [How to: View the Dynamics 365 for Sales Synchronization Job Queue Status](How-to-View-Synchronization-Job-Queue-Status.md).  

## See Also  
[Synchronizing Microsoft Dynamics NAV and Dynamics 365 for Sales](Synchronizing-Dynamics-NAV-and-Dynamics-CRM.md)   
[Setting Up Dynamics 365 for Sales Integration in Dynamics NAV](Setting-Up-Dynamics-CRM-Integration.md )   
[How to: Set Up a Dynamics 365 for Sales Connection](How-to-Set-Up-a-Dynamics-CRM-Connection.md)    
[Integrating Dynamics 365 for Sales in Dynamics NAV](Integrating-Dynamics-CRM-in-Dynamics-NAV.md)   
