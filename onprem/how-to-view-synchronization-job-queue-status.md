---
title: "Synchronizing Dynamics NAV and Dynamics 365 for Sales"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
ms.prod: "dynamics-nav-2018"
---
# How to: View Synchronization Job Queue Status
You can set up and run synchronization jobs when integrating [!INCLUDE[navnow_md](includes/navnow_md.md)] with [!INCLUDE[crm_md](includes/crm_md.md)] to ensure that data remains the same in both [!INCLUDE[navnow_md](includes/navnow_md.md)] and [!INCLUDE[crm_md](includes/crm_md.md)]. Viewing the [!INCLUDE[crm_md](includes/crm_md.md)] synchronization job status enables you to see whether any jobs have failed and the cause of the failure.  

### To view [!INCLUDE[crm_md](includes/crm_md.md)] synchronization job status from the Microsoft Dynamics 365 for Sales  Connection Setup window  

1.  In the **Search** box, enter In the **Search** box, enter **Microsoft Dynamics 365 for Sales  Connection Setup**, and then choose the related link.  

2.  On the **Navigate** tab, in the **General** group, choose **Synch. Job Queue Entries**.  

### To view the [!INCLUDE[crm_md](includes/crm_md.md)] synchronization job status from IT Manager Role Center  

1.  Open the IT Manager Role Center.  

2.  The [!INCLUDE[crm_md](includes/crm_md.md)] synchronization job status is available in the **365 for Sales Synch. Job Status Part** window.  

     If this part is not displayed, do the following:  

    1.  On the **Application** menu ![Dynamics NAV Application menu.](/media/ApplicationMenuIcon.png "RTC\_ApplicationMenu"), select **Customize**, and then **Customize this Page**.  

    2.  In the **Customize the Role Center** window, in the **Available parts** field, select **365 for Sales Synch. Job Status**, and then choose **Add**.  

    3.  Use the **Move Up**, **Move Down**, **Move Left**, and **Move Right** buttons to position the part on your Role Center.  

    4.  Choose the **OK** button.  

3.  The **365 for Sales Synch. Job Status Part** window includes the **Failed Synch. Jobs** Cue that displays the total number of failed synchronization jobs. To view the details of the failures, choose the Cue.  

     The **Failed Synch. Job** list opens.  

    > [!TIP]  
    >  You can also open the **Failed Synch. Job** list by entering **Failed Synch Jobs** in the **Search** box, and then choose the related link.  

4.  You can perform the following operations from the menu on **365 for Sales Synch. Job Status Part**:  

    -   To reset the Cue to zero, choose **Reset**.  

         Counting starts from the last time that a [!INCLUDE[crm_md](includes/crm_md.md)] synchronization job was in the **Ready** state.  

    -   To view and modify the [!INCLUDE[crm_md](includes/crm_md.md)] synchronization jobs in the Job Queue, choose **Job Queue Entries.**  

    -   To view or change the settings of the connection from [!INCLUDE[navnow_md](includes/navnow_md.md)] to [!INCLUDE[crm_md](includes/crm_md.md)], choose **Microsoft Dynamics 365 for Sales  Connection Setup**.  

## See Also  
 [Integrating Dynamics 365 for Sales in Dynamics NAV](Integrating-Dynamics-CRM-in-Dynamics-NAV.md)   
 [How to: Set Up a Dynamics 365 for Sales Connection](How-to-Set-Up-a-Dynamics-CRM-Connection.md)   
 [How to: View the Dynamics 365 for Sales Connection Status](How-to-view-dynamics-crm-connection-status.md)
