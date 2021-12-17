---
title: "OData Endpoint Performance"
description: Learn about how to develop efficient and fast OData clients
ms.custom: na
ms.date: 17/12/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
---

# OData Query Performance
[!INCLUDE[prod_short](../developer/includes/prod_short.md)] supports OData web services to make it easier to integrate with external systems. As a developer, you need to think about performance of web services both seen from the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] server (the endpoint) and as seen from the consumer (the client). This article focuses on client performance.

## Using Data Access Intent Readonly
By specifying HTTP header `Data-Access-Intent: ReadOnly` for GET requests you can instruct Business Central to run requests against a replica of the database, which can lead to improved performance. To learn more, see [Specifying Data Access Intent for GET requests](../developer/devenv-connect-apps-tips.md#DataAccessIntent).

## Using OData transaction `$batch`
Use OData transaction `$batch` requests where relevant. They can reduce the number of requests the client needs to do when errors occur. For more information, see [Tips for working with the APIs - OData transactional $batch requests](../developer/devenv-connect-apps-tips.md#batch).

## Limiting the set (`$filter` or `$top`) if you're using an expensive `$expand` statement
Limit the result set using `$filter` or `$top` if you are using an expensive `$expand` statement. If you havve moved calculated fields to a separate page, then it's good practice to limit the result set to get better performance.

## Specifying columns in the `$select` clause
Specify the columns you care about in the `$select` clause. By reducing the set of properties you reference in the `$select` clause, you can reduce the number of fields that have to be read from the database and this will improve the overall performance of the query.
 
> [!NOTE]
> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] supports table extensions. If you omit the `$select` clause, your query will return all fields from the table, including fields from other extensions.

### Specifying columns in the `$select` expand option inside an `$expand` clause
Similarly to the `$select` clause guidelines, specify the properties in the `$select` expand option within the `$expand` clause. It is easy to forget, but if you omit it, your response will contain all the properties from the expanded object.

### Using a filter on `LastModifiedOn` when you query for historical data
When you query for historical data, the chances are that you're interested in the most recent period (for example, 30 days, 90 days). Because of how data audit fields are implemented in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database, there is a updates the data in the `LastModifiedOn` system field, which makes it perfect for history filters.

### Using `$top` query option to limit the number of records
Query option `$top` is only discouraged when used together with `$skip`. If you need only a subset of records (for example, if you just want to sample some data), it is fine to use `$top` query option. Additionally, if you need to rank records according to some criteria, you should always use `$top` in combination with `$orderby` to get stable result with top ranked records.

### Do not use `$top` and `$skip` query options to implement client-driven paging
With other REST APIs, you might have implemented client-driven paging with `$top` and `$skip` query options. Don't use them with [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. There are several problems with this approach and performance is one of them. Instead, use server-driven paging.


## See Also  
[OData endpoint performance](odata-endpoint-performance.md)
[Performance Articles For Developers](../performance/performance-developer#writing-efficient-web-services)
[SOAP Web Services](SOAP-Web-Services.md)
