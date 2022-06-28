---
title: "Walkthrough: Creating a console application that use OAuth to Authenticate Business Central Web Services (OData and SOAP)"
description: Learn how to use OAuth to authenticate Business Central web services (OData and SOAP) through a step-by-step guide
ms.custom: na
ms.date: 01/25/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: jswymer
---

# Walkthrough: Creating a console application that use OAuth to Authenticate Business Central Web Services (OData or SOAP)

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] supports the OAuth authorization protocol for SOAP and OData web services. The article provides a walkthrough guide on how to create a custom .NET application that connects to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services and authenticates by using OAuth.

> [!TIP]
> For some samples about setting up OAuth, see the [BCTech repo](https://github.com/microsoft/BCTech/tree/master/samples/PSOAuthBCAccess).

## About OAuth
[!INCLUDE[about_oauth](../developer/includes/include-about-oauth.md)]

## About the tasks in this article

The tasks illustrate how to use OAuth by walking you through the creation of a simple console application. The application returns a list of customers from a page in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] that is published as a web service. The console application connects to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] by using the ODataV4 endpoint.

## Prerequisites and preparation

To complete the following tasks in this article, make sure your system meets the following requirements:

- Configure [!INCLUDE[prod_short](../developer/includes/prod_short.md)] for Azure Active Directory or Microsoft 365 authentication.

    For more information, see [Authenticating [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Users with Azure Active Directory](../administration/authenticating-users-with-azure-active-directory.md).

    Also, for purposes of this article only, make sure that your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] user account is configured with a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Authentication password or web access key.  

- Get information about the Azure Active Directory tenant and the registered [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application.

    When you configured authentication, you had to register [!INCLUDE[prod_short](../developer/includes/prod_short.md)] as an application in Azure Active Directory. To complete the tasks that follow, you'll need the following information about the tenant and application. You can get this information from the Azure portal.

    |Setting/option|Description|
    |--------------|-----------|
    |Azure Active Directory Tenant ID|The ID of the directory that's used by Business Central in Azure AD. The Azure Active Directory Tenant ID can be the tenant's domain name or GUID. In most cases, you can use the domain name. The domain name is typically in the form *mytenant.onmicrosoft.com*, which is the case if you have a Microsoft 365 subscription. You get the domain name from the **Domain** or **Custom domain names** settings for the AD tenant in the Azure portal. The Azure AD Tenant ID also makes up part of the **WS-federation login endpoint** setting that is configured for the [!INCLUDE[server](../developer/includes/server.md)] instance|
    |App ID URI| When you configured Business Central for Azure AD or Microsoft 365 authentication, you had to register Business Central as an application in the Azure Active Directory (Azure AD) and also specify an APP ID URI. The APP ID URI has the format `https://<domain>/<guid>`, like `https://mytenant.onmicrosoft.com/91ce5ad2-c339-46b3-831f-67e43c4c6abd`. You need the APP ID URI later to enable OAuth. You can get the ID from the Azure portal by viewing the Business Central application **Settings** in Active Directory. This value is also specified as the `wtrealm` in the `WS-Federation Login Endpoint` setting of the [!INCLUDE[server](../developer/includes/server.md)] instance configuration. For more information, see [Azure Active Directory Settings](../administration/configure-server-instance.md#AzureAd).|
  
- Enable OData Services and V4 Endpoint on the [!INCLUDE[server](../developer/includes/server.md)] instance.

    For more information, see [OData Services Settings](../administration/configure-server-instance.md#ODataServices).
  
- Install Visual Studio.

    You can use any edition of Visual Studio that supports adding a connected service for web services. This article uses Visual Studio 2017.  

- Install OData Connected Service in Visual Studio.

    This tool generates code to facilitate the consumption of OData services. This tool is functionally equivalent to the Add Service Reference for OData V3 service. To install OData Connected Service,  download it from [OData Connected Service](https://marketplace.visualstudio.com/items?itemName=laylaliu.ODataConnectedService) and follow the instructions, or do the following steps in Visual Studio:

    1. On the **Tools** menu, select **Extensions and Updates** > **Online**
    2. Search for **OData Connected Service**, select it in the results, and choose **Download**.
    3. Close Visual Studio to start the installation.

## Configure the App ID URI in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server

When [!INCLUDE[prod_short](../developer/includes/prod_short.md)] was registered in the Azure AD tenant, it was assigned an APP ID URI. For example, in this article, the APP ID URI is `https://mytenant.onmicrosoft.com/91ce5ad2-c339-46b3-831f-67e43c4c6abd`.

If you haven't already done so, set the **Azure AD App ID URI** setting in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server instance configuration to the same value as the APP ID URI in Azure. You can do this step by using the [!INCLUDE[admintool](../developer/includes/admintool.md)], [Set-NAVServerConfiguration cmdlet](/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration) of the [!INCLUDE[adminshell](../developer/includes/admintool.md)], or by modifying the server instance CustomSettings.config file directly. For more information, see [Configuring Business Central Server](../administration/configure-server-instance.md).

## Expose a page as web service

Use the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client to publish an object as a web service. For this article, use page **21 Customer Card** from the [!INCLUDE[demo_long_md](../developer/includes/demolong_md.md)] and assign the page the service name **Customer**.

1. Search for and open the **Web Services** page.
2. Choose **New**.
3. On the new line, set: **Object Type** to **Page**, the **Object ID** to **21** column, and the **Service Name** to **Customer**.
4. Select the **Published** check box.

    The following table shows the resultant web service setup that you'll see on the **Web Services** page.

    |Object Type|Object ID|Object Name|Service Name|Published|OData URL|
    |-----------|---------|-----------|------------|---------|---------|
    |Page|21|Customer Card|Customer|√|`https://myserver:7048/BC/ODataV4/Company('CRONUS%20International%20Ltd.')/Customer`|

    In the OData URL, `myserver` is the computer that is running the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server instance, `7048` is the port number used for OData, and `BC`is the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server instance.

    For more information about publishing, see [Publish a Web Service](./publish-web-service.md).
5. After you publish the web service, you can now enter the OData URL in the address of an Internet browser.

    You're prompted for your user name and password. The user name and password that you enter is the user name and password (or web service access key) of your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] account; not your Microsoft 365 or Azure AD user name and password.

    This condition illustrates the problem&mdash;users must use different credentials for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] clients than they do for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services.

## Register the console application in the Azure AD tenant

Although you haven't yet created the console application, the next thing to do is to register it as an application in the same Azure AD Directory in which you registered [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. Having to register the console application in Azure AD makes sense because Azure AD is the common authority that can issue security tokens that enable client applications to call server applications.

1. Using the Azure portal, register the console application as a native client application.

    For information about how to do this step, follow the instructions in [Quickstart: Register an app with the Azure Active Directory](/azure/active-directory/develop/quickstart-v1-add-azure-ad-app).

    Use the following table as guide to help you determine some of the registration settings.

    |Option|Description and value|Example|
    |------|-----|----|
    |Name|Specifies a descriptive name for the application. | `My Business Central Web Service App`|
    |Application Type|Set to `Native`|`Native`|
    |Redirect URI|Specifies the redirect URI to a valid URI for Azure AD to redirect to in response to an OAuth request.<br /><br /> This value is a logical URL that only acts as a unique identifier for the application. It doesn't have to refer to an actual endpoint; but it must be a valid URI.|`https://mybcclient`|

2. Grant the console application delegated permissions to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application.

    1. Select  **API Permissions ** > **Add a permission** > **APIs my organization uses**.
    2. Search for and select the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application,
    3. Select **Delegated Permissions**.
    4. Under **Permissions**, select **user_impersonation**, then **Add permissions**.

    For more information, see [Permissions and consent in the Microsoft identity platform endpoint](/azure/active-directory/develop/v2-permissions-and-consent).
  
3. Make a note of the values of the **Application (client) ID** and **Redirect URI** values. You'll use this information later when you create the console application.

    In the Azure portal, you can see these values by opening **Settings** for the registered application.

Now the custom client application is registered in Azure AD, and it has the permission to call [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services on behalf of a signed-in user.

## Create the console application that connects to the OData Web Service using OAuth

Here, you'll create the Windows console application that connects to the Customer web service using the ODataV4 endpoint and authorizes users with OAuth.

### Create the C\# project  
  
1. In Visual Studio, on the **File** menu, point to **New**, and then choose **Project**.  
2. In the pane on the left, select **Installed** > **Visual C\#** > **Windows (Classic) Desktop** > **Console App (.NET Framework)**.
3. Set the **Name** and **Solution Name** to, for example, **BusinessCentralCustomers**, and choose  **OK** to exit the **New Project** page.

### Add a connected service reference for the OData web service

1. Temporarily set the [!INCLUDE[server](../developer/includes/server.md)] to use **Windows** credential type.

    This step allows you to access the OData endpoint from Visual Studio.
2. In the Solution Explorer pane, right-click the project (**BusinessCentralCustomers**), and then choose **Add** > **Connected Service** > **OData Connected Service**.  

3. On the **Configure Endpoint** page, either keep the **Service name** of **OData Service** or change it if you like.

4. In the **Address** field, enter the URI for your OData web service.

    The endpoint has the format `https://<servercomputer>:<business-central-odata-port>/<business-central-server-instance>/ODataV4`, for example:

    `https://localhost:7048/BC/ODataV4`
  
   > [!IMPORTANT]  
   >  In this example, we use the HTTP protocol to illustrate the use of OData web services. We recommend that you use the more secure HTTPS protocol when you consume web services.
  
5. Choose **Next**.
6. On the **Settings** page, either keep the file name **Reference** or change it if you like.
  
   The project is created, and your OData web service is added as a connected service reference. Next, you add the code that will show a list of existing customers, add a customer, and then rename the new customer.

7. From Solution Explorer, open the C\# reference file (Reference.cs or whatever you named it) under **Connected Services** > **OData Service**, and then do the following steps:

    - Replace all references to `Microsoft.OData.Edm.Library.Date` with `Microsoft.OData.Edm.Date`.
    - Replace all references to `Microsoft.OData.Edm.Csdl.EdmxReader` with `Microsoft.OData.Edm.Csdl.CsdlReader`.

8. Set the [!INCLUDE[server](../developer/includes/server.md)] to use **AccessControlService** credential type again.

### Install and add a reference to the Microsoft.Identity.Client

The Microsoft.Identity.Client library contains utilities for token acquisition for OAuth web services. The library enables you to add code in the console application for acquiring a security token to access Business Central web services. You can read about the package at Microsoft.Identity.Client.

Install the latest version of the package by using NuGet Package Manager in Visual Studio Code as follows:

1. Select **Tools** > **NuGet Package Manager** > **Package Manager Console**.
2. At the `PM>` prompt, enter the following command:

    ```
    Install-Package Microsoft.Identity.Client -Version 4.40.0
    ```

3. Add a reference to Microsoft.Identity.Client in the console application project.

### Add code to console application

1. In the code editor, write the following code. Replace brackets `<>` with your values.

    ```
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using Microsoft.Identity.Client;

    namespace MyBCCustomers
    {
        class Program
        {
            // Azure AD registrations:
            // Specifies the Azure AD tenant ID
            const string AadTenantId = "<mytenant.onmicrosoft.com>";
            // Specifies the Application (client) ID of the console application registration in Azure AD
            const string ClientId = "<7b235fb6-c01b-47c5-afeb-cbb165abeaf7>";
            // Specifies the redirect URL for the client that was configured for console application registration in Azure AD
            const string ClientRedirectUrl = "<https://mybcclient>";
            // Specifies the APP ID URI that is configured for the registered Business Central application in Azure AD
            const string ServerAppIdUri = "<https://mytenant.onmicrosoft.com/91ce5ad2-c339-46b3-831f-67e43c4c6abd>";

            static void Main()
            {
                // Get access token from Azure AD. This will show the login dialog.
                            // Get access token from Azure AD. This will show the login dialog.
                var client = PublicClientApplicationBuilder.Create(ClientId)
                    .WithAuthority("https://login.microsoftonline.com/" + AadTenantId, false)
                    .WithRedirectUri(ClientRedirectUrl)
                    .Build();
                AuthenticationResult authenticationResult = client.AcquireTokenInteractive(new string[] { $"{ServerAppIdUri}/.default" }).ExecuteAsync().GetAwaiter().GetResult();
                // Connect to the Business Central OData web service and display a list of customers
                var nav = new NAV.NAV(new Uri(<"https://localhost:7048/BC/ODataV4/Company('CRONUS%20International%20Ltd.'>)"));
                nav.BuildingRequest += (sender, eventArgs) => eventArgs.Headers.Add("Authorization", authenticationResult.CreateAuthorizationHeader());
    
                // Retrieve and return a list of the customers 
                foreach (var customer in nav.Customer)
                {
                    Console.WriteLine("Found customer: " + customer.Name);
                }
                Console.ReadLine();
            }
        }
    }
    ```

2. Build and run the application.

    You should be prompted to enter a user name and password. 

## Summary

More and more companies adopt Microsoft 365 and integrate [!INCLUDE[prod_short](../developer/includes/prod_short.md)] with Microsoft 365 to obtain single sign-on. As this occurs, it also becomes important that customers can authenticate to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services by using their universal credentials – the Microsoft 365 user name and password. OAuth is the web service authorization protocol that makes this possible.

This article covered how to configure [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services for OAuth authorization. It also demonstrated how to create a simple .NET console application that connects to these web services. It is also possible to create other types of applications that authenticate using OAuth, such as modern Windows 10 apps, iOS apps, and Android apps. The Microsoft Azure Active Directory team has released libraries for all these platforms. See the following resources:

https://github.com/azureadsamples/nativeclient-windowsstore

https://github.com/MSOpenTech/azure-activedirectory-library-for-ios

https://github.com/MSOpenTech/azure-activedirectory-library-for-android


## See Also
  
[Web Services Authentication](web-services-authentication.md)  
[OData Web Services](OData-Web-Services.md)  
[Configuring Business Central Server](../administration/configure-server-instance.md)  
[Authentication and Credential Types](../administration/Users-Credential-Types.md)
