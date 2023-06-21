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
|RT0023|Troubleshooting|[Verbose telemetry enabled for session: {sessionId}](../administration/telemetry-verbose-logging-trace.md#enabled)|
|RT0024|Troubleshooting|[Verbose telemetry disabled for session: {sessionId}](../administration/telemetry-verbose-logging-trace.md#enabled)|
| RT0025 | Performance | [Database wait statistics snapshot taken: {snapshotId}](../administration/telemetry-database-wait-statistics-trace.md#waitstatstaken) | 
| RT0026 | Performance | [Database wait statistics snapshot entry: {databaseWaitStatisticsCategory}](../administration/telemetry-database-wait-statistics-trace.md#waitstatsentry) | 
| RT0028 | Performance | [Database deadlock occurred](../administration/telemetry-database-deadlocks-trace.md#database-deadlock-occurred) |
|RT0029|Sessions|[The StopSession method was invoked on session {failureReason}](../administration/telemetry-stop-session-trace.md) |
| RT0030 | Error method call| [Error dialog displayed: {errorMessage}](../administration/telemetry-error-method-trace.md) | 
| RT0031 | Permission error| [Permission error shown](../administration/telemetry-permission-error-trace.md) | 
|RT0032|Permission error| [Dependency cycle discovered in permission sets](../administration/telemetry-permission-dependency-cycle-trace.md) |
|RT0033|Web service publishing| [Web service metadata error: Name for subpage of parent page '{parentPageName}' is missing. Subpage is skipped.](../administration/telemetry-webservices-publish-failure-trace.md#web-service-metadata-error-name-for-subpage-of-parent-page-parentpagename-is-missing-subpage-is-skipped) |
|RT0034|Web service publishing| [Web service metadata error: Control element with id {metadataObjectName} has a missing name. The page with the control was skipped.](../administration/telemetry-webservices-publish-failure-trace.md#web-service-metadata-error-control-element-with-id-metadataobjectname-has-a-missing-name-the-page-with-the-control-was-skipped) |
|RT0035|Web service publishing| [Web service metadata error: The record with name '{webserviceRecordName}' was skipped.](../administration/telemetry-webservices-publish-failure-trace.md#web-service-metadata-error-the-record-with-name-webservicerecordname-was-skipped) |
|RT0036|Web service publishing| [Web service metadata error: Table field name error, the page contaning the field with caption '{metaFieldCaption}' was skipped.](../administration/telemetry-webservices-publish-failure-trace.md#web-service-metadata-error-table-field-name-error-the-page-containing-the-field-with-caption-metafieldcaption-was-skipped) |
|RT0038|Web service publishing| [Web service metadata warning: Multiple options while generation navigation property for tablerelation.](../administration/telemetry-webservices-publish-failure-trace.md#web-service-metadata-warning-multiple-options-while-generation-navigation-property-for-tablerelation) |
|RT0039|Web service publishing| [Web service metadata error: The record with name '{entityName}' was skipped.](../administration/telemetry-webservices-publish-failure-trace.md#rt0039) |


