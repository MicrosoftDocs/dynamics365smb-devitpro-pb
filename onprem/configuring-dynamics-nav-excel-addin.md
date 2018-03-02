---
title: "Setting up the Excel Add-In for Editing Data"
author: jswymer
manager: edupont
ms.author: jswymer
ms.custom: na
ms.date: 08/17/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
---
# Setting up the Excel Add-In for Editing [!INCLUDE[navnow](includes/navnow_md.md)] Data
You can set up the [!INCLUDE[navnow](includes/navnow_md.md)] deployment to support an Excel add-in that enables users in the [!INCLUDE[navnow](includes/navnow_md.md)] client to work with data from list pages in Excel. Users can get fresh data from [!INCLUDE[navnow](includes/navnow_md.md)] and update the data in [!INCLUDE[navnow](includes/navnow_md.md)] based on their work in Excel.

Without this add-in, users can open a list page in Excel from the **Open in Excel** action on the page, which does not allow them to push changed data back to [!INCLUDE[navnow](includes/navnow_md.md)]. When this add-in is set up, the **Open in Excel** action is replaced by the **Edit in Excel** action.

>[!NOTE]
>This Excel add-in is different than the Microsoft Office Excel Add-in that can be installed with  the [!INCLUDE[navnow](includes/navnow_md.md)] client by using the the [!INCLUDE[navnow](includes/navnow_md.md)] Setup. For more information about Microsoft Office Excel Add-in, see [Client Option](client-option.md).

## Prerequisites
Your deployment must meet the following prerequisites:

-   Azure Active Directory (Azure AD) used to authenticate users.

    The [!INCLUDE[nav_server_md](includes/nav_server_md.md)] instance, clients, and users must be configured for NavUserPassword, Azure Access Control Service (ACS), or Azure Active Directory (Azure AD) authentication.

    For more information, see [Authenticating Users with Azure Active Directory](Authenticating-Users-with-Azure-Active-Directory.md).  
-   OData enabled and uses Secure Sockets Layer (SSL) for authentication.

    For more information, see [Walkthrough: Configuring Web Services to Use SSL (SOAP and OData)](Walkthrough--Configuring-Web-Services-to-Use-SSL--SOAP-and-OData-.md).  

-   [!INCLUDE[nav_web_server_md](includes/nav_web_server_md.md)] installed and configured to use SSL (https).

    For more information, see [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md) and [How to: Configure SSL to Secure the Connection to Microsoft Dynamics NAV Web Client](How-to--Configure-SSL-to-Secure-the-Connection-to-Microsoft-Dynamics-NAV-Web-Client.md)

-   If your deployment is multitenant, [!INCLUDE[nav_web](includes/nav_web_md.md)] must accept host names for tenants.

    For more information, see [How to: Configure the Microsoft Dynamics NAV Web client to Accept Host Names for Tenants](How-to--Configure-the-Microsoft-Dynamics-NAV-Web-client-to-Accept-Host-Names-for-Tenants.md).  

- [!INCLUDE[navnow](includes/navnow_md.md)] client computers have a supported version of Excel.

    For more information, see [System Requirements for Microsoft Dynamics NAV 2017](System-Requirements-for-Microsoft-Dynamics-NAV.md#WebClient).

## Register and configure an Azure AD Application for the Excel Add-in in Microsoft Azure
When Azure AD authentication was set up for your [!INCLUDE[navnow](includes/navnow_md.md)] deployment, an Azure AD tenant was created in Microsoft Azure, and an application for [!INCLUDE[navnow](includes/navnow_md.md)] was registered in the tenant. The Excel add-in requires that you add (or register) a separate Azure AD application in the tenant.

You can add the Azure AD application by using the [Azure portal](http://go.microsoft.com/fwlink/?LinkID=317944). The following procedure outlines the steps you must perform to add and configure the Excel add-in application in your Azure AD tenant. For more specific guidelines about how to use the Azure portal, see [Register your application with your Azure Active Directory tenant](https://docs.microsoft.com/en-us/azure/active-directory/active-directory-app-registration).

1.  Add an Azure AD application for the Excel add-in.

    When you add an application to an Azure AD tenant, you must specify the following information:  

    <table>
    <tr>
    <th>Setting</th>
    <th>Description</th>
    </tr>
    <tr>
    <td>Name</td>
    <td>The name of your application as it will display to your users, such as *Excel Add-in for Dynamics NAV*.</td>
    </tr>
    <tr>
    <td>Type</td>
    <td>Choose **Web application and/or web app**.</td>
    </tr>
    <tr>
    <td>Sign-on URL (App URL)</td>
    <td>The URI for signing in to your [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], such as ```https://www.solutions.com/DynamicsNAV``` or ```https://www.solutions.com/DynamicsNAV/WebClient/``` (for [!INCLUDE[nav2017](includes/nav2017.md)] and earlier versions).</td>
    </tr>
    <tr>
    <td>App ID URI</td>
    <td>The URI to a domain in your Azure AD tenant, such as *https://solutions.onmicrosoft.com/ExcelAddinforDynamicsNAV*. **Important:**  The App ID URI must be unique within the Azure AD tenant and not the same as you specified for your [!INCLUDE[navnow](includes/navnow_md.md)] solution.</td>
    </tr>
    <tr>
    <td>Directory Access</td>
    <td>Choose **Single Sign-On**.</td>
    </tr>
    </table>

2.  Grant the Excel add-in application permission to the [!INCLUDE[navnow](includes/navnow_md.md)] application.

    You must give the Azure AD application for the Excel add-in delegated permission to access the [!INCLUDE[navnow](includes/navnow_md.md)] application in Azure AD. This allows users of the Excel add-in to access the OData web services to read and write data.  

    In the portal, you set up permissions on the configuration/settings page of Excel add-in application, in the permissions section.  

3.  Configure OAuth2 authentication in the Excel add-in application manifest.

    The Excel add-in requires OAuth2 implicit grant flow to be enabled on the application. The manifest for the application is a .json file type. To enable OAuth2 implicit grant flow in the manifest file, change the *oauth2AllowImplicitFlow* key to *true*.

4. Add the following URL to the *ReplyUrl* list:

    ```  
    https://az689774.vo.msecnd.net/dynamicsofficeapp/v1.3.0.0/*
    ```  

5.  Copy the **Client ID (Application ID)** that is assigned to Excel add-in application. You'll need this in the procedure.

This completes the work you have to do in the Azure portal. The final configuration is to add the Excel add-in to the [!INCLUDE[nav_server](includes/nav_server_md.md)] instances.

## Configure the [!INCLUDE[nav_server](includes/nav_server_md.md)] Instances
You must add the Excel add-in to the [!INCLUDE[nav_server](includes/nav_server_md.md)] instances in your deployment. You can use either the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] or **Set-NAVServerConfiguration** cmdlet in the [!INCLUDE[nav_shell](includes/nav_shell_md.md)].

1.  In the [!INCLUDE[nav_admin](includes/nav_admin_md.md)], in the **Azure Active Directory** section, set the **Excel add-in AAD client ID** field to the client ID (or application ID) for the Excel add-in application that you copied from the Azure portal.

    With the Set-NAVServerConfiguration cmdlet, set the ```ExcelAddInAzureActiveDirectoryClientId``` key.

2.  In the **Client Services** section, set the **Web Client Base URL** field to the base URL of the [!INCLUDE[nav_web_md](includes/nav_web_md.md)].

	This is the root portion of all URLs that are used to access pages in the web client. This must have the format ```https://[hostname:port]/[instance]``` or ```https://www.solutions.com/DynamicsNAV/WebClient/``` (for [!INCLUDE[nav2017](includes/nav2017.md)] and earlier versions), such as ```https://MyNavWebServer/DynamicsNAV``` and ```https://MyNavWebServer/DynamicsNAV/WebClient/```.

    With the **Set-NAVServerConfiguration** cmdlet, set the ```PublicWebBaseUrl``` key.

3.  In the **OData Services** section, set the **OData Base URL** field to the public URL for accessing OData services.

    The URL must have the following format ```https://<hostname>:<port>/<instance>/ODataV4/```, such as ```https://Cronus.Nav.net:7047/dynamicsnav/ODataV4/```.

    With the **Set-NAVServerConfiguration** cmdlet, set the ```PublicODataBaseUrl``` key.

## Use the Excel Add-In
Your users can now use the Excel add-in. When a list page shows the **Edit in Excel** action, then users can open lists such as the **Customers** page in Excel and work with the data there. They can use the add-in to update data in [!INCLUDE[navnow](includes/navnow_md.md)], and they can get fresh data from the database.  

<!-- > [!NOTE]  
>  The pages that your users want to work on in Excel must be published as web services. -->

## See Also
[Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV.md)  
[Authenticating Users with Azure Active Directory](Authenticating-Users-with-Azure-Active-Directory.md)  
[Walkthrough: Configuring Web Services to Use SSL (SOAP and OData)](Walkthrough--Configuring-Web-Services-to-Use-SSL--SOAP-and-OData-.md)  
[How to: Configure the Microsoft Dynamics NAV Web client to Accept Host Names for Tenants](How-to--Configure-the-Microsoft-Dynamics-NAV-Web-client-to-Accept-Host-Names-for-Tenants.md)  
