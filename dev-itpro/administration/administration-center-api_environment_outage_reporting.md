---
title: Business Central Admin Center API - Environment Outage Reporting
description: Learn about the Business Central administration center API for reporting an environment outage.
author: jswymer
ms.topic: reference
ms.devlang: al
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 11/17/2025
---

# Business Central Admin Center API - Environment outage reporting

Enables the ability to report that an environment isn't accessible and might require attention.

## Get outage types

Gets the list of supported categories of outages.

```HTTP
GET /admin/{apiVersion}/support/outageTypes
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

### Response

Returns a list with information about the supported outage types for reporting.

```JSON
{
  "value": [
    {
      "outageType": string, // The identifier of the outage type.
      "name": string, // A displayable name for the outage type.
      "description": string, // A displayable description for the outage type.
    }]
}
```

### Expected error codes

`cannotGetOutages` - an unhandled error occurred when trying to acquire the outage types

`tenantNotFound` - the calling tenant information couldn't be found

## Get outage questions

Gets the list of metadata about questions that need to be answered when reporting an environment outage.

```HTTP
GET /admin/{apiVersion}/support/outageTypes/{outageType}/outageQuestions
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

### Response

Returns the list of question metadata for the provided outage type.

```JSON
{
  "value": [
    {
      "sequence": int, // The order in which the question should be answered
      "parentId": int, // The identifier of a toggle question whose value indicates if this question should be shown. that is if the parent value is 'true' then this question should also be answered
      "id": string, // The unique identifier of the question
      "defaultValue": string, // The default value of the question if it has no value
      "questionType": string, // (enum | "None", "Toggle", "TextField", "DateTime")
      "questionText": string, // The question's text to display
      "required": bool, // Indicates if the question must have a value
      "onText": string, // Toggle type only - display text for when the question is toggled to 'true'
      "offText": string, // Toggle type only - display text for when the question is toggled to 'false'
      "multiline": bool // Indicates if the value is intended to contain multi-line text
    }]
}
```

### Expected error codes

`cannotGetOutageQuestions` - an unhandled error occurred when trying to acquire the outage types.

`tenantNotFound` - the calling tenant information couldn't be found.

## Get reported outages

Gets the list of outages that were previously reported.

```HTTP
GET /admin/{apiVersion}/support/reportedoutages
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

### Response

Returns the list of outages reported across all environments for the calling tenant.

```JSON
{
  "value": [
    {
      "TenantId": string, // The id of the tenant who reported the outage.
      "EnvironmentId": string, // The id of the environment that was reported to have been unavailable.
      "CreatedDate": dateTime, // The date that the report was created.
      "State": string, // The current state of the outage report.
      "MsaasTicketId": string, // The identifier of the MSaaS ticket that is associated with the outage report.
      "IcmTicketId": string, // The identifier of the IcM ticket that is associated with the outage report.
      "AppVersion": string, // The version of the environment's application at the time of the outage report.
      "PlatformVersion": string, // The version of the environment's platform at the time of the outage report.
      "OutageType": string, // The category of the reported outage.
    }]
}
```

### Expected error codes

`cannotGetReportedOutages` - an unhandled error occurred when trying to acquire the reported outages.

`tenantNotFound` - the calling tenant information couldn't be found.

## Report outage

Initiates an outage report indicating that an environment isn't accessible.

```HTTP
Content-Type: application/json
POST /admin/{apiVersion}/support/applications/{applicationFamily}/environments/{environmentName}/reportoutage
```

### Route parameters

`apiVersion` - version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral").

`environmentName` - the name of the targeted environment.

### Body

```JSON
{
  "outageType": string, // The category of the outage being reported.
  "outageQuestionAnswers": [{ // The collection of answers to the questions associated with the outage type.
    "id": string, // The identifier of the question being answered.
    "answer": string // The answered value of the question.
  }],
  ("firstName": string), // (Optional) - The first name of the person whose to contact with updates on the outage report
  ("lastName": string), // (Optional) - The last name of the person whose to contact with updates on the outage report
  ("email": string), // (Optional) - An email to contact with updates on the outage report
  ("phone": string), // (Optional) - A phone number to contact with updates on the outage report. It should contain only numbers, use 00 instead of + for international number prefix.
  ("appVersion": string), // (Optional) - If known, the version of the targeted environment's application
  ("platformVersion": string) //(Optional) - If known, the version of the targeted environment's platform
}
```

### Response

Returns information about the created outage report

```JSON
{
    "creationStatus": string, // The status of the request to create an outage report. (enum | "Unknown", "Created", "UpdatedExisting", "Error")
    "msaasCaseNumber": string, // The identifier of the MSaaS ticket that is associated with the outage report.
}
```

### Expected error codes

`requestBodyRequired` - the request body must be provided,

`environmentNotFound` - the targeted environment couldn't be found.

   - target: {applicationFamily}/{environmentName}

`failedToReportOutage` - an unhandled error occurred when trying to report the outage.


## Related information

[The Business Central Administration Center API](administration-center-api.md)
[Manage Apps](tenant-admin-center-manage-apps.md)
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md)

