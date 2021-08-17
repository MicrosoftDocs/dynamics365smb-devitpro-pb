---
title: Analyzing Configuration Package Lifecycle Trace Telemetry
description: Learn about the telemetry for configuration package telemetry for Azure Application Insights.  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 04/01/2021
ms.author: jswymer
---

# Analyzing Configuration Package Lifecycle Trace Telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2020 release wave 2, version 17.2, and later

Configuration package telemetry gathers data about the following operations on configuration packages:

- Export
- Import
- Apply 
- Delete

For information about working with configuration packages, see [Prepare a Configuration Package](/dynamics365/business-central/admin-how-to-prepare-a-configuration-package) in the [!INCLUDE[prod_short](../includes/prod_short.md)] Application Help.

## <a name="exportstarted"></a>Configuration package export started

Occurs when an export operation on a configuration package is started.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Configuration package export started: {alPackageCode}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E3F**|
|alExecutionId|Specifies the ID of the export operation.|
|alObjectId|**8614**, which is the ID of the base application codeunit that handles the export of configuration packages.|
|alObjectName|**Config. XML Exchange**, which is the name of the base application codeunit that handles the export of configuration packages.|
|alObjectType|**CodeUnit**|
|alPackageCode|Specifies the ID of the configuration package being exported.|


<!--
{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","Component version":"17.0.19123.0","componentVersion":"17.0.19123.0","Environment type":"Production","environmentType":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","aadTenantId":"common","AadTenantId":"common","Component":"Dynamics 365 Business Central Server","component":"Dynamics 365 Business Central Server","eventId":"AL0000E3F","alObjectId":"8614","alObjectType":"CodeUnit","alObjectName":"Config. XML Exchange","alDataClassification":"SystemMetadata","alExecutionId":"3774e6c6-b0a5-4e30-8314-d8e582384d41","alPackageCode":"MY.W1.PACKAGE1","alCategory":"RapidStart"}

-->

<a name="other"></a>**Common custom dimensions**

The following table explains additional custom dimensions that are common to all configuration package traces. 

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alCategory|**RapidStart**|
|alDataClassification|**SystemMetadata**|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments).|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|


## <a name="exportsuccessful"></a>Configuration package exported successfully

Occurs when an export operation on a configuration package completes successfully. 

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Configuration package exported successfully: {alPackageCode}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E3G**|
|alExecutionId|Specifies the ID of the export operation.|
|alExecutionTimeInMs|Specifies the number of milliseconds it took to complete the export operation.|
|alObjectId|**8614**, which is the ID of the base application codeunit that handles the export of configuration packages.|
|alObjectName|**Config. XML Exchange**, which is the name of the base application codeunit that handles the export of configuration packages.|
|alObjectType|**CodeUnit**|
|alPackageCode|Specifies the ID of the configuration package that was exported.|
|[See common custom dimensions](#other)||

<!--
{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","Component version":"17.0.19123.0","componentVersion":"17.0.19123.0","Environment type":"Production","environmentType":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","aadTenantId":"common","AadTenantId":"common","Component":"Dynamics 365 Business Central Server","component":"Dynamics 365 Business Central Server","eventId":"AL0000E3G","alObjectId":"8614","alObjectType":"CodeUnit","alObjectName":"Config. XML Exchange","alDataClassification":"SystemMetadata","alExecutionId":"3774e6c6-b0a5-4e30-8314-d8e582384d41","alPackageCode":"MY.W1.PACKAGE1","alCategory":"RapidStart","alExecutionTimeInMs":"2207"}

-->

## <a name="importstarted"></a>Configuration package import started

Occurs when an import operation on a configuration package is started. 

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Configuration package import started: {alPackageCode}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E3H**|
|alExecutionId|Specifies the ID of the import operation.|
|alObjectId|**8614**, which is the ID of the base application codeunit that handles the import of configuration packages.|
|alObjectName|**Config. XML Exchange**, which is the name of the base application codeunit that handles the import of configuration packages.|
|alObjectType|**CodeUnit**|
|alPackageCode|Specifies the ID of the configuration package being imported.|
|[See common custom dimensions](#other)||

<!--
{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","Component version":"17.0.19123.0","Environment type":"Production","componentVersion":"17.0.19123.0","environmentType":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","aadTenantId":"common","AadTenantId":"common","component":"Dynamics 365 Business Central Server","Component":"Dynamics 365 Business Central Server","eventId":"AL0000E3H","alObjectId":"8614","alObjectName":"Config. XML Exchange","alObjectType":"CodeUnit","alDataClassification":"SystemMetadata","alPackageCode":"MY.W1.PACKAGE1","alCategory":"RapidStart","alExecutionId":"74ddbbf7-580f-444d-85bd-c9c419d39295"}

-->


## <a name="importsuccessful"></a>Configuration package imported successfully

Occurs when an import operation on a configuration package completes successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Configuration package imported successfully: {alPackageCode}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E3I**|
|alExecutionTimeInMs|Specifies the number of milliseconds it took to complete the import operation.|
|alExecutionId|Specifies the ID of the import operation.|
|alPackageCode|Specifies the ID of the configuration package that was imported.|
|alObjectId|**8614**, which is the ID of the base application codeunit that handles the import of configuration packages.|
|alObjectName|**Config. XML Exchange**, which is the name of the base application codeunit that handles the import of configuration packages.|
|alObjectType|**CodeUnit**|
|[See common custom dimensions](#other)||

<!--
{"{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","Component version":"17.0.19123.0","Environment type":"Production","componentVersion":"17.0.19123.0","environmentType":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","aadTenantId":"common","AadTenantId":"common","component":"Dynamics 365 Business Central Server","Component":"Dynamics 365 Business Central Server","eventId":"AL0000E3I","alObjectId":"8614","alObjectName":"Config. XML Exchange","alObjectType":"CodeUnit","alDataClassification":"SystemMetadata","alPackageCode":"MY.W1.PACKAGE1","alCategory":"RapidStart","alExecutionId":"74ddbbf7-580f-444d-85bd-c9c419d39295","alExecutionTimeInMs":"3300","alFileSizeInBytes":"147572"}
-->


## <a name="applystarted"></a>Configuration package apply started

Occurs when an apply operation on a configuration package is started.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Configuration package apply started: {alPackageCode}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E3N**|
|alExecutionId|Specifies the ID of the apply operation.|
|alObjectId|**8611**, which is the ID of the base application codeunit that handles applying configuration packages.|
|alObjectName|**Config. Package Management**, which is the name of the base application codeunit that handles applying configuration packages.|
|alObjectType|**CodeUnit**|
|alPackageCode|Specifies the ID of the configuration package being applied.|
|[See common custom dimensions](#other)||

<!--
{"{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","Component version":"17.0.19123.0","componentVersion":"17.0.19123.0","Environment type":"Production","environmentType":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","aadTenantId":"common","AadTenantId":"common","component":"Dynamics 365 Business Central Server","Component":"Dynamics 365 Business Central Server","eventId":"AL0000E3N","alObjectId":"8611","alObjectName":"Config. Package Management","alObjectType":"CodeUnit","alDataClassification":"SystemMetadata","alExecutionId":"a187e49b-8d08-475a-9ac5-074dcae28344","alPackageCode":"MY.W1.PACKAGE1","alCategory":"RapidStart"}

-->

## <a name="applysuccessful"></a>Configuration package applied successfully

Occurs when an apply operation on a configuration package completes successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Configuration package applied successfully: {alPackageCode}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E3O**|
|alExecutionId|Specifies the ID of the apply operation.|
|alExecutionTimeInMs|Specifies the number of milliseconds it took to complete the apply operation.|
|alErrorCount|Specifies the number of errors that occurred when applying the configuration package.|
|alFieldCount|Specifies the number of fields that were included in the migration table of the applied configuration package. |
|alObjectId|**8611**, which is the ID of the base application codeunit that applies configuration packages.|
|alObjectName|**Config. Package Management**, which is the name of the base application codeunit that applies configuration packages.|
|alObjectType|**CodeUnit**|
|alPackageCode|Specifies the ID of the configuration package that was applied.|
|alRecordCount|Specifies the number of records that were included in the applied configuration package.|
|[See common custom dimensions](#other)||

<!--
{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","Component version":"17.0.19123.0","componentVersion":"17.0.19123.0","Environment type":"Production","environmentType":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","aadTenantId":"common","AadTenantId":"common","component":"Dynamics 365 Business Central Server","Component":"Dynamics 365 Business Central Server","eventId":"AL0000E3O","alObjectId":"8611","alObjectName":"Config. Package Management","alObjectType":"CodeUnit","alDataClassification":"SystemMetadata","alExecutionId":"a187e49b-8d08-475a-9ac5-074dcae28344","alPackageCode":"MY.W1.PACKAGE1","alCategory":"RapidStart","alExecutionTimeInMs":"274","alErrorCount":"0","alFieldCount":"79","alRecordCount":"15"}

-->

## <a name="deletesuccessful"></a>Configuration package deleted successfully

Occurs when a configuration package is deleted successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Configuration package deleted successfully: {alPackageCode}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E3P**|
|alObjectId|**8611**, which is the ID of the base application codeunit that deletes configuration packages.|
|alObjectName|**Config. Package Management**, which is the name of the base application codeunit that handles deleting configuration packages.|
|alObjectType|**CodeUnit**|
|alPackageCode|Specifies the ID of the configuration package that was deleted.|
|[See common custom dimensions](#other)||

<!--
{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","Component version":"17.0.19123.0","Environment type":"Production","componentVersion":"17.0.19123.0","environmentType":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","aadTenantId":"common","AadTenantId":"common","component":"Dynamics 365 Business Central Server","Component":"Dynamics 365 Business Central Server","eventId":"AL0000E3P","alObjectId":"8611","alObjectType":"CodeUnit","alObjectName":"Config. Package Management","alDataClassification":"SystemMetadata","alPackageCode":"MY.W1.PACKAGE1","alCategory":"RapidStart"}

-->

## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
[Prepare a Configuration Package](/dynamics365/business-central/admin-how-to-prepare-a-configuration-package) in the [!INCLUDE[prod_short](../includes/prod_short.md)]  
