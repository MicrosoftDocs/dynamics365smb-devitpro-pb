The events _OnCompanyOpen_ and _OnCompanyOpenCompleted_ are raised every time a session is created. Only when the code for all event subscribers on these events has completed can the session start running AL code. Until code has completed, the session creation process will wait. For interactive sessions, the user will see a spinner. Web service calls (SOAP, OData, or API) or background sessions (job queue, scheduled tasks, page background tasks) will not start running.

This behavior means that you must design such code in a way that is minimally intrusive, for example, set low timeouts for outgoing web service calls.

One or more of these three things typically are involved in a performance issue on logins
1. calls to external services
2. long running SQL calls to the database

If you have enabled telemetry for your environment or app, you can use this KQL query to analyze how session creation time is delayed by calls to external services.

```Kusto
traces
| where timestamp > ago(1d) // adjust as needed
| where customDimensions.eventId == 'RT0019'
| where isnotempty( customDimensions.alStackTrace ) // RT0019 only has stacktrace from 20.1
| extend StackTrace = tostring( customDimensions.alStackTrace )
, executionTimeInMs = toreal(totimespan(customDimensions.serverExecutionTime))/10000 //the datatype for executionTime is timespan
| where StackTrace has 'OnCompanyOpen' or StackTrace has 'OnCompanyOpenCompleted'
| summarize count() // how many calls
, sum(executionTimeInMs) // sum of delays for session creations (all session types are affected: UI, web service, background, ...) 
, avg(executionTimeInMs) // average session creation time delay by this app
, max(executionTimeInMs) // average session creation time delay by this app
by 
// which app is calling out from OnCompanyOpen/OnCompanyOpenCompleted?
  extensionId = tostring( customDimensions.extensionId )
, extensionName = tostring( customDimensions.extensionName )
, extensionVersion = tostring( customDimensions.extensionVersion )
// session type: UI, web service, background, ...
, clientType = tostring( customDimensions.clientType )
```

Use this KQL query to analyze how session creation time is delayed by calls to the database:

```Kusto
traces
| where timestamp > ago(1d) // adjust as needed
| where customDimensions.eventId == 'RT0005'
| where isnotempty( customDimensions.alStackTrace ) // RT0019 only has stacktrace from 20.1
| extend StackTrace = tostring( customDimensions.alStackTrace )
, executionTimeInMs = toreal(totimespan(customDimensions.executionTime))/10000 //the datatype for executionTime is timespan
| where StackTrace has 'OnCompanyOpen' or StackTrace has 'OnCompanyOpenCompleted'
| summarize count() // how many calls
, sum(executionTimeInMs) // sum of delays for session creations (all session types are affected: UI, web service, background, ...) 
, avg(executionTimeInMs) // average session creation time delay by this app
, max(executionTimeInMs) // average session creation time delay by this app
by 
// which app is querying the database
  extensionId = tostring( customDimensions.extensionId )
, extensionName = tostring( customDimensions.extensionName )
, extensionVersion = tostring( customDimensions.extensionVersion )
// session type: UI, web service, background, ...
, clientType = tostring( customDimensions.clientType )
```
