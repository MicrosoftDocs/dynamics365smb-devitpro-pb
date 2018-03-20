---
title: "Developing Connect Apps for Dynamics 365 Business Central"
author: SusanneWindfeldPedersen

ms.author: solsen
ms.custom: na
ms.date: 03/16/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
redirect_url: http://www.microsoft.com
---



# Developing Connect Apps for Dynamics 365 Business Central
A Connect app establishes a connection between two independent services using an API to interchange data. A typical example of a Connect app is a payroll solution. All work related to payroll is done within your payroll service and only as a last step is the financial data posted into [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] using the API. A Connect app is mainly created using common development tools and the REST APIs made available in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)].

## Want to try it out?
With this preview, you can get started exploring the APIs that we offer for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. We do not yet support submission to AppSource for Connect apps, so for now, we encourage you to get familiar with the structure and possibilities of the API.

<!--
> [!NOTE]  
> For information about enabling the APIs on [!INCLUDE[navnow_md](includes/navnow_md.md)] see [Enabling the APIs for Microsoft Dynamics NAV](../enabling-apis-for-dynamics-nav.md).
-->

It's easy to get started. Just spin up a tenant by going through these steps.

1) Sign up for [[!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]](https://go.microsoft.com/fwlink/?linkid=847861).    
2) To connect to your tenant via APIs, you can use your tenant URL and basic authentication.  
    + The tenant's API endpoint is the tenant's base URL (up until .com) followed by `:7048/MS/api/beta/`, for example, `https://cronus.businesscentral.dynamics.com:7048/MS/api/beta/`.    
    + To set up basic authentication, create a Web Service Access key in [!INCLUDE[d365fin_md](includes/d365fin_md.md)]. On the **Users** page, in the **Web Service Access Key** field, generate a key.

   > [!NOTE]
   > For production, you should use Azure Active Directory (AAD) for authentication and the common service endpoint `https://api.businesscentral.dynamics.com/v1.0/api/beta`. However, for exploring and prototyping with the APIs, using basic authentication and the tenant URL as described will be faster.

3) Go to the documentation on the APIs, you can get our published preview [here](https://docs.microsoft.com/en-gb/dynamics-nav/fin-graph/).  
4) Download an API explorer, such as [Postman](https://www.getpostman.com/) or [Fiddler](http://www.telerik.com/fiddler) to connect to and explore the API.

### Some tips for working with the APIs

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

### Delta

Delta links are opaque, service-generated links that the client uses to retrieve subsequent changes to a result. 

> [!Note]  
> Delta token support is available only in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] and not available in Dynamics NAV.

The user can obtain a delta link from each entity API in the library by including the `odata.track-changes` preference in the header of the request. The response to the GET request returns a deltaLink parameter, providing an opaque URL.

On subsequent calls, the API consumer can use the deltaLink URL, which will provide the changes that have occurred in the data set since the initial request was made including the following points.

+ Any records that have not changed will exclude from the resulting response
+ Any added or updated entries appear as regular JSON objects with their current properties
+ Any records that have been removed will include in the response but represented only by their `"id"` and a `@odata.context` URL followed by a `/$deletedEntity`


#### Example 
In the following example, the specified changes have occurred since the initial API was called.

1. A customer name was changed to "Super Cloud"
2. A customer record was deleted
3. A new customer "Alpine Ski House" was created

When the API consumer calls a GET using the `@odata.deltaLink`, as shown below:  

```json
GET https://api.businesscentral.dynamics.com/v1.0/api/beta/companies(2d117882-81a5-489e-b956-613205b06c72)/customers?deltaToken=ZmYwMWIzZmEtMTk4OS00MWRjLTllM2UtMWE2MWNlZjE2NzEzLDIwMTgtMDEtMjNUMTc6Mjk6NDAuNTM1MTY0NlosJTJmTVMlMmZhcGklMmZiZXRhJTJmY29tcGFuaWVzKDY3MTE1YTRmLTRkZjQtNDQ1ZC1hNjYwLTlmNzU3MjgzZDhlYyklMmZpdGVtcywsVW5zcGVjaWZpZWQ=
```
The response would return with the specified changes in the result, see the following example:  

```json
{
    "@odata.context": "https://api.businesscentral.dynamics.com/v1.0/api/beta/$metadata#companies(2d117882-81a5-489e-b956-613205b06c72)/customers?deltaToken=ZmYwMWIzZmEtMTk4OS00MWRjLTllM2UtMWE2MWNlZjE2NzEzLDIwMTgtMDEtMjNUMTc6Mjk6NDAuNTM1MTY0NlosJTJmTVMlMmZhcGklMmZiZXRhJTJmY29tcGFuaWVzKDY3MTE1YTRmLTRkZjQtNDQ1ZC1hNjYwLTlmNzU3MjgzZDhlYyklMmZpdGVtcywsVW5zcGVjaWZpZWQ=",
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
            “@odata.context”: “https://api.businesscentral.dynamics.com/v1.0/api/beta/$metadata#companies(2d117882-81a5-489e-b956-613205b06c72)/customers/$deletedEntity”,
            "id": "e6b1c1f2-0694-46c0-96ec-6283627b1251",
            “reason": “changed”
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
     "@odata.deltaLink": "https://api.businesscentral.dynamics.com/v1.0/api/beta/companies(2d117882-81a5-489e-b956-613205b06c72)/customers?deltaToken=ZmYwMWIzZmEtMTk4OS00MWRjLTllM2UtMWE2MWNlZjE2NzEzLDIwMTgtMDEtMjNUMTc6Mjk6NDAuNTM1MTY0NlosJTJmTVMlMmZhcGklMmZiZXRhJTJmY29tcGFuaWVzKDY3MTE1YTRmLTRkZjQtNDQ1ZC1hNjYwLTlmNzU3MjgzZDhlYyklMmZpdGVtcywsVW5zcGVjaWZpZWQ="
}
```

#### Delta support limitations

+ The delta links apply to all entity APIs that include a persistent identifier, which is `"id"`, and the deltaLink will not apply to APIs that do not have the ID property. For example, the report APIs like balanceSheet.
+ If a deltaLink is no longer valid, the service will respond with `410 Gone`. The response should include a location header so that the client can use that to retrieve a new baseline set of results.
+ Not all entities in the API library support delta tokens. If a delta token is requested for an entity that does not support them, the service will respond with `500 Entity does not support delta requests`.
+ The client must use the deltaLink URL as provided. The URL must not be modified either by parsing it or adding any additional query string parameters including changing the filters. The deltaLink and token are specific to the original query provided.

### Filters

+ You can provide filters in API calls. The syntax for this follows the [Microsoft REST API guidelines](https://github.com/Microsoft/api-guidelines/blob/master/Guidelines.md#97-filtering). For example, to GET all open (unpaid) sales invoices above 1000.00 excl tax, call `<endpoint>/companies(bb6d48b6-c7b2-4a38-9a93-ad5506407f12)/salesInvoices?$filter=status eq 'Open' and totalAmountExcludingTax gt 1000.00`.

+ You can include filters for the delta links; which are typically based on the GET query call. When calling the API with the deltaLink to get the changes, each entity that previously did not match the filter criteria, but matches it now, returns as an `"add"` entity. Each entity that previously matched the query but no longer does, either because the entity was deleted, or the properties of the entity have changed such that it no longer matches the query parameters. In this case, it returns as a `"removed"` entry.


