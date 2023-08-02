When calling APIs and OData web services, there are many strategies that you can use to speed up your queries, like:

- Limiting the set ($filter or $top) if you're using an expensive $expand statement
- Using OData transaction $batch
- Using Data Access Intent Read-only with OData

For more information about OData query performance, see [OData Query Performance](../webservices/odata-client-performance.md).