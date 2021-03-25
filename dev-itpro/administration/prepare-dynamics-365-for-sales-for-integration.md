---
title: "Preparing for Dynamics 365 for Sales for Integration"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: jswymer
ms.service: dynamics365-business-central
---
# Preparing Dynamics 365 Sales for Integration

This article describes how to set up and configure [!INCLUDE[crm_md](../developer/includes/crm_md.md)] for integrating with [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. Complete the following tasks:  

1.  Create a user for connecting to and synchronizing data from [!INCLUDE[prod_short](../developer/includes/prod_short.md)].  


2.  Install the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] integration solution for [!INCLUDE[crm_md](../developer/includes/crm_md.md)].  

     This task is optional. You only need to complete this task if you want the functionality that is provided by the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] integration solution.  

> [!IMPORTANT]  
>  To perform the tasks in this topic, you must have the System Administrator security role or equivalent privileges in [!INCLUDE[crm_md](../developer/includes/crm_md.md)].  

##  <a name="createuser"></a> Create a Dynamics 365 for Sales User for Connecting to Business Central
  
 As a minimum, this user must be a non-interactive user account that has the required privileges to write, read, modify, and delete data in the entities that will be integrated with [!INCLUDE[prod_short](../developer/includes/prod_short.md)].  

 You will use this user account to set up the connection to [!INCLUDE[crm_md](../developer/includes/crm_md.md)] from [!INCLUDE[prod_short](../developer/includes/prod_short.md)].  

> [!IMPORTANT]  
>  You should not use this account to sign in to [!INCLUDE[crm_md](../developer/includes/crm_md.md)] to modify entities records that are integrated with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] because the changes will be ignored by integration synchronization jobs in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

#### Create the connection user  

-   For more information about how to create users in [!INCLUDE[crm_md](../developer/includes/crm_md.md)], see [https://go.microsoft.com/fwlink/?LinkID=616518](/previous-versions/dynamicscrm-2016/administering-dynamics-365/dn531066(v=crm.8)).  

##  <a name="InstallNavSolution"></a> Install the Business Central Integration Solution
  
 [!INCLUDE[prod_short](../developer/includes/prod_short.md)] includes a solution that enables users to access coupled records in [!INCLUDE[prod_short](../developer/includes/prod_short.md)], such as customers and items, from records in [!INCLUDE[crm_md](../developer/includes/crm_md.md)], such as accounts and products. The solution adds a link on the [!INCLUDE[crm_md](../developer/includes/crm_md.md)] record pages that opens the coupled [!INCLUDE[prod_short](../developer/includes/prod_short.md)] record. The solution is also used to display information from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] in a part on certain entity records in [!INCLUDE[crm_md](../developer/includes/crm_md.md)], such as accounts. Installing this solution is optional.  


1.  From [!INCLUDE[prod_short](../developer/includes/prod_short.md)] installation media \(DVD\), copy either the  DynamicsNAVIntegrationSolution_v8.zip or DynamicsNAVIntegrationSolution_v9.zip file to your computer.  

    These files are located in the **CrmCustomization** folder. This file is the solution package.

    Use the zip version that matches the [!INCLUDE[crm_md](../developer/includes/crm_md.md)] SDK version. Use DynamicsNAVIntegrationSolution_v8.zip for legacy services running CRM or [!INCLUDE[crm_md](../developer/includes/crm_md.md)] version 8.x and earlier. Use DynamicsNAVIntegrationSolution_v9.zip for [!INCLUDE[crm_md](../developer/includes/crm_md.md)] versions 9.0 and later. 

2.  In [!INCLUDE[crm_md](../developer/includes/crm_md.md)], import the DynamicsNAVIntegrationSolution.zip as a solution.  

     This step adds the **Business Central Connection** entity and **Business Central Account Statistics** entity in the system and additional items such as Business Central integration security roles.  

     For more information about how to manage solutions in [!INCLUDE[crm_md](../developer/includes/crm_md.md)], [https://go.microsoft.com/fwlink/?LinkID=616519](/previous-versions/dynamicscrm-2016/administering-dynamics-365/dn531198(v=crm.8)).  

3.  (Optional) Set up the **Business Central Connection** entity to display in the **Settings** area of [!INCLUDE[crm_md](../developer/includes/crm_md.md)].  

     This setup enables [!INCLUDE[crm_md](../developer/includes/crm_md.md)] users who are assigned the **Business Central Admin** role to modify the entity in [!INCLUDE[crm_md](../developer/includes/crm_md.md)]. For more information about how to modify entities in [!INCLUDE[crm_md](../developer/includes/crm_md.md)], see [https://go.microsoft.com/fwlink/?LinkID=616521](/previous-versions/dynamicscrm-2016/admins-customizers-dynamics-365/mt826673(v=crm.8)).  

4.  Assign the **Business Central Integration Administrator** role to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] connection user.  

5.  Assign the **Business Central Integration User** role to all users who require the use of the features provided by the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] integration solution.  

If you install the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] integration solution after you have set up the connection to [!INCLUDE[crm_md](../developer/includes/crm_md.md)] from in [!INCLUDE[prod_short](../developer/includes/prod_short.md)], you must modify the connection setup to point to the URL of the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)].<!-- For more information, see [How to: Set Up a Microsoft Dynamics 365 for Sales Connection]() --> 



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

-->

## See Also  
[Connecting On-Premises Versions](/dynamics365/business-central/admin-how-to-set-up-a-dynamics-crm-connection#connecting-on-premises-versions)