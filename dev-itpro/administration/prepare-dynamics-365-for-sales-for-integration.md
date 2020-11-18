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

## Connecting Business Central on-premises versions earlier than version 16
The Microsoft Power Platform team has [announced](/dynamics365/business-central/dev-itpro/administration/prepare-dynamics-365-for-sales-for-integration) that it is deprecating the Office365 authentication type for connecting to Dataverse. If you are using a Business Central on-premises version that is earlier than version 16, you must use the OAuth authentication type to connect to [!INCLUDE[crm_md](../developer/includes/crm_md.md)] online. The steps in this section describe how to make the connection.

### Requirements
You must have a Microsoft Azure subscription. A trial account will work for application registration.

### To connect a version of Business Central earlier than version 16
1. Import the CDS Base Integration Solution into your [!INCLUDE[crm_md](../developer/includes/crm_md.md)] environment. The integration solution is available in the CrmCustomization folder on your Business Central installation DVD. There are multiple versions of the solution, such as DynamicsNAVIntegrationSolution_v8 or DynamicsNAVIntegrationSolution_v9 or DynamicsNAVIntegrationSolution_v91. The solution you should import depends on the version of [!INCLUDE[crm_md](../developer/includes/crm_md.md)] you're connecting to. [!INCLUDE[crm_md](../developer/includes/crm_md.md)] online requires the DynamicsNAVIntegrationSolution_v91 integration solution.
2. Create a non-interactive integration user in your [!INCLUDE[crm_md](../developer/includes/crm_md.md)] environment, and assign the user the following security roles:

   * Dynamics 365 Business Central Integration Administrator
   * Dynamics 365 Business Central Integration User

   > [!Important]
   > This user must not have the System Administrator security role. Also, you cannot use the system administrator account as the integration user.

3.  In Azure portal, create an app registration for [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. For the steps, see [Register an application in Azure Active Directory](/business-central/dev-itpro/administration/register-app-azure?branch=live#register-an-application-in-azure-active-directory). The settings that are specific to connecting to [!INCLUDE[crm_md](../developer/includes/crm_md.md)] are the delegated permissions. The following table lists and describes the permissions.

   |API / Permission Name |Type  |Description  |
   |---------|---------|---------|
   |Financials.ReadWrite.All     |Delegated|Required for [!INCLUDE[prodshort](../developer/includes/prodshort.md)].    |
   |user_impersonation     |Delegated|Required for [!INCLUDE[crm_md](../developer/includes/crm_md.md)].|
   
4. In [!INCLUDE[prodshort](../developer/includes/prodshort.md)], search for **Microsoft Dynamics 365 Connection Setup**, and then choose the related link. 
5. On the **Microsoft Dynamics 365 Connection Setup** page, in the **Authentication Type** field, choose the option for OAuth. 
6. Choose the CRM SDK version that matches solution version you imported in step 1.
7. In the **Server Address** field, enter the URL of your [!INCLUDE[crm_md](../developer/includes/crm_md.md)] environment, and then enter the user name and password for the integration user.
8. In the **Connection String** field, specify the ID of the app registration. This field has two tokens in which the ID of your application should be specified.

   |Token           |Description  |
   |----------------|-------------|
   |**AppId**       |Set to the application ID.      |
   |**RedirectUri** |Set to the application ID, but add the **app://** prefix.         |

##### Example
This is an example of a connection string that works.

```
AuthType=OAuth;Username=jsmith@contoso.onmicrosoft.com;Password=****;Url=https://contosotest.crm.dynamics.com;AppId=<your AppId>;RedirectUri=app://<your AppId>;TokenCacheStorePath=;LoginPrompt=Auto
```
9. Enable the connection.

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

