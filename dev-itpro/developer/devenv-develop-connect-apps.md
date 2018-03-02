---
title: "Developing Connect Apps for Dynamics 365 Business Central"
author: SusanneWindfeldPedersen
ms.author: solsen
ms.custom: na
ms.date: 02/26/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
---

[!INCLUDE[newdev_dev_preview](includes/newdev_dev_preview.md)]

# Developing Connect Apps for Dynamics 365 Business Central

1. Sign up for a [Dynamics 365 Business Central sandbox]().  
For exploring and prototyping with the APIs, use basic authentication with the tenant specific endpoint https://api.financials.dynamics.com/v1.0/<tenant user domain url>/api/beta. You can set up basic authentication by creating a **Web Service Access** key in Dynamics 365 Business Central. 
2. Log into your tenant, in the Search field, enter **Users** and then select the relevant link.
3. On the **Users** page, in the **Web Service Access Key** field, generate a key.  
4. Copy the generated key and use it as the password for the username. <!-- (add link from getting started with APIs)  -->

> [!IMPORTANT]  
> For developing and going into production, you must, however, use Azure Active Directory (AAD)/OAuth v2 authentication and the common endpoint https://api.financials.dynamics.com/v1.0/api/beta. 
 
For more information, see the preview of the [API documentation](../fin-graph/resources/dynamics_overview.md).

Download an API explorer, such as Postman or Fiddler to connect to and explore the API.

### Some tips for working with the API's

+ Call (GET) the endpoint to list all the API
+ Call (GET) the endpoint with `$metadata` to list all metadata for the API
+ Call (GET) the endpoint with the `odata.track-changes` preference to obtain a [deltaLink](devenv-develop-connect-apps-for-fin.md#delta) to return the records that have changed in the data set since the last query
+ Call (GET) the endpoint with `$filter` to list all the records within the specified range by providing [Filters](devenv-develop-connect-apps-for-fin.md#filters)
+ Calling a resource API (GET) will return a list of all instances of the resource type
+ Each resource is uniquely identified through an ID, see the following example:  

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

+ The resource ID must be provided in the URL when trying to read or modify a resource or any of its children. The ID is provided in () after the API endpoint. For example, to GET the “CRONUS USA, Inc.” company details, you must call `<endpoint>/companies(bb6d48b6-c7b2-4a38-9a93-ad5506407f12)/`
+ All resources live in the context of a parent company, which means that the company ID must be provided in the URL for all resource API calls. For example, to GET all customers in the “CRONUS USA, Inc.” company, you must call `<endpoint>/companies(bb6d48b6-c7b2-4a38-9a93-ad5506407f12)/customers`

## See Also
