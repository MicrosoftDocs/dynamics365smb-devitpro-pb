---
title: "Preparing for Dynamics 365 for Sales for Integration"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
ms.service: dynamics365-business-central
---
# Preparing  Dynamics 365 for Sales for Integration

This article describes how to set up and configure [!INCLUDE[crm_md](../developer/includes/crm_md.md)] for integrating with [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. You must complete the following tasks:  

1.  Create a user for connecting to and synchronizing data from [!INCLUDE[prodshort](../developer/includes/prodshort.md)].  


2.  Install the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] integration solution for [!INCLUDE[crm_md](../developer/includes/crm_md.md)].  

     This task is optional. You only need to complete this task if you want the functionality that is provided by the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] integration solution.  

> [!IMPORTANT]  
>  To perform the tasks in this topic, you must have the System Administrator security role or equivalent privileges in [!INCLUDE[crm_md](../developer/includes/crm_md.md)].  

##  <a name="createuser"></a> Create a Dynamics 365 for Sales User for Connecting to Business Central
  
 As a minimum, this must be a non\-interactive user account that has the required privileges to write, read, modify, and delete data in the entities that will be integrated with [!INCLUDE[prodshort](../developer/includes/prodshort.md)].  

 You will use this user account to set up the connection to [!INCLUDE[crm_md](../developer/includes/crm_md.md)] from [!INCLUDE[prodshort](../developer/includes/prodshort.md)].  

> [!IMPORTANT]  
>  You should not use this account to sign in to [!INCLUDE[crm_md](../developer/includes/crm_md.md)] to modify entities records that are integrated with [!INCLUDE[prodshort](../developer/includes/prodshort.md)] because the changes will be ignored by integration synchronization jobs in [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

#### Create the connection user  

-   For more information about how to create users in [!INCLUDE[crm_md](../developer/includes/crm_md.md)], see [https://go.microsoft.com/fwlink/?LinkID=616518](https://go.microsoft.com/fwlink/?LinkID=616518).  

##  <a name="InstallNavSolution"></a> Install the Business Central Integration Solution
  
 [!INCLUDE[prodshort](../developer/includes/prodshort.md)] includes a solution that enables users to access coupled records in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], such as customers and items, from records in [!INCLUDE[crm_md](../developer/includes/crm_md.md)], such as accounts and products. The solution adds a link on the [!INCLUDE[crm_md](../developer/includes/crm_md.md)] record pages that opens the coupled [!INCLUDE[prodshort](../developer/includes/prodshort.md)] record. The solution is also used to display information from [!INCLUDE[prodshort](../developer/includes/prodshort.md)] in a part on certain entity records in [!INCLUDE[crm_md](../developer/includes/crm_md.md)], such as accounts. Installing this solution is optional.  


1.  From [!INCLUDE[prodshort](../developer/includes/prodshort.md)] installation media \(DVD\), copy either the  DynamicsNAVIntegrationSolution_v8.zip or DynamicsNAVIntegrationSolution_v9.zip file to your computer.  

    These files are located in the **CrmCustomization** folder. This file is the solution package.

    Use the zip version that matches the [!INCLUDE[crm_md](../developer/includes/crm_md.md)] SDK version. Use DynamicsNAVIntegrationSolution_v8.zip for legacy services running CRM or [!INCLUDE[crm_md](../developer/includes/crm_md.md)] version 8.x and earlier. Use DynamicsNAVIntegrationSolution_v9.zip for [!INCLUDE[crm_md](../developer/includes/crm_md.md)] versions 9.0 and later. 

2.  In [!INCLUDE[crm_md](../developer/includes/crm_md.md)], import the DynamicsNAVIntegrationSolution.zip as a solution.  

     This step adds the **Business Central Connection** entity and **Business Central Account Statistics** entity in the system and additional items such as Business Central integration security roles.  

     For more information about how to manage solutions in [!INCLUDE[crm_md](../developer/includes/crm_md.md)], [https://go.microsoft.com/fwlink/?LinkID=616519](https://go.microsoft.com/fwlink/?LinkID=616519).  

3.  (Optional) Set up the **Business Central Connection** entity to display in the **Settings** area of [!INCLUDE[crm_md](../developer/includes/crm_md.md)].  

     This enables [!INCLUDE[crm_md](../developer/includes/crm_md.md)] users who are assigned the **Business Central Admin** role to modify the entity in [!INCLUDE[crm_md](../developer/includes/crm_md.md)]. For more information about how to modify entities in [!INCLUDE[crm_md](../developer/includes/crm_md.md)], see [https://go.microsoft.com/fwlink/?LinkID=616521](https://go.microsoft.com/fwlink/?LinkID=616521).  

4.  Assign the **Business Central Integration Administrator** role to the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] connection user.  

5.  Assign the **Business Central Integration User** role to all users who require the use of the features provided by the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] integration solution.  

If you install the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] integration solution after you have set up the connection to [!INCLUDE[crm_md](../developer/includes/crm_md.md)] from in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], you must modify the connection setup to point to the URL of the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)].<!-- For more information, see [How to: Set Up a Microsoft Dynamics 365 for Sales Connection]() --> 

<!-- 
# View Item Availability - Support Matrix
For most versions of Business Central and Dynamics 365 for Sales, you can view availability figures for items across the integrated products. The following table shows which version combinations support viewing item availability.

| |Dynamics 365 for Sales version|2015/Update 1/Online|2016/Update 1/Online|Dynamics 365 for Sales|
|-|---------------------|---------------------|--------------------------|-----------------|
|**Dynamics NAV version**|
|**2016**||Not supported|Not supported|Not supported|
|**2017**||Not supported - Install from 2016|Supported|Supported|
|**Dynamics 365 for Financials**||Not supported - Install from 2016|Supported|Supported|


> [Note]
> You can obtain item availability support for combinations of Dynamics CRM 2015 and Business Central by running the DynamicsNAVIntegrationSolution.zip file on the Business Central product DVD.

For more information, see [System Requirements for Business Central](../deployment/system-requirement-business-central.md).


## See Also  
[Setting Up Dynamics 365 for Sales Integration in Dynamics NAV]  
-->
