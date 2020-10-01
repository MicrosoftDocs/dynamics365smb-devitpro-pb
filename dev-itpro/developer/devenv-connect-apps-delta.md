---
title: "Using Delta Links With APIs"
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

# Using Delta Links With APIs

Delta links are opaque, service-generated links that the client uses to retrieve subsequent changes to a result. 

The user can obtain a delta link from each entity API in the library by including the `odata.track-changes` preference in the header of the request. The response to the GET request returns a deltaLink parameter, providing an opaque URL.

On subsequent calls, the API consumer can use the deltaLink URL, which will provide the changes that have occurred in the data set since the initial request was made including the following points.

+ Any records that have not changed will exclude from the resulting response
+ Any added or updated entries appear as regular JSON objects with their current properties
+ Any records that have been removed will include in the response but represented only by their `"id"` and a `@odata.context` URL followed by a `/$deletedEntity`

<!--
## Example

In the following example, the specified changes have occurred since the initial API was called.

1. A customer name was changed to "Super Cloud"
2. A customer record was deleted
3. A new customer "Alpine Ski House" was created

When the API consumer calls a GET using the `@odata.deltaLink`, as shown below:  

`GET`<br>
`https://api.businesscentral.dynamics.com/v1.0/api/v1.0/companies(2d117882-81a5-489e-b956-613205b06c72)/customers?`<br>`deltaToken=ZmYwMWIzZmEtMTk4OS00MWRjLTllM2UtMWE2MWNlZjE2NzEzLDIwMTgtMDEtMjNUMTc6M`<br>`jk6NDAuNTM1MTY0NlosJTJmTVMlMmZhcGklMmZiZXRhJTJmY29tcGFuaWVzKDY3MTE1YTRmLTRkZjQtN`<br>`DQ1ZC1hNjYwLTlmNzU3MjgzZDhlYyklMmZpdGVtcywsVW5zcGVjaWZpZWQ=`

The response would return with the specified changes in the result, see the following example:  

```json
{
    "@odata.context": "https://api.businesscentral.dynamics.com/v1.0/api/v1.0/$metadata#companies(2d117882-81a5-489e-b956-613205b06c72)/customers?deltaToken=ZmYwMWIzZmEtMTk4OS00MWRjLTllM2UtMWE2MWNlZjE2NzEzLDIwMTgtMDEtMjNUMTc6Mjk6NDAuNTM1MTY0NlosJTJmTVMlMmZhcGklMmZiZXRhJTJmY29tcGFuaWVzKDY3MTE1YTRmLTRkZjQtNDQ1ZC1hNjYwLTlmNzU3MjgzZDhlYyklMmZpdGVtcywsVW5zcGVjaWZpZWQ=",
    "value": [
        {
            "@odata.etag": "W/\"JzI4O0VnQUFBQUo3QlRVQU1BQXdBREFBTUFBQUFBQUE0OzQzMDgwOyc=\"",
            "id": "6cb4e290-a784-4105-b340-32bb3527bb87",
            "number": "50000",
            "displayName": "Super Cloud",
            "email": "jesse.homer@cronuscorp.net",
            "balance": 8836.8
        },
        {
            "@odata.context": "https://api.businesscentral.dynamics.com/v1.0/api/v1.0/$metadata#companies(2d117882-81a5-489e-b956-613205b06c72)/customers/$deletedEntity",
            "id": "e6b1c1f2-0694-46c0-96ec-6283627b1251",
            "reason": "changed"
        },
        {
            "@odata.etag": "W/\"JzI4O0VnQUFBQUo3QlRRQU1BQXdBREFBTUFBQUFBQUE0OzQzMDcwOyc=\"",
            "id": "71513a39-921d-44f4-866f-e15602ea12b4",
            "number": "40000",
            "displayName": "Alpine Ski House",
            "email": "paul.cannon@cronuscorp.net",
            "balance": 4316.92
        }
    ],
     "@odata.deltaLink": "https://api.businesscentral.dynamics.com/v1.0/api/v1.0/companies(2d117882-81a5-489e-b956-613205b06c72)/customers?deltaToken=ZmYwMWIzZmEtMTk4OS00MWRjLTllM2UtMWE2MWNlZjE2NzEzLDIwMTgtMDEtMjNUMTc6Mjk6NDAuNTM1MTY0NlosJTJmTVMlMmZhcGklMmZiZXRhJTJmY29tcGFuaWVzKDY3MTE1YTRmLTRkZjQtNDQ1ZC1hNjYwLTlmNzU3MjgzZDhlYyklMmZpdGVtcywsVW5zcGVjaWZpZWQ="
}
```
-->
## Delta support limitations

+ The delta links apply to all entity APIs that include a persistent identifier, which is `"id"`, and the deltaLink will not apply to APIs that do not have the ID property. For example, the report APIs like balanceSheet.
+ If a deltaLink is no longer valid, the service will respond with `410 Gone`. The response should include a location header so that the client can use that to retrieve a new baseline set of results.
+ Not all entities in the API library support delta tokens. If a delta token is requested for an entity that does not support them, the service will respond with `500 Entity does not support delta requests`.
+ The client must use the deltaLink URL as provided. The URL must not be modified either by parsing it or adding any additional query string parameters including changing the filters. The deltaLink and token are specific to the original query provided.

## See Also
[Developing Connect Apps for Dynamics 365 Business Central](devenv-develop-connect-apps.md)  
[Using Filtering With APIs](devenv-connect-apps-filtering.md)  
[Tips for working with the APIs](devenv-connect-apps-tips.md)  
