---
title: "Setting up the Excel Add-In for Editing Data"
author: jswymer
manager: edupont
ms.author: jswymer
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---
# Setting up the Excel Add-In for Editing [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Data
You can set up the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] deployment to support an Excel add-in that enables users in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] client to work with data from list pages in Excel. Users can get fresh data from [!INCLUDE[prodshort](../developer/includes/prodshort.md)] into Excel and push updated data from Excel to [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

Without this add-in, users can open a list page in Excel from the **Open in Excel** action on the page, which does not allow them to push changed data back to [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. When this add-in is set up, the **Open in Excel** action is replaced by the **Edit in Excel** action.

> [!NOTE]  
> This feature is only available for the Web client.

>[!NOTE]
>This Excel add-in is different than the Microsoft Excel Add-in that can be installed together with the [!INCLUDE[nav_windows_md](../developer/includes/nav_windows_md.md)] client by using the [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)].

## Prerequisites
Your deployment must meet the following prerequisites:

- Azure Active Directory (Azure AD) used to authenticate users.

  The [!INCLUDE[server](../developer/includes/server.md)] instance, clients, and users must be configured for NavUserPassword, Azure Access Control Service (ACS), or Azure Active Directory (Azure AD) authentication.

   For more information, see [Authenticating Users with Azure Active Directory](Authenticating-Users-with-Azure-Active-Directory.md).  
- OData enabled and uses Secure Sockets Layer (SSL) for authentication.

   For more information, see [Using Security Certificates with Business Central On-Premises](../deployment/implement-security-certificates-production-environment.md).  

- [!INCLUDE[webserver](../developer/includes/webserver.md)] installed and configured to use SSL (https).

  For more information, see [Install Business Central](../deployment/install-using-setup.md) and [Configure SSL to Secure the Connection to Web Client](../deployment/Configure-SSL-web-client-connection.md).

- If your deployment is multitenant, [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] must accept host names for tenants.

  For more information, see [Configure the Web Server to Accept Host Names for Tenants](configure-web-server-to-accept-host-names-for-tenants.md).  

- [!INCLUDE[prodshort](../developer/includes/prodshort.md)] client computers have a supported version of Excel.

   For more information, see [System Requirements](../deployment/System-Requirement-business-central.md#WebClient).

## Register and configure an Azure AD Application for the Excel Add-in in Microsoft Azure

When Azure AD authentication was set up for your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] deployment, an Azure AD tenant was created in Microsoft Azure, and an application for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] was registered in the tenant. The Excel add-in requires that you add (or register) a separate Azure AD application in the tenant.

You can add the Azure AD application by using the [Azure portal](http://go.microsoft.com/fwlink/?LinkID=317944). The following procedure outlines the steps you must perform to add and configure the Excel add-in application in your Azure AD tenant. For more specific guidelines about how to use the Azure portal, see [Register your application with your Azure Active Directory tenant](https://docs.microsoft.com/en-us/azure/active-directory/active-directory-app-registration).

1. Add an Azure AD application for the Excel add-in.

    When you add an application to an Azure AD tenant, you must specify the following information:

    |Setting|Description|
    |-------|-----------|
    |Name|The name of your application as it will display to your users, such as *Excel Add-in for Dynamics NAV*.|
    |Type|Choose **Web application and/or web app**.|
    |Sign-on URL (App URL)|The URI for signing in to your [!INCLUDE[nav_web_server](../developer/includes/nav_web_server_md.md)], such as `https://www.solutions.com/BC`|
    |App ID URI|The URI to a domain in your Azure AD tenant, such as *https://solutions.onmicrosoft.com/ExcelAddinforBusinessCentral*. **Important:**  The App ID URI must be unique within the Azure AD tenant and not the same as you specified for your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] solution.|
    |Directory Access|Choose **Single Sign-On**.|

2. Grant the Excel add-in application permission to the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] application.

    You must give the Azure AD application for the Excel add-in delegated permission to access the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] application in Azure AD. This allows users of the Excel add-in to access the OData web services to read and write data.  

    In the portal, you set up permissions on the configuration/settings page of Excel add-in application, in the permissions section.  

3. Configure OAuth2 authentication in the Excel add-in application manifest.

    The Excel add-in requires OAuth2 implicit grant flow to be enabled on the application. The manifest for the application is a .json file type. To enable OAuth2 implicit grant flow in the manifest file, change the `oauth2AllowImplicitFlow` key to `true`.

4. Add the following URL to the `ReplyUrl` list:

    ```  
    https://az689774.vo.msecnd.net/dynamicsofficeapp/v1.3.0.0/*
    ```  

5. Copy the **Application (Client)** that is assigned to Excel add-in application.
    
    You can get this from the **Settings** page for the application. You'll need this later in the procedure.

This completes the work you have to do in the Azure portal. The final configuration is to add the Excel add-in to the [!INCLUDE[server](../developer/includes/server.md)] instances.

## Configure the [!INCLUDE[server](../developer/includes/server.md)] Instances

You must add the Excel add-in to the [!INCLUDE[server](../developer/includes/server.md)] instances in your deployment. You can use either the [!INCLUDE[admintool](../developer/includes/admintool.md)] or **Set-NAVServerConfiguration** cmdlet in the [!INCLUDE[adminshell](../developer/includes/adminshell.md)].

1.  In the [!INCLUDE[admintool](../developer/includes/admintool.md)], in the **Azure Active Directory** section, set the **Excel add-in AAD client ID** field to the application (client) ID for the Excel add-in application that you copied from the Azure portal.

    With the Set-NAVServerConfiguration cmdlet, set the `ExcelAddInAzureActiveDirectoryClientId` key.

2.  In the **Client Services** section, set the **Web Client Base URL** field to the base URL of the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)].

	This is the root portion of all URLs that are used to access pages in the web client. This must have the format `https://[hostname:port]/[instance]`, such as `https://MyBCWebServer/BC`.

    If using the **Set-NAVServerConfiguration** cmdlet, set the `PublicWebBaseUrl` key.

3.  In the **OData Services** section, set the **OData Base URL** field to the public URL for accessing OData services.

    The URL must have the following format `https://<hostname>:<port>/<instance>/ODataV4/`, such as `https://Cronus.Nav.net:7047/bc130/ODataV4/`.

    With the **Set-NAVServerConfiguration** cmdlet, set the `PublicODataBaseUrl`key.

## Use the Excel Add-In
Your users can now use the Excel add-in. When a list page shows the **Edit in Excel** action, then users can open lists, such as the **Customers** page, in Excel and work with the data there. They can use the add-in to update data in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], and they can get fresh data from the database.  

<!-- > [!NOTE]  
>  The pages that your users want to work on in Excel must be published as web services. -->

## See Also
[Configuring Business Central Server](configure-server-instance.md)  
[Authenticating Users with Azure Active Directory](Authenticating-Users-with-Azure-Active-Directory.md)  
