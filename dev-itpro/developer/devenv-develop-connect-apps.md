---
title: "Getting Started Developing Connect Apps for Dynamics 365 Business Central"
author: SusanneWindfeldPedersen
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---

# Getting Started Developing Connect Apps for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]

A Connect app establishes a point-to-point connection between [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] and a 3rd party solution or service and is typically created using standard REST API to interchange data. Any coding language capable of calling REST APIs can be used to develop your Connect app. In the following section you can read about how you get started exploring the available APIs for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)].

To explore and develop against APIs in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], you must first sign up for a trial tenant and then you have to connect and authenticate. To do that, follow the steps below.

1. Sign up for [Dynamics 365 Business Central](https://signup.microsoft.com/signup?sku=6a4a1628-9b9a-424d-bed5-4118f0ede3fd&ru=https%3A%2F%2Fbusinesscentral.dynamics.com%2FSandbox%2F%3FredirectedFromSignup%3D1).  
When you have your tenant, you can sign into the UI to play with the product, as well as [explore the APIs](/dynamics-nav/api-reference/v2.0)
2. There are two different ways to connect to and authenticate against the APIs.  
    - Use Azure Active Directory (AAD) based authentication against the common API endpoint: `https://api.businesscentral.dynamics.com/v2.0/<environment name>/api/v2.0`
    - Use basic authentication with username and password (a so-called web service access key) against the common API endpoint that includes the user domain, for example `https://api.businesscentral.dynamics.com/v2.0/production/cronus.com/api/v2.0`.  
        > [!IMPORTANT]  
        > When going into production, you should use Azure Active Directory (AAD)/OAuth v2 authentication and the common endpoint `https://api.businesscentral.dynamics.com/v2.0/production/api/v2.0`. For exploring and initial development, you can use basic authentication.

For constructing the URL to the environment, the path needs to contain the environment name. To get all environments for the tenant call `GET https://api.businesscentral.dynamics.com/environments/v2.0/`. That will return the name for all environments in the tenant. OAuth required for this endpoint. [See Exploring the APIs with Postman and AAD authentication below](#exploring-the-apis-with-postman-and-aad-authentication).

In the following sections you can read more about setting up the two types of authentication and using both authentication methods in Postman.

APIs can also be explored through the [OpenAPI specification for Business Central](/dynamics-nav/api-reference/v1.0/dynamics-open-api).

## Setting up basic authentication
If you prefer to set up an environment with basic authentication just to explore the APIs, you can skip setting up the AAD based authentication for now and proceed with the steps below. If you, however, want to go into production, you must use AAD/Oauth v2 authentication, see the section [Setting up Azure Active Directory (AAD) based authentication](#AAD).

1. To set up basic authentication, log into your tenant, and in the **Search** field, enter **Users** and then select the relevant link.
2. Select the user to add access for, and on the **User Card** page, in the **Web Service Access Key** field, generate a key.  
3. Copy the generated key and use it as the password for the username. 

Now that we have the username and password, we can connect and authenticate. You can do this from code, or API explorers such as Postman or Fiddler. In the [Exploring the APIs with Postman and basic authentication](#exploring-the-apis-with-postman-and-basic-authentication) section we will use Postman.

## <a name="AAD"></a>Setting up Azure Active Directory (AAD) based authentication
Sign in to the [Azure Portal](https://portal.azure.com) to register [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] as an app and thereby provide access to [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] for users in the directory.

1. Follow the instructions in the [Integrating applications with Azure Active Directory](/azure/active-directory/develop/quickstart-register-app) article. The next steps elaborate on some of the specific settings you must enable.
2. On the **API permissions** page for your app, click the **Add a permission** button. 
3. Make sure the **Microsoft APIs** tab is selected. In the *Commonly used Microsoft APIs* section, click on the **Dynamics 365 Business Central** and select **Delegated permissions**.  
1. Ensure that the right permission is checked: **user_impersonation**. Use the search box if necessary.
1. Click the **Add permissions** button.
    > [!NOTE]  
    > If **Dynamics 365** does not show up in search, it's because the tenant does not have any knowledge of Dynamics 365. To make it visible, an easy way is to register for a [free trial](https://signup.microsoft.com/signup?sku=6a4a1628-9b9a-424d-bed5-4118f0ede3fd&ru=https%3A%2F%2Fbusinesscentral.dynamics.com%2FSandbox%2F%3FredirectedFromSignup%3D1) for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] with a user from the directory. 

1. From the **Certificates & secrets** page, in the **Client secrets** section, choose **New client secret**:
    - Type a key description (of instance app secret),
    - Select a key duration of either In 1 year, In 2 years, or Never Expires.
    - When you press the Add button, the key value will be displayed, copy, and save the value in a safe location.

    > [!NOTE]  
    > You'll need this key later to configure the project in Visual Studio. This key value will not be displayed again, nor retrievable by any other means, so record it as soon as it is visible from the Azure portal.

You have now set up the AAD based authentication. Next, you can go exploring the APIs, see the [Exploring the APIs with Postman and AAD authentication](#exploring-the-apis-with-postman-and-aad-authentication) section below.

## Exploring the APIs with Postman and basic authentication
In this `Hello World` example, we are going over the basic steps required to retrieve the list of customers in our trial tenant. This example is based on running with basic authentication. 

1.	First, in Postman, set up a `GET` call to the base API URL.  
    - When you call the base API URL, you will get a list of all the available APIs. You can append `$metadata` to the URL to also get information about the fields in the APIs. The list of supported APIs and fields information can also be found in the API documentation.

    - Since we are using basic authentication, we need to include the users domain in the URL, for example, call `GET https://api.businesscentral.dynamics.com/v2.0/<your tenant domain>/<environment name>/api/v2.0`.
        > [!NOTE]  
        > The parameter `<your tenant domain>` is your default Azure Active Directory GUID.
    
2. On the **Authorization** tab in Postman select **Basic Auth** in the **Type** and provide the Username and **Web Service Access Key** from above as password. 

3. Choose **Send** in Postman to execute the call, and inspect the returned body, which should include a list of the APIs.

## Exploring the APIs with Postman and AAD authentication
In this `Hello World` example, we are going over the basic steps required to retrieve the list of customers in our trial tenant. This example is based on running with AAD authentication.

1. First, in Postman, set up a `GET` call to the base API URL.
    - When you call the base API URL, you will get a list of all the available APIs. You can append `$metadata` to the URL to also get information about the fields in the APIs. The list of supported APIs and fields information can also be found in the API documentation, for example, call `GET https://api.businesscentral.dynamics.com/v2.0/environment name/api/v2.0`
2. On the **Authorization** tab in Postman select **OAuth 2.0** in the **Type** and then choose **Get New Access Token**. 
3. In the **GET NEW ACCESS TOKEN** window, enter the following information as specified below:
    - In the **Token name** field, choose a descriptive name.
    - In the **Grant type** field, choose **Authorization Code**.
    - In the **Callback URL** field, specify the URL specified as the sign-on URL/Reply URL in the Azure Portal.
    - In the **Auth URL** field, specify a URL such as `https://login.windows.net/<your tenant domain>/oauth2/authorize?resource=https://api.businesscentral.dynamics.com`.
    - In the **Access Token URL** field, specify a URL such as `https://login.windows.net/<your tenant domain>/oauth2/token?resource=https://api.businesscentral.dynamics.com`.
    - In the **Client ID** field, enter the Application ID from the registered app in Azure Portal.
    - In the **Client Secret** field, enter the key generated under **Keys** that you copied in step 6 in the [Setting up Azure Active Directory (AAD) based authentication](#AAD).
    - In the **Client Authentication** field, choose the **Send client credentials in body** option.
4. Choose the **Request token** button. The first time you log in, you will get prompted for consent.
5. Scroll down and choose **Use token** button.  
An Authorization request header is now added containing the Bearer token.
6. Choose **Send** in Postman to execute the call, and inspect the returned body, which should include a list of the APIs.
   > [!NOTE]  
   > **For OAuth for testing purposes**, a multi-tenant AAD app has been created. Admin consent is needed before the ADD app can be used. Information is as follows:
   > * Grant Type: Implict
   > * Callback URL: https://localhost 
   > * Auth URL: https://login.microsoftonline.com/common/oauth2/authorize?resource=https://api.businesscentral.dynamics.com 
   > * Client ID: 060af3ac-70c3-4c14-92bb-8a88230f3f38

## Calling the API
Each resource is uniquely identified through an ID, see the following example of calling `GET <endpoint>/companies`:  

```json
    {
        "@odata.context": "<endpoint>/$metadata#companies",
        "value": [
            {
                "id": "bb6d48b6-c7b2-4a38-9a93-ad5506407f12",
                "systemVersion": "18453",
                "name": "CRONUS USA, Inc.",
                "displayName": "CRONUS USA, Inc.",
                "businessProfileId": ""
            }
        ]
    }
```

The resource ID must be provided in the URL when trying to read or modify a resource or any of its children. The ID is provided in parenthesis () after the API endpoint. For example, to GET the “CRONUS USA, Inc.” company details, you must call `<endpoint>/companies(bb6d48b6-c7b2-4a38-9a93-ad5506407f12)/`.

All resources, such as customers, invoices etc., live in the context of a parent company, of which there can be more than one in the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] tenant. Therefore, it is a requirement to provide the company ID in the URL for all resource API calls. To GET all customers in the “CRONUS USA, Inc.” company, we must call a GET on the URL `<endpoint>/companies(bb6d48b6-c7b2-4a38-9a93-ad5506407f12)/customers`.

## See Also

[Developing a Custom API](devenv-develop-custom-api.md)  
[Using Filtering With APIs](devenv-connect-apps-filtering.md)  
[Tips for Working with APIs](devenv-connect-apps-tips.md)
