When calling external web services using the HttpClient module in AL, make sure that you handle the HTTP status code returned by the service in case of errors. For more information, see [HttpHttpResponseMessage.HttpStatusCode() Method](../developer/methods-auto/httpresponsemessage/httpresponsemessage-httpstatuscode-method.md).


If you've enabled telemetry for your environment or app, you can use this KQL query to analyze errors in calls to external services.

```Kusto
traces
| where customDimensions has 'RT0019'
| extend httpStatusCode = toint( case( isnotempty(customDimensions.httpStatusCode), customDimensions.httpStatusCode, customDimensions.httpReturnCode ) )
| where httpStatusCode > 299
| summarize count() // how many calls fail
by httpStatusCode 
, endpoint = tostring( customDimensions.endpoint ) // which endpoint
```
