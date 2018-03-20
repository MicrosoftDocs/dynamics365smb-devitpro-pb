---
title: "Getting Started Developing Connect Apps for Dynamics 365 Business Central"
author: SusanneWindfeldPedersen
ms.author: solsen
ms.custom: na
ms.date: 03/09/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# Getting Started Developing Connect Apps for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]
A Connect app establishes a point-to-point connection between [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] and a 3rd party solution or service and is typically created using standard REST API to interchange data. Any coding language capable of calling REST APIs can be used to develop your Connect app. In the following section you can read about how you get started exploring the available APIs for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)].

To explore and develop against APIs in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], you must first sign up for a trial tenant and then you have to connect and authenticate. To do that, follow the steps below.

1. Sign up for [Dynamics 365 Business Central]().  
When you have your tenant, you can sign into the UI to play with the product, as well as explore the APIs []()
2. There are two different ways to connect to and authenticate against the APIs.  
    - Use Azure Active Directory (AAD) based authentication against the common API endpoint: https://api.businesscentral.dynamics.com/v1.0/api/beta
    - Use basic authentication with username and password (a so-called web service access key) against the common API endpoint that includes the user domain, for example https://api.businesscentral.dynamics.com/v1.0/cronus.com/api/beta.  
        > [!IMPORTANT]  
        > When going into production, you must use Azure Active Directory (AAD)/OAuth v2 authentication and the common endpoint https://api.businesscentral.dynamics.com/v1.0/api/beta. For exploring and initial development, you can use basic authentication. In the simple **Hello World** example below, we are going to use basic authentication, as it is a bit faster to get up and running.

3. To set up basic authentication, log into your tenant, and in the **Search** field, enter **Users** and then select the relevant link.
4. On the **Users** page, in the **Web Service Access Key** field, generate a key.  
5. Copy the generated key and use it as the password for the username. 


Now that we have the username and password, we can connect and authenticate. You can do this from code, or API explorers such as Postman or Fiddler. In the following section we will use Postman.

## Exploring the APIs with Postman
In this `Hello World` example, we are going over the basic steps required to retrieve the list of customers in our trial tenant. 

1.	First, in Postman, set up a `GET` call to the base API URL.  
    - When you call the base API URL, you will get a list of all the available APIs. You can append `$metadata` to the URL to also get information about the fields in the APIs. The list of supported APIs and fields information can also be found in the API documentation.

    - Since we are using basic authentication, we need to include the users domain in the URL, for example, call `GET https://api.businesscentral.dynamics.com/v1.0/myusersdomain.com/api/beta`
    
2. On the **Authorization** tab in Postman select **Basic Auth** in the **Type** and provide the Username and **Web Service Access Key** from above as password. 

3. Choose **Send** in Postman to execute the call, and inspect the returned body, which should include a list of the APIs.
    
Each resource is uniquely identified through an ID, see the following example of calling `GET <endpoint>/companies`:  

    ``` 
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
[Using Deltas With APIs](devenv-connect-apps-delta.md)  
[Using Filtering With APIs](devenv-connect-apps-filtering.md)  
[Tips for Working with APIs](devenv-connect-apps-tips.md)