---
title: Analyzing Profile Configuration Lifecycle Telemetry
description: Learn about the telemetry for configuration profiles using the in-client designer.  
author: jswymer
ms.author: jswymer
ms.reviewer: solsen
ms.topic: conceptual
ms.date: 10/04/2022
ms.custom: bap-template
---

# Analyzing Profile Configuration Lifecycle Telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2022 release wave 2, version 21.0, and later

From the [!INCLUDE[web](../developer/includes/webclient.md)], users can do various operations on profiles, like, import/export, create, copy, and remove. To learn more about these operations, see [Manage User Profiles](/dynamics365/business-central/admin-users-profiles-roles) and [Customize Pages for Profiles](/dynamics365/business-central/ui-personalization-manage).

Business Central emits telemetry signals for these operations, which you can collect using an Application Insights resource. As a partner or consultant, this information gives you insight into what the service does with the profiles and page customizations you provide.

## <a name="other"></a>**Common custom dimensions**

The following table explains custom dimensions that are common to all profile configuration traces. 

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|companyName|The name of the company where the operation is applied. Added in version 20.0. |
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments).|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

## <a name="import-success"></a>Profile import succeeded 

Occurs when a profile was successfully imported from a file.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Profile import succeeded: {profileId} in app/extension {profileAppId}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0046**|
|diagnostics|List of diagnostics (severity and message) from compiler and designer. |
|profileAppId|Specifies the ID of the extension that included the profile. An empty value or  `00000000-0000-0000-0000-000000000000` indicates the profile was created from the Business Central web client or programmatically using AL code.|
|profileId|Specifies the ID of the profile that was targeted by the operation.|
|sqlExecutes|[!INCLUDE[sqlExecutes](../includes/include-telemetry-dimension-sqlexecutes.md)]|
|serverExecutionTime|[!INCLUDE[server-executiontime](../includes/include-telemetry-dimension-server-executiontime.md)]|
|sqlRowsRead|[!INCLUDE[sqlRowsRead](../includes/include-telemetry-dimension-sqlrowsread.md)]|
|result|**Success**|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|
<!--
{"component":"Dynamics 365 Business Central Server","environmentType":"Production","eventId":"LC0046","telemetrySchemaVersion":"0.1","componentVersion":"21.0.45947.0","aadTenantId":"common","profileAppId":"00000000-0000-0000-0000-000000000000","profileId":"MY TEAM MEMBER","result":"Success","sqlExecutes":"7","diagnostics":"Warning - AL1412: Page 'O365 Sales Activities RC' is marked for removal. Reason: Microsoft Invoicing has been discontinued.. Tag: 21.0.","totalTime":"00:00:00.0478840","serverExecutionTime":"00:00:00.0478840","sqlRowsRead":"6"}

-->

## <a name="import-failed"></a>Profile import failed

Occurs when a profile failed to be imported from a file.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Profile import failed: {ProfileId} in app/extension {ProfileAppId}**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0047**|
|diagnostics|List of diagnostics (severity and message) from compiler and designer. |
|failureReason|Specifies why the import operation failed.|
|profileAppId|Specifies the ID of the extension that included the profile. An empty value or  `00000000-0000-0000-0000-000000000000` indicates the profile was created from the Business Central web client or programmatically using AL code.|
|profileId|Specifies the ID of the profile that was targeted by the operation.|
|[See common custom dimensions](#other)||

<!--

-->

## <a name="export-success"></a>Profile export succeeded

Occurs when a profile was successfully exported to a file.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Profiles exported successfully**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0048**|
|diagnostics|List of diagnostics (severity and message) from compiler and designer. |
|force|Species whether the Force flag was set, allowing to export profiles even with compilation errors. |
|sqlExecutes|[!INCLUDE[sqlExecutes](../includes/include-telemetry-dimension-sqlexecutes.md)]|
|serverExecutionTime|[!INCLUDE[server-executiontime](../includes/include-telemetry-dimension-server-executiontime.md)]|
|sqlRowsRead|[!INCLUDE[sqlRowsRead](../includes/include-telemetry-dimension-sqlrowsread.md)]|
|result|**Success**|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|
|[See common custom dimensions](#other)||

<!--
{"result":"Success","component":"Dynamics 365 Business Central Server","environmentType":"Production","eventId":"LC0048","sqlExecutes":"62","telemetrySchemaVersion":"0.1","componentVersion":"21.0.45947.0","aadTenantId":"common","totalTime":"00:00:00.1123959","serverExecutionTime":"00:00:00.1123959","sqlRowsRead":"64","diagnostics":"Warning - AL1412: Page 'O365 Sales Activities RC' is marked for removal. Reason: Microsoft Invoicing has been discontinued.. Tag: 21.0.","force":"False","profileCount":"5"}


-->


## <a name="export-failed"></a>Profiles export failed

Occurs when a profile failed to be exported to a file.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Profiles failed to be exported**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0049**|
|diagnostics|List of diagnostics (severity and message) from compiler and designer. |
|failureReason|Specifies why the export operation failed.|
|[See common custom dimensions](#other)||

<!--

-->


## <a name="copy-success"></a>Profile copy succeeded

Occurs when a profile was copied successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Profile copy succeeded: {profileId} to {newProfileId} from app/extension {profileAppId} to app/extension {newProfileAppId}** |
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0050**|
|diagnostics|List of diagnostics (severity and message) from compiler and designer. |
|ProfileAppId|Specifies the ID of the extension that included the profile that was copied. An empty value or  `00000000-0000-0000-0000-000000000000` indicates the profile was created from the Business Central web client or programmatically using AL code.|
|ProfileId|Specifies the ID of the profile that was copied.|
|newProfileAppId|Specifies the ID of the extension that included the new profile. An empty value or  `00000000-0000-0000-0000-000000000000` indicates the profile was created from the Business Central web client or programmatically using AL code.|
|newProfileId|Specifies the ID of the new profile that was created from a copy.|
|sqlExecutes|[!INCLUDE[sqlExecutes](../includes/include-telemetry-dimension-sqlexecutes.md)]|
|serverExecutionTime|[!INCLUDE[server-executiontime](../includes/include-telemetry-dimension-server-executiontime.md)]|
|sqlRowsRead|[!INCLUDE[sqlRowsRead](../includes/include-telemetry-dimension-sqlrowsread.md)]|
|result|**Success**|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|
|[See common custom dimensions](#other)||

<!--
{"result":"Success","component":"Dynamics 365 Business Central Server","environmentType":"Production","eventId":"LC0050","sqlExecutes":"15","telemetrySchemaVersion":"0.1","componentVersion":"21.0.45947.0","aadTenantId":"common","totalTime":"00:00:00.0485309","serverExecutionTime":"00:00:00.0485309","sqlRowsRead":"9","profileAppId":"437dbf0e-84ff-417a-965d-ed2bb9650972","profileId":"ACCOUNTANT","newProfileId":"ACCOUNT-TEST","newProfileAppId":"00000000-0000-0000-0000-000000000000"}
-->

## <a name="copy-failed"></a>Profile copy failed

Occurs when a profile failed to copy successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Profile copy failed: {ProfileId} to {NewProfileId} from app/extension {ProfileAppId} to app/extension {NewProfileAppId}**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0051**|
|diagnostics|List of diagnostics (severity and message) from compiler and designer. |
|failureReason|Specifies why the copy operation failed.|
|profileAppId|Specifies the ID of the extension that included the profile that was copied. An empty value or  `00000000-0000-0000-0000-000000000000` indicates the profile was created from the Business Central web client or programmatically using AL code.|
|profileId|Specifies the ID of the profile that was copied.|
|newProfileAppId|Specifies the ID of the extension that included the new profile. An empty value or  `00000000-0000-0000-0000-000000000000` indicates the profile was created from the Business Central web client or programmatically using AL code.|
|newProfileId|Specifies the ID of the new profile that was created from a copy.|
|[See common custom dimensions](#other)||

<!--

-->

## <a name="create-success"></a>Profile created successfully

Occurs when a new profile was created successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Profile created successfully:  {profileId} in app/extension {profileAppId}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0052**|
|profileAppId|Specifies the ID of the extension that includes the new profile. An empty value or  `00000000-0000-0000-0000-000000000000` indicates the profile was created from the Business Central web client or programmatically using AL code.|
|profileId|Specifies the ID of the profile that was created.|
|[See common custom dimensions](#other)||

<!--
{"component":"Dynamics 365 Business Central Server","environmentType":"Production","eventId":"LC0052","telemetrySchemaVersion":"0.1","componentVersion":"21.0.45947.0","aadTenantId":"d88985a1-c863-442c-bb5f-dc622e480a8d","profileAppId":"00000000-0000-0000-0000-000000000000","profileId":"MY-NEW-PROFILE"}

-->

## <a name="removed"></a>Profile removed 

Occurs when a profile was deleted.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Profile removed: {profileId} in app/extension {profileAppId}**|
|severityLevel|**2**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0053**|
|profileAppId|Specifies the ID of the extension that included the profile that was removed. An empty value or  `00000000-0000-0000-0000-000000000000` indicates the profile was created from the Business Central web client or programmatically using AL code.|
|profileId|Specifies the ID of the profile that was removed.|
|[See common custom dimensions](#other)||

<!--
{"component":"Dynamics 365 Business Central Server","environmentType":"Production","eventId":"LC0053","telemetrySchemaVersion":"0.1","componentVersion":"21.0.45947.0","aadTenantId":"common","profileAppId":"00000000-0000-0000-0000-000000000000","profileId":"ACCOUNT-TEST"}
-->

## <a name="customization-removed"></a>Profile page customization removed

Occurs when a page customization was deleted from a profile.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Profile page customization removed: {profileId} in app/extension {profileAppId}** |
|severityLevel|**2**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0054**|
|pageId|Specifies the ID of the page object from which the customization was removed. |
|profileAppId|Specifies the ID of the extension that included the profile page customization that was removed. An empty value or  `00000000-0000-0000-0000-000000000000` indicates the profile was created from the Business Central web client or programmatically using AL code.|
|profileId|Specifies the ID of the profile that was targeted by the operation.|
|[See common custom dimensions](#other)||

<!--
{"component":"Dynamics 365 Business Central Server","environmentType":"Production","eventId":"LC0054","telemetrySchemaVersion":"0.1","componentVersion":"21.0.45947.0","aadTenantId":"common","profileAppId":"00000000-0000-0000-0000-000000000000","profileId":"ACCOUNT-TEST","pageId":"9027"}
-->

## <a name="customization-converted"></a>Profile page customization converted

Occurs when a page customization was converted successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Profile page customization converted: {ProfileId} in app/extension {ProfileAppId}**|
|severityLevel|**2**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0055**|
|pageId|Specifies the ID of the page object for which the customization was converted. |
|profileAppId|Specifies the ID of the extension that included the profile page customization. An empty value or  `00000000-0000-0000-0000-000000000000` indicates the profile was created from the Business Central web client or programmatically using AL code.|
|profileId|Specifies the ID of the profile that was targeted by the operation.|
|operationReason|Specifies the reason why the conversion was triggered.|
|[See common custom dimensions](#other)||

<!--

-->

## Next steps

Use this telemetry data to determine how the users are working with the profiles that you provide in extensions. Then, make changes to better suit the users needs as you see fit.

## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
