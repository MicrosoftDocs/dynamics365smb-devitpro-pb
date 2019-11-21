---
title: "How to: Set Up a Dynamics 365 for Sales Connection"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
ms.prod: "dynamics-nav-2018"
---
# How to: Set Up a Dynamics 365 for Sales Connection
To integrate with [!INCLUDE[crm_md](includes/crm_md.md)], you must set up a connection between [!INCLUDE[navnow_md](includes/navnow_md.md)] and [!INCLUDE[crm_md](includes/crm_md.md)]. To set up the connection, you must provide the following information as a minimum:  

-   Dynamics 365 for Sales URL  

     You must provide the URL of the [!INCLUDE[crm_md](includes/crm_md.md)] server to connect to. The URL specifies the URI scheme, such as HTTPS or HTTP, and the fully qualified domain name \(FQDN\) that identifies the [!INCLUDE[crm_md](includes/crm_md.md)] organization and the computer where the [!INCLUDE[crm_md](includes/crm_md.md)] server is installed.  

     For connecting to [!INCLUDE[crm_md](includes/crm_md.md)] Online, the format is typically *scheme://organizationname.domainname*, such as **https://mycrm.crm4.dynamics.com**, where *https* is the scheme, *myorganization* is the organization and *crm4.dynamics.com* is the domain.  

-   User name and password of a dedicated [!INCLUDE[crm_md](includes/crm_md.md)] user account for integrating with [!INCLUDE[navnow_md](includes/navnow_md.md)].  

     For more information about this user account and additional [!INCLUDE[crm_md](includes/crm_md.md)] setup requirements, see [Create a Dynamics 365 for Sales User for Connecting to Microsoft Dynamics NAV](How-to-prepare-dynamics-crm-for-integration.md#createuser).  

### To set up, test, and enable a connection to [!INCLUDE[crm_md](includes/crm_md.md)]  
For all authentication types other than Office 365 authentication, you set your 365 for Sales connection up in the **Microsoft Dynamics 365 for Sales Connection Setup** window. For Office 365 authentication, you can also use the **Microsoft Dynamics 365 for Sales Connection Setup** assisted setup, which is a wizard that helps you fill in the required setup fields. The following procedure describes how to fill in the fields in the **Microsoft Dynamics 365 for Sales Connection Setup** window manually.

1. In the **Search** box, enter **Microsoft Dynamics 365 Connection Setup**, and then choose the related link.  

2. Specify the Dynamics 365 for Sales URL and the user name and password of the service account of the server.
3. On the **Authentication Type Details** FastTab, fill in the fields if you want to configure a connection to a 365 for Sales instance with a specific authentication type. For more information, see [Use connection strings in XRM tooling to connect to Dynamics 365](https://go.microsoft.com/fwlink/?linkid=843055).

4. To test the connection settings, on the **Home** tab, in the **Progress** group, choose **Test Connection**.  

    [!INCLUDE[navnow_md](includes/navnow_md.md)] tries to establish a connection to the [!INCLUDE[crm_md](includes/crm_md.md)] server.  

    -   If the settings are valid and a connection can be established, a message appears that states the test was successful.  

    -   Otherwise a message appears that states the system could not connect to [!INCLUDE[crm_md](includes/crm_md.md)] and provides details of the error that occurred.  

    > [!NOTE]  
    >  If data encryption is not enabled in [!INCLUDE[navnow_md](includes/navnow_md.md)], you will get a message that asks whether you want to enable it. To enable data encryption, choose the **Yes** button and provide the required information. Otherwise, choose the **No** button. You can enable data encryption later. <!--For more information, see [Manage Data Encryption](../Topic/Manage%20Data%20Encryption.md).-->  

5. Select the **Enable** check box to enable the connection.  

     If you do not enable the connection now, the connection settings will be saved, but users will not be able to access [!INCLUDE[crm_md](includes/crm_md.md)] data from [!INCLUDE[navnow_md](includes/navnow_md.md)]. You can return to this window and enable the connection later.  

6. If [!INCLUDE[crm_md](includes/crm_md.md)] synchronization is not already set up, you will get a message that asks whether you want to use the default synchronization setup.  

     Setting up synchronization provides the capability to keep data in records that are common to [!INCLUDE[crm_md](includes/crm_md.md)] and [!INCLUDE[navnow_md](includes/navnow_md.md)] up\-to\-date. If you want enable to default data synchronization, choose the **Yes** button; otherwise choose the **No** button.  

     We recommend that you set up synchronization now. However, you can always set up the connection to use the default synchronization settings later. For more information, see [How to: Enable Default Dynamics 365 for Sales Synchronization Setup](How-to-Enable-Default-Dynamics-CRM-Synchronization-Setup.md).  

7. The connection to [!INCLUDE[crm_md](includes/crm_md.md)] is now configured and [!INCLUDE[crm_md](includes/crm_md.md)] integration is enabled. You can begin to work [!INCLUDE[crm_md](includes/crm_md.md)] data in [!INCLUDE[navnow_md](includes/navnow_md.md)]. There are several advanced settings which you can view and set to enhance security and enable [!INCLUDE[crm_md](includes/crm_md.md)] sales order processing.  

    The following table describes the settings. To change a setting, choose the value.

    <table>
  <tr>
    <th>Field<br></th>
    <th>Description</th>
  </tr>
  <tr>
    <td>Active Scheduled Synchronization Jobs</td>
    <td>Specifies how many of the default integration synchronization job queue entries are in the **Ready** state.<br /><br /> The default integration synchronization job queue entries synchronize data between [!INCLUDE[navnow_md](includes/navnow_md.md)] records and [!INCLUDE[crm_md](includes/crm_md.md)] records, such as customers and accounts. If there is no job queue started, the integration synchronization job queue entries cannot run.<br /><br /> For more information, see [Scheduled Synchronization Using the Synchronization Job Queue Entries](Scheduled-Synchronization-Using-the-Synchronization-Job-Queue-Entries.md).</td>
  </tr>
  <tr>
    <td>Dynamics NAV Integration Solution Imported</td>
    <td>Specifies whether the [!INCLUDE[navnow_md](includes/navnow_md.md)] Integration Solution is installed and configured in [!INCLUDE[crm_md](includes/crm_md.md)]. You cannot change this setting. For more information, see [Install the Microsoft Dynamics NAV Integration Solution](How-to-prepare-Dynamics-CRM-for-Integration.md#InstallNavSolution).</td>
  </tr>
  <tr>
    <td>Dynamics NAV URL</td>
    <td>Specifies the URL of [!INCLUDE[nav_web_md](includes/nav_web_md.md)]. This enables users in [!INCLUDE[crm_md](includes/crm_md.md)] to open corresponding records in [!INCLUDE[navnow_md](includes/navnow_md.md)] from records in [!INCLUDE[crm_md](includes/crm_md.md)], such as an account or product. The [!INCLUDE[navnow_md](includes/navnow_md.md)] records open in the [!INCLUDE[nav_web_md](includes/nav_web_md.md)]. Set this field to the URL of the [!INCLUDE[nav_web_md](includes/nav_web_md.md)] instance to use.<br /><br /> To reset the field to the default URL for the [!INCLUDE[nav_web_md](includes/nav_web_md.md)], choose **Reset Web Client URL** action.<br /><br /> This field is only relevant if the [!INCLUDE[navnow_md](includes/navnow_md.md)] Integration Solution is installed in [!INCLUDE[crm_md](includes/crm_md.md)].</td>
  </tr>
  <tr>
    <td>Version</td>
    <td>Specifies the version of [!INCLUDE[crm_md](includes/crm_md.md)]. For more information about the supported versions, see [Microsoft Dynamics NAV System Requirements](https://go.microsoft.com/fwlink/?LinkID=317819).</td>
  </tr>
  <tr>
    <td>Dynamics 365 for Sales Connection User is Integration User</td>
    <td>Specifies the [!INCLUDE[crm_md](includes/crm_md.md)] user account that is used for the connection from [!INCLUDE[navnow_md](includes/navnow_md.md)] to [!INCLUDE[crm_md](includes/crm_md.md)] to be an integration user. When set to **Yes**, the integration user property of the connection user account is set and the user becomes a non\-interactive user in [!INCLUDE[crm_md](includes/crm_md.md)]. This setting does not assign the Integration User role to the connection user.</td>
  </tr>
  <tr>
    <td>Sales Order Integration is Enabled</td>
    <td>Specifies whether sales order processing integration is enabled in [!INCLUDE[crm_md](includes/crm_md.md)]. This enables [!INCLUDE[crm_md](includes/crm_md.md)] users to submit sales orders, which can then be viewed and imported in [!INCLUDE[navnow_md](includes/navnow_md.md)].</td>
  </tr>
  <tr>
    <td>Dynamics NAV Users Must Map to Dynamics 365 for Sales Users</td>
    <td>Specifies that [!INCLUDE[navnow_md](includes/navnow_md.md)] user accounts must have a matching user accounts in [!INCLUDE[crm_md](includes/crm_md.md)], as determined by the email addresses of the accounts. The **Office 365 Authentication Email** of the [!INCLUDE[navnow_md](includes/navnow_md.md)] user must be the same as the **Primary Email** of the [!INCLUDE[crm_md](includes/crm_md.md)] user.<br /><br /> If you set the value to **Yes**, [!INCLUDE[navnow_md](includes/navnow_md.md)] users who do not have a matching [!INCLUDE[crm_md](includes/crm_md.md)] user account will not have [!INCLUDE[crm_md](includes/crm_md.md)] integration capabilities in the user interface. Access to [!INCLUDE[crm_md](includes/crm_md.md)] data directly from [!INCLUDE[navnow_md](includes/navnow_md.md)] is performed on behalf of the [!INCLUDE[crm_md](includes/crm_md.md)] user account.<br /><br /> If you set the value to **No**, all [!INCLUDE[navnow_md](includes/navnow_md.md)] users will have [!INCLUDE[crm_md](includes/crm_md.md)] integration capabilities in the user interface. Access to [!INCLUDE[crm_md](includes/crm_md.md)] data is performed on behalf of the [!INCLUDE[crm_md](includes/crm_md.md)] connection user.</td>
  </tr>
  <tr>
    <td>Dynamics 365 SDK Version</td>
    <td>Specifies that Dynamics 365 software development kit ( also referred to as Xrm) to use to connect [!INCLUDE[navnow_md](includes/navnow_md.md)] to [!INCLUDE[crm_md](includes/crm_md.md)]. The version that you select must be compatible with SDK version that is used by [!INCLUDE[crm_md](includes/crm_md.md)]. You must set this version equal or higher than the version used by  used by [!INCLUDE[crm_md](includes/crm_md.md)].</td>
  </tr>
</table>
8.  Choose the **OK** button when done.  

 After you set up the connection to [!INCLUDE[crm_md](includes/crm_md.md)], you can monitor its status. For more information, see [How to: View the Microsoft Dynamics 365 for Sales Connection Status](How-to-View-Dynamics-CRM-Connection-Status.md).  

### To disable a connection to [!INCLUDE[crm_md](includes/crm_md.md)]  

1. In the **Search** box, enter **Microsoft Dynamics 365 for Sales Connection Setup**, and then choose the related link.  

2. In the **Microsoft Dynamics 365 for Sales Connection Setup** window, clear the **Enabled** check box.  

 Users will not be able to access [!INCLUDE[crm_md](includes/crm_md.md)] data from [!INCLUDE[navnow_md](includes/navnow_md.md)].  

## See Also  
 [Integrating Microsoft Dynamics 365 for Sales in Microsoft Dynamics NAV](Integrating-Dynamics-CRM-in-Dynamics-NAV.md)   
 [How to: View the Microsoft Dynamics 365 for Sales Connection Status](How-to-view-dynamics-crm-connection-status.md)   
 [Synchronizing Microsoft Dynamics NAV and Dynamics 365 for Sales](Synchronizing-Dynamics-NAV-and-Dynamics-CRM.md)   
 [How to: Set Up Microsoft Dynamics 365 for Sales for Integration with Dynamics NAV](How-to-prepare-Dynamics-CRM-for-Integration.md)
