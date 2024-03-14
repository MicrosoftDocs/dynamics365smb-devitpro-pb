---
title: "Setting Up Dynamics 365 for Sales Integration"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
---
# Setting Up Dynamics 365 for Sales Integration
This article provides an overview of how to set up [!INCLUDE[crm_md](includes/crm_md.md)] integration in  [!INCLUDE[navnow_md](includes/navnow_md.md)]. You can use default integration, or you can configure the integration manually.  

## Getting Started  
 To get started with [!INCLUDE[crm_md](includes/crm_md.md)] integration, perform the following tasks:  

1.	Prepare [!INCLUDE[crm_md](includes/crm_md.md)].  

     You must set up users for connecting to and synchronizing [!INCLUDE[crm_md](includes/crm_md.md)]. Optionally, you can also install the [!INCLUDE[navnow_md](includes/navnow_md.md)] integration solution that enables viewing [!INCLUDE[navnow_md](includes/navnow_md.md)] customer statistics, and navigating to customers from directly from [!INCLUDE[crm_md](includes/crm_md.md)] accounts, contacts, users, and products.  

     For more information, see [How to: Prepare Dynamics 365 for Sales for Integration with Dynamics NAV](How-to-prepare-Dynamics-CRM-for-Integration.md).  

2.  Set up a connection to [!INCLUDE[crm_md](includes/crm_md.md)].  

     You must establish a connection from [!INCLUDE[navnow_md](includes/navnow_md.md)] to your [!INCLUDE[crm_md](includes/crm_md.md)] organization.  

     For more information, see [How to: Set Up a Dynamics 365 for Sales Connection](How-to-Set-Up-a-Dynamics-CRM-Connection.md).  

3.  Validate the data synchronization setup.  

     If you enabled the default data synchronization, verify that the integration synchronization jobs and integration table mappings are set up to synchronize the proper data.  

     For more information, see [Synchronizing Dynamics NAV and Dynamics 365 for Sales](Synchronizing-Dynamics-NAV-and-Dynamics-CRM.md).  

     Make sure that you start a job queue.  

4.  Couple [!INCLUDE[navnow_md](includes/navnow_md.md)] and [!INCLUDE[crm_md](includes/crm_md.md)] records.  

     For more information, see [Record Couplings](Dynamics-CRM-Integration-Concepts-and-Terminology.md#CouplingOverview) and [How to: Couple and Synchronize Records Manually](How-to-Couple-and-Synchronize-Records-Manually.md)  

## See Also  
[How to: Enable Default Dynamics 365 for Sales Synchronization Setup](How-to-Enable-Default-Dynamics-CRM-Synchronization-Setup.md)  
