---
title: "Tips for working with the APIs"
author: SusanneWindfeldPedersen
ms.author: solsen
ms.custom: na
ms.date: 03/07/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---

# Tips for working with the APIs

+ Call (GET) the endpoint to list all the API
+ Call (GET) the endpoint with `$metadata` to list all metadata for the API
+ Call (GET) the endpoint with the `odata.track-changes` preference to obtain a [deltaLink](devenv-connect-apps-delta.md) to return the records that have changed in the data set since the last query
+ Call (GET) the endpoint with `$filter` to list all the records within the specified range by providing [Filters](devenv-connect-apps-filtering.md)
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
[Using Deltas With APIs](devenv-connect-apps-delta.md)  
[Using Filtering With APIs](devenv-connect-apps-filtering.md)
