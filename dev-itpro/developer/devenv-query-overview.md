---
title: "Query Object"
description: "Description of the query object."
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# Queries in Business Central

Queries enable you to retrieve records from one or more tables or data sources and then combine the data into rows and columns in a single dataset. Queries can also perform calculations on data, such finding the sum or average of all values in a column of the dataset.

## Query Types

There are two types of query objects: normal and API.

- A normal query retrieves records from business data tables in the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] database, and can be used to display data in the user interface. This type of query is created by a query object. For more information, [Query Object](devenv-query-object.md). 
- An API query is used to generate web service endpoints and this type of page cannot be displayed in the user interface. A query of the API type can be used to join data from different data sources. The data can only be viewed. For information about creating a query of the type API, see [API Query Type](devenv-api-querytype.md).

### Query usages
  
The following examples show how you can use queries in your [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] application.  

- Creating charts that are based on a query instead of a table.  

- Saving a query as an .xml or .csv file. For example, you can use the [SAVEASXML method](methods-auto/query/query-saveasxml-integer-string-method.md) to create an .xml file that contains the resulting dataset of a query. You can use the .xml file to integrate with external applications.  

- Exposing data as an OData web service. You can register and publish a query as a web service in the same way that you can register and publish pages or codeunits as web services. You use the **Web Services** page to register and publish pages, codeunits, or queries. After you expose a query as a web service, you can import it into other applications.

## See Also
[Query Object](devenv-query-object.md)
[Linking and Joining Data Items](devenv-query-links-joins.md)  
[Aggregating Data in Query Objects](devenv-query-totals-grouping.md)  
[API Query Type](devenv-api-querytype.md)  
[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Report Object](devenv-report-object.md)  
[Page Properties](properties/devenv-page-property-overview.md)
