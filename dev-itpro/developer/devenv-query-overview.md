---
title: "Query Overview"
description: "Description of the query object."
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---

# Queries in Business Central

Queries enable you to retrieve records from one or more tables or data sources and then combine the data into rows and columns in a single dataset. Queries can also perform calculations on data, such as finding the sum or average of all values in a column of the dataset.

## Query Types

There are two types of query objects: normal and API.

- A normal query retrieves records from business data tables in the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] database, and can be used to display data in the user interface. This type of query is created by a query object. For more information, [Query Object](devenv-query-object.md). 
- An API query is used to generate web service endpoints and this type of page cannot be displayed in the user interface. A query of the API type can be used to join data from different data sources. The data can only be viewed. For information about creating a query of the type API, see [API Query Type](devenv-api-querytype.md).

### Query usages
  
The following examples show how you can use queries in your [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] application.  

- Creating charts that are based on a query instead of a table.  

- Saving a query as an .xml or .csv file. For example, you can use the [SAVEASXML method](methods-auto/query/query-saveasxml-integer-string-method.md) to create an .xml file that contains the resulting dataset of a query. You can use the .xml file to integrate with external applications.  

- Exposing data as an OData web service. You can register and publish a query as a web service in the same way that you can register and publish pages or codeunits as web services. You use the **Web Services** page to register and publish pages, codeunits, or queries. After you expose a query as a web service, you can import it into other applications.

- Using the query as a data source for a page. To do this, you have to copy the query resulting dataset into a temporary table and set it as the source table for the page. 

- Using the query as a data source for a report. To do this, you have to copy the query resulting dataset into a temporary table which can then be used by the report. 

- Performing calculations on data such as computing sums and averages. For more information see, [Query Totals and Grouping](devenv-query-totals-grouping.md).

- Replacing nested loops that use record variables to retrieve or to detect duplicate records. For more information, see [Using Queries Instead of Record Variables](devenv-query-using-instead-record-variables.md).

## Query Data Type
The query resulting dataset cannot be used directly by other objects such as pages and reports. Instead, you must create a [Query Data Type](methods-auto/query/query-data-type.md) instance and apply methods for handling the data from the query object. You must first call the [OPEN Method](methods-auto/query/queryinstance-open-method.md) to be able to perform actions such as reading the dataset or setting filters and you must use the [CLOSE Method](methods-auto/query/queryinstance-close-method.md) when you are finished. You can write this code in a codeunit, for example. The following example illustrates how to do this. 

```AL
var
    MyQuery: Query "Customer SalesQuantity";
    Text000: Label 'Customer name = %1, Quantity = %2';
begin
    // Sets a filter to display only sales quantities greater than 20.  
    MyQuery.SETFILTER(Quantity, '>20');   
    // Runs the query.  
    MyQuery.OPEN;  
    // Reads each row in the dataset and displays a message with column values.  
    // Stops reading when there are no more rows remaining in the dataset (READ is FALSE).  
    while MyQuery.READ do  
    begin  
      MESSAGE(Text000, MyQuery.Name, MyQuery.Quantity);  
    end;  
    MyQuery.CLOSE;  
end;
```

## See Also
[Query Object](devenv-query-object.md)  
[Linking and Joining Data Items](devenv-query-links-joins.md)  
[Aggregating Data in Query Objects](devenv-query-totals-grouping.md)  
[Query Properties](properties/devenv-query-properties.md)  
[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Utilizing Read Scale-Out for Better Performance](../administration/database-read-scale-out-overview.md)  
