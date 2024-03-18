When calling [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services, you can inject information about the caller into telemetry for REST API and OData calls. 

- Setting the HTTP header _UserAgent_ logs requests with the httpHeaders dimension. 

- Setting the HTTP header _client-request-id_, logs requests with the httpHeaders dimension and it also sets the "OperationId"/ClientActivity in Application Insights.

This capability means you can use telemetry to see who's calling [!INCLUDE[prod_short](../developer/includes/prod_short.md)] REST APIs and OData web services. It also lets you correlate to telemetry from other web services, if you use Azure Application Insights to instrument them.