---
title: "Setting up the Excel Add-In for Editing Data"
description: Learn about how to configure the Excel add-in so users can edit data in Excel and push back to Business Central.
author: jswymer
ms.author: jswymer
ms.custom: bap-template
ms.service: dynamics-365-op
ms.topic: conceptual
ms.date: 09/18/2024
ms.reviewer: jswymer
---
# Setting up the Business Central add-in for Excel in Business Central on-premises

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

This article provides guidance for how to configure [!INCLUDE [prod_short](../developer/includes/prod_short.md)] on-premises so that users can edit data in Excel by using the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] add-in for Excel.

> [!NOTE]
> This article does not apply to the older Excel add-in that was available for installation with the [!INCLUDE[nav_windows_md](../developer/includes/nav_windows_md.md)] client by using the [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] in versions older than 2019 release wave 2.

## Overview
  
You can set up the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] deployment to support an add-in that enables users in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client to work with data from list pages in Excel. Users can get fresh data from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] into Excel and push updated data from Excel to [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

Without this add-in, users can open a list page in Excel from the **Open in Excel** action on the page. But the **Open in Excel** action doesn't allow them to push changed data back to [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. When this add-in is set up, the **Edit in Excel** action is added. The add-in is based on the [Microsoft Dynamics Office Add-In](https://appsource.microsoft.com/product/office/WA104379629) available from the Office Store.

Learn more about how users work with Excel from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] at [Viewing and Editing in Excel From Business Central](/dynamics365/business-central/across-work-with-excel).

> [!NOTE]
> The Excel add-in is not available in the mobile apps.

## Prepare Business Central

Your on-premises deployment must meet the following prerequisites:

- Microsoft Entra ID used to authenticate users.

  The [!INCLUDE[server](../developer/includes/server.md)] instance, clients, and users must be configured for Microsoft Entra authentication, including OData.

  - For [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2022 release wave 1 (v20) and later, go to [Configure Microsoft Entra authentication with OpenID Connect](Authenticating-Users-with-Azure-ad-openid-connect.md).

       > [!IMPORTANT]
       > Be sure to set `WSFederationLoginEndpoint` parameter of [!INCLUDE[server](../developer/includes/server.md)] instance. Otherwise, you'll get an error that the realm is not defined when trying to edit data using **Edit in Excel**.
  - For [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 2 (v19) and earlier, go to [Configure Microsoft Entra authentication with WS-Federation](authenticating-users-with-azure-active-directory.md).
- OData enabled and uses Secure Sockets Layer (SSL) for authentication.

   Learn more in [Using Security Certificates with Business Central On-Premises](../deployment/implement-security-certificates-production-environment.md).  

- [!INCLUDE[webserver](../developer/includes/webserver.md)] configured to use SSL (https).

  Learn more in [Configure SSL to Secure the Connection to Web Client](../deployment/Configure-SSL-web-client-connection.md).

- If your deployment is multitenant, [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] must accept host names for tenants.

  Learn more in [Configure the Web Server to Accept Host Names for Tenants](configure-web-server-to-accept-host-names-for-tenants.md).  

- [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client computers have a supported version of Excel.

   Learn more in [System Requirements](../deployment/System-Requirement-business-central.md#WebClient).

## Expose the Business Central application Web API in Microsoft Entra ID

When [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is configured for Microsoft Entra authentication, the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application is registered as an application in a Microsoft Entra ID. Before the Excel add-in can be configured, you must configure the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application in Microsoft Entra ID to expose its Web API.

> [!NOTE]
> The API may have already been exposed as part of the Microsoft Entra authentication setup. You can also use the following steps to verify.

1. Sign in to the [Azure portal](https://portal.azure.com).
1. Search for and select **Microsoft Entra ID**.
1. Under **Manage**, select **App registrations**, and then select the app registration for Business Central authentication.
1. Under **Manage**, select **Expose API**.
1. On the **Expose API** page, if the **Application ID URI** box is filled out, then API is already exposed, so you don't have to do anything else. Otherwise, select **Set** to expose the API.
1. Under **Manage**, select **Token configuration**, and then do the following steps:

   1. On the **Optional claims** page, select **Add optional claim**.
   1. In the **Token type** pane, choose **Access**.
   1. Under **Claim**, select **email** and **upn**, and then select **Add**.

      If a dialog appears with the checkbox **Turn on the Microsoft Graph email, profile permissions (required for claims to appear in token)**, select the checkbox, and then select **Add**.
1. After you perform the previous steps, especially step 6, the application might issue a token to the Excel add-in. It's recommended to clear any caches to ensure that you get the **upn** and **email** claims. To clear the cache of the Excel add-in, do the following steps:

    1. In Excel, right-click the Excel add-in pane, and then select **Inspect** to open the browser developer tools.
    1. Go to the **Application** tab.
    1. In the **Storage** pane, clear instances of `https://az689774.vo.mssecnd.net` under **Local Storage**, **Session Storage**, **Cookies**, and **Shared Storage**. To clear, right-click an instance and select **Clear**.
    1. Refresh the add-in by closing and opening the Excel file again or pressing Ctrl+R while being inside the developer tools.
    1. If the Excel add-in prompts you to sign in again, then you'll receive a token with the new claims the next time you sign in.

Learn more about how to expose the Web API at [Quickstart: Configure an application to expose web APIs](/azure/active-directory/develop/quickstart-configure-app-expose-web-apis).

## Register and configure an application in Microsoft Azure

When Microsoft Entra authentication was set up for your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] deployment, a Microsoft Entra tenant was created in Microsoft Azure, and an application for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] was registered in the tenant. The Excel add-in requires that you add (register) a separate Microsoft Entra application in the Microsoft Entra tenant. Learn more guidelines at [Register your application with your Microsoft Entra tenant](/azure/active-directory/active-directory-app-registration).

1. Sign in to the [Azure portal](https://portal.azure.com).
1. Search for and select **Microsoft Entra ID**.
1. Under **Manage**, select **App registrations** > **New registration**.
1. On the **Register an application** page, fill in the following information, and then select **Register**:

    |Setting|Description|
    |-------|-----------|
    |Name|The name of your application as it will display to your users, such as *Excel Add-in for Business Central*.|
    |Supported account types|Specifies which accounts that you would like your application to support. For purposes of this article, select **Accounts in this organizational directory only**. |

1. Modify the app's manifest to configure OAuth2 implicit grant flow and a *spa* type reply URL for the Excel add-in.

    From the application's **Overview**, select **Manifest**. You can choose to edit the manifest using the **Microsoft Graph App Manifest (New)** tab or the **AAD Graph App Manifest (Deprecating Soon)** tab. We recommend the **Microsoft Graph App Manifest (New)** tab.

    # [Microsoft Graph App Manifest (New)](#tab/graphapp)

    1. In the editor, set `"web.implicitGrantSettings.enableIdTokenIssuance"` and `"web.implicitGrantSettings.enableAccessTokenIssuance"` keys to `true`:

        ```json
        "enableAccessTokenIssuance": true,
        "enableIdTokenIssuance": true
        ```

    1. In the `"spa.redirectUris":[]` key, add the following lines:

        ```json 
        "https://az689774.vo.msecnd.net/dynamicsofficeapp/v1.3.0.0/App/DynamicsApp.html",
        "https://az689774.vo.msecnd.net/dynamicsofficeapp/v1.3.0.0/App/Authenticated.html",
        "https://az689774.vo.msecnd.net/dynamicsofficeapp/v1.3.0.0/App/AuthenticationDialog.html",
        "https://az689774.vo.msecnd.net/dynamicsofficeapp/v1.3.0.0/App/SignOutDialog.html"
        ```  

        Remember to add a comma before or after this entry, depending on where you add it in the list.
    1. Select **Save**.

    # [AAD Graph App Manifest (Deprecating Soon)](#tab/aad)

    1. In the editor, set `"oauth2AllowIdTokenImplicitFlow"` and `"oauth2AllowImplicitFlow"` keys to `true`:

        ```json
        "oauth2AllowIdTokenImplicitFlow": true,
        "oauth2AllowImplicitFlow": true,
        ```

    1. In the `"replyUrlsWithType":[]` key, add the following lines:

        ```json  
        {
            "url": "https://az689774.vo.msecnd.net/dynamicsofficeapp/v1.3.0.0/App/DynamicsApp.html",
            "type": "Spa"
        },
        {
            "url": "https://az689774.vo.msecnd.net/dynamicsofficeapp/v1.3.0.0/App/Authenticated.html",
            "type": "Spa"
        },
        {
            "url": "https://az689774.vo.msecnd.net/dynamicsofficeapp/v1.3.0.0/App/AuthenticationDialog.html",
            "type": "Spa"
        },
        {
            "url": "https://az689774.vo.msecnd.net/dynamicsofficeapp/v1.3.0.0/App/SignOutDialog.html",
            "type": "Spa"
        }
        ```  

        Remember to add a comma before or after this entry, depending on where you add it in the list.
    1. Select **Save**.

       ---

1. Grant the Excel add-in application permission to access the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application Web API.

    Give the Microsoft Entra application for the Excel add-in delegated permission to access the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application Web API, which you exposed earlier in this article. This permission allows users of the Excel add-in to access the OData web services to read and write data.  

    1. From the application's **Overview** page, select **API Permissions**.
    2. Select the **Add a permission**
    3. On the **APIs my organization uses**, select the Business Central application.
    4. Select **Delegated permission**.
    5. Search for Business Central API by using registered application's name or application ID.
    6. Select the permission from the list, then select **Add Permission**. 

    Learn more at [Quickstart: Configure a client application to access web APIs](/azure/active-directory/develop/quickstart-configure-app-access-web-apis#add-permissions-to-access-web-apis).  

1. On the application's **Overview** page, copy the **Application (Client) ID** that is assigned to Excel add-in application.

    You need the application ID to configure the [!INCLUDE[server](../developer/includes/server.md)] instance.

You've completed the work you have to do in the Azure portal. The next configuration is done on the [!INCLUDE[server](../developer/includes/server.md)] instances.

## Configure the [!INCLUDE[server](../developer/includes/server.md)] instance

You add the Excel add-in to the [!INCLUDE[server](../developer/includes/server.md)] instances in your deployment. You can use either the [!INCLUDE[admintool](../developer/includes/admintool.md)] or  [Set-NAVServerConfiguration cmdlet](/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration) in the [!INCLUDE[adminshell](../developer/includes/adminshell.md)].

1. In the [!INCLUDE[admintool](../developer/includes/admintool.md)], in the **Microsoft Entra ID** section, set the **Excel add-in Microsoft Entra ID client ID** field to the application (client) ID for the Excel add-in application that you copied from the Azure portal.

   If you're using the Set-NAVServerConfiguration cmdlet, set the `ExcelAddInAzureActiveDirectoryClientId` key.

    ```powershell
    Set-NAVServerConfiguration -ServerInstance <Business Central server instance> -KeyName ExcelAddInAzureActiveDirectoryClientId -KeyValue <application ID>
    ```

   > [!NOTE]
   > Make sure the  **Microsoft Entra app ID URI** is set to the App ID URI of the registered app for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] in the Microsoft Entra tenant.

1. In the **Client Services** section, set the **Web Client Base URL** field to the base URL of the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)].

    This value is the root portion of all URLs that are used to access pages in the web client. The value must have the format `https://[hostname:port]/[instance]`, such as `https://MyBCWebServer/BC` or `https://cronusinternationltd.onmicrosoft.com/BC240`.

    If you're using the Set-NAVServerConfiguration cmdlet, set the `PublicWebBaseUrl` key.

    ```powershell
    Set-NAVServerConfiguration -ServerInstance <Business Central server instance> -KeyName PublicWebBaseUrl -KeyValue <web client URL>
    ```

1. In the **OData Services** section, configure or verify the following settings:

   1. Set the **OData Base URL** field to the public URL for accessing OData services.

       The URL must have the following format `https://<hostname>:<port>/<instance>/ODataV4/`, such as `https://localhost:7048/BC240/ODataV4/`.

       With the Set-NAVServerConfiguration cmdlet, set the `PublicODataBaseUrl` key.

        ```powershell
        Set-NAVServerConfiguration -ServerInstance <Business Central server instance> -KeyName PublicODataBaseUrl -KeyValue <OData URL>
        ```

   1. Select the **Enable OData Services** check box.

       If you're using the Set-NAVServerConfiguration cmdlet, set the `ODataServicesEnabled` key to `true`.

        ```powershell
        Set-Navserverconfiguration -ServerInstance <Business Central server instance> -KeyName ODataServicesEnabled -KeyValue true
        ```

   1. Select the **Enable API Services** check box.

       If you're using the Set-NAVServerConfiguration cmdlet, set the `ApiServicesEnabled` key to `true`.

        ```powershell
        Set-NAVServerConfiguration -ServerInstance <Business Central server instance> -KeyName ApiServicesEnabled -KeyValue true
        ```

    1. Select the **Enable OData Services SSL** check box.

        If you're using the Set-NAVServerConfiguration cmdlet, set the `ODataServicesSSLEnabled` key to `true`.

        ```powershell
        Set-NavServerConfiguration -ServerInstance <Business Central server instance> -KeyName ODataServicesSSLEnabled -KeyValue True
        ```

## Prepare devices and network for the Excel Add-In

Network services such as proxies or firewalls must allow routing between each client device on which the add-In is installed and many service endpoints. Learn more about the endpoints in [Preparing your network for the Excel Add-In](configuring-network-for-addins.md).  

## Next steps

The next step is to get the add-in installed in Excel of the users. As an administrator, you can set up Centralized Deployment in Microsoft 365 admin center to automatically install the add-ins to users in your organization. Or you can allow users to install it themselves from the Office Store. Learn more at [Get the Business Central Add-in for Excel](/dynamics365/business-central/admin-deploy-excel-addin) in the business functionality help.

## Related information

[Configuring Business Central Server](configure-server-instance.md)  
[Authenticating Users with Microsoft Entra ID](Authenticating-Users-with-Azure-Active-Directory.md)  
