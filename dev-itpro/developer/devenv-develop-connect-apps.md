---
title: "Getting Started Developing Connect Apps for Dynamics 365 Business Central"
author: SusanneWindfeldPedersen
ms.author: solsen
ms.custom: na
ms.date: 03/07/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
---

[!INCLUDE[newdev_dev_preview](includes/newdev_dev_preview.md)]

# Getting Started Developing Connect Apps for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]
A Connect app establishes a point-to-point connection between [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] and a 3rd party solution or service and is typically created using standard REST API to interchange data. Any coding language capable of calling REST APIs can be used to develop your Connect app.

To explore and develop against APIs in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], you must first sign up for a trial tenant.

1. Sign up for [Dynamics 365 Business Central]().  
When you have your tenant, you can sign into the UI to play with the product, as well as explore the APIs []()
2. There are two different ways to connect to and authenticate against the APIs.  
- Use Azure Active Directory (AAD) based authentication against the common API endpoint: https://api.businesscentral.dynamics.com/v1.0/api/beta
- Use basic authentication with username and password (a so-called web service access key) against the common API endpoint that includes the user domain, for example https://api.businesscentral.dynamics.com/v1.0/<tenant user domain url>/api/beta

For more information, see [../fin-graph/endpoints-apis-for-dynamics.md].

> [!IMPORTANT]  
> For developing and going into production, you must use Azure Active Directory (AAD)/OAuth v2 authentication and the common endpoint https://api.businesscentral.dynamics.com/v1.0/api/beta. 

For exploring and initial development, you can also use basic authentication. In the following simple “Hello World” example, we are going to use basic authentication, as it is a bit faster to get up and running.

3. To set up basic authentication, log into your tenant, in the **Search** field, enter **Users** and then select the relevant link.
4. On the **Users** page, in the **Web Service Access Key** field, generate a key.  
5. Copy the generated key and use it as the password for the username. 


Now that we have the username and password, we can connect and authenticate. You can do this from code, or API explorers such as Postman or Fiddler. In the following section we will use Postman.

## Exploring the APIs with Postman
In this `Hello World` example, we are going over the basic steps required to retrieve the list of customers in our trial tenant. 

1.	First, in Postman, set up a GET call to the base API url.  
    When you call the base API url, you will get a list of all the available APIs. You can append a $metadata to the url to also get information about the fields in the APIs. The list of supported APIs and fields information can also be found in the API documentation.

    Since we are using basic authentication, we need to include the users domain in the url, e.g., call GET https://api.businesscentral.dynamics.com/v1.0/myusersdomain.com/api/beta
    
    In the Authorization tab in Postman select Basic Auth in the Type and provide the Username and Web Service Access Key from above as password. 
    
    Hit Send in Postman to execute the call, and inspect the returned body, which should include a list of the APIs
    
2.	Each resource is uniquely identified through an ID, see the following example of calling GET <endpoint>/companies: 
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



1.	The resource ID must be provided in the URL when trying to read or modify a resource or any of its children. The ID is provided in () after the API endpoint. For example, to GET the “CRONUS USA, Inc.” company details, you must call <endpoint>/companies(bb6d48b6-c7b2-4a38-9a93-ad5506407f12)/
2.	
3.	All resources, such as customers, invoices etc, live in the context of a parent company or legal entity, of which there can be more than one in Business Central tenant.  Thus it is a requirement to provide the company ID in the URL for all resource API calls. Hence, to GET all customers in the “CRONUS USA, Inc.” company, we must call a GET on the url <endpoint>/companies(bb6d48b6-c7b2-4a38-9a93-ad5506407f12)/customers


<!--
For exploring and prototyping with the APIs, use basic authentication with the tenant specific endpoint https://api.businesscentral.dynamics.com/v1.0/<tenant user domain url>/api/beta. You can set up basic authentication by creating a **Web Service Access** key in Dynamics 365 Business Central. 
2. Log into your tenant, in the Search field, enter **Users** and then select the relevant link.
3. On the **Users** page, in the **Web Service Access Key** field, generate a key.  
4. Copy the generated key and use it as the password for the username. <!-- (add link from getting started with APIs)  

> [!IMPORTANT]  
> For developing and going into production, you must, however, use Azure Active Directory (AAD)/OAuth v2 authentication and the common endpoint https://api.businesscentral.dynamics.com/v1.0/api/beta. 
 
For more information, see the preview of the [API documentation](../fin-graph/resources/dynamics_overview.md).

Download an API explorer, such as Postman or Fiddler to connect to and explore the API.
-->

## See Also
[Using Deltas With APIs](devenv-connect-apps-delta.md)  
[Using Filtering With APIs](devenv-connect-apps-filtering.md)  
[Tips for Working with APIs](devenv-connect-apps-tips.md)