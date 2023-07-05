When calling APIs and OData web services from Power BI, it's important that you understand the concepts of *query folding*. The [!INCLUDE[prod_short](prod_short.md)] connector uses the [OData.Feed](/powerquery-m/odata-feed) library behind the scenes, which translates numerous the Power BI constructs into OData query parameters. For example:
 
- Table.RemoveColumns or Table.SelectColumns becomes $select
- Table.SelectRows becomes $filter
- Table.ExpandTableColumn becomes $expand

For more information about query folding in Power BI, see [Power Query query folding](/power-query/power-query-folding).

> [!NOTE]  
> Query folding optimizations might not be applied in a few cases:
>
> - Query folding is NOT applied when loading data preview (such as while you are editing your query and data updates in the query editor screen).
> - Be careful if you do joins with other data in Power Query. If you do, some OData.Feed limitations might apply, and the OData parameters will be applied client side instead. The Workaround from the Power BI team is to use Table.Buffer before doing any join. For more information, refere to [Known issues and limitations in OData-based Power BI connectors](/power-query/connectors/odata-feed#joins).

For more information about OData/API client performance in [!INCLUDE[prod_short](prod_short.md)], see [OData query performance](../webservices/odata-client-performance.md).