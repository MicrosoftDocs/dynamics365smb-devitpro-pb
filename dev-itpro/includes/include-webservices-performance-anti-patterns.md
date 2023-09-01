Avoid using standard UI pages to expose as web service endpoints. Many things, such as fact boxes, aren't returned in web service results, but use resources to prepare.

Things that have historically caused performance issues on pages that are exposed as endpoints are:

- Heavy logic in `OnAfterGetCurrRecord` or `OnAfterGetRecord`
- Many SIFT fields
- FactBoxes

Avoid exposing calculated fields, because calculated fields are expensive. Try to move them to a separate page or to refactor the code so the value is stored on the physical table (if applicable). Complex types are also a performance hit because they take time to calculate. 

Don't use temp tables as a source if you have many records. Temp tables that are based on APIs are a performance hit. The server has to fetch and insert every record, and there's no caching on data in temp tables. Paging becomes difficult to do in a performant manner. A rule of thumb is if you have more than 100 records, don't use temp tables.

Don't insert child records belonging to same parent in parallel. This condition causes locks on parent and Integration Record tables because parallel calls try to update the same parent record. The solution is to wait for the first call to finish or use $batch, which will make sure calls get executed one after another.

Don't use a deprecated protocol such as SOAP. Instead, utilize newer technology stacks such as OData, or preferably API pages/queries. The latter are up to 10 times faster than using the SOAP protocol. One way to migrate from SOAP towards OData is to utilize OData unbound actions. For more information, see [Creating and Interacting with an OData V4 Unbound Action](../developer/devenv-creating-and-interacting-with-odatav4-unbound-action.md).