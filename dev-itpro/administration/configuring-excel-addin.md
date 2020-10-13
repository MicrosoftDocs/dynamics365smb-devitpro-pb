---
title: "Setting up the Excel Add-In for Editing Data"
author: jswymer
ms.author: jswymer
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---
# Setting up the Excel Add-In for Editing [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Data

You can set up the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] deployment to support an Excel add-in that enables users in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] client to work with data from list pages in Excel. Users can get fresh data from [!INCLUDE[prodshort](../developer/includes/prodshort.md)] into Excel and push updated data from Excel to [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

Without this add-in, users can open a list page in Excel from the **Open in Excel** action on the page. But the **Open in Excel** action doesn't allow them to push changed data back to [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. When this add-in is set up, the **Open in Excel** action is replaced by the **Edit in Excel** action.

> [!NOTE]  
> This feature is only available for the Web client.

>[!NOTE]
>This Excel add-in is different than the Microsoft Excel Add-in that can be installed together with the [!INCLUDE[nav_windows_md](../developer/includes/nav_windows_md.md)] client by using the [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)].

## Prerequisites

Your deployment must meet the following prerequisites:

- Azure Active Directory (Azure AD) used to authenticate users.

  The [!INCLUDE[server](../developer/includes/server.md)] instance, clients, and users must be configured for Azure Active Directory (Azure AD) authentication.

   For more information, see [Authenticating Users with Azure Active Directory](Authenticating-Users-with-Azure-Active-Directory.md).  
- OData enabled and uses Secure Sockets Layer (SSL) for authentication.

   For more information, see [Using Security Certificates with Business Central On-Premises](../deployment/implement-security-certificates-production-environment.md).  

- [!INCLUDE[webserver](../developer/includes/webserver.md)] installed and configured to use SSL (https).

  For more information, see [Install Business Central](../deployment/install-using-setup.md) and [Configure SSL to Secure the Connection to Web Client](../deployment/Configure-SSL-web-client-connection.md).

- If your deployment is multitenant, [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] must accept host names for tenants.

  For more information, see [Configure the Web Server to Accept Host Names for Tenants](configure-web-server-to-accept-host-names-for-tenants.md).  

- [!INCLUDE[prodshort](../developer/includes/prodshort.md)] client computers have a supported version of Excel.

   For more information, see [System Requirements](../deployment/System-Requirement-business-central.md#WebClient).

## Expose the Business Central application Web API in Azure AD 

When [!INCLUDE[prodshort](../developer/includes/prodshort.md)] is configured for Azure AD authentication, the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] application is registered as an application in an Azure AD. Before the Excel add-in can be configured, you must configure the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] application in Azure AD to expose its Web API.

For information about how to expose the Web API, see [Quickstart: Configure an application to expose web APIs](/azure/active-directory/develop/quickstart-configure-app-expose-web-apis).

## Register and configure an Azure AD application for the Excel Add-in in Microsoft Azure

When Azure AD authentication was set up for your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] deployment, an Azure AD tenant was created in Microsoft Azure, and an application for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] was registered in the tenant. The Excel add-in requires that you add (register) a separate Azure AD application in the Azure AD tenant.

1. Register an Azure AD application for the Excel add-in.

    You add the Azure AD application by using the [Azure portal](https://go.microsoft.com/fwlink/?LinkID=317944). For guidelines, see [Register your application with your Azure Active Directory tenant](/azure/active-directory/active-directory-app-registration).
    
    When you add an application to an Azure AD tenant, you must specify the following information:

    |Setting|Description|
    |-------|-----------|
    |Name|The name of your application as it will display to your users, such as *Excel Add-in for Business Central*.|
    |Supported account types|Specifies which accounts that you would like your application to support. For purposes of this article, select **Accounts in this organizational directory only**. |
    |Redirect URI|Specifies the type of application that you're registering and the redirect URI (or reply URL) for your application. Select the type to **Web**, and in the redirect URL box, enter URL for signing in to the [!INCLUDE[webclient](../developer/includes/webclient.md)], for example `https://localhost:443/BC150/SignIn`.<br /><br />The URI has the format `https://<domain or computer name>/<webserver-instance>/SignIn`, such as `https://cronusinternationltd.onmicrosoft.com/BC150/SignIn` or `https://MyBcWebServer/BC150/Signin`. **Important** The portion of the reply URL after the domain name (in this case `BC150/SignIn`) is case-sensitive, so make sure that the web server instance name matches the case of the web server instance name as it is defined on IIS for your [!INCLUDE[webserver](../developer/includes/webserver.md)] installation.|

    <!--
        |Directory Access|Choose **Single Sign-On**.|
            |App ID URI|The URI to a domain in your Azure AD tenant, such as *https://solutions.onmicrosoft.com/ExcelAddinforBusinessCentral*. **Important:**  The App ID URI must be unique within the Azure AD tenant and not the same as you specified for your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] solution.|
                |Sign-on URL (App URL)|The URI for signing in to your [!INCLUDE[nav_web_server](../developer/includes/nav_web_server_md.md)], such as `https://www.solutions.com/BC`|
    -->
    When completed, the **Overview** displays in the portal for the new Excel Add-in application.

<!--
2. After you register the application, set the Application ID URI for the application.  

    1. From the **Overview** page for your app registration, next to the **Application ID URI** label, select **Add an Application ID URI**.
    2. On the **Expose API**, page, next to the **Application ID URI**, select **Set**.
    
        The **Application ID URI** box displays the default application ID URI, which has the format `api://<guid>`, such as `api://70b20a51-46b7-4290-8686-b79ec90379f6`. You can keep this value or change it. The application ID URI must be a valid URI starting with HTTPS, API, URN, MS-APPX. It must not end in a slash. For example, `https://cronusinternationltd.onmicrosoft.com/ExcelAddinforBusinessCentral`.
    3. Select **Save** when done.
-->
2. Grant the Excel add-in application permission to access the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] application Web API.

    Give the Azure AD application for the Excel add-in delegated permission to access the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] application Web API in Azure AD (which you exposed earlier in this article). This permission allows users of the Excel add-in to access the OData web services to read and write data.  

    1. From the application's **Overview**, select **API Permissions**.
    2. Select the **Add a permission**
    3. On the **APIs my organization uses**, select the Business Central application.
    4. Select **Delegated permission**.
    5. Select the permission from the list, and then select **Add Permission**.

    For information, see [Quickstart: Configure a client application to access web APIs](/azure/active-directory/develop/quickstart-configure-app-access-web-apis#add-permissions-to-access-web-apis).  

3. Configure OAuth2 authentication in the Excel add-in.

    The Excel add-in requires OAuth2 implicit grant flow to be enabled on the Excel Add-in application. You configure OAuth2 in the manifest file for the Excel Add-in application. From the application's **Overview**, select **Manifest**, and then set `"oauth2AllowIdTokenImplicitFlow"` and `"oauth2AllowImplicitFlow"` to `true`:

    ```
    "oauth2AllowIdTokenImplicitFlow": true,
    "oauth2AllowImplicitFlow": true,
    ```

4. In the manifest, add the following URL entry to the `"replyUrlsWithType":`:

    ```  
    {
        "url": "https://az689774.vo.msecnd.net/dynamicsofficeapp/v1.3.0.0/*",
        "type": "Web"
    }
    ```  
    
    Remember to add a comma before or after this entry, depending on where you add it in the list.

5. Copy the **Application (Client) ID** that is assigned to Excel add-in application.
    
    You can get this value from the **Overview** page for the application. You'll need it to configure the [!INCLUDE[server](../developer/includes/server.md)] instance.

This completes the work you have to do in the Azure portal. The final configuration is to add the Excel add-in to the [!INCLUDE[server](../developer/includes/server.md)] instances.

## Configure the [!INCLUDE[server](../developer/includes/server.md)] Instances

You add the Excel add-in to the [!INCLUDE[server](../developer/includes/server.md)] instances in your deployment. You can use either the [!INCLUDE[admintool](../developer/includes/admintool.md)] or  [Set-NAVServerConfiguration cmdlet](/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration) in the [!INCLUDE[adminshell](../developer/includes/adminshell.md)].

1.  In the [!INCLUDE[admintool](../developer/includes/admintool.md)], in the **Azure Active Directory** section, set the **Excel add-in AAD client ID** field to the application (client) ID for the Excel add-in application that you copied from the Azure portal.

    If you use the Set-NAVServerConfiguration cmdlet, set the `ExcelAddInAzureActiveDirectoryClientId` key.

2.  In the **Client Services** section, set the **Web Client Base URL** field to the base URL of the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)].

    This value is the root portion of all URLs that are used to access pages in the web client. The value must have the format `https://[hostname:port]/[instance]`, such as `https://MyBCWebServer/BC` or `https://cronusinternationltd.onmicrosoft.com/BC150`.

    If using the **Set-NAVServerConfiguration** cmdlet, set the `PublicWebBaseUrl` key.

3.  In the **OData Services** section, set the **OData Base URL** field to the public URL for accessing OData services.

    The URL must have the following format `https://<hostname>:<port>/<instance>/ODataV4/`, such as `https://localhost:7048/BC150/ODataV4/`.

    With the **Set-NAVServerConfiguration** cmdlet, set the `PublicODataBaseUrl`key.

## Prepare devices and network for the Excel Add-In

Network services such as proxies or firewalls must allow routing between each client device on which the Add-In is installed and a number of service endpoints. For a list of endpoints, see [Preparing your network for the Excel Add-In](configuring-network-for-addins.md).  

## Use the Excel Add-In
Your users can now use the Excel add-in. When a list page shows the **Edit in Excel** action, then users can open lists, such as the **Customers** page, in Excel and work with the data there. They use the add-in to update data in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] and get fresh data from the database.  

<!-- > [!NOTE]  
>  The pages that your users want to work on in Excel must be published as web services. -->

## See Also
[Configuring Business Central Server](configure-server-instance.md)  
[Authenticating Users with Azure Active Directory](Authenticating-Users-with-Azure-Active-Directory.md)  
