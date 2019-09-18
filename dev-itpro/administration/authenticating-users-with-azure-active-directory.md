---
title: User Authentication with Azure AD for Single Sign-on
description: Associate an existing Microsoft account with user account to achieve single sign-on between the Web client and Office 365.
ms.custom: na
ms.date: 04/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Authenticating [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Users with Azure Active Directory
Azure Active Directory \(Azure AD\) is a cloud service that provides identity and access capabilities, such as for applications on Microsoft Azure, Microsoft Office 365, and for applications that install on-premises. If the [!INCLUDE[server](../developer/includes/server.md)] instance is configured to use the AccessControlService credential type, you can associate the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] user accounts with Azure AD accounts (or Office 365 account) that users use to access the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)], [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)], Office 365, and SharePoint.  

 For example, your users access a website, such as a SharePoint site. From there, they have single sign-on access to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] because you have configured [!INCLUDE[prodshort](../developer/includes/prodshort.md)] for Azure AD.  

## Azure AD and [!INCLUDE[prodshort](../developer/includes/prodshort.md)]  
 You can use the Azure AD service to associate your existing Microsoft account with your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] user account and achieve single sign-on between the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] and Office 365. Also, if you use [!INCLUDE[prodshort](../developer/includes/prodshort.md)] in an app for SharePoint, you can use Azure AD to achieve single sign-on between the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] and SharePoint. You can still host the [!INCLUDE[server](../developer/includes/server.md)] instance and [!INCLUDE[webserver](../developer/includes/webserver.md)] on-premises. You do not have to deploy [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on Azure to use Azure AD for user authentication.

 The following sections describe the tasks involved in setting up Azure AD authentication for authenticating [!INCLUDE[prodshort](../developer/includes/prodshort.md)] users.

## Preparation

Azure AD authentication requires the use of service certificates to help secure client connections over a wide area network (WAN). In a production environment, you should obtain a certificate from a certification authority or trusted provider. In a test environment, if you do not have a certificate, then you can create your own self-signed certificate. The implementation of certificates involves installation and configuration of the certificates on the [!INCLUDE[server](../developer/includes/server.md)] server and client computers.

For more information, see [Using Certificates to Secure Connections](../deployment/implement-security-certificates-production-environment.md).

## Task 1: Create an Azure AD Tenant
  
If you have an Office 365 subscription that is based on a domain such as *solutions.onmicrosoft.com*, you are already using Azure AD because the Office 365 user accounts are based on Azure AD. Then, if you add the email addresses for those user accounts to the user accounts in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], the users experience seamless integration between your SharePoint site and the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)].  

If you want to sign up for an Office 365 plan, you can use a plan such as Office 365 Enterprise E1 as your test site, or sign up for a trial developer plan. A trial plan includes an administrative account which you will use to access the Azure management portal. For example, if your Office 365 site is *Solutions.onmicrosoft.com*, your administrative account can be *admin@solutions.onmicrosoft.com*. For more information, see [Select an Office 365 plan for business](http://go.microsoft.com/fwlink/?LinkId=309050).  

Alternatively, you can sign up for an Azure subscription that is not associated with an Office 365 subscription. You can sign up in the Azure portal at [http://portal.azure.com](http://portal.azure.com). Then, you can configure an Azure Active Directory, which creates an Azure AD tenant. For more information, see [How to get an Azure Active Directory tenant](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-howto-tenant).
 
 <!-- For more information, see [Administering your Azure AD tenant](http://go.microsoft.com/fwlink/?LinkId=317423).-->  

 When you create an Azure Active Directory in the Azure portal, you must specify a domain name that identifies your Azure AD tenant, such as *solutions.onmicrosoft.com* or *cronusinternationltd.onmicrosoft.com*. You will use the domain name when you add users to your Azure AD and when you configure the [!INCLUDE[server](../developer/includes/server.md)] instance.  

 When you have created the Azure AD tenant, you must add users. For more information, see [Quickstart: Add new users to Azure Active Directory](http://go.microsoft.com/fwlink/?LinkId=317435). 

> [!IMPORTANT]  
> For security reasons, we recommend that you limit the lifetime of the access token to 10 minutes. To do this, follow the steps in the [To set the access token lifetime](#to-set-the-access-token-lifetime) section below.

### To set the access token lifetime
As a reference, see the prerequisites section in the following topic: [Configurable token lifetimes in Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/active-directory-configurable-token-lifetimes#prerequisites). Follow the steps outlined below.

1. Download the latest [Azure AD PowerShell Module Public Preview release](https://www.powershellgallery.com/packages/AzureADPreview/2.0.1.11).
2. Run the following command to sign in to your Azure AD admin account `Connect-AzureAD -Confirm`
3. Login as the tenant admin. 
4. Run the `Get-AzureADPolicy` command. 
5. For each `Id` which is the result of above command, run `    Remove-AzureADPolicy -Id {Guid}`. 
6. Set the token lifetime to 10 minutes by running the following command: `New-AzureADPolicy -Definition @('{"TokenLifetimePolicy":{"Version":1, "AccessTokenLifetime":"0.00:10:00"}}') -DisplayName "OrganizationDefaultPolicyScenario" -IsOrganizationDefault $true -Type "TokenLifetimePolicy"`.


## Task 2: Add an Application for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] to the Azure AD Tenant  

You must register your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] solution as an application in Azure AD tenant. Then, you can choose to make it available to other Azure AD tenants.  

You register an application by using the [Azure portal](http://portal.azure.com). For more specific guidelines, see [Register your application with your Azure Active Directory tenant](https://docs.microsoft.com/en-us/azure/active-directory/active-directory-app-registration). When you add an application to an Azure AD tenant, you must specify the following information.

|Setting/option|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|
|-----------------|---------------------------------|---------------------------------------|
|Name|The name of your application as it will display to your users, such as **Business Central App by My Solutions**.|
|Type|Choose **Web app/API**.|
|Sign-on URL (also referred to as App URL and Home page)|The URI for signing on to the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)], which has the format `https://<domain or computer name>/<webserver-instance>`, such as `https://cronusinternationltd.onmicrosoft.com/BC140` or `https://MyBcWebServer/BC140`.|
|App ID URI|The URI to a domain in your Azure AD tenant. By default, the application is assigned an App ID URI that has the format `https://<domain>/<guid>`, such as https://cronusinternationltd.onmicrosoft.com/70b20a51-46b7-4290-8686-b79ec90379f6. You can keep this value or change the `<guid>` portion to suit, for example, `https://cronusinternationltd.onmicrosoft.com/businesscentral`. You can see this in Setting Properties. <BR /><BR />**Important:**  The App ID URI must be unique within the Azure AD tenant. However, if you want to share your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] solution with other Azure AD tenants, the App ID URI must be unique in Azure AD. <br /><br /> This URI is appended to the **WS-Federation Login Endpoint** setting in the [!INCLUDE[server](../developer/includes/server.md)] configuration and **ACSURI** setting in the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] configuration. Additionally, in the [!INCLUDE[server](../developer/includes/server.md)] configuration, it must be specified in the **Azure AD App ID URI** setting for SOAP and OData web services.|
|Reply URL|Add a reply URL for the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] and the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)]. <br /><br />The reply URL for the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] is the same as the **Sign-on URL**, except it includes `/SignIn` at the end, such as `https://cronusinternationltd.onmicrosoft.com/BC140/SignIn`. **Important** The portion of the reply URL after the domain name (in this case `BC140/SignIn`) is case-sensitive, so make sure that the web server instance name matches the case of the web server instance name as it is defined on IIS for your installation. <br /><br /> The reply URL for the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] is the URL for opening the client, such as `https://dynamicsnavwinclient`.|

Your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] solution is now registered in your Azure AD tenant. You will need to provide the App ID URI and Reply URLs when you configure the [!INCLUDE[server](../developer/includes/server.md)] instance for single sign-on. So, make a note of or copy the values for these settings for later use. You can view the settings in the Azure portal by selecting **Settings** for the registered application.

<!-- 
Next, you must configure the application to be externally available. Also, you can change the logo to reflect the functionality of the application. From the overview page for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] as an application, you can change configuration settings by choosing **Settings** in new portal). Then, save your changes.
-->

## Task 2a: (SharePoint app only) Make [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Available to Azure AD Tenants  
In the overview page for the application, the **URL for Granting Access** field contains a URL that you can send to users in other Azure AD tenants. Then, when they choose the link, a page displays where they must agree to trust the application. If they accept, the app is added to their SharePoint site.  

## Task 3: Configure [!INCLUDE[server](../developer/includes/server.md)] for Azure AD

You can configure the [!INCLUDE[server](../developer/includes/server.md)] instance by using the [!INCLUDE[admintool](../developer/includes/admintool.md)], modifying the CustomSettings.config file directly, or using the [Set-NAVServerConfiguration cmdlet](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration) in the [!INCLUDE[adminshell](../developer/includes/adminshell.md)]. For more information, see [Configuring Server](../administration/configure-server-instance.md).

1. Configure the [!INCLUDE[server](../developer/includes/server.md)] instances that must support Azure AD to use `AccessControlService` as the credential type.

	The `AccessControlService` credential type for the [!INCLUDE[server](../developer/includes/server.md)] instance includes support for Azure AD so that you can achieve single sign-on between Office 365 and [!INCLUDE[prodshort](../developer/includes/prodshort.md)].  

2. Specify the location of the federation metadata. For example, in the [!INCLUDE[admintool](../developer/includes/admintool.md)], on the **Azure Active Directory** tab, set the **WS-Federation Metadata Location** field.

	The federation metadata is used to establish a trust relationship between [!INCLUDE[prodshort](../developer/includes/prodshort.md)] and Azure AD. 
	
	Azure AD publishes federation metadata at:
	
	```
	https://login.microsoftonline.com/<Azure AD TENANT ID>/FederationMetadata/2007-06/FederationMetadata.xml
	```

	For example:

	```
	https://login.microsoftonline.com/cronusinternationltd.onmicrosoft.com/FederationMetadata/2007-06/FederationMetadata.xml
	```  

3. Specify the WS-federation login endpoint.

	The WS-federation login endpoint is the URL of the sign-on page that [!INCLUDE[prodshort](../developer/includes/prodshort.md)] redirects to when users sign on from a client. You must specify a URL in the following format:

	```
    https://login.microsoftonline.com/<AAD TENANT ID>/wsfed?wa=wsignin1.0%26wtrealm=<APP ID URI>%26wreply=<APP REPLY URL>
    ```

	For example:

	```
    https://login.microsoftonline.com/cronusinternationltd.onmicrosoft.com/wsfed?wa=wsignin1.0%26wtrealm=https://cronusinternationltd.onmicrosoft.com/businesscentral%26wreply=https://cronusinternationltd.onmicrosoft.com/BC130/SignIn
    ```

	**Parameter descriptions**:
    
    |Parameter|Description|
    |-|-|-|
    |`<AAD TENANT ID>`|The ID of the Azure AD tenant, for example `CRONUSInternationLtd.onmicrosoft.com`. To ensure that [!INCLUDE[prodshort](../developer/includes/prodshort.md)] redirects to the right sign-in page, substitute `<AAD TENANT ID>` with a value according to the following:<ul><li>If the [!INCLUDE[server](../developer/includes/server.md)] instance is configured for as a single tenant server instance, the value is typically the domain name for the Azure AD tenant, and the URL is similar to the example above.</li><li>If the [!INCLUDE[server](../developer/includes/server.md)] instance is configured for multitenancy and each [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant corresponds to an Azure AD tenant that has a service principal, use `{AADTENANTID}` as the value. For example, `https://login.microsoftonline.com/{AADTENANTID}/wsfed?wa=wsignin1.0%26wtrealm=...%26wreply=...`. The [!INCLUDE[server](../developer/includes/server.md)] instance will automatically replace `{AADTENANTID}` with the correct Azure AD tenant.</li><li>If the [!INCLUDE[server](../developer/includes/server.md)] instance is configured as a multitenant instance and the corresponding [!INCLUDE[prodshort](../developer/includes/prodshort.md)] application in Azure AD has external access and configured as a multitenant application, substitute [AAD TENANT ID] with `common`. Tenant ID parameter that is specified when mounting a tenant replaces the placeholder.</li>|
    |`<APP ID URI>`|The ID that was assigned to the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] application when it was registered in Azure AD, for example `https://localhost/` or `https://cronusinternationltd.onmicrosoft.com/businesscentral`.|
    |`<APP REPLY URL>`|The reply URL that was assigned to the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] application when it was registered in the Azure AD tenant. This parameter must point to the SignIn page of the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)]. Make sure it exactly matches the **Relpy URL** that was configured on the application in Azure AD.<br /><br />`	https://cronusinternationltd.onmicrosoft.com/BC130/SignIn`<br /><br />The `wreply` parameter is optional. The `wreply` query parameter tells the Azure AD authentication service where to send the authentication token. If you do not specify the `wreply` parameter, it will be deducted from the URL in the browser.|

   > [!IMPORTANT]
   >The query string parameter must be URI-encoded. This means, for example, use "%26" instead of "&".

4. Disable token-signing certificate validation.

	If you are using the [!INCLUDE[admintool](../developer/includes/admintool.md)], select the **Disable Token-Signing Certificate Validation** check box. If you are using the [Set-NAVServerConfiguration cmdlet](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration) or modifying the CustomSettings.config file directly, set `DisableTokenSigningCertificateValidation` to `true`.

5. To configure SOAP and OData web services for Azure AD authentication, specify the App ID URI that is registered for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] in the Azure AD.

	In the [!INCLUDE[admintool](../developer/includes/admintool.md)], you do this by setting the **Azure AD App URI** field on the **Azure Active Directory** tab. The App ID URI is typically the same as the *wtrealm* parameter value of the **WS-Federation Endpoint** setting in the [!INCLUDE[server](../developer/includes/server.md)] configuration and the **ACSUri** setting in the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] configuration. 

## Task 4: Configure [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)] for Azure AD  
 You must configure the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)] to use `AccessControlService` as the credential type.  

For more information see, [Configure Authentication](users-credential-types.md).

## Task 5: Configure [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] for Azure AD  
The [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] must also be configured to use `AccessControlService` as the credential type in order to support Azure AD. In addition, the `ACSUri` setting for Azure AD authentication must be set. The value should be that same as the **WS-Federation Login Endpoint** setting of the [!INCLUDE[server](../developer/includes/server.md)] instances, except for the `<App REPLY URL>` parameter. The `ACSUri` setting has the following format:

```
https://login.microsoftonline.com/<AAD TENANT ID>/wsfed?wa=wsignin1.0%26wtrealm=[APP ID URI]%26wreply=[APP REPLY URL]
```

The `<APP REPLY URL>` parameter in the URL must be equal to the sign in page for the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)], such as  `https://dynamicsnavwinclient`.  

For example:

```
<add key="ACSUri" value="https://login.microsoftonline.com/cronusinternationltd.onmicrosoft.com/wsfed?wa=wsignin1.0%26wtrealm=https://cronusinternationltd.onmicrosoft.com/businesscentral%26wreply=https://dynamicsnavwinclient" />
```
You configure the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] by modifying the ClientUserSettings.config file. <!-- For more information, see [Configuring the Dynamics NAV Windows Client](configuring-the-windows-client.md#afterset).-->

## Task 6: Associate the Azure AD Accounts with the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] User Accounts  
Each user in your Azure AD tenant that will access [!INCLUDE[prodshort](../developer/includes/prodshort.md)] must be set up with an account in [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

1. In the client, use the **Users** page to create new or modify existing users.

2. On the **User Card** for a specific user, under **Business Central Authentication Password**, assign the user a password.

3. Under **Office 365 Authentication**, specify the authentication email address 

    The authentication email address is the email account for that user in your Azure AD tenant. When you combine this with the relevant configuration of the [!INCLUDE[server](../developer/includes/server.md)] instance, users achieve single sign-on when they access [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)].

For more information about how to set up users, see [Managing Users and Permissions](/dynamics365/business-central/ui-how-users-permissions).

> [!IMPORTANT]  
>  The single sign-on means that users are still signed in to Azure AD when they sign out from [!INCLUDE[prodshort](../developer/includes/prodshort.md)], unless they close all browser windows. However, if a user selected the **Keep me signed in** field when they signed in, they are still signed in when they close the browser window. To fully sign out from Azure AD, the user must sign out from each application that uses Azure AD, including [!INCLUDE[prodshort](../developer/includes/prodshort.md)] and SharePoint.  
>   
>  We recommend that you provide guidance to your users for signing out of their account when they’re done, so that you can keep your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] deployment more secure.  

### Web service accounts

For user accounts that you want to access OData and SOAP web services, you do the same as for a normal user, except you do not have to provide a password. Instead, you specify a web service access key that will be used to sign in.

To specify web service access key, go to **Web Service Access** on the **User Card**, and select the `...` next to the **Web Service Access Key** field to generate a key. Set an expiration date if you like.

The access key that appears in the **Web Service Access Key** is need to access web services. 

## See Also  

[Authentication and Credential Types](Users-Credential-Types.md)  
[Troubleshooting: The SAML2 token is not valid because its validity period has ended](troubleshooting-SAML2-token-not-valid-because-validity-period-ended.md)  