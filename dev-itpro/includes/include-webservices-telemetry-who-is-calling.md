When calling [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services, you can inject information about the caller into telemetry. 

- Setting the HTTP header _UserAgent_ logs requests with the httpHeaders dimension (for OData and API calls). 

- Setting the HTTP header _client-request-id_, logs requests with the httpHeaders dimension (for OData and API calls) and it also sets the "OperationId"/ClientActivity in Application Insights.

This capability means you can use telemetry to see who's calling [!INCLUDE[prod_short](../developer/includes/prod_short.md)] APIs. It also lets you correlate to telemetry from other web services, if you use Azure Application Insights to instrument them.