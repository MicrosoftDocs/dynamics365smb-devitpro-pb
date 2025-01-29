---
title: Set up the add-ins for Outlook integration with Business Central on-premises
description: Learn how to configure your Business Central on-premises solution so that users can work with Business Central data in Outlook.
ms.custom: bap-template
ms.date: 01/21/2025
ms.reviewer: jswymer
ms.service: dynamics-365-op
ms.topic: conceptual
author: jswymer
---
# Set Up the Business Central Add-In for Outlook with Business Central On-premises

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

If your organization uses Exchange Server or Exchange Online (alone or as part of a Microsoft 365 subscription), [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises supports integration with Outlook that enables users to complete [!INCLUDE[prod_short](../developer/includes/prod_short.md)] business tasks from their Outlook inbox. As the admin, you can configure [!INCLUDE [prod_short](../includes/prod_short.md)] so that users can connect to [!INCLUDE [prod_short](../includes/prod_short.md)] data from Outlook.

This article describes how to get the add-ins for [!INCLUDE [prod_short](../includes/prod_short.md)] on-premises. Learn about [!INCLUDE [prod_short](../includes/prod_short.md)] online deployment in [Get the Business Central add-in for Outlook](/dynamics365/business-central/admin-outlook).

## Overview

### About the add-in

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] add-in for Outlook consists of two add-ins:

- Contact Insights

    The add-in provides users with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] customer or vendor information in Outlook emails and calendar appointments. It also enables users to create and send [!INCLUDE[prod_short](../developer/includes/prod_short.md)] business documents, such sales quotes and invoices to a contact. To support these tasks, the add-in adds actions to the Outlook ribbon, in the **Business Central** group.  

- Document View

    When a business document is sent as an email, this  add-in provides a direct link from email to the actual business document in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

Each add-in is provided as an XML manifest file, which must be installed in Outlook client of any user that wants this functionality. These files describe how to activate the add-ins and connect to Business Central when they're used in Outlook.

Learn more about using the add-ins in [Using Business Central as your Business Inbox in Outlook](/dynamics365/business-central/work-outlook-addin).

### About deployment

There are different options for deploying the add-ins. The option you choose depends on your organization's security policies, the Business Central environment, and how much control over installing the add-in you want to give users. For example, you can install the add-ins automatically for all users in your organization or targeted users only. Or, you can allow users to install the add-ins themselves. Learn more in the following sections of this article:

- [Centralized Deployment](#centralized-deployment)
- [Automated Individual Deployment](#automated-individual-deployment)
- [Manual Individual Deployment](#manual-individual-deployment)

> [!IMPORTANT]
> Working with multiple environments? The Business Central add-in for Outlook works with a single Business Central environment. When installed, the environment name is included in the add-in's manifest. This configuration means the add-in will only connect to the environment it was installed from. To use the add-in with a different environment, open the environment and install the add-in again.

### Mail server

The add-in deployment works with Exchange Online, Exchange Online as part of Microsoft 365, and Exchange Server 2019. The add-in uses Exchange Web Services (EWS) to access mailbox data from Exchange Server, while Microsoft Entra Identity Provider and Microsoft Graph are used to access data from Exchange Online.

### Authentication and authorization

The authentication and authorization that can be used depends on whether you're using Exchange Online or Exchange Server.

#### [Exchange Online](#tab/exchangeonline)

To use Exchange Online, configure Business Central to use Microsoft Entra authentication. Learn more in [Configure Microsoft Entra authentication with OpenID Connect](authenticating-users-with-azure-ad-openid-connect.md).

The Business Central add-in uses NAA (Nested App Authentication) for a secure, single sign-on experience with Outlook and your users' Entra ID account. It also supports multi-factor authentication if configured in Microsoft 365.

#### [Exchange Server](#tab/exchangeserver)

With Exchange Server, EWS and Autodiscover try to find the local Exchange Server. Business Central can be configured to use either NavUserPassword or Microsoft Entra authentication.

---

## Prepare for deployment

The steps to prepare for deploying the add-in depend on whether you plan to deploy to Exchange Online or Exchange Server.

### [Deploying to Exchange Online](#tab/m356)

1. Prepare Microsoft 365

   - Assign users a Microsoft 365 license.
   - Make sure your Microsoft 365 account has at least the **Exchange Administrator** role.

2. Prepare Business Central

   - Set up Microsoft Entra authentication.

      Learn more in [Configure Microsoft Entra authentication with OpenID Connect](authenticating-users-with-azure-ad-openid-connect.md).

      In the app registration, expose the Business Central API with a scope requiring admin and user consent:

      1. Select **Expose an API**.
      1. If there's no value for **Application ID URI**, select **Add** > **Save**. Make note of the Application ID URI for later.
      1. On the **Expose an API** page, select **Add a Scope**, and then  the following:

         |Setting|Value|Example|
         |-|-|-|
         |Scope name|Specify a meaningful name of a permission scope |BusinessCentralOnPrem.Access |
         |Consent|Choose **Admins and users** ||
         |Admin consent display name|Specify a meaningful name for admin consent.|Access Business Central as the signed-in user|
         |Admin consent description |Specify a meaningful, accompanying description |Business Central is a comprehensive business management solution that organizations work smarter, adapt faster, and perform better. |
         |User consent display name|Specify a meaningful name that for user consent.|Have full access to Business Central|
         |User consent description|Specify a meaningful, accompanying description. 
         |Allow the application full access to Dynamics 365 on your behalf.|

      Learn more in [Configure an application to expose a web API](/entra/identity-platform/quickstart-configure-app-expose-web-apis#add-a-scope)

   - Configure [!INCLUDE[webserver](../developer/includes/webserver.md)] to use SSL (https).

      Learn more in [Configure SSL to secure the connection to web client](../deployment/configure-ssl-web-client-connection.md).

   - Configure the [!INCLUDE[server](../developer/includes/server.md)] instance to work with the Office Add-ins.

      Learn more in [Configure the [!INCLUDE[server](../developer/includes/server.md)] instance to work with the Office Add-ins](#server)

   - Register an application in Mirosoft Entra ID for connecting Outlook and Business Central

     Learn more in [Register an app that connects Outlook and Business Central](#register-an-app-that-connects-outlook-and-business-central)

   - Configure the Business Central web server instance to work with Exchange Online

      Learn more in [Configure the web server instance to work with the Office Add-ins](#configure-the-includeserver-instance-to-work-with-the-office-add-ins).

   - Set the authentication email on user accounts to the user's Microsoft 365 email address.

      Learn more in [Create Users According to Licenses](/dynamics365/business-central/ui-how-users-permissions) in the business functionality help.

### [Deploying to Exchange Server](#tab/exchange)

1. Prepare Exchange Server

    - Enable access to EWS. Learn more in [Control access to EWS in Exchange](/exchange/client-developer/exchange-web-services/how-to-control-access-to-ews-in-exchange)
    - Make sure your Exchange account has the Organization Management role or the Org Apps admin role

2. Business Central

    - Set up Microsoft Entra authentication or NavUserPassword.

      Learn more in [Authenticating issers with Microsoft Entra ID](authenticating-users-with-azure-ad-openid-connect.md) or [Authenticating users with NavUserPassword](authenticating-users-with-navuserpassword.md)

    - Configure [!INCLUDE[webserver](../developer/includes/webserver.md)] to use SSL (https).

      Learn more in [Configure SSL to Secure the Connection to Web Client](../deployment/configure-ssl-web-client-connection.md).
    - Configure the [!INCLUDE[server](../developer/includes/server.md)] instance to work with the Office Add-ins.

      Learn more in [Configure the [!INCLUDE[server](../developer/includes/server.md)] instance to work with the Office Add-ins](#server)

---

#### Register an app that connects Outlook and Business Central

> APPLIES TO: Exchange Online, Exchange Server

Sign in to the [Microsoft Entra admin center](https://entra.microsoft.com) and create a new app registration on your tenant. Create a new registration with the following settings:

|Setting|Value|Example|
|-|-|-|
|Name|Specify a meaningful name for the app |Business Central on-prem Outlook Add-in Connector |
|Supported account types |Use the default or select **Accounts in any organizational directory (Any Microsoft Entra ID directory - Multitenant)** ||
|Redirect URI - Select a platform box|**Single-Page application (SPA)**||
|Redirect URI - URI box|Enter the base URL for your Business Central on-premises web client |`https://MyBCWebServer` |

Add the following API permissions the new registered app:

With the new registered app open, select **API permissions** > **Add a permission**.

- In the **Microsoft APIs** tab, select **Microsoft Graph**, and **Delegated permissions**. From the list of available permissions, select **User.Read** and **Mail.ReadWrite** and then select **Add permissions**.

- In the **APIs my organization uses** tab, search for the name of the app that authenticates Microsoft Entra ID users with Business Central (this is not the app you registered to connect Outlook and Business Central), and add the scope you created earlier.

Select **Add permissions** to save the changes.

Learn more in [Add permissions to access web APIs](/azure/active-directory/develop/quickstart-configure-app-access-web-apis#add-permissions-to-access-web-apis) of the Azure documentation.

#### <a name="server"></a>Configure the [!INCLUDE[server](../developer/includes/server.md)] instance to work with the Office Add-ins

> APPLIES TO: Exchange Online, Exchange Server

For this task, use the [Set-NAVServerConfiguration cmdlet](/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration) cmdlet in the [!INCLUDE[adminshell](../developer/includes/adminshell.md)].

1. Start the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator.
1. Run the Set-NAVServerConfiguration cmdlet to set the `PublicWebBaseUrl` key to the base URL of the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)].

   The base URL is the public URL that Outlook clients use to access [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. The base URL is the root portion of all URLs that are used to access pages in the web client. It must have the format `https://[hostname:port]/[instance]`, such as `https://MyBCWebServer:443/BC252`.

    ```powershell
    Set-NavServerConfiguration -ServerInstance <BC server instance> -KeyName PublicWebBaseUrl -Keyvalue <web client URL>
    ```

1. Run the Set-NAVServerConfiguration cmdlet to set the `ValidAudiences` key to the host name of the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)]. The value is the web client base URL *without* the port number and server instance, like `https://MyBCWebServer`.

    ```powershell
    Set-NavServerConfiguration -ServerInstance <BC server instance> -KeyName ValidAudiences -Keyvalue <host name>
    ```

   If you have a multitenant deployment that uses different host names for tenants, like `https://tenant1.cronusinternational.com`, you have to register each host name as a valid audience. There are two ways you can do this:

   - On the server-level, use the Set-NavServerConfiguration cmdlet to add each host name to **Valid Audiences** setting of the [!INCLUDE[server](../developer/includes/server.md)] instance. separate each host name with a semi-colon.

     ```powershell
     Set-NavServerConfiguration -ServerInstance <BC server instance> -KeyName ValidAudiences -Keyvalue "<host name 1>;<host name 1>"
     ```
  
   - On the tenant-level, add the host names to the **Valid Audiences** setting when you mount the tenant by using the [Mount-NAVTenant cmdlet](/powershell/module/microsoft.dynamics.nav.management/mount-navtenant).

     ```powershell
     Mount-NavTenant -ServerInstance <BC server instance> -Tenant <tenant_ID> -ValidAudiences <host name 1>  
     ```

   > [!NOTE]
   > If there's more than one host name, separate each host name with a semi-colon. You can specify the host names on the server-level, tenant-level, or a combination of both.  

1. (Optional) Run the `Set-NAVServerConfiguration` cmdlet to set the `ExchangeAuthenticationMetadataLocation` key.

   ```powershell
   Set-NavServerConfiguration -ServerInstance <BC server instance> -KeyName ExchangeAuthenticationMetadataLocation -Keyvalue <metadata document URL>
   ```

   This setting is used to confirm the identity of the signing authority when using Exchange authentication. In part, the value includes the URL of the Exchange mail server. The field accepts a wild-card URL. So for example, if the URL of the Exchange mail server is `https://mail.cronus.com`, then you can set the field to `https://mail.cronus.com*`. The default value is `https://outlook.office365.com/`. Complete this step only if you want to use a value other than the default.

## Configure the Business Central web server instance to work with Exchange Online

> APPLIES TO: Exchange Online

This task is only required when working with Exchange Online. To complete this task, you need the application (client) ID of the registered application used for Business Central authentication in Microsost Entra.

Use the [Set-NAVWebServerInstanceConfiguration](/powershell/module/microsoft.dynamics.nav.management/set-navwebserverinstanceconfiguration) in the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] to configure the following web server instance settings:

|KeyName|KeyValue|Example|
|-|-|-|
|ExchangeOnlineAppId|Use the Application (client) ID for the application you registered that connects Outlook and Business Central. |00001111-aaaa-2222-bbbb-3333cccc4444  |
|ExchangeOnlineAppScope |Use the Scope from the application you registered that authenticates Microsoft Entra ID users with Business Central. The value has the format: \<BC OnPrem app ID>\/\<scope\> |11112222-bbbb-3333-cccc-4444dddd5555/BusinessCentralOnPrem.Access |

Run the cmdlet for each setting using the following syntax:

```powershell
Set-NAVWebServerInstanceConfiguration -ServerInstance <BC server instance> -Tenant <tenant_ID> -KeyName <KeyName> -KeyValue <KeyValue> 
```

For example:

```powershell
Set-NAVWebServerInstanceConfiguration -ServerInstance BC252 -Tenant default -KeyName ExchangeOnlineAppId -KeyValue "00001111-aaaa-2222-bbbb-3333cccc4444" 
Set-NAVWebServerInstanceConfiguration -ServerInstance BC252 -Tenant default -KeyName ExchangeOnlineAppScope -KeyValue "11112222-bbbb-3333-cccc-4444dddd5555/BusinessCentralOnPrem.Access" 
```

Restart the web server instance when you're done.

```powershell
iireset
```

## <a name="centralized-deployment"></a>Centralized Deployment

Centralized Deployment is a feature in Microsoft 365 admin center and Exchange admin center that lets you automatically install add-ins in users' Office apps, like Outlook. It's the recommended way for admins to deploy for Office add-ins to users and groups within your organization. Learn more in [Centralized Deployment FAQ](/microsoft-365/admin/manage/centralized-deployment-faq).

Complete the following steps:

1. Verify that Centralized Deployment works for your organization.

   Learn more in [Determine if Centralized Deployment of add-ins works for your organization](/microsoft-365/admin/manage/centralized-deployment-of-add-ins).
1. In Business Central, choose the ![Lightbulb that opens the Tell Me feature.](../developer/media/search_small.png "Tell me what you want to do") icon, enter **Assisted Setup**, and then choose the related link.
1. Choose **Outlook Add-in Centralized Deployment** > **Next**.
1. In the **Deploy** column, select the check box for the add-ins that you want to deploy, then choose **Download and Continue**.

    A file named OutlookAddins.zip is downloaded to your device.
1. On the **Where do you want to deploy to?** page, set **Deploy Add-in to** to either **Microsoft 365** or **Exchange Server**, then choose **Next**.
1. At this point, you're finished with the work you need to do in Business Central, so you can choose **Done**.

   >[!TIP]
   > Before you choose **Next**, select the **Go to Microsoft 365 (opens in a new window)** or **Learn more about the add-in for Outlook in Exchange Server** link to open or get help on the admin center you'll use to complete the setup.
1. Go the folder where the OutlookAddins.zip file was downloaded, and extract the **Content Insights.xml** and **Document View.xml** files from the .zip to a folder of your choice.

    Learn more in [Zip and Unzip files and folders](https://support.microsoft.com/en-us/windows/zip-and-unzip-files-8d28fa72-f2f9-712f-67df-f80cf89fd4e5).

1. For Microsoft 365 deployment, sign in to the [Microsoft 365 admin center](https://go.microsoft.com/fwlink/?linkid=2163967). For Exchange Server deployment, sign in to Exchange admin center.<!--https://admin.microsoft.com/#/Settings/AddIns-->

1. Upload the add-in files as custom add-ins in the admin center you're working with:

   - For Microsoft 365 admin center, follow the steps at [Deploy add-ins in the admin center](/microsoft-365/admin/manage/manage-deployment-of-add-ins).
   - For Exchange admin center, follow the steps at [Install or remove add-ins for Outlook for your Exchange organization](/exchange/install-or-remove-outlook-add-ins-2013-help).
    <!--Go to the **Settings** > **Add-ins** page. If you don't see the **Add-in** Page, go to the **Settings** > **Integrated apps** > **Add-ins** page.-->

    This step assigns users and deploys the add-ins.

> [!IMPORTANT]
> An add-in can take up to 24 hours before users see the add-in in Outlook app.

After you finish, you can always change the deployment in admin center, like assigning more users.

## <a name="automated-individual-deployment"></a>Automated individual deployment

With this deployment option, users install the Business Central add-in for Outlook for themselves only. This deployment option uses a registered application in Microsoft Entra ID with Exchange web service permission, so users don't have to upload the add-ins manually in Outlook. When using the add-in, users don't have to sign in the Business Central because authentication against the Exchange or Microsoft 365 is done using an authentication token.

If you've prepared for deployment as described earlier, then as an admin, the only remaining task is to set up an application registration in Microsoft Entra ID. Then, users can start to install the add-in in Outlook.

### Register an application in Microsoft Entra ID

In the Azure portal, add an application registration for Business Central in your Microsoft Entra tenant. Give the registered app delegated permission to Exchange web service (EWS). After you've added the registered app in Microsoft Entra ID, set up Business Central to use it by using the **Set up your Microsoft Entra accounts** assisted setup.

Learn more in [Registering Business Central on-premises in Microsoft Entra ID](register-app-azure.md).

### Get the add-in (users)

After you complete the Business Central setup, users deploy the add-in by using **Get Outlook Add-in** assisted setup in Business Central. Learn more in [Install the Business Central Add-in for Outlook](/dynamics365/business-central/admin-outlook#onprem).

## <a name="manual-individual-deployment"></a>Manual individual deployment

With this deployment option, users install the Business Central add-in for Outlook for themselves only. Unlike the individual acquisition (automated) deployment option, users will have to download the add-in files from Business Central, then manually add them in Outlook. If you've prepared your deployment as described earlier, the only step remaining is for users to get the add-in.  

### Get the add-in (users)

After you complete the Business Central setup, users deploy the add-in by using **Get Outlook Add-in** assisted setup in Business Central. Learn more in [Install the Business Central Add-in for Outlook](/dynamics365/business-central/admin-outlook#onprem).

## Related information  

[Deploying Business Central](../deployment/deployment.md)  
[Using Business Central as your Business Inbox in Outlook](/dynamics365/business-central/admin-outlook?toc=/dynamics365/business-central/dev-itpro/toc.json)  
[Mount or Dismount a Tenant](mount-dismount-tenant.md)  
[Configuring Business Central Web Server to Accept Host Names for Tenants](configure-web-server-to-accept-host-names-for-tenants.md)  
[FAQ](/dynamics365/business-central/ui-outlook-addin-faq)  
