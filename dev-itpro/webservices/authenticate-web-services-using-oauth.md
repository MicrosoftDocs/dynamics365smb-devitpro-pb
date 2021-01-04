---
title: "Using OAuth to Authenticate Business Central Web Services (OData and SOAP)"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# Using OAuth to Authorize Business Central Web Services (OData and SOAP)

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] supports the OAuth authorization protocol for SOAP and OData web services. This article some basics behind the use and configuration of OAuth authentication in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. It describes the general aspects of the OAuth authorization protocol, including how to set it up for [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. It also provides a guide on how to create a custom .NET application that connects to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services and authenticates by using OAuth.

## Introduction

### About OAuth

OAuth is an open standard for authorizing access to web services and APIs from native clients and websites in Azure Active Directory (Azure AD). In [!INCLUDE[prod_short](../developer/includes/prod_short.md)], OAuth is useful when your deployment is configured for Azure Active Directory authentication, either through your own Azure subscription or a Microsoft 365 subscription, because it lets users sign-in to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services using their Microsoft 365 or Azure AD credentials. Otherwise, they would have to use their [!INCLUDE[prod_short](../developer/includes/prod_short.md)] account credentials (user name and password or web access key).

### About the tasks in this article

This article illustrates how to use OAuth by walking you through the creation of a simple console application that <!-- is a basically an alteration of the console application that is used in the article [Interacting with a Page Web Service (OData)](interact-with-page-odata-web-service.md)--> returns a list of customers from a page in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] that is published as a web service. The console application connects to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] by using the ODataV4 endpoint. <!--The difference here is that you will abandon the use of the built-in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] user name and password for authentication (NavUserPassword) and use Microsoft 365 or Azure AD credentials instead.-->

<!--
The result will be a .NET console application that contains following code (with some adjustments to suit your environment):

```
using Microsoft.IdentityModel.Clients.ActiveDirectory;
using MyNavClient.ServiceReference1;
using System;
class Program
{
    // Azure AD registrations
    // - the Azure AD tenant
    const string AadTenantId = "mytenant.onmicrosoft.com";
    // - this client application
    const string ClientId = "e64a621d-beb8-4e7d-bf0b-30e3e79651dd";
    const string ClientAppUri = "https://MyNavClient";
    // - the server that we want to call ([!INCLUDE[prod_short](../developer/includes/prod_short.md)])
    const string ServerAppIdUri = "https://mynavserver/NAVAppIdUri";
    [STAThread]
    static void Main()
    {
        // Get access token from AAD. This will show the login dialog.
               var authenticationContext = new AuthenticationContext(
                   "https://login.windows.net/" + AadTenantId);
        AuthenticationResult authenticationResult =
            authenticationContext.AcquireToken(
            ServerAppIdUri, ClientId, new Uri(ClientAppUri));
        // Connect to the NAV web service
        var nav = new NAV(new Uri("https://mynavserver:7047/NAV/OData"));
        nav.BuildingRequest += (sender, eventArgs) => eventArgs.Headers.Add(
            "Authorization", authenticationResult.CreateAuthorizationHeader());
        foreach (var customer in nav.Customer)
        {
            Console.WriteLine("Found customer: " + customer.Name);
        }
        Console.ReadLine();
    }
}
```


```
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.IdentityModel.Clients.ActiveDirectory;


namespace oauthConsoleApp
{
    class Program
    {
        // Azure AD registrations
        // Specifies the Azure AD tenant ID
        const string AadTenantId = "mytenant.onmicrosoft.com";
        // Specifies the Application (client) ID of the console application registration in Azure AD
        const string ClientId = "7b235fb6-c01b-47c5-afeb-cbb165abeaf7";
        // Specifies the redirect URL for the client that was configured for console application registration in Azure AD
        const string ClientAppUri = "https://mybcclient";
        // Specifies the APP ID URI that is configured for the registered Business Central application in Azure AD and configured in the Business Central Server.
        const string ServerAppIdUri = "https://mytenant.onmicrosoft.com/91ce5ad2-c339-46b3-831f-67e43c4c6abd";

        [STAThread]
        static void Main()
        {
            // Get access token from AAD. This will show the login dialog.
            var authenticationContext = new AuthenticationContext("https://login.microsoftonline.com/" + AadTenantId, false);
            AuthenticationResult authenticationResult = authenticationContext.AcquireTokenAsync(ServerAppIdUri, ClientId, new Uri(ClientAppUri), new PlatformParameters(PromptBehavior.SelectAccount)).GetAwaiter().GetResult();
            // Connect to the Business Central OData web service and display a list of customers
            var nav = new NAV.NAV(new Uri("https://myBCserver:7048/BC140/ODataV4"));
            nav.BuildingRequest += (sender, eventArgs) => eventArgs.Headers.Add("Authorization", authenticationResult.CreateAuthorizationHeader());
            foreach (var customer in nav.Customer)
            {
                Console.WriteLine("Found customer: " + customer.Name);
            }
            Console.ReadLine();
        }
    }
}
```

When you run the application, a dialog box appears where you can sign in to Azure Active Directory by using your organizational account. After you sign in, the application connects to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] OData web service to get a list of customers.

You will start by creating a custom application that connects to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] OData endpoint and authenticates by using Basic authentication. The subsequent sections cover the changes that you must make to authenticate by using OAuth. This should help make it clear what is required to take the next step for setting up OAuth authentication.
-->
## Prerequisites and preparation

To complete the following tasks in this article, make sure your system meets the following requirements:

- Configure [!INCLUDE[prod_short](../developer/includes/prod_short.md)] for Azure Active Directory or Microsoft 365 authentication.

    For more information, see [Authenticating [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Users with Azure Active Directory](../administration/authenticating-users-with-azure-active-directory.md).

    Also, for purposes of this article only, make sure that your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] user account is configured with a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Authentication password or web access key.  

- Get information about the Azure Active Directory tenant and the registered [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application.

    When you configured authentication, you had to register [!INCLUDE[prod_short](../developer/includes/prod_short.md)] as an application in Azure Active Directory. To complete the tasks that follow, you will need the following information about the tenant and application. You can get this information from the Azure Portal.

    |Setting/option|[Description|
    |-----------------|---------------------------------|---------------------------------------|
    |Azure Active Directory Tenant ID|This is the ID identities the directory that is used by [!INCLUDE[prod_short](../developer/includes/prod_short.md)] in Azure AD.  The Azure Active Directory Tenant ID can be the tenant's domain name or GUID. In most cases, you can use the domain name, which is typically in the form *mytenant.onmicrosoft.com*, which is the case if you have a Microsoft 365 subscription. You can get the domain name from the **Domain** or **Custom domain names** settings for the Active Directory tenant in the Azure Portal. The Azure AD Tenant ID also makes up part of the **WS-federation login endpoint** setting that is configured for the [!INCLUDE[server](../developer/includes/server.md)] instance||
    |App ID URI|When you configured [!INCLUDE[prod_short](../developer/includes/prod_short.md)] for Azure AD or Microsoft 365 authentication, you had to register [!INCLUDE[prod_short](../developer/includes/prod_short.md)] as an application in the Azure Active Directory (Azure AD) and also specify an APP ID URI. The  APP ID URI has the format `https://<domain>/<guid>`, like `https://mytenant.onmicrosoft.com/91ce5ad2-c339-46b3-831f-67e43c4c6abd`. You need the APP ID URI later to enable OAuth. You can get the ID from the Azure Portal by viewing the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application **Settings** in Active Directory. This is also specified as the `wtrealm` in the `WS-Federation Login Endpoint` setting of the [!INCLUDE[server](../developer/includes/server.md)] instance configuration. For more information, [Azure Active Directory Settings](../administration/configure-server-instance.md#AzureAd).|
  
- Enable OData Services and V4 Endpoint on the [!INCLUDE[server](../developer/includes/server.md)] instance.

    For more information, see [OData Services Settings](../administration/configure-server-instance.md#ODataServices).
  
- Install Visual Studio.

    You can use any edition of Visual Studio that supports adding a connected service for web services. This article uses Visual Studio 2017.  

- Install OData Connected Service in Visual Studio.

    This tool generates code to facilitate the consumption of OData services. This tool is functionally equivalent to the Add Service Reference for OData V3 service. To install OData Connected Service you can either download it from [OData Connected Service](https://marketplace.visualstudio.com/items?itemName=laylaliu.ODataConnectedService) and follow the instructions, or do the following in Visual Studio:

    1. On the **Tools** menu, select **Extensions and Updates** > **Online**
    2. Search for **OData Connected Service**, select it in the results, and choose **Download**.
    3. Close Visual Studio to start the installation.

## Configure the App ID URI in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server

When [!INCLUDE[prod_short](../developer/includes/prod_short.md)] was registered in the Azure AD tenant, it was assigned an APP ID URI. For example, in this article, the APP ID URI is `https://mytenant.onmicrosoft.com/91ce5ad2-c339-46b3-831f-67e43c4c6abd`.

If you have not already done so, set the **Azure AD App ID URI** setting in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server instance configuration to the same value as the APP ID URI in Azure. You can do this by using the [!INCLUDE[admintool](../developer/includes/admintool.md)], [Set-NAVServerConfiguration cmdlet](/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration) of the [!INCLUDE[adminshell](../developer/includes/admintool.md)], or by modifying the server instance CustomSettings.config file directly. For more information, see [Configuring Business Central Server](../administration/configure-server-instance.md).


<!-- 
## The Starting Point: [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Configured for Microsoft 365 Single Sign-on 

This article assumes that you already have a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] installation, and that you have configured it for either for single sign-on (SSO) with your Microsoft 365 account. We will not cover the details of how to do this here. <!--You can learn about single sign-on by watching the video How Do I: Enable Single Sign-On with Microsoft 365 in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2013 R2 or reading the topic How to: Set up [!INCLUDE[prod_short](../developer/includes/prod_short.md)] for Single Sign-on With Microsoft 365 using Windows PowerShell.
 
- App ID URI of the registered [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application in Azure Active Directory

    When you configured [!INCLUDE[prod_short](../developer/includes/prod_short.md)] for single sign-on with Microsoft 365, you had to register [!INCLUDE[prod_short](../developer/includes/prod_short.md)] as an application in a Microsoft Azure Active Directory (Azure AD), and also specify an APP ID URI. You will need the APP ID URI later to enable OAuth. You can get the ID from the Azure Management Portal by viewing the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application configuration in Active Directory. For more information, see Integrating Applications with Azure Active Directory.

- Azure Active Directory Tenant ID (AadTenantId)

    The Azure Active Directory Tenant ID identities the directory for the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application in Azure AD. The tenant ID can be the tenant's domain name or GUID. In most cases, you can use the domain name, which is typically in the form *mytenant.onmicrosoft.com*. You can get the domain name from the **Domain** or **Custom domain names** settings for the Active Directory tenant in the Azure Portal. Or you can extract the information from the URL in the browser when you open the AD tenant in the Azure Management Portal, as illustrated in the following URL:

    `https://manage.windowsazure.com/*\[Domain name]#Workspaces/ActiveDirectoryExtension/Directory/[Tenant ID]*/directoryQuickStart`
- Set the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server instance credential type to `NavUserPassword`.

    To make sure that the procedures in this article work as expected, set the Credential Type setting (ClientServicesCredentialType) of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server instance to NavUserPassword. When this is the case, the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server instance supports both NavUserPassword (Basic) and AccessControlService (Microsoft 365) authentication.

    For more information, see Configuring [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server.

When configured for single sign-on, you will be prompted for your Microsoft 365 credentials when you try to access [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. To verify this, open a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client.

-->

## Expose a page as web service

Use the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client to publish an object as a web service. For this article, use page **21 Customer Card** from the [!INCLUDE[demo_long_md](../developer/includes/demolong_md.md)] and assign the page the service name **Customer**.

1. Search for and open the **Web Services** page.
2. Choose **New**.
3. On the new line, set **Object Type** to **Page**, the **Object ID** to **21** column, and the **Service Name** to **Customer**.
4. Select the **Published** check box.

    The following table depicts the resultant web service setup that you will see on the **Web Services** page.

    |Object Type|Object ID|Object Name|Service Name|Published|OData URL|
    |-----------|---------|-----------|------------|---------|---------|
    |Page|21|Customer Card|Customer|√|`https://myserver:7048/BC/ODataV4/Company('CRONUS%20International%20Ltd.')/Customer`|


    In the OData URL, `myserver` is the computer that is running the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server instance, `7048` is the port number used for OData, and `BC`is the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server instance.

    For more information about publishing, see [Publish a Web Service](/dynamics365/business-central/dev-itpro/webservices/publish-web-service).
5. After you publish the web service, you can now enter the OData URL in the address of an Internet browser.

    Your are prompted for your user name and password. The user name and password that you enter is the user name and password (or web service access key) of your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] account; not your Microsoft 365 or Azure AD user name and password.

    <!--On the **User Card** in [!INCLUDE[prod_short](../developer/includes/prod_short.md)], this information is specified by the **User Name** field in the **General** section and the **Password** field in the **[!INCLUDE[prod_short](../developer/includes/prod_short.md)] Password Authentication** section (or by the **Web Service Access Key** field in the **Web Service Access** section if your account is set up a web access key).-->

    This kind of illustrates the problem, which is, users must use different credentials when they use the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] clients than when they use the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services.

## Register the console application in the Azure AD tenant

Although you have not yet created the console application, the next thing to do is to register it as an application in the same Azure AD Directory in which you registered [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. Having to register the console application in Azure AD makes sense because Azure AD is the common authority that can issue security tokens that enable client applications to call server applications.

1. Using the Azure Portal, register the console application as a native client application.

    For information about how to do this, follow the instructions in [Quickstart: Register an app with the Azure Active Directory](/azure/active-directory/develop/quickstart-v1-add-azure-ad-app).

    Use the following table as guide to help you determine some of the registration settings.

    |Option|Description and value|Example|
    |------|-----|----|
    |Name|Specifies a descriptive name for the application. | `My Business Central Web Service App`|
    |Application Type|Set to `Native`|`Native`|
    |Redirect URI|Specifies the redirect URI to a valid URI for Azure AD to redirect to in response to an OAuth request.<br /><br /> This is a logical URL that only acts as a unique identifier for the application. It does not have to refer to an actual endpoint; but is must be a valid URI.|`https://mybcclient`|

2. Grant the console application delegated permissions to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application.

    1. Select  **Settings** > **Required Permissions** > **Add** > **Select API**.
    2. Search for and select the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application,
    3. Select **Delegated Permissions**, and then save the changes.

    For more information, see [Permissions and consent in the Microsoft identity platform endpoint](/azure/active-directory/develop/v2-permissions-and-consent).

   <!--configure the custom application to have delegated permission to access the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application.-->
<!-- 
- Choose the Add an application my organization is developing option.
- Give application a name such as MyBClient,
- Choose to add a native client application type.
- Set the redirect URI to a valid URI for Azure AD to redirect to in response to an OAuth request, for example, https://MyNavClient..
    - This is a logical URL that only acts as a unique identifier for the application. It does not have to refer to an actual endpoint; but is must be a valid URI.


- 2.  Grant the Excel add-in application permission to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application.

    You must give the Azure AD application for the Excel add-in delegated permission to access the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application in Azure AD. This allows users of the Excel add-in to access the OData web services to read and write data.  

    In the portal, you set up permissions on the configuration/settings page of Excel add-in application, in the permissions section.

-->
  
3. Make a note of the values of the **Application (client) ID** and **Redirect URI** values because you will use this later when you create the console application.

    In the Azure Portal, you can see these values by opening **Settings** for the registered application.

Now the custom client application is registered in Azure AD, and it has the permission to call [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services on behalf of a signed-in user.

## Create the console application that connects to the OData Web Service using OAuth

In this section, you will create the Windows console application that connects to the Customer web service using the ODataV4 endpoint and authorizes users with OAuth. 
<!--
You will start by creating an application that connects to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] OData web service by using Basic authentication. To do this, follow these steps:

1. In Visual Studio, create a new C# Console Application project and name it "MyBCClient".
2. Add a service reference according to the following guidelines:
    1. In the Address field of the Add Service Reference dialog box, enter the base part of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] OData URL. This is the part of the URL up to and including "/OData", for example, https://myserver:7047/NAV/OData.
    2. Choose GO, and enter your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] user name and password when you are prompted.
    
        In the Service pane, you will see the OData feeds that [!INCLUDE[prod_short](../developer/includes/prod_short.md)] has exposed, which includes the Customer feed that you exposed earlier.
    3. Select the Customer service, and then choose OK.

        At this point, the wizard generates a service reference, which you can in the Solution Explorer pane and code editor of Visual Studio. The service reference includes some useful C# proxy classes (which are not shown) that make it easy to call the web service.

3. In the code editor, write the following code. Replace myserver and port to suit your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server instance.

    ```
    using MyNavClient.ServiceReference1;
    using System;
    using System.Net;
    using System.Runtime.InteropServices;
    using System.Text;

    class Program
    {
        [STAThread]
        static void Main()
        {
            // Get user credentials
            string userName;
            string password;
            PromptForCredentials(out userName, out password);
            // Connect to the Dynamics NAV web service
            var nav = new NAV(new Uri("https://myserver:port/NAV/OData"));
            nav.Credentials = new NetworkCredential(userName, password);
            foreach (var customer in nav.Customer)
            {
                Console.WriteLine("Found customer: " + customer.Name);
            }
            Console.ReadLine();
        }
        // NOTE: the PromptForCredentials method is included in the appendix
    }
    ```

4. Press F5 to run the console application.
5. Enter your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] user name and password when you are prompted.

    You should see the list of customers in the console.

## Converting the Application to OAuth Authentication

The next step is to abandon the use of the built-in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] user name and password for authentication and use the Microsoft 365 user name and password instead. This is a three-step process as described in this section.
-->

<!--

1. If you do not know the APP ID URI for the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application, get it by using the Azure Management Portal.

    For more information, see The Starting Point: [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Configured for Microsoft 365 Single Sign-on.

2. Using the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server Administration tool, open the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server instance for editing, and fill in the Azure Active Directory App ID URL field with the APP ID URI value. Restart the instance.

    For more information, see How to: Configure a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server Instance.

 
Next, you create a C\# console application in Visual Studio.
  
### Create the C\# project  
  
1. In Visual Studio, on the **File** menu, point to **New**, and then choose **Project**.  
2. In the pane on the left, select **Installed** > **Visual C\#** > **Windows Classic Desktop** > **Console App (.NET Framework)**.
3. Set the **Name** and **Solution Name** to, for example, **BusinessCentralCustomers**, and choose  **OK** to exit the **New Project** page.

<!--   
### Add a Service Reference for your OData Web service (Visual Studio 2015 and earlier)
1. In the Solution Explorer pane, right-click **References**, and then choose **Add Service Reference**.  
  
2. In the **Address** field, enter the URI for your OData web service, such as **https://localhost:7048/DynamicsNAV/OData/**.  
  
   > [!IMPORTANT]  
   >  In this example, we use the HTTP protocol to illustrate the use of OData web services. We recommend that you use the more secure HTTPS protocol when you consume web services.  
  
3. Choose **Go**, and then, in the **Services** field, choose **NAV**, and then choose the **OK** button.  
  
   The project is created, and your OData web service is added as a service reference. Next, you add the code that will show a list of existing customers, add a customer and then rename the new customer.  -->

### Create the C\# project  
  
1. In Visual Studio, on the **File** menu, point to **New**, and then choose **Project**.  
1. In the pane on the left, select **Installed** > **Visual C\#** > **Windows (Classic) Desktop** > **Console App (.NET Framework)**.
1. Set the **Name** and **Solution Name** to, for example, **BusinessCentralCustomers**, and choose  **OK** to exit the **New Project** page.

### Add a connected service reference for the OData web service

1. Temporarily set the [!INCLUDE[server](../developer/includes/server.md)] to use **Windows** credential type.

    This allows you to access the OData endpoint from Visual Studio.
2. In the Solution Explorer pane, right-click the project (**BusinessCentralCustomers**), and then choose **Add** > **Connected Service** > **OData Connected Service**.  

3. On the **Configure Endpoint** page, either keep the **Service name** of **OData Service** or change it if you like.

4. In the **Address** field, enter the URI for your OData web service.

    The endpoint has the format `https://<servercomputer>:<business-central-odata-port>/<business-central-server-instance>/ODataV4`, for example:

    `https://localhost:7048/BC/ODataV4`
  
   > [!IMPORTANT]  
   >  In this example, we use the HTTP protocol to illustrate the use of OData web services. We recommend that you use the more secure HTTPS protocol when you consume web services.
  
5. Choose **Next**.
6. On the **Settings** page, either keep the file name **Reference** or change it if you like.
  
   The project is created, and your OData web service is added as a connected service reference. Next, you add the code that will show a list of existing customers, add a customer and then rename the new customer.

7. From Solution Explorer, open the C\# reference file (Reference.cs or whatever yoo named it) under **Connected Services** > **OData Service**, and then do the following:

    - Replace all references to `Microsoft.OData.Edm.Library.Date` with `Microsoft.OData.Edm.Date`.
    - Replace all references to `Microsoft.OData.Edm.Csdl.EdmxReader` with `Microsoft.OData.Edm.Csdl.CsdlReader`.

8. Set the [!INCLUDE[server](../developer/includes/server.md)] to use **AccessControlService** credential type again.

### Install and add a reference to the Microsoft.IdentityModel.Clients.ActiveDirectory

The Microsoft.IdentityModel.Clients.ActiveDirectory library contains utilities for calling OAuth web services. The library enables you to add code in the console application for acquiring an security token to access [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services. You can read about the package at [Microsoft.IdentityModel.Clients.ActiveDirectory](https://www.nuget.org/packages/Microsoft.IdentityModel.Clients.ActiveDirectory).

Install the latest version of the package by using NuGet Package Manager in Visual Studio Code as follows:

1. Select **Tools** > **NuGet Package Manager** > **Package Manager Console**.
2. At the `PM>` prompt, enter the the following command:

    ```
    Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory -Version 4.5.1
    ```

3. Add a reference to Microsoft.IdentityModel.Clients.ActiveDirectory in the console application project.

### Add code to console application

1. In the code editor, write the following code. Replace brackets `<>` with your values.

    ```
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using Microsoft.IdentityModel.Clients.ActiveDirectory;
    
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
                var authenticationContext = new AuthenticationContext(<"https://login.microsoftonline.com/"> + AadTenantId, false);
                AuthenticationResult authenticationResult = authenticationContext.AcquireTokenAsync(ServerAppIdUri, ClientId, new Uri(ClientRedirectUrl), new PlatformParameters(PromptBehavior.SelectAccount)).GetAwaiter().GetResult();
    
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

<!--
### Change the Custom Application to use OAuth

The final task is to modify the custom application to use OAuth authentication. To complete this procedure, you must have the following information, most of which you should already have:

|Information|Description|Example|
|-----------|-----------|-------|
|Azure AD Tenant ID|This is the ID that is assigned to the Azure AD directory. For more information about finding this value, see The Starting Point: [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Configured for Microsoft 365 Single Sign-on.|mytenant.onmicrosoft.com|
|Client ID|This is the ID that is assigned to the custom application in Azure AD.|e64a621d-beb8-4e7d-bf0b-30e3e79651dd|
|Redirect URI|This is the redirect URI that you assigned the ID that is assigned to the custom application in Azure AD.|https://MyBClient|
|App ID URI|The App ID URI that you assigned to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application in Azure AD.|https://myserver/NAVAppIdUri|
|OData URL|The base part of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] OData URL. This is the part of the URL up to and including "/ODataV4". For more information, see Exposing a Web Service.|https://myserver:7048/BC/ODataV4|

Once you have this information, follow these steps:

1. In Visual Studio, open the custom application, and use the NuGet Package Manager to install the latest Microsoft.IdentityModel.Clients.ActiveDirectory package for the Active Directory Authentication Library.

    ```
    Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory -Version 4.5.1
    ```
    This library contains useful utilities for calling OAuth web services. You can read about the package at [Microsoft.IdentityModel.Clients.ActiveDirectory](https://www.nuget.org/packages/Microsoft.IdentityModel.Clients.ActiveDirectory).
2. In the code editor, write the following code. Replace brackets [] with your values:

    ```
    using Microsoft.IdentityModel.Clients.ActiveDirectory;
    using MyNavClient.ServiceReference1;
    using System;
    class Program
    {
        // Azure AD registrations
        // - the Azure AD tenant
        const string AadTenantId = "[Azure Tenant ID];
        // - this client application
        const string ClientId = "[Client ID]";
        const string ClientAppUri = "[Redirect URI]";
        // - the server that we want to call ([!INCLUDE[prod_short](../developer/includes/prod_short.md)])
        const string ServerAppIdUri = "[App ID URI]";
        [STAThread]
        static void Main()
        {
            // Get access token from AAD. This will show the login dialog.
            var authenticationContext = new AuthenticationContext("https://login.windows.net/" +
                AadTenantId);
            AuthenticationResult authenticationResult = authenticationContext.AcquireToken(
                ServerAppIdUri, ClientId, new Uri(ClientAppUri));
            // Connect to the Dynamics NAV web service
            var nav = new NAV(new Uri([Odata URL]"));
            nav.BuildingRequest += (sender, eventArgs) => eventArgs.Headers.Add(
                "Authorization", authenticationResult.CreateAuthorizationHeader());
            foreach (var customer in nav.Customer)
            {
                Console.WriteLine("Found customer: " + customer.Name);
            }
            Console.ReadLine();
        }
    }
    ```

    Notice the few changes that you had to make: You had to specify the IDs that were used when you registered the applications in Azure AD. Then, you had to add 3 lines of code to open the Microsoft 365 logon page to get the OAuth access token.
3. Press F5 to run the custom application.

    You should see the Microsoft 365 Sign-in page.
4. Enter your Microsoft 365 user name and password.

    You should again see the list of customers from [!INCLUDE[prod_short](../developer/includes/prod_short.md)].
-->

## Credentials lifetime

With authentication methods other than Azure AD, like Windows or NavUserPassword, the credentials that users provide are persisted by application and used for as long as they are valid in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. However, this is more complicated for OAuth, because the security tokens that are used for authentication have a limited lifetime. The code to obtain OAuth credentials was as follows:
<!-- 
```
AuthenticationResult authenticationResult = authenticationContext.AcquireToken(
            ServerAppIdUri, ClientId, new Uri(ClientAppUri));
```
-->
```
AuthenticationResult authenticationResult = authenticationContext.AcquireTokenAsync(ServerAppIdUri, ClientId, new Uri(ClientRedirectUrl), new PlatformParameters(PromptBehavior.SelectAccount)).GetAwaiter().GetResult();
```

The `AuthenticationResult` actually contains two tokens: an access token and a refresh token.

<!--
Clients use access tokens to access a protected resource.

```
string accessToken = authenticationResult.AccessToken;
string refreshToken = authenticationResult.RefreshToken;
```
-->
The `access token` is the one that is actually used when the client application calls the web service. The access token is relatively short-lived (for example, one hour by default, and one day maximum). When it expires, the client application needs a new access token.

The `refresh token` is used to obtain new access/refresh token pairs when the current access token expires. It lives much longer (for exampl, 3 months by default).

The lifetime of both these tokens is configurable. For more information about how to configure and manage these tokens for your installation, see [Configurable token lifetimes in Azure Active Directory](/azure/active-directory/develop/active-directory-configurable-token-lifetimes).  

<!--
```
AuthenticationResult newAuthenticationResult =
            authenticationContext.AcquireTokenByRefreshToken(refreshToken, ClientId);
string newAccessToken = newAuthenticationResult.AccessToken;
string newRefreshToken = newAuthenticationResult.RefreshToken;
```

By the way, this also gives a new refresh token, and in this manner, the client application can keep calling the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services forever.
-->

## Summary

More and more companies adopt Microsoft 365 and integrate [!INCLUDE[prod_short](../developer/includes/prod_short.md)] with Microsoft 365 to obtain single sign-on. As this occurs, it also becomes important that customers can authenticate to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services by using their universal credentials – the Microsoft 365 user name and password. OAuth is the web service authorization protocol that makes this possible.

This article covered how to configure [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services for OAuth authorization. It also demonstrated how to create a simple .NET console application that connects to these web services. It is also possible to create other types of applications that authenticate using OAuth, such as modern Windows 10 apps, iOS apps, and Android apps. The Microsoft Azure Active Directory team has released libraries for all these platforms. See the following resources:

https://github.com/azureadsamples/nativeclient-windowsstore

https://github.com/MSOpenTech/azure-activedirectory-library-for-ios

https://github.com/MSOpenTech/azure-activedirectory-library-for-android

<!--

## Appendix: Sample Code for Prompting for a User Name and Password

The following code illustrates how you can use a Windows API to prompt for user name and password, which you can use for Basic authentication. This code will not be needed for OAuth authentication.

```
private static void PromptForCredentials(out string userName, out string password)
    {
        const int BufferSize = 200;
        // Set up variables 
        StringBuilder passwordBuffer = new StringBuilder(BufferSize + 1), 
             userBuffer = new StringBuilder(BufferSize + 1);
        var credUi = new NativeMethods.CREDUI_INFO();
        credUi.Size = Marshal.SizeOf(credUi);
        bool save = false;
        // Prompt the user 
        const NativeMethods.CREDUI_FLAGS Flags = NativeMethods.CREDUI_FLAGS.ALWAYS_SHOW_UI | 
           NativeMethods.CREDUI_FLAGS.GENERIC_CREDENTIALS |  
           NativeMethods.CREDUI_FLAGS.EXPECT_CONFIRMATION;
        NativeMethods.CredUIReturnCodes returnCode = 
           NativeMethods.CredUIPromptForCredentials(
           ref credUi, "servername", IntPtr.Zero, 0, userBuffer, BufferSize, passwordBuffer,
           BufferSize, ref save, Flags);
        if (returnCode == NativeMethods.CredUIReturnCodes.NO_ERROR)
        {
            userName = userBuffer.ToString();
            password = passwordBuffer.ToString();
            return;
        }
        userName = null;
        password = null;
    }
    private static class NativeMethods
    {
        internal struct CREDUI_INFO
        {
            internal int Size;
            internal IntPtr Parent;
            internal string MessageText;
            internal string CaptionText;
            internal IntPtr BannerBitmapHandle;
        }
        [DllImport("credui", CharSet = CharSet.Unicode)]
        internal static extern CredUIReturnCodes CredUIPromptForCredentials(
              ref CREDUI_INFO creditUR,
              string targetName,
              IntPtr reserved1,
              int error,
              StringBuilder userName,
              int maxUserName,
              StringBuilder password,
              int maxPassword,
              [MarshalAs(UnmanagedType.Bool)] ref bool save,
              CREDUI_FLAGS flags);
        [Flags]
        internal enum CREDUI_FLAGS
        {
            ALWAYS_SHOW_UI = 0x80,
            EXPECT_CONFIRMATION = 0x20000,
            GENERIC_CREDENTIALS = 0x40000,
        }
        internal enum CredUIReturnCodes
        {
            NO_ERROR = 0,
        }
    }
```
-->
## See Also
  
[Web Services Authentication](web-services-authentication.md)  
[OData Web Services](OData-Web-Services.md)  
[Configuring Business Central Server](../administration/configure-server-instance.md)  
[Authentication and Credential Types](../administration/Users-Credential-Types.md)  
