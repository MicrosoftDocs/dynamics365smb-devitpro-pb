---
title: "Tips for working with the APIs"
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

# Tips for working with the APIs

+ Call (GET) the endpoint to list all the API
+ Call (GET) the endpoint with `$metadata` to list all metadata for the API

<!--
+ Call (GET) the endpoint with the `odata.track-changes` preference to obtain a [deltaLink](devenv-connect-apps-delta.md) to return the records that have changed in the data set since the last query
+ Call (GET) the endpoint with `$filter` to list all the records within the specified range by providing [Filters](devenv-connect-apps-filtering.md)
-->
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

## <a name="AcceptLanguage"></a>Accept-Language

By specifying `Accept-Language` in the request header, you can set a specific language for your web service response. It is strongly recommended to use this setting, if your app is dependent on a web service response to be in a specific language. If `Accept-Language` is set, it will override default settings. This setting also controls the regional formatting settings, affecting behavior such as how date and time will be formatted.

One of the most common examples is showing error messages to the users in their language. To see which possible error messages to display, see [Error Codes](/dynamics-nav/api-reference/v1.0/dynamics_error_codes). Another common example is displaying reports in a specific language, see the example below for how to specify `Accept-Language`. The following example sets the language to always be `en-US`.

### Example

`GET businesscentralPrefix/companies({id})/salesInvoices({salesInvoiceId})/pdfDocument({salesInvoiceId})/content`

#### Request headers
|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Accept-Language|en-US|

#### Request body
Do not supply a request body for this method.

#### Reponse
If successful, this method returns a `200 OK` response code and a report PDF file in the response body.

## See Also
<!-- [Using Deltas With APIs](devenv-connect-apps-delta.md)-->  
[Using Filtering With APIs](devenv-connect-apps-filtering.md)
