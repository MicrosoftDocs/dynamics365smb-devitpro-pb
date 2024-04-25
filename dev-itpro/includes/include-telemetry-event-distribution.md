The easiest way to see the data distribution of different event IDs in your [!INCLUDE[appinsights](azure-appinsights-name.md)] resource is to use the _Data in Telemetry_ page on the _Administration_ report in the Power BI app on telemetry data.

You can also run the KQL queries below.

```kql
// 30 day overview of event ingestion in your Application Insights resource
let lookback = 30d ;
let traces_stats = 
traces
| where timestamp > ago(lookback) 
| extend eventId = tostring( customDimensions.eventId )
| summarize count() by eventId
| extend table_name = 'traces'
| project eventId, table_name, count_
;
let pageview_stats =
pageViews
| where timestamp > ago(lookback) 
| extend eventId = tostring( customDimensions.eventID )
| summarize count() by eventId
| extend table_name = 'pageViews'
| project eventId, table_name, count_
;
traces_stats
| union pageview_stats
| order by count_ desc
| project eventId, table_name, event_count=count_
| order by event_count desc  
```

Similarly, you can see the data distribution of different environments in your [!INCLUDE[appinsights](azure-appinsights-name.md)] resource, by running the KQL queries below.

```kql
// 30 day overview of data ingestion by environment in your Application Insights resource
let lookback = 30d ;
union traces, pageViews
| where timestamp > ago(lookback) 
| extend aadTenantId = tostring( customDimensions.aadTenantId )
, environmentName = tostring( customDimensions.environmentName )
| summarize count() by aadTenantId, environmentName
| project aadTenantId, environmentName, count_
| order by aadTenantId, environmentName
```
