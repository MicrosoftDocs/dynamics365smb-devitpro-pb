---
title: "API Limits in Dynamics 365 Business Central"
description: ""
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Working with API limits in Dynamics 365 Business Central

Large scale cloud services use shared resources to achieve the best possible utilization of resources – like IO, CPU, and memory. To ensure that all tenants are running smoothly, on shared resources, rate limits are applied. Without limits, one tenant might be using most resources, while other tenants running on the same resources might experience slower performance – one tenant can become a ‘noisy neighbor’.  

Dynamics 365 Business Central has a rich and flexible Web service platform, made to support a wide range of integration scenarios. Some require fast access to few data and others require lots of data for reporting purposes.

Rate limits are introduced to ensure that no single client consumes too many resources and becomes the noisy neighbor. If calling clients receives an HTTP Status Code `429 - Too Many Requests` from Dynamics 365 Business Central, the API request limits are exceeded. In these cases, the client will need to handle this.
 
> [!IMPORTANT]  
> An HTTP Status Code 429 will be returned when throttling occurs. Request limits have been exceeded.

Handling Status Code 429 requires the client to adopt a retry logic while providing a cool off period. Different strategies such as regular interval retry, incremental intervals retry, exponential back-off, or even randomization can be applied.  

Request execution time is limited to 10 minutes. If response cannot be provided within 10 minutes, the service will abort the request and return `504 - Gateway Timeout`.

Handling `504 - Gateway Timeout` requires the client to refactor long running request to execute within time limit, but splitting the request into multiple requests - and then dealing with potential 429, by applying a backoff strategy.  

There are several areas to consider, which can reduce the amount of calls from a client or integration and some also increase the throughput and reduce execution time: 

1. Use [webhooks](dynamics_subscriptions.md) to receive changes when they occur. When an entity is added, modified, or deleted, a notification is sent/pushed to subscribing clients. 

2. Polling interval might be reducible. Webhooks should be considered, thereby moving from a pull to a push model. If polling is the preferred method, ensure to apply other principles listed here.

3. [Batching](https://docs.oasis-open.org/odata/odata/v4.01/csprd05/part1-protocol/odata-v4.01-csprd05-part1-protocol.html#_Toc14172866) can be used, to perform many operations in one call. Instead of issuing multiple requests, one request can be issued. Please be aware of the batch size. If the batch is too large, a timeout will occur. 

4. Use [Filter](https://docs.oasis-open.org/odata/odata/v4.01/csprd05/part2-url-conventions/odata-v4.01-csprd05-part2-url-conventions.html#_Toc14103724) to reduce the number of entities returned by applying filtering. If the returned dataset contains multiple pages, then pages must be fetched using the continuation tokens.  
    ``` 
    GET /companies({{companyId}})/customers?$filter=lastModifiedDateTime gt 2019-08-18T20:05:51.603Z 
    ```

5. Use [Expand](https://docs.oasis-open.org/odata/odata/v4.01/csprd05/part1-protocol/odata-v4.01-csprd05-part1-protocol.html#_Toc14172769) to fetch related entities in one request. Metadata contains navigational properties from one entity to other entities, where expand can be used. Multi-level expand is possible and can be combined with Filter.  
    ```
    GET /companies({{companyId}})/salesOrders?$filter=orderDate ge 2019-05-01&$expand=paymentTerm,salesOrderLines($expand=account,item($expand=itemCategory)) 
    ```

6. Use deep inserts when possible. Body of the `POST` request can contain nested entities. Metadata will contain a Navigational property from one entity to another, where deep insert is possible.
    ```
    POST /companies({{companyId}})/salesQuotes 
    { 
        "customerId": "{{customerId}}", 
        "salesQuoteLines" :  [ 
        {"itemId": "{{itemId}}", "quantity": 10} ] 
    }
   ```

    Deep insert can also be performed in Batch calls.

## See Also

[Operational Limits for Business Central Online](/dynamics365/business-central/dev-itpro/administration/operational-limits-online)  
[Best practices on transient errors](https://docs.microsoft.com/azure/architecture/best-practices/transient-faults)  
[Using OData Batch request](https://docs.microsoft.com/openspecs/windows_protocols/ms-odata/dd99aa5c-d81e-4eac-9e07-039491356bf6)  
[Microsoft API Terms of Use](https://docs.microsoft.com/legal/microsoft-apis/terms-of-use)