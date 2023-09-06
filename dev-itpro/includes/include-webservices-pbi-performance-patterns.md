When calling APIs and OData web services from Power BI, it's important that you understand the concepts of *query folding*. The [!INCLUDE[prod_short](prod_short.md)] connector uses the [OData.Feed](/powerquery-m/odata-feed) library behind the scenes, which translates numerous the Power BI constructs into OData query parameters. For example:
 
- Table.RemoveColumns or Table.SelectColumns becomes $select
- Table.SelectRows becomes $filter
- Table.ExpandTableColumn becomes $expand

The following example illustrates how filters are pushed from Power BI to the [!INCLUDE[prod_short](prod_short.md)] connector.

It is common practice to have a query that refreshes the current date and time at every refresh in your Power BI dataset:

```powerquery-m
// LastRefreshDate query
let
    Source = DateTimeZone.UtcNow()
in
    Source
```

To apply a filter such as “the last 12 months of data” to other queries, simply use the PowerQuery _Table.SelectRows_ on appropriate dates, for example:

```powerquery-m
// SalesInvoices
// Filtered to last 12 months
let
    Source = Dynamics365BusinessCentral.ApiContentsWithOptions(null, null, null, null),
    PRODUCTION = Source{[Name="PRODUCTION"]}[Data],
    #"CRONUS USA, Inc." = PRODUCTION{[Name="CRONUS USA, Inc."]}[Data],
    v2.0 = #"CRONUS USA, Inc."{[Name="v2.0"]}[Data],
    salesInvoices_table = v2.0{[Name="salesInvoices",Signature="table"]}[Data],
    filteredRows = Table.SelectRows(salesInvoices_table, each [postingDate] > Date.From(Date.AddMonths(LastRefreshDate, -12)))
in
    filteredRows
```

For a LastRefreshDate of _2022-08-17_, the Power BI connector adds this `$filter` predicate to the API call:
`/v2.0/PRODUCTION/api/v2.0/salesInvoices?$filter=postingDate gt 2022-08-17&company=CRONUS USA, Inc.`


For more information about query folding in Power BI, see [Power Query query folding](/power-query/power-query-folding).

> [!NOTE]  
> Query folding optimizations might not be applied in a few cases:
>
> - Query folding is NOT applied when loading data preview (such as while you are editing your query and data updates in the query editor screen).
> - Be careful if you do joins with other data in Power Query. If you do, some OData.Feed limitations might apply, and the OData parameters will be applied client side instead. The Workaround from the Power BI team is to use Table.Buffer before doing any join. For more information, refere to [Known issues and limitations in OData-based Power BI connectors](/power-query/connectors/odata-feed#joins).

For more information about OData/API client performance in [!INCLUDE[prod_short](prod_short.md)], see [OData query performance](../webservices/odata-client-performance.md).
