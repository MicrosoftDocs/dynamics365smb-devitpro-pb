---
title: User Authentication with Azure AD for Single Sign-on
description: Associate an existing Microsoft account with user account to achieve single sign-on between the Web client and Microsoft 365.
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Authenticating [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Users with Azure Active Directory

Microsoft Azure Active Directory \(Azure AD\) is a cloud service that provides identity and access capabilities for applications. The applications can be cloud-based, like on Microsoft Azure and  Microsoft 365, and installed on-premises, like [!INCLUDE[prod_short](../developer/includes/prod_short.md)].


The article describes the tasks involved in setting up Azure AD authentication for authenticating [!INCLUDE[prod_short](../developer/includes/prod_short.md)] users.

## Azure AD and [!INCLUDE[prod_short](../developer/includes/prod_short.md)]

With Azure AD authentication, you store user accounts and credentials in an Azure AD tenant. You then associate [!INCLUDE[prod_short](../developer/includes/prod_short.md)] user accounts with the Azure AD tenant user account. Once in place, users access [!INCLUDE[prod_short](../developer/includes/prod_short.md)] by using their Azure AD account.  

Azure AD authentication enables [!INCLUDE[prod_short](../developer/includes/prod_short.md)] to integrate with various applications and services, through a single sign-on experience. It's the required authentication method for some features offered by [!INCLUDE[prod_short](../developer/includes/prod_short.md)], such as:  

- Excel add-in
- Excel financial reports
- Outlook add-in
- Cover sheets for contact management
- Power BI reports and charts
- Power Automate Management
- Service-to-Service authentication with Automation APIs

## Preparation

- Obtain and set up security certificates on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] deployment

    Azure AD authentication requires the use of service certificates to help secure client connections over a wide area network (WAN). In a production environment, you should obtain a certificate from a certification authority or trusted provider. In a test environment, if you don't have a certificate, then you can create your own self-signed certificate. The implementation of certificates involves installation and configuration of the certificates on the [!INCLUDE[server](../developer/includes/server.md)] server and client computers.

    Follow the instructions for obtaining and installing the certificates [Using Certificates to Secure Connections](../deployment/implement-security-certificates-production-environment.md). However, for now, **don't** change the credential type used by [!INCLUDE[server](../developer/includes/server.md)] and [!INCLUDE[webserver](../developer/includes/webserver.md)] yet. You'll change it later in this article.

- Upcoming releases of some browsers, such as Google Chrome 80 and Microsoft Edge, will include changes to how cookies are handled.

    To ensure Azure AD authentication works with these browser versions, make sure that the Business Central platform has been upgraded to a recommended update. For more information, see [Preparing Dynamics NAV or Dynamics 365 Business Central for Upcoming Changes to Browser Cookie Policy](../administration/prepare-for-cookie-samesite-policy.md).

## Task 1: Create an Azure AD Tenant

To get started, you need an Azure AD tenant. The Azure AD tenant is where you manage user accounts and register apps, like [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

There are a couple ways to get an Azure AD tenant:

<!--    Then, if you add the email addresses for those user accounts to the user accounts in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].  -->

- Sign up a Microsoft 365 plan

    If you have a Microsoft 365 subscription that is based on a domain such as *solutions\.onmicrosoft\.com*, then you're already using Azure AD. The Microsoft 365 user accounts are based on Azure AD. So, there's nothing more to do in this task.

    If you want to sign up for a Microsoft 365 plan, you can use a plan such as Microsoft 365 Enterprise E1 as your test site, or sign up for a trial developer plan. A trial plan includes an administrative account that you'll use to access the Azure management portal. If your Microsoft 365 site is *solutions.onmicrosoft.com*, for example, your administrative account can be *admin\@solutions\.onmicrosoft\.com*. For more information, see [Select a Microsoft 365 plan for business](https://go.microsoft.com/fwlink/?LinkId=309050).

- Sign up for an Azure subscription that isn't associated with a Microsoft 365 subscription and create your own Azure AD tenant. For more information, see the next section.

### Create your own Azure AD tenants

If you have a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises deployment configured for multitenancy, you can choose to use the same Azure AD tenant for all [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenants or you can create a separate Azure AD tenant for each [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenant.

1. Sign up for an Azure subscription at [https://azure.microsoft.com](https://azure.microsoft.com).
2. Sign in to [Azure portal](https://portal.azure.com).
3. Create a directory by following the instructions at [How to get an Azure Active Directory tenant](/azure/active-directory/develop/active-directory-howto-tenant).

    This step will create an Azure AD tenant. When you create an Azure Active Directory in the Azure portal, you specify an initial domain name that identifies your Azure AD tenant, such as *solutions.onmicrosoft.com* or *cronusinternationltd.onmicrosoft.com*. You'll use the domain name when you add users to your Azure AD and when you configure the [!INCLUDE[server](../developer/includes/server.md)] instance. In the tasks that follow, this is referred to as the Azure AD Tenant ID. 

4. After you've created the Azure AD tenant, add users.

    For more information, see [Quickstart: Add new users to Azure Active Directory](/azure/active-directory/fundamentals/add-users-azure-active-directory). Later, you'll have to map the users in Azure AD to your users in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

### Set the access token lifetime

> [!IMPORTANT]  
> For security reasons, we recommend that you limit the lifetime of the access token to 10 minutes as described in this section.

Follow the steps outlined below.

1. Download the latest [Azure AD PowerShell Module Public Preview release](https://www.powershellgallery.com/packages/AzureADPreview/2.0.1.11).
2. Run the following command to sign in to your Azure AD admin account `Connect-AzureAD -Confirm`
3. Sign in as the tenant admin. 
4. Run the `Get-AzureADPolicy` command. 
5. For each `Id` that is the result of above command, run `    Remove-AzureADPolicy -Id {Guid}`. 
6. Set the token lifetime to 10 minutes by running the following command: `New-AzureADPolicy -Definition @('{"TokenLifetimePolicy":{"Version":1, "AccessTokenLifetime":"0.00:10:00"}}') -DisplayName "OrganizationDefaultPolicyScenario" -IsOrganizationDefault $true -Type "TokenLifetimePolicy"`.

For reference, see the prerequisites section in the following article: [Configurable token lifetimes in Azure Active Directory](/azure/active-directory/active-directory-configurable-token-lifetimes#prerequisites).

## Task 2: Register an application for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] in Azure AD Tenant  

In this task, you register your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] solution as an application in the Azure AD tenant.

> [!NOTE]
> If you're configuring a multitenant deployment, where each tenant will use a different Azure Tenant, you only register an application on one of the Azure AD tenants. Then, you'll make the application available to the other Azure AD tenants by making it a *Multitenant* application.

1. Sign in to [Azure portal](https://portal.azure.com) and open the Active Directory tenant.

2. To register the application, follow the guidelines at [Register your application with your Azure Active Directory tenant](/azure/active-directory/active-directory-app-registration).

    When you add an application to an Azure AD tenant, you specify the following information. The configuration is slightly different in for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] single-tenant and multitenant deployment.

    # [Single-tenant](#tab/singletenant)

    | Setting | Description |
    |--|--|
    |Name|Specifies the name of your application as it will display to your users, such as **Business Central App by My Solutions**.|
    |Supported account types|Specifies the accounts that you would like your application to support. You can choose either **Accounts in this organizational directory only (Single tenant)** or **Accounts in any organizational directory (Any Azure AD directory - Multitenant)**. Otherwise, select **Help me choose** link on the **Register an Application** page in the portal.|
    |Redirect URI|Specifies the type of application that you're registering and the redirect URI (or reply URL) for your application. Set the type to **Web**, and in the redirect URL box, enter URL for signing in to the [!INCLUDE[webclient](../developer/includes/webclient.md)], for example `https://localhost:443/BC170/SignIn`.<br /><br />The URI has the format `https://<domain or computer name>/<webserver-instance>/SignIn`, such as `https://cronusinternationltd.onmicrosoft.com/BC170/SignIn` or `https://MyBcWebServer/BC170/Signin`. <br /> <br />**Important** The portion of the reply URL after the domain name (in this case `BC170/SignIn`) is case-sensitive, so make sure that the web server instance name matches the case of the web server instance name as it is defined on IIS for your [!INCLUDE[webserver](../developer/includes/webserver.md)] installation.|

    # [Multitenant-tenant](#tab/multitenant)
    
    | Setting | Description |
    |--|--|
    |Name|Specifies the name of your application as it will display to your users, such as **Business Central App by My Solutions**.|
    |Supported account types|Specifies the accounts that you would like your application to support. If you're going to use different Azure AD tenants for different [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenants, then select **Accounts in any organizational directory (Any Azure AD directory - Multitenant)**. Otherwise, you can choose **Accounts in this organizational directory only (Single tenant)**.|
    |Redirect URI|Specifies the type of application that you're registering and the redirect URI (or reply URL) for your application. Set the type to **Web**, and in the redirect URL box, enter URL for signing in to the [!INCLUDE[webclient](../developer/includes/webclient.md)], for example `https://localhost:443/BC170/SignIn`.<br /><br />The URI has the format `https://<domain or computer name>/<webserver-instance>/SignIn`, such as `https://cronusinternationltd.onmicrosoft.com/BC170/SignIn` or `https://MyBcWebServer/BC170/Signin`.<br /> <br />**Important** The portion of the reply URL after the domain name (in this case `BC170/SignIn`) is case-sensitive, so make sure that the web server instance name matches the case of the web server instance name as it is defined on IIS for your [!INCLUDE[webserver](../developer/includes/webserver.md)] installation.|

    ---

3. After you register the application, set the Application ID URI for the application:

    1. From the **Overview** page for your app registration, next to the **Application ID URI** label, select **Add an Application ID URI**.
    2. On the **Expose API** page, next to the **Application ID URI**, select **Set**.
    3. The **Application ID URI** box displays the default application ID URI.
    
        It has the format `api://<guid>`, such as `api://70b20a51-46b7-4290-8686-b79ec90379f6`. You can keep this value or change it. The application ID URI must be a valid URI starting with HTTPS, API, URN, MS-APPX. It must not end in a slash. To use an HTTPS URI, for example `https://cronusinternationltd.onmicrosoft.com/businesscentral`, it must be a verified domain.

    4. Select **Save** when done.

4. (SharePoint app only) Make [!INCLUDE[prod_short](../developer/includes/prod_short.md)] available to Azure AD Tenants

    In the overview page for the application, the **URL for Granting Access** field contains a URL that you can send to users in other Azure AD tenants. Then, when they choose the link, a page displays where they must agree to trust the application. If they accept, the app is added to their SharePoint site.  

5. The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] solution is now registered in your Azure AD tenant. To complete the steps that follow, you'll need the tenant's domain (**Directory (tenant) ID**), **Redirect URI**, and **Application ID URI**.

    You can view the settings in the Azure portal by selecting **Overview** for the registered application. So, make a note of or copy the values for these settings for later use.

> [!NOTE]
> The guidelines for the Azure Portal in this article might not reflect the current user interface of the Azure Portal. Please refer to the Azure Portal documentation for the latest instructions.

## <a name="task3"></a>Task 3: Associate Azure AD Users with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Users
  
Each user in your Azure AD tenant that will access [!INCLUDE[prod_short](../developer/includes/prod_short.md)] must be set up with an account in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

You can postpone this task for most users and do it after you complete Azure AD setup. But you must do this task now for your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] user account. If you don't, you won't be able to sign in to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] after you switch to Azure AD.

To associate a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] user account with Azure AD, you'll set the user principal name of the user in Azure AD, like *chris@contoso.com*, as the user's authentication email in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. When you combine this setting with the relevant configuration of the [!INCLUDE[server](../developer/includes/server.md)] instance, users achieve single sign-on when they access [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)].

This task can be done from the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Web client or using the [!INCLUDE[adminshell](../developer/includes/adminshell.md)].

# [Business Central Web client](#tab/admintool)

1. Start the [!INCLUDE[prod_short](../developer/includes/prod_short.md)], and open the **Users** page.
2. Open the user that you want to modify.
3. Under **Microsoft 365 (Authentication)**, set the **Authentication Email** to the user principle name  in Azure AD.

# [Administration Shell](#tab/adminshell)

1. Run [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator.

2. Run the [Set-NAVServerUser cmdlet](/powershell/module/microsoft.dynamics.nav.management/set-navserveruser) to set the authentication email. For example:

    ```powershell
    Set-NAVServerUser -WindowsAccount yourdomain\username -AuthenticationEmail "AzureAD_principal_name"
    ```
---

For more information about setting up users in [!INCLUDE[prod_short](../developer/includes/prod_short.md)], see [Create Users According to Licenses](/dynamics365/business-central/ui-how-users-permissions).

> [!IMPORTANT]  
> Single sign-on means that users are still signed in to Azure AD when they sign out from [!INCLUDE[prod_short](../developer/includes/prod_short.md)], unless they close all browser windows. However, if a user selected the **Keep me signed in** field when they signed in, they are still signed in when they close the browser window. To fully sign out from Azure AD, the user must sign out from each application that uses Azure AD, including [!INCLUDE[prod_short](../developer/includes/prod_short.md)] and SharePoint.  
>
> We recommend that you provide guidance to your users for signing out of their account when they're done, so that you can keep your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] deployment more secure.  

## Task 4: Configure [!INCLUDE[server](../developer/includes/server.md)]

Once you have the Azure AD tenant and a registered application for [!INCLUDE[prod_short](../developer/includes/prod_short.md)], you configure the [!INCLUDE[server](../developer/includes/server.md)] instance for Azure AD authentication.

You can configure the [!INCLUDE[server](../developer/includes/server.md)] by using the [!INCLUDE[admintool](../developer/includes/admintool.md)] or [!INCLUDE[adminshell](../developer/includes/adminshell.md)].

# [Administration Tool](#tab/admintool)

1. Open the [!INCLUDE[admintool](../developer/includes/admintool.md)].

2. In the **General** tab, set the **Credential Type** to **AccessControlService**.

3. Configure the Azure Active Directory settings.

    This step is different for a single-tenant and multitenant [!INCLUDE[server](../developer/includes/server.md)] deployments. The settings you set in this step are under the **Azure Active Directory** tab.

    # [Single-tenant](#tab/singletenant)

    1. Set the **WS-Federation Login Endpoint** parameter.

        The WS-federation login endpoint is the URL of the sign-on page that [!INCLUDE[prod_short](../developer/includes/prod_short.md)] redirects to when users sign in from a client. Specify a URL in the following format:

        ```
        https://login.microsoftonline.com/<AAD TENANT ID>/wsfed?wa=wsignin1.0%26wtrealm=<Application ID URI>%26wreply=<Redirect URL>
        ```

        |Parameter|Description|
        |-|-|-|
        |`<AAD TENANT ID>`|The ID of the Azure AD tenant ID or its domain, like `11111111-aaaa-2222-bbbb-333333333333` or `CRONUSInternationLtd.onmicrosoft.com`.|
        |`<Application ID URI>`|The ID that was assigned to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application when it was registered in Azure AD, for example `api://44444444-cccc-5555-dddd-666666666666` or `https://cronusinternationltd.onmicrosoft.com/businesscentral`.|
        |`<Redirect URL>`|The redirect URL that was assigned to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application when it was registered in the Azure AD tenant. This parameter must point to the SignIn page of the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)]. Make sure it exactly matches the **Redirect URL** that was configured on the application in Azure AD.|

       > [!IMPORTANT]
       > The string parameter must be URI-encoded. This means, for example, use "%26" instead of "&".

        **Example**

        ```
        https://login.microsoftonline.com/cronusinternationltd.onmicrosoft.com/wsfed?wa=wsignin1.0%26wtrealm=https://cronusinternationltd.onmicrosoft.com/businesscentral%26wreply=https://cronusinternationltd.onmicrosoft.com/BC170/SignIn
        ```

    2. Set the **WS-Federation Metadata Location** parameter.

        The WS-federation metadata location establishes a trust relationship between [!INCLUDE[prod_short](../developer/includes/prod_short.md)] and Azure AD. The parameter value has the following format:

        ```
        https://login.microsoftonline.com/<AAD TENANT ID>/FederationMetadata/2007-06/FederationMetadata.xml
        ```

        |Parameter|Description|
        |-|-|-|
        |`<AAD TENANT ID>`|The ID of the Azure AD tenant ID or its domain, for example, `11111111-aaaa-2222-bbbb-333333333333` or `CRONUSInternationLtd.onmicrosoft.com`. The value is the same as what you used in the WS-federation login endpoint in the previous step.|

        **Example**

        ```
        https://login.microsoftonline.com/cronusinternationltd.onmicrosoft.com/FederationMetadata/2007-06/FederationMetadata.xml
        ```  

    # [Multitenant-tenant](#tab/multitenant)

    1. Set the **WS-Federation Login Endpoint** parameter.

        The WS-federation login endpoint is the URL of the sign-on page that [!INCLUDE[prod_short](../developer/includes/prod_short.md)] redirects to when users sign in from a client. Specify a URL in the following format:

        ```
        https://login.microsoftonline.com/<AADTENANTID>/wsfed?wa=wsignin1.0%26wtrealm=<Application ID URI>%26wreply=<Redirect URL>
        ```

        |Parameter|Description|
        |-|-|-|
        |`<AADTENANTID>`|Set this parameter to one of the following values:<ul><li>`{AADTENANTID}`- Use this value if each [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenant you'll mount will use its own Azure AD tenant that has a service principal. The [!INCLUDE[server](../developer/includes/server.md)] instance will automatically replace `{AADTENANTID}` with the correct Azure AD tenant. You'll specify the Azure AD Tenant ID when you mount the tenant.</li><li>`common`- Use this value if the corresponding [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application in Azure AD configured as a multitenant application, but tenants will use the same Azure AD tenant. </li></ul>|
        |`<Application ID URI>`|The ID that was assigned to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application when it was registered in Azure AD, for example `api://44444444-cccc-5555-dddd-666666666666` or `https://cronusinternationltd.onmicrosoft.com/businesscentral`.|
        |`<Redirect URL>`|The redirect URL that was assigned to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application when it was registered in the Azure AD tenant. This parameter must point to the SignIn page of the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)]. Make sure it exactly matches the **Redirect URL** that was configured on the application in Azure AD.<br /><br />`https://cronusinternationltd.onmicrosoft.com/BC170/SignIn`<br /><br />The `wreply` parameter is optional. The `wreply` query parameter tells the Azure AD authentication service where to send the authentication token. If you don't specify the `wreply` parameter, it will be deducted from the URL in the browser.|

       > [!IMPORTANT]
       > The string parameter must be URI-encoded. This means, for example, use "%26" instead of "&".

       **Example**

        Using multiple Azure AD tenants:

        ```
        https://login.microsoftonline.com/{AADTENANTID}/wsfed?wa=wsignin1.0%26wtrealm=https://cronusinternationltd.onmicrosoft.com/businesscentral%26wreply=https://cronusinternationltd.onmicrosoft.com/BC170/SignIn
        ```

        Using a single Azure AD tenant:
 
        ```
        https://login.microsoftonline.com/common/wsfed?wa=wsignin1.0%26wtrealm=https://cronusinternationltd.onmicrosoft.com/businesscentral%26wreply=https://cronusinternationltd.onmicrosoft.com/BC170/SignIn
        ```

    2. Set the **WS-Federation Metadata Location** parameter.

        The WS-federation metadata location establishes a trust relationship between [!INCLUDE[prod_short](../developer/includes/prod_short.md)] and Azure AD. The parameter value has the following format:

        ```
        https://login.microsoftonline.com/<AADTENANTID>/FederationMetadata/2007-06/FederationMetadata.xml
        ```

        |Parameter|Description|
        |-|-|-|
        |`<AADTENANTID>`|Set this parameter to one of the following values:<ul><li>`{AADTENANTID}`- Use this value if each [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenant corresponds to an Azure AD tenant that has a service principal. The [!INCLUDE[server](../developer/includes/server.md)] instance will automatically replace `{AADTENANTID}` with the correct Azure AD tenant. The Azure AD Tenant ID is specified when you mount the tenant. ID parameter that is specified when mounting a tenant replaces the placeholder.</li><li>`common`- Use this value if the corresponding [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application in Azure AD configured as a multitenant application, but tenants will use the same Azure AD tenant. </li></ul>|

    <!--3. Mount your tenants.

        Use the **Tenants** node in the tool to mount the tenants.

        - If you'll be using the same Azure AD tenant for all [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenants, you can leave **Azure AD Tenant ID** blank.
        - If you'll be using different Azure AD tenants, set the **Azure AD Tenant ID** to the ID or domain name of the Azure AD tenant that you want to use for the tenant. For example, **11111111-aaaa-2222-bbbb-333333333333** or **CRONUSInternationLtd.onmicrosoft.com**.
        - Also, if you've set up different host names that you want to use accessing the tenant, set the **Alternate ID**.

        For more information about mounting tenants, see [Mount or Dismount a Tenant on a Business Central Server Instance](mount-dismount-tenant.md).-->
    ---

4. To configure SOAP and OData web services for Azure AD authentication, specify the App ID URI that is registered for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] in the Azure AD.

    On the **Azure Active Directory** tab, set the **Azure AD App URI**. The App ID URI is typically the same as the *wtrealm* parameter value of the **WS-Federation Endpoint** setting.

5. Increase the `ExtendedSecurityTokenLifetime` parameter value.

    This parameter defines the interval of time that a client session can remain inactive before the session is dropped. If the value is too low, users may experience the error **Connection is not longer available or was lost**. The event log will include the error **The SAML2 token is not valid because its validity period has ended.** for the server instance. Increasing this value will resolve this issue. We recommend that you set it to a value greater than 8 hours.

6. Disable token-signing certificate validation by selecting the **Disable Token-Signing Certificate Validation** check box.

7. Restart the server instance.

# [Administration Shell](#tab/adminshell)

1. Run [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator.
 
    To configure the server instance in the next steps, you'll use the [Set-NAVServerConfiguration cmdlet](/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration).

2. Set the `ClientServicesCredentialType` to `AccessControlService`.

   ```powershell
   Set-NAVServerConfiguration -ServerInstance <BC server instance name>  -KeyName ClientServicesCredentialType -KeyValue AccessControlService
   ```

3. Configure the Azure Active Directory settings.

    This step is different for a single-tenant and multitenant [!INCLUDE[server](../developer/includes/server.md)] deployments.

    # [Single-tenant](#tab/singletenant)

    1. Set the `WSFederationLoginEndpoint` parameter.

        The WS-federation login endpoint is the URL of the sign-on page that [!INCLUDE[prod_short](../developer/includes/prod_short.md)] redirects to when users sign in from a client. The value has the following format:

        ```powershell
        Set-NAVServerConfiguration -ServerInstance <BC server instance name>  -KeyName WSFederationLoginEndpoint -KeyValue "https://login.microsoftonline.com/<AAD TENANT ID>/wsfed?wa=wsignin1.0%26wtrealm=<Application ID URI>%26wreply=<Redirect URL>"
        ```

        |Parameter|Description|
        |-|-|-|
        |`<AAD TENANT ID>`|The ID of the Azure AD tenant ID or its domain, for example `11111111-aaaa-2222-bbbb-333333333333` or `CRONUSInternationLtd.onmicrosoft.com`.|
        |`<Application ID URI>`|The ID that was assigned to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application when it was registered in Azure AD, for example `api://44444444-cccc-5555-dddd-666666666666` or `https://cronusinternationltd.onmicrosoft.com/businesscentral`.|
        |`<Redirect URL>`|The redirect URL that was assigned to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application when it was registered in the Azure AD tenant. This parameter must point to the SignIn page of the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)]. Make sure it exactly matches the **Redirect URL** that was configured on the application in Azure AD.|

       > [!IMPORTANT]
       > The string parameter must be URI-encoded. This means, for example, use "%26" instead of "&". Also, place key values in double-quotes (`" "`).

        **Example**

        ```powershell
        Set-NAVServerConfiguration -ServerInstance BC170 -KeyName `WSFederationLoginEndpoint -KeyValue "https://login.microsoftonline.com/cronusinternationltd.onmicrosoft.com/wsfed?wa=wsignin1.0%26wtrealm=https://cronusinternationltd.onmicrosoft.com/businesscentral%26wreply=https://cronusinternationltd.onmicrosoft.com/BC170/SignIn"
        ```

    2. Set the `ClientServicesFederationMetadataLocation` parameter.

        The value has the following format:

        ```powershell
        Set-NAVServerConfiguration -ServerInstance <BC server instance name>  -KeyName ClientServicesFederationMetadataLocation -KeyValue "https://login.microsoftonline.com/<AAD TENANT ID>/FederationMetadata/2007-06/FederationMetadata.xml"
        ```

        |Parameter|Description|
        |-|-|-|
        |`<AAD TENANT ID>`|The ID of the Azure AD tenant ID or its domain, for example, `11111111-aaaa-2222-bbbb-333333333333` or `CRONUSInternationLtd.onmicrosoft.com`. The value is the same as what you used in the WS-federation login endpoint in the previous step.|

        **Example**

        ```powershell
        Set-NAVServerConfiguration -ServerInstance BC170 -KeyName ClientServicesFederationMetadataLocation -KeyValue "https://login.microsoftonline.com/cronusinternationltd.onmicrosoft.com/FederationMetadata/2007-06/FederationMetadata.xml"
        ```  

    # [Multitenant-tenant](#tab/multitenant)

    1. Set the `WSFederationLoginEndpoint` parameter.

        The WS-federation login endpoint is the URL of the sign-on page that [!INCLUDE[prod_short](../developer/includes/prod_short.md)] redirects to when users sign in from a client. The value has the following format:

        ```powershell
        Set-NAVServerConfiguration -ServerInstance <BC server instance name>  -KeyName WSFederationLoginEndpoint -KeyValue "https://login.microsoftonline.com/<AADTENANTID>/wsfed?wa=wsignin1.0%26wtrealm=<Application ID URI>%26wreply=<Redirect URL>"
        ```

        |Parameter|Description|
        |-|-|-|
        |`<AADTENANTID>`|Set this parameter to one of the following values:<ul><li>`{AADTENANTID}`- Use this value if each [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenant you'll mount will use its own Azure AD tenant that has a service principal. The [!INCLUDE[server](../developer/includes/server.md)] instance will automatically replace `{AADTENANTID}` with the correct Azure AD tenant. You'll specify the Azure AD Tenant ID when you mount the tenant.</li><li>`common`- Use this value if the corresponding [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application in Azure AD configured as a multitenant application, but tenants will use the same Azure AD tenant. </li></ul>|
        |`<Application ID URI>`|The ID that was assigned to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application when it was registered in Azure AD, for example `api://70b20a51-46b7-4290-8686-b79ec90379f6` or `https://cronusinternationltd.onmicrosoft.com/businesscentral`.|
        |`<Redirect URL>`|The redirect URL that was assigned to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application when it was registered in the Azure AD tenant. This parameter must point to the SignIn page of the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)]. Make sure it exactly matches the **Redirect URL** that was configured on the application in Azure AD.<br /><br />`https://cronusinternationltd.onmicrosoft.com/BC170/SignIn`<br /><br />The `wreply` parameter is optional. The `wreply` query parameter tells the Azure AD authentication service where to send the authentication token. If you don't specify the `wreply` parameter, it will be deducted from the URL in the browser.|

       > [!IMPORTANT]
       > The string parameter must be URI-encoded. This means, for example, use "%26" instead of "&". Also, place key values in double-quotes (`" "`).

       **Example**

        ```powershell
        Set-NAVServerConfiguration -ServerInstance BC170 -KeyName WSFederationLoginEndpoint -KeyValue "https://login.microsoftonline.com/{AADTENANTID}/wsfed?wa=wsignin1.0%26wtrealm=https://cronusinternationltd.onmicrosoft.com/businesscentral%26wreply=https://cronusinternationltd.onmicrosoft.com/BC170/SignIn"
        ```

        or

        ```powershell
        Set-NAVServerConfiguration -ServerInstance BC170 -KeyName WSFederationLoginEndpoint -KeyValue "https://login.microsoftonline.com/common/wsfed?wa=wsignin1.0%26wtrealm=https://cronusinternationltd.onmicrosoft.com/businesscentral%26wreply=https://cronusinternationltd.onmicrosoft.com/BC170/SignIn"
        ```

    2. Set the `ClientServicesFederationMetadataLocation` parameter.

        The value has the following format:

        ```powershell
        Set-NAVServerConfiguration -ServerInstance <BC server instance name>  -KeyName ClientServicesFederationMetadataLocation -KeyValue "https://login.microsoftonline.com/<AADTENANTID>/FederationMetadata/2007-06/FederationMetadata.xml"
        ```

        |Parameter|Description|
        |-|-|-|
        |`<AADTENANTID>`|Set this parameter to one of the following values:<ul><li>`{AADTENANTID}`- Use this value if each [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenant corresponds to an Azure AD tenant that has a service principal. The [!INCLUDE[server](../developer/includes/server.md)] instance will automatically replace `{AADTENANTID}` with the correct Azure AD tenant. The Azure AD Tenant ID is specified when you mount the tenant. ID parameter that is specified when mounting a tenant replaces the placeholder.</li><li>`common`- Use this value if the corresponding [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application in Azure AD configured as a multitenant application, but tenants will use the same Azure AD tenant.</li></ul>|

    <!--3. Mount your tenants by using the [Mount-NAVTenant cmdlet](/powershell/module/microsoft.dynamics.nav.management/mount-navtenant). 

        - If you'll be using the same Azure AD tenant for all [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenants, you can omit the `-AadTenantId` parameter.
        - If you'll be using different Azure AD tenants, set the `-AadTenantId` parameter to the ID or domain name of the Azure AD tenant that you want to use for the tenant.
        - Also, if you've set up different host names that you want to use accessing the tenant, use the `-AlternateId` parameter.

        For example:

          ```powershell
          Mount-NAVTenant -ServerInstance BC170  -Tenant Tenant1 –DatabaseServer ..\BCDEMO -DatabaseName "BC Demo Database" -AadTenantId 1111-aaaa-2222-bbbb-333333333333 -AlternateId "https://tenant1.cronusinternational.com"
          ```

        For more information about mounting tenants, see [Mount or Dismount a Tenant on a Business Central Server Instance](mount-dismount-tenant.md).-->

    ---

4. Disable token-signing certificate validation by setting `DisableTokenSigningCertificateValidation` to `true`.

    ```powershell
    Set-NAVServerConfiguration -ServerInstance <BC server instance name>  -KeyName DisableTokenSigningCertificateValidation -KeyValue true
    ```

5. To configure SOAP and OData web services for Azure AD authentication, specify the App ID URI that is registered for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] in the Azure AD.

    ```powershell
    Set-NAVServerConfiguration -ServerInstance <BC server instance name>  -KeyName AppIdUri -KeyValue "<Application ID URI>"
    ```

    The value is typically the same as the *wtrealm* parameter value of the WSFederationLoginEndpoint parameter. 

    **Example**

    ```powershell
    Set-NAVServerConfiguration -ServerInstance BC170  -KeyName AppIdUri -KeyValue "https://cronusinternationltd.onmicrosoft.com"
    ```

6. Increase the `ExtendedSecurityTokenLifetime` parameter value.

   This parameter defines the interval of time that a client session can remain inactive before the session is dropped. If the value is too low, users may experience the error: **Connection is not longer available or was lost**. The event log will include the error: **The SAML2 token is not valid because its validity period has ended.** for the server instance. Increasing this value will resolve this issue. We recommend that you set it to a value greater than 8 hours.

    ```powershell
    Set-NAVServerConfiguration -ServerInstance <BC server instance name>  -KeyName ExtendedSecurityTokenLifetime -KeyValue "<hours>"
    ```

    **Example**

    ```powershell
    Set-NAVServerConfiguration -ServerInstance BC170  -KeyName ExtendedSecurityTokenLifetime -KeyValue "20"
    ```
7. Restart the server instance. For example:

    ```powershell
    Restart-NAVServerInstance -ServerInstance BC170
    ```

---

## Task 5: Configure [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)]

Configure the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)] to use `AccessControlService` as the credential type. 

1. Open the navsettings.json for the [!INCLUDE[webserver](../developer/includes/webserver.md)] in any text or code editor, such as Notepad or Visual Studio Code.

2. Set the `ClientServicesCredentialType` key value to `AccessControlService`.

    ```
    "ClientServicesCredentialType":  "AccessControlService",
    ```

3. Save the navsettings.json file

For more information, see [Configure Configuring [!INCLUDE[webserver](../developer/includes/webserver.md)] Instances](configure-web-server.md) and [Configure Authentication](users-credential-types.md).

## Task 6: Configure [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)]

[!INCLUDE[2019_releasewave2_deprecated](../includes/2019_releasewave2_deprecated.md)] 

Configure the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] to use `AccessControlService` as the credential type to support Azure AD. Also, configure the `ACSUri` setting for Azure AD authentication must be set. The value must be that same as the **WS-Federation Login Endpoint** setting of the [!INCLUDE[server](../developer/includes/server.md)] instances, except for the `<App REPLY URL>` parameter. The `ACSUri` setting has the following format:

```
https://login.microsoftonline.com/<AAD TENANT ID>/wsfed?wa=wsignin1.0%26wtrealm=<Application ID URI>%26wreply=<Redirect URL>
```

The `<Redirect URL>` parameter in the URL must be equal to the sign-in page for the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)], such as  `https://dynamicsnavwinclient`.  

For example:

```
<add key="ACSUri" value="https://login.microsoftonline.com/cronusinternationltd.onmicrosoft.com/wsfed?wa=wsignin1.0%26wtrealm=https://cronusinternationltd.onmicrosoft.com/businesscentral%26wreply=https://dynamicsnavwinclient" />
```

You configure the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] by modifying the ClientUserSettings.config file. <!-- For more information, see [Configuring the Dynamics NAV Windows Client](configuring-the-windows-client.md#afterset).-->

## Task 7: Mount tenants (multitenant only)

If you have a multitenant [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment, mount the tenant databases on the [!INCLUDE[server](../developer/includes/server.md)].

Use either the [!INCLUDE[admintool](../developer/includes/admintool.md)] or [!INCLUDE[adminshell](../developer/includes/adminshell.md)]. For more information about mounting tenants, see [Mount or Dismount a Tenant on a Business Central Server Instance](mount-dismount-tenant.md).

# [Administration Tool](#tab/admintool)

In the navigation pane, use the **Tenants** node  to mount the tenants.

- If you'll be using the same Azure AD tenant for all [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenants, you can leave **Azure AD Tenant ID** blank.
- If you'll be using different Azure AD tenants, set the **Azure AD Tenant ID** to the ID or domain name of the Azure AD tenant that you want to use for the tenant. For example, **11111111-aaaa-2222-bbbb-333333333333** or **CRONUSInternationLtd.onmicrosoft.com**.
- Also, if you've set up different host names that you want to use accessing the tenant, set the **Alternate ID**. See [Using alternate tenant IDs](#altid).

# [Administration Shell](#tab/adminshell)

Mount your tenants by using the [Mount-NAVTenant cmdlet](/powershell/module/microsoft.dynamics.nav.management/mount-navtenant).

- If you'll be using the same Azure AD tenant for all [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenants, you can omit the `-AadTenantId` parameter.
- If you'll be using different Azure AD tenants, set the `-AadTenantId` parameter to the ID or domain name of the Azure AD tenant that you want to use for the tenant.
- Also, if you've set up different host names that you want to use accessing the tenant, use the `-AlternateId` parameter. See [Using alternate tenant IDs](#altid).

For example:

```powershell
Mount-NAVTenant -ServerInstance BC170  -Tenant Tenant1 –DatabaseServer ..\BCDEMO -DatabaseName "BC Demo Database" -AadTenantId 1111-aaaa-2222-bbbb-333333333333
```

<!--```powershell
Mount-NAVTenant -ServerInstance BC170  -Tenant Tenant1 –DatabaseServer ..\BCDEMO -DatabaseName "BC Demo Database" -AadTenantId 1111-aaaa-2222-bbbb-333333333333 -AlternateId "https://tenant1.cronusinternational.com"
```-->
---

## Task 8: Set up other users and web service accounts
  
### User accounts

Set up remaining [!INCLUDE[prod_short](../developer/includes/prod_short.md)] user accounts, which you didn't cover in [Task 3](#task3), with Azure AD authentication email accounts.

### Web service accounts

With Azure AD authentication, [!INCLUDE[prod_short](../developer/includes/prod_short.md)]  supports two different methods for authenticating users trying to access data through OData and SOAP web services: web service access keys (or Basic authentication) and OAuth.

With Basic authentication, the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] user account must have web service access key. To sign in, instead using their Azure AD password, users provide the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] the web service access key. For information about setting up web service access keys, see [How to use an Access Key for SOAP and OData Web Service Authentication](../webservices/web-services-authentication.md#accesskey).

With OAuth, users are authenticated based on their Azure AD credentials, providing a more direct and single sign-on experience. For more information, see [Using OAuth to Authorize Business Central Web Services (OData and SOAP)](../webservices/authenticate-web-services-using-oauth.md).

## Additional tips

### Using host names for tenants

You can configure host name tenant resolution, where each tenant is assigned a unique domain, like customer1.cronusinternational.com. Customers would then access their tenant by using `https://customer1.cronusinternational.com/BC170`.

This setup implies that the public URL is different for each tenant. To support this scenario, you set [!INCLUDE[server](../developer/includes/server.md)] to calculate the host dynamically. In the `WSFederationLoginEndpoint` parameter, use the `{HOSTNAME}` placeholder in the `wreply`, for example:

```http
https://login.microsoftonline.com/<AAD TENANT ID>/wsfed?wa=wsignin1.0%26wtrealm=<APP ID URI>%26wreply=https://{HOSTNAME}/BC170/SignIn

```

### <a name="altid"></a>Using alternate tenant IDs

When you mount a tenant, you can give the tenant an additional ID by setting the `-AlternateId` parameter. Users can then access the tenant using this ID as a well as the original. The alternate ID is useful if you have different host names for tenants. In this case, you have to set up URL rewriting in the web.config file for the [!INCLUDE[webserver](../developer/includes/webserver.md)]. For more information, see [Configuring [!INCLUDE[webserver](../developer/includes/webserver.md)] to Accept Host Names for Tenants](configure-web-server-to-accept-host-names-for-tenants.md).


## See Also  

[Authentication and Credential Types](Users-Credential-Types.md)  
[Troubleshooting: SAML2 token errors with Azure Active Directory/Office 365 Authentication](troubleshooting-SAML2-token-not-valid-because-validity-period-ended.md)  
[Migrating to Multitenancy](../deployment/migrating-to-multitenancy.md)