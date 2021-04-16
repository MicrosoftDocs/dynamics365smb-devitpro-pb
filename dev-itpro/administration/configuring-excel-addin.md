---
title: "Setting up the Excel Add-In for Editing Data"
description: Learn about how to configure the Excel add-in so users can edit data in Excel and push back to Business Central.
author: jswymer
ms.author: jswymer
ms.custom: na
ms.reviewer: edupont
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.date: 04/01/2021
---
# Setting up the Excel Add-In for Editing [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Data

You can set up the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] deployment to support an Excel add-in that enables users in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client to work with data from list pages in Excel. Users can get fresh data from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] into Excel and push updated data from Excel to [!INCLUDE[prod_short](../developer/includes/prod_short.md)].  

Without this add-in, users can open a list page in Excel from the **Open in Excel** action on the page. But the **Open in Excel** action doesn't allow them to push changed data back to [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. When this add-in is set up, the **Open in Excel** action is replaced by the **Edit in Excel** action. The add-in is based on the [Microsoft Dynamics Office Add-In](https://appsource.microsoft.com/product/office/WA104379629).

> [!NOTE]
> The Excel add-in is not available in the mobile apps.

This article provides guidance for how to configure [!INCLUDE [prod_short](../developer/includes/prod_short.md)] so that users can edit data in Excel.  

> [!NOTE]
> This article does not apply to the older Excel add-in that was available for installation with the [!INCLUDE[nav_windows_md](../developer/includes/nav_windows_md.md)] client by using the [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] in versions older than 2019 release wave 2.

## Deploy the Excel add-in for Business Central online

For [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online, the administrator can deploy the add-in for all users. But users can also install the add-in themselves, provided they have permission to configure their Office experience.  

> [!TIP]
> In some organizations, administrators cannot deploy add-ins centrally. For more information, see [Determine if Centralized Deployment of add-ins works for your organization](/microsoft-365/admin/manage/centralized-deployment-of-add-ins?view=o365-worldwide&preserve-view=true).

### To deploy the Excel add-in for all users

1. As the administrator, sign in to the Microsoft commercial website and find the add-in at [https://appsource.microsoft.com/product/office/WA104379629](https://appsource.microsoft.com/product/office/WA104379629).
2. Choose the **Get it now** button.

    You'll be redirected to the Microsoft 365 admin center.
3. In the left panel, go to **Settings**, and then choose **Add-ins**.
4. In the **Configure add-in** pane, specify which users to grant access to the add-in.
5. Save your changes.

When users now choose the **Edit in Excel** action, the add-in will launch as a pane in Excel. Each user will be automatically logged in and connected to their [!INCLUDE [prod_short](../developer/includes/prod_short.md)], but if a user cannot connect automatically, you can unblock them by asking them to follow the steps in the [To configure the connection](#to-configure-the-connection) section.

### To add the Excel add-in locally

1. Open Excel, and then open any Excel workbook.
2. On the **Insert** menu, choose **Office Add-ins**, and then choose **Admin managed** or **Store** as appropriate.
3. Search for *Dynamics Office Add-In*, and then install the add-in.

When the add-in is installed, it shows up as a panel in Excel. Next, you must configure the connection.

### To configure the connection

1. In the Dynamics 365 Excel add-in, choose **Add server information**, and then in the **Server URL** field, enter `https://exceladdinprovider.smb.dynamics.com`.
2. Choose the OK button, and then confirm that the app reloads.
3. When prompted, sign in with your Azure Active Directory account.
4. Optionally, choose the environment and company that you want to connect to.

The add-in is now connected to your [!INCLUDE [prod_short](../developer/includes/prod_short.md)], and you can edit data and publish the changes to [!INCLUDE [prod_short](../developer/includes/prod_short.md)].  

> [!TIP]
> If the workbook is not automatically saved to the user's OneDrive, then recommend them to save all workbooks that they export from [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. When they open the workbook again, the connection is still available, so they do not have to configure the connection again.

> [!NOTE]
> In certain deployments, the administrator must configure network access to unblock the Excel add-in. For more information, see [Preparing Your Network for the Excel Add-In](configuring-network-for-addins.md).

### Troubleshooting

Sometimes, users run into problems with the Excel add-in. In this section, we provide tips for how to unblock users in certain circumstances.

|Issue  |Solution or workaround  |Comments  |
|---------|---------|---------|
|The add-in doesn't start|Check if the add-in is deployed centrally, or if the user is blocked from installing it locally. | The admin can configure Office so that users cannot acquire add-ins. In those cases, the admin must deploy the add-in centrally. For more information, see [Deploy add-ins in the admin center](/microsoft-365/admin/manage/manage-deployment-of-add-ins?view=o365-worldwide&preserve-view=true).|
|Data does not load into Excel|Test the connection by opening another list in Excel from [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. Alternatively, open the workbook in Excel in a browser.|If the user has specified a company name that contains special characters, the add-in might not be able to connect. |
|Data can't publish back to [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. |Test the connection by opening the workbook in Excel in a browser. |Sometimes an extension can block the publishing job. If the page is extended or customized, remove the extensions, and then try again.|
|The dates are wrong  |Excel might show times and dates in a different format than [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. This doesn't make them wrong, and the data in [!INCLUDE [prod_short](../developer/includes/prod_short.md)] will not get messed up.|         |
|For some list pages, editing multiple lines in Excel consistently causes errors. This condition can occur if OData calls include FlowFields and fields outside of the repeater control.|On the **Web Services** page, select the **Exclude Non-Editable FlowFields** and **Exclude Fields Outside of the Repeater** check boxes for the published page. Selecting these check boxes excludes non-editable FlowFields and field from the eTag calculation. |These check boxes are hidden by default. To show them on the **Web Services** page, use [personalization](/dynamics365/business-central/ui-personalization-user). |

## Deploy the Excel add-in for Business Central on-premises

Your on-premises deployment must meet the following prerequisites:

- Azure Active Directory (Azure AD) used to authenticate users.

  The [!INCLUDE[server](../developer/includes/server.md)] instance, clients, and users must be configured for Azure Active Directory (Azure AD) authentication.

   For more information, see [Authenticating Users with Azure Active Directory](Authenticating-Users-with-Azure-Active-Directory.md).  
- OData enabled and uses Secure Sockets Layer (SSL) for authentication.

   For more information, see [Using Security Certificates with Business Central On-Premises](../deployment/implement-security-certificates-production-environment.md).  

- [!INCLUDE[webserver](../developer/includes/webserver.md)] installed and configured to use SSL (https).

  For more information, see [Install Business Central](../deployment/install-using-setup.md) and [Configure SSL to Secure the Connection to Web Client](../deployment/Configure-SSL-web-client-connection.md).

- If your deployment is multitenant, [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] must accept host names for tenants.

  For more information, see [Configure the Web Server to Accept Host Names for Tenants](configure-web-server-to-accept-host-names-for-tenants.md).  

- [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client computers have a supported version of Excel.

   For more information, see [System Requirements](../deployment/System-Requirement-business-central.md#WebClient).

### Expose the Business Central application Web API in Azure AD

[!INCLUDE [on_prem_only_v2](../developer/includes/on_prem_only_v2.md)]

When [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is configured for Azure AD authentication, the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application is registered as an application in an Azure AD. Before the Excel add-in can be configured, you must configure the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application in Azure AD to expose its Web API.

For information about how to expose the Web API, see [Quickstart: Configure an application to expose web APIs](/azure/active-directory/develop/quickstart-configure-app-expose-web-apis).

### Register and configure an Azure AD application for the Excel Add-in in Microsoft Azure

[!INCLUDE [on_prem_only_v2](../developer/includes/on_prem_only_v2.md)]

When Azure AD authentication was set up for your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] deployment, an Azure AD tenant was created in Microsoft Azure, and an application for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] was registered in the tenant. The Excel add-in requires that you add (register) a separate Azure AD application in the Azure AD tenant.

1. Register an Azure AD application for the Excel add-in.

    You add the Azure AD application by using the [Azure portal](https://go.microsoft.com/fwlink/?LinkID=317944). For guidelines, see [Register your application with your Azure Active Directory tenant](/azure/active-directory/active-directory-app-registration).

    When you add an application to an Azure AD tenant, you must specify the following information:

    |Setting|Description|
    |-------|-----------|
    |Name|The name of your application as it will display to your users, such as *Excel Add-in for Business Central*.|
    |Supported account types|Specifies which accounts that you would like your application to support. For purposes of this article, select **Accounts in this organizational directory only**. |
    |Redirect URI|Specifies the type of application that you're registering and the redirect URI (or reply URL) for your application. Select the type to **Web**, and in the redirect URL box, enter URL for signing in to the [!INCLUDE[webclient](../developer/includes/webclient.md)], for example `https://localhost:443/BC170/SignIn`.<br /><br />The URI has the format `https://<domain or computer name>/<webserver-instance>/SignIn`, such as `https://cronusinternationltd.onmicrosoft.com/BC170/SignIn` or `https://MyBcWebServer/BC170/Signin`. **Important** The portion of the reply URL after the domain name (in this case `BC170/SignIn`) is case-sensitive, so make sure that the web server instance name matches the case of the web server instance name as it is defined on IIS for your [!INCLUDE[webserver](../developer/includes/webserver.md)] installation.|

    <!--
        |Directory Access|Choose **Single Sign-On**.|
            |App ID URI|The URI to a domain in your Azure AD tenant, such as *https://solutions.onmicrosoft.com/ExcelAddinforBusinessCentral*. **Important:**  The App ID URI must be unique within the Azure AD tenant and not the same as you specified for your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] solution.|
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
2. Grant the Excel add-in application permission to access the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application Web API.

    Give the Azure AD application for the Excel add-in delegated permission to access the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application Web API in Azure AD (which you exposed earlier in this article). This permission allows users of the Excel add-in to access the OData web services to read and write data.  

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

### Configure the [!INCLUDE[server](../developer/includes/server.md)] Instances

[!INCLUDE [on_prem_only_v2](../developer/includes/on_prem_only_v2.md)]

You add the Excel add-in to the [!INCLUDE[server](../developer/includes/server.md)] instances in your deployment. You can use either the [!INCLUDE[admintool](../developer/includes/admintool.md)] or  [Set-NAVServerConfiguration cmdlet](/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration) in the [!INCLUDE[adminshell](../developer/includes/adminshell.md)].

1. In the [!INCLUDE[admintool](../developer/includes/admintool.md)], in the **Azure Active Directory** section, set the **Excel add-in AAD client ID** field to the application (client) ID for the Excel add-in application that you copied from the Azure portal.

    If you use the Set-NAVServerConfiguration cmdlet, set the `ExcelAddInAzureActiveDirectoryClientId` key.

2. In the **Client Services** section, set the **Web Client Base URL** field to the base URL of the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)].

    This value is the root portion of all URLs that are used to access pages in the web client. The value must have the format `https://[hostname:port]/[instance]`, such as `https://MyBCWebServer/BC` or `https://cronusinternationltd.onmicrosoft.com/BC170`.

    If using the **Set-NAVServerConfiguration** cmdlet, set the `PublicWebBaseUrl` key.

3. In the **OData Services** section, set the **OData Base URL** field to the public URL for accessing OData services.

    The URL must have the following format `https://<hostname>:<port>/<instance>/ODataV4/`, such as `https://localhost:7048/BC170/ODataV4/`.

    With the **Set-NAVServerConfiguration** cmdlet, set the `PublicODataBaseUrl`key.

## Prepare devices and network for the Excel Add-In

Network services such as proxies or firewalls must allow routing between each client device on which the Add-In is installed and a number of service endpoints. For a list of endpoints, see [Preparing your network for the Excel Add-In](configuring-network-for-addins.md).  

## Use the Excel Add-In

Your users can now use the Excel add-in. When a list page shows the **Edit in Excel** action, then users can open lists, such as the **Customers** page, in Excel and work with the data there. They use the add-in to update data in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] and get fresh data from the database. For more information, see [Viewing and Editing in Excel From Business Central](/dynamics365/business-central/across-work-with-excel).  

<!-- > [!NOTE]  
>  The pages that your users want to work on in Excel must be published as web services. -->

## See Also

[Configuring Business Central Server](configure-server-instance.md)  
[Authenticating Users with Azure Active Directory](Authenticating-Users-with-Azure-Active-Directory.md)  
