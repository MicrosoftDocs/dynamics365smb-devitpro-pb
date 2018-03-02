---
title: "How to: Prepare Dynamics 365 for Sales for Integration"
ms.custom: na
ms.date: 24/10/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
ms.prod: "dynamics-nav-2018"
---
# How to: Prepare Dynamics 365 for Sales for Integration
This topic describes how to set up and configure [!INCLUDE[crm_md](includes/crm_md.md)] for integrating with [!INCLUDE[navnow_md](includes/navnow_md.md)]. You must complete the following tasks:  

1.  Create a user for connecting to and synchronizing data from [!INCLUDE[navnow_md](includes/navnow_md.md)].  

     For more information, see [Create a Dynamics 365 for Sales User for Connecting to Microsoft Dynamics NAV](how-to-prepare-Dynamics-CRM-for-Integration.md#createuser).  

2.  Install the [!INCLUDE[navnow_md](includes/navnow_md.md)] integration solution for [!INCLUDE[crm_md](includes/crm_md.md)].  

     This task is optional. You only need to complete this task if you want the functionality that is provided by the [!INCLUDE[navnow_md](includes/navnow_md.md)] integration solution. For more information, see [Install the Microsoft Dynamics NAV Integration Solution](how-to-prepare-Dynamics-CRM-for-Integration.md#InstallNavSolution).  

> [!IMPORTANT]  
>  To perform the tasks in this topic, you must have the System Administrator security role or equivalent privileges in [!INCLUDE[crm_md](includes/crm_md.md)].  

##  <a name="createuser"></a> Create a Dynamics 365 for Sales User for Connecting to Microsoft Dynamics NAV  
 As a minimum, this must be a non\-interactive user account that has the required privileges to write, read, modify, and delete data in the entities that will be integrated with [!INCLUDE[navnow_md](includes/navnow_md.md)].  

 You will use this user account to set up the connection to [!INCLUDE[crm_md](includes/crm_md.md)] from [!INCLUDE[navnow_md](includes/navnow_md.md)].  

> [!IMPORTANT]  
>  You should not use this account to sign in to [!INCLUDE[crm_md](includes/crm_md.md)] to modify entities records that are integrated with [!INCLUDE[navnow_md](includes/navnow_md.md)] because the changes will be ignored by integration synchronization jobs in [!INCLUDE[navnow_md](includes/navnow_md.md)].

#### To create the connection user  

-   For more information about how to create users in [!INCLUDE[crm_md](includes/crm_md.md)], see [http://go.microsoft.com/fwlink/?LinkID=616518](http://go.microsoft.com/fwlink/?LinkID=616518).  

##  <a name="InstallNavSolution"></a> Install the Microsoft Dynamics NAV Integration Solution  
 [!INCLUDE[navnow_md](includes/navnow_md.md)] includes a solution that enables users to access coupled records in [!INCLUDE[navnow_md](includes/navnow_md.md)], such as customers and items, from records in [!INCLUDE[crm_md](includes/crm_md.md)], such as accounts and products. The solution adds a link on the [!INCLUDE[crm_md](includes/crm_md.md)] record pages that opens the coupled [!INCLUDE[navnow_md](includes/navnow_md.md)] record. The solution is also used to display information from [!INCLUDE[navnow_md](includes/navnow_md.md)] in a part on certain entity records in [!INCLUDE[crm_md](includes/crm_md.md)], such as accounts. Installing this solution is optional.  

#### To install the [!INCLUDE[navnow_md](includes/navnow_md.md)] solution  

1.  From [!INCLUDE[navnow_md](includes/navnow_md.md)] installation media \(DVD\), copy the DynamicsNAVIntegrationSolution.zip file to your computer.  

     The DynamicsNAVIntegrationSolution.zip file is located in the **CrmCustomization** folder. This file is the solution package.  

2.  In [!INCLUDE[crm_md](includes/crm_md.md)], import the DynamicsNAVIntegrationSolution.zip as a solution  

     This step adds the **Dynamics NAV Connection** entity and **Dynamics NAV Account Statistics** entity in the system and additional items such as navnow integration security roles.  

     For more information about how to manage solutions in [!INCLUDE[crm_md](includes/crm_md.md)], [http://go.microsoft.com/fwlink/?LinkID=616519](http://go.microsoft.com/fwlink/?LinkID=616519).  

3.  (Optional) Set up the **Dynamics NAV Connection** entity to display in the **Settings** area of [!INCLUDE[crm_md](includes/crm_md.md)].  

     This enables [!INCLUDE[crm_md](includes/crm_md.md)] users who are assigned the **Dynamics NAV Admin** role to modify the entity in [!INCLUDE[crm_md](includes/crm_md.md)]. For more information about how to modify entities in [!INCLUDE[crm_md](includes/crm_md.md)], see [http://go.microsoft.com/fwlink/?LinkID=616521](http://go.microsoft.com/fwlink/?LinkID=616521).  

4.  Assign the **Dynamics NAV Integration Administrator** role to the [!INCLUDE[navnow_md](includes/navnow_md.md)] connection user.  

5.  Assign the **Dynamics NAV Integration User** role to all users who require the use of the features provided by the [!INCLUDE[navnow_md](includes/navnow_md.md)] integration solution.  

 If you install the [!INCLUDE[navnow_md](includes/navnow_md.md)] integration solution after you have set up the connection to [!INCLUDE[crm_md](includes/crm_md.md)] from in [!INCLUDE[navnow_md](includes/navnow_md.md)], you must modify the connection setup to point to the URL of the [!INCLUDE[nav_web_md](includes/nav_web_md.md)]. For more information, see [How to: Set Up a Microsoft Dynamics 365 for Sales Connection](How-to-Set-Up-a-Dynamics-CRM-Connection.md)  

# View Item Availability - Support Matrix
For most versions of Dynamics NAV and Dynamics 365 for Sales, you can view availability figures for items across the integrated products. The following table shows which version combinations support viewing item availability.

| |Dynamics 365 for Sales version|2015/Update 1/Online|2016/Update 1/Online|Dynamics 365 for Sales|
|-|---------------------|---------------------|--------------------------|-----------------|
|**Dynamics NAV version**|
|**2016**||Not supported|Not supported|Not supported|
|**2017**||Not supported - Install from 2016|Supported|Supported|
|**Dynamics 365 for Financials**||Not supported - Install from 2016|Supported|Supported|


> [Note]
> You can obtain item availability support for combinations of Dynamics CRM 2015 and Dynamics NAV 2017 or Dynamics 365 for Financials by running the DynamicsNAVIntegrationSolution.zip file on the Dynanmics NAV 2016 product DVD.

For more information, see [System Requirements for Microsoft Dynamics NAV 2017](System-Requirements-for-Microsoft-Dynamics-NAV.md).

## See Also  
[Setting Up Dynamics 365 for Sales Integration in Dynamics NAV](Setting-Up-Dynamics-CRM-Integration.md)  
