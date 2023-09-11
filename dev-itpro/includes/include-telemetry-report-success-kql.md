This KQL code can help you get started analyzing report rendering:

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where operation_Name == "Success report generation" // do note that in a later version of the schema, this field will not be used 
     or customDimensions.eventId == 'RT0006'          // introduced in version 16.1
| where customDimensions.result == "Success"
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// in which extension/app
, extensionId = customDimensions.extensionId
, extensionName = customDimensions.extensionName
, extensionVersion = customDimensions.extensionVersion
, extensionPublisher = customDimensions.extensionPublisher
// in which object
, alObjectId = customDimensions.alObjectId
, alObjectName = customDimensions.alObjectName
, alObjectType = customDimensions.alObjectType
// what did the user do
, documentFormat = customDimensions.documentFormat   // documentFormat dimension added in version 20.0
, LayoutAppId = customDimensions.layoutAppId         // layout dimensions added in version 20.0
, LayoutName = customDimensions.layoutName           // layout dimensions added in version 20.0
, LayoutType = customDimensions.layoutType           // layout dimensions added in version 20.0
, reportAction = customDimensions.reportAction       // reportAction dimension added in version 20.0
, reportingEngine = customDimensions.reportingEngine // reportingEngine dimension was added in version 17.3
// which user ran the report
, usertelemetryId = case(
  toint( substring(customDimensions.componentVersion,0,2)) >= 20, user_Id // user telemetry id was introduced in the platform in version 20.0
, 'N/A'
)
// performance data
, numberOfRows = customDimensions.numberOfRows
// , serverExecutionTime = customDimensions.serverExecutionTime // the datatype for executionTime is timespan
, serverExecutionTimeInMS = toreal(totimespan(customDimensions.serverExecutionTime))/10000 // this shows how to convert timespan to millisecods
, sqlDatabaseAccessIntent = customDimensions.sqlDatabaseAccessIntent  // sqlDatabaseAccessIntent dimension added in version 19.1
, sqlExecutes = customDimensions.sqlExecutes 
, sqlRowsRead = customDimensions.sqlRowsRead
// , totalTime = customDimensions.totalTime // the datatype for totalTime is timespan
, totalTimeInMS = toreal(totimespan(customDimensions.totalTime))/10000 // this shows how to convert timespan to millisecods
| extend renderTimeInMS = totalTimeInMS - serverExecutionTimeInMS
```