| Event ID | Area | Message |
|----------|-------------|-----------------|
| RT0001 | Authorization| [Authorization Failed (Pre Open Company): {failure reason}](../administration/telemetry-authorization-trace.md#authorizationfailedpreopencompany) |
| RT0002 | Authorization| [Authorization Failed (Open Company): {failure reason}](../administration/telemetry-authorization-trace.md#authorization-failed-open-company) |
| RT0003 | Authorization| [Authorization Succeeded (Pre Open Company)](../administration/telemetry-authorization-trace.md#authorizationsucceededpreopencompany) | 
| RT0004 | Authorization| [Authorization Succeeded (Open Company)](../administration/telemetry-authorization-trace.md#authorization-succeeded-open-company) |
| RT0005 | Performance | [Operation exceeded time threshold (SQL query)](../administration/telemetry-long-running-sql-query-trace.md) |
| RT0006 | Report generation | [Success report generation](../administration/telemetry-reports-trace.md#successful-report-generation) |
| RT0006 | Report generation | [Report rendering failed: {report ID} - {report name}](../administration/telemetry-reports-trace.md#failed-report-generation) |
| RT0007 | Report generation | [Cancellation report generation](../administration/telemetry-reports-trace.md#cancellation-report-generation) | 
| RT0008 | Incoming Web service requests | [Web service called ({category of request}): {endpoint}](../administration/telemetry-webservices-trace.md) |
| RT0009 | Performance | [Executed a SQL statement](../administration/telemetry-sql-query-trace.md#RT0009) |
|RT0010|Extension lifecycle|[Extension Update Failed: exception raised in extension {extensionName} by {extensionPublisher} (updating to version {extensionTargetedVersion})](../administration/telemetry-extension-update-trace.md#extension-update-failed-exception-raised-in-extension) |
| RT0011 | Report generation | [Report cancelled but a commit occurred](../administration/telemetry-reports-trace.md#commit) | 
| RT0012 | Performance | [Database lock timed out](../administration/telemetry-database-locks-trace.md#database-lock-timed-out) | 
| RT0013 | Performance | [Database lock snapshot: {snapshotId}](../administration/telemetry-database-locks-trace.md#database-lock-snapshot) |
| RT0014 | Security | [App Key Vault initialization succeeded: '{keyVaultUri}'](../administration/telemetry-extension-key-vault-trace.md#initializedsuccess) |
| RT0015 | Security | [App Key Vault initialization failed](../administration/telemetry-extension-key-vault-trace.md#initializedfailed) |
| RT0016 | Security | [App Key Vault secret retrieval succeeded from key vault '{keyVaultUri}'](../administration/telemetry-extension-key-vault-trace.md#retrievedsuccess) |
| RT0017 | Security | [App Key Vault secret retrieval failed from key vault: '{keyVaultUri}'](../administration/telemetry-extension-key-vault-trace.md#retrievedfailed) |
| RT0018 | Performance | [Operation exceeded time threshold (AL method)](../administration/telemetry-al-method-trace.md) |
| RT0019 | Outgoing Web service requests  | [Web Service Called (Outgoing): {endpoint}](../administration/telemetry-webservices-outgoing-trace.md) |
| RT0020 | Web service key request| [Authentication with Web Service Key succeeded: {endpoint}](../administration/telemetry-webservices-access-key-trace.md#succeeded) |
| RT0021 | Web service key request| [Authentication with Web Service Key failed: {endpoint}](../administration/telemetry-webservices-access-key-trace.md#failed) |
| RT0022 | Security | [App secret initialization failed](../administration/telemetry-app-resource-exposure-trace.md#RT0022) |
|RT0023|Troubleshooting|[Verbose telemetry enabled for session: {sessionId}](../administration/telemetry-verbose-logging-trace.md#enabled)|
|RT0024|Troubleshooting|[Verbose telemetry disabled for session: {sessionId}](../administration/telemetry-verbose-logging-trace.md#enabled)|
| RT0025 | Performance | [Database wait statistics snapshot taken: {snapshotId}](../administration/telemetry-database-wait-statistics-trace.md#waitstatstaken) | 
| RT0026 | Performance | [Database wait statistics snapshot entry: {databaseWaitStatisticsCategory}](../administration/telemetry-database-wait-statistics-trace.md#waitstatsentry) | 
| RT0027 | Performance | [Database locks snapshot: {snapshotId}](../administration/telemetry-database-locks-trace.md#RT0027) |
| RT0028 | Performance | [Database deadlock occurred](../administration/telemetry-database-deadlocks-trace.md#database-deadlock-occurred) |
|RT0029|Sessions|[The StopSession method was invoked on session {failureReason}](../administration/telemetry-stop-session-trace.md) |
| RT0030 | Error method call| [Error dialog displayed: {errorMessage}](../administration/telemetry-error-method-trace.md) | 
| RT0031 | Permission error| [Permission error shown](../administration/telemetry-permission-error-trace.md) | 
|RT0032|Permission error| [Dependency cycle discovered in permission sets](../administration/telemetry-permission-dependency-cycle-trace.md) |
|RT0033|Web service publishing| [Web service metadata error: Name for subpage of parent page '{parentPageName}' is missing. Subpage is skipped.](../administration/telemetry-webservices-publish-failure-trace.md#rt0033) |
|RT0034|Web service publishing| [Web service metadata error: Control element with id {metadataObjectName} has a missing name. The page with the control was skipped.](../administration/telemetry-webservices-publish-failure-trace.md#rt0034) |
|RT0035|Web service publishing| [Web service metadata error: The record with name '{webserviceRecordName}' was skipped.](../administration/telemetry-webservices-publish-failure-trace.md#rt0035) |
|RT0036|Web service publishing| [Web service metadata error: Table field name error, the page contaning the field with caption '{metaFieldCaption}' was skipped.](../administration/telemetry-webservices-publish-failure-trace.md#rt0036) |
|RT0038|Web service publishing| [Web service metadata warning: Multiple options while generation navigation property for tablerelation.](../administration/telemetry-webservices-publish-failure-trace.md#rt0038) |
|RT0039|Web service publishing| [Web service metadata error: The record with name '{entityName}' was skipped.](../administration/telemetry-webservices-publish-failure-trace.md#rt0039) |
|RT0040|Business events| [Business event subscription created](../administration/telemetry-business-events-trace.md#RT0040) |
|RT0041|Business events| [Business event subscription deleted](../administration/telemetry-business-events-trace.md#RT0041) |
|RT0042|Business events| [Business event subscription modified](../administration/telemetry-business-events-trace.md#RT0042) |
|RT0043|Business events| [Business event subscription enabled](../administration/telemetry-business-events-trace.md#RT0043) |
|RT0044|Business events| [Business event subscription disabled](../administration/telemetry-business-events-trace.md#RT0044) |
|RT0045|Business events| [Business event triggered successfully](../administration/telemetry-business-events-trace.md#RT0045) |
|RT0046|Business events| [Business event trigger failed](../administration/telemetry-business-events-trace.md#RT0046) |
|RT0047|Business events| [Business event notification sending failed](../administration/telemetry-business-events-trace.md#RT0047) |
|RT0048|Web service publishing| [Web service conflicting API path](../administration/telemetry-api-metadata-validation-trace.md#RT0048) |
|RT00049|Web service publishing| [Web service metadata circular API pages](../administration/telemetry-api-metadata-validation-trace.md#RT00049) |
|RT0050|Web service publishing| [Web service metadata invalid root entity](../administration/telemetry-api-metadata-validation-trace.md#RT0050) |
|RT0051|Web service publishing| [Web service metadata conflicting navigation property](../administration/telemetry-api-metadata-validation-trace.md#RT0051) |
|RT0052|Outgoing Web service requests  | [HTTP server certificate validation failed when calling endpoint: {endpoint}](../administration/telemetry-webservices-outgoing-certificate-validation-errors.md) |
|RT0053| Incoming Web service requests | [Deprecated endpoint called: {endpoint}](../administration/telemetry-webservices-trace.md#deprecated-endpoint-called-endpoint) |
|RT0054| MCP Server | [MCP Server tool called: '{toolName}'](../administration/telemetry-mcp-server-trace.md#rt0054) |
|RT0055|AI Consumption|[AI consumption recorded](../administration/telemetry-ai-consumption.md)|
|RT0056|Open in Excel|[Open in Excel: {pageName}](../administration/telemetry-open-in-excel-trace.md#RT0056)|
