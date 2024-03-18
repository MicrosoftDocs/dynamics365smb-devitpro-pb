---
title: "How to: Enable Default Configuration Setup"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
---
# How to: Enable Default Configuration Setup
With [!INCLUDE[crm_md](includes/crm_md.md)] integration, you can decide whether to synchronize data between [!INCLUDE[crm_md](includes/crm_md.md)] and [!INCLUDE[navnow_md](includes/navnow_md.md)].

This topic describes how to enable the default synchronization setup between [!INCLUDE[navnow_md](includes/navnow_md.md)] and [!INCLUDE[crm_md](includes/crm_md.md)]. You can use the default synchronization set up to get [!INCLUDE[crm_md](includes/crm_md.md)] integration up and running for the first time, out-of-the-box. You can also perform this task to revert your synchronization set up back to the default setup. The default synchronization setup specifies the following items:  

-   Integration table mappings that map [!INCLUDE[navnow_md](includes/navnow_md.md)] tables, such as salespeople and customers, to [!INCLUDE[crm_md](includes/crm_md.md)] entities, such as users and accounts.  

-   Synchronization job queue entries that synchronize data on scheduled intervals.  

-   Integration IDs for [!INCLUDE[navnow_md](includes/navnow_md.md)] records to be integrated with [!INCLUDE[crm_md](includes/crm_md.md)].  

> [!IMPORTANT]  
>  If you enable the default synchronization setup, any existing custom configurations for [!INCLUDE[crm_md](includes/crm_md.md)] integration, such as table mappings and field mappings, will be deleted.  

> [!NOTE]  
>  If you are re\-enabling a [!INCLUDE[crm_md](includes/crm_md.md)] connection, then you might want to generate integration IDs for new records that were added while the connection was disabled. For more information, see [Generating Integration IDs for New Records](How-to-Enable-Default-Dynamics-CRM-Synchronization-Setup.md#GenIntIds).  

### To enable the default [!INCLUDE[crm_md](includes/crm_md.md)] synchronization setup

1.  In the **Search** box, enter **5330 CRM Connection Setup**, and then choose the related link.  

2.  The [!INCLUDE[crm_md](includes/crm_md.md)] connection must be enabled first. To enable the connection, select the **Enable** check box.  

3.  On the **Actions** tab, in the **General** group, choose **Use Default Synchronization Setup**, and then choose the **OK** button.  

4.  Choose the **OK** button when done.  

 You can now synchronize coupled [!INCLUDE[crm_md](includes/crm_md.md)] records and [!INCLUDE[navnow_md](includes/navnow_md.md)] records. You can perform this manually on an individual record basis or automatically on a scheduled time interval by using the default [!INCLUDE[crm_md](includes/crm_md.md)] synchronization jobs. For more information, see [How to: Couple and Synchronize Records Manually](How-to-Couple-and-Synchronize-Records-Manually.md) and [Scheduled Synchronization Using the Synchronization Job Queue Entries](Scheduled-Synchronization-Using-the-Synchronization-Job-Queue-Entries.md).  

##  <a name="GenIntIds"></a> Generating Integration IDs for New Records  
 To synchronize records in [!INCLUDE[navnow_md](includes/navnow_md.md)], such as customers or contacts, with [!INCLUDE[crm_md](includes/crm_md.md)] entity records, the [!INCLUDE[navnow_md](includes/navnow_md.md)] record must have an integration ID. When a [!INCLUDE[crm_md](includes/crm_md.md)] connection is enabled, integration IDs for new records are automatically generated. However, in some cases, you may temporarily disable the [!INCLUDE[crm_md](includes/crm_md.md)] connection. If you want to integrate [!INCLUDE[navnow_md](includes/navnow_md.md)] records that were added while the [!INCLUDE[crm_md](includes/crm_md.md)] was disabled, you must generate integration IDs for the records. Complete the following procedure to populate the integration IDs for the new records.  

#### To enable the default [!INCLUDE[crm_md](includes/crm_md.md)] synchronization setup  

1.  In the **Search** box, enter **5330 CRM Connection Setup**, and then choose the related link.  

2.  On the **Actions** tab, in the **General** group, choose **Generate Integration IDs**, and then choose the **OK** button.  

3.  Choose the **OK** button when done.  

## See Also   
 [Setting Up Dynamics 365 for Sales Integration in Dynamics NAV](Setting-Up-Dynamics-CRM-Integration.md )   
 [How to: Set Up a Dynamics 365 for Sales Connection](How-to-Set-Up-a-Dynamics-CRM-Connection.md)   
