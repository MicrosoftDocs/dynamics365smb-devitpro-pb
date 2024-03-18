---
title: "How to: Modify Table Mappings for Synchronization"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
---
# How to: Modify Table Mappings for Synchronization
An integration table mapping links the [!INCLUDE[navnow_md](includes/navnow_md.md)] table to the integration table for the [!INCLUDE[crm_md](includes/crm_md.md)] entity. For each entity in [!INCLUDE[crm_md](includes/crm_md.md)] that you want to synchronize with corresponding data in [!INCLUDE[navnow_md](includes/navnow_md.md)], there must be a corresponding integration table mapping. An integration table mapping includes several settings that enable you to control how records in a [!INCLUDE[navnow_md](includes/navnow_md.md)] table and a [!INCLUDE[crm_md](includes/crm_md.md)] entity are synchronized by the corresponding integration synchronization jobs.  

You can view the status of the individual synchronization jobs that have been run for [!INCLUDE[crm_md](includes/crm_md.md)] integration. This includes synchronization jobs that have been run from the job queue and manual synchronization jobs that were performed on records from the [!INCLUDE[navnow_md](includes/navnow_md.md)] client.  

This is helpful when troubleshooting synchronization problem because it enables you to access details about specific errors that occur.  

### To view synchronization job log  
1.  In the **Search** box, enter **Integration Synchronization Log**, and then choose the related link.  

2.  If one or more error occurred for a synchronization job, the number of errors appears in the **Failed** column. To view the errors for the job, choose the number.  

    > [!TIP]  
    >  You can view all synchronization job errors by opening the synchronization job error log directly. For more information, see [To view the synchronization error log](How-to-View-Synchronization-Status.md#SynchErrorLog).  

### To view synchronization job log from the Table Mappings  

1.  In the **Search** box, enter **Integration Table Mappings**, and then choose the related link.  

2.  In the **Integration Table Mappings** window, select an entry, and then on the **Home** tab, in the **Process** group, choose **Integration Synch. Job Log**.  

##  <a name="SynchErrorLog"></a>To view the synchronization error log  

-   In the **Search** box, enter **Integration Synchronization Errors** and then choose the related link.  

## See Also  
[Setting Up Dynamics 365 for Sales Integration in Dynamics NAV](Setting-Up-Dynamics-CRM-Integration.md )   
 [How to: Enable Default Dynamics 365 for Sales Synchronization Setup](How-to-Enable-Default-Dynamics-CRM-Synchronization-Setup.md)   
 [How to: Set Up Scheduled Synchronization by Using the Job Queue](How-to-Set-Up-Scheduled-Synchronization-by-Using-the-Job-Queue.md)  
