If you call an external web service using the HttpClient module in AL, be aware that the [!INCLUDE[server](../developer/includes/server.md)] blocks the execution of AL code for the session until the call completes. For interactive sessions, this behavior means that the user sees a spinning wheel during the call.  

If you have enabled telemetry for your environment or app, you can use this KQL query to analyze how much time users are delayed in the UI by calls to external services.

```Kusto
traces
| where customDimensions has 'RT0019'
| where customDimensions.clientType == 'WebClient'
| project executionTimeInMs = toreal(totimespan(customDimensions.serverExecutionTime))/10000 //the datatype for executionTime is timespan
| summarize count() // how many calls
, sum(executionTimeInMs) // sum of delays for UI sessions
, avg(executionTimeInMs) // average waiting time by this app
, max(executionTimeInMs) // average waiting time by this app
by 
// which app is calling out from the UI
  extensionId = tostring( customDimensions.extensionId )
, extensionName = tostring( customDimensions.extensionName )
, extensionVersion = tostring( customDimensions.extensionVersion )
```
