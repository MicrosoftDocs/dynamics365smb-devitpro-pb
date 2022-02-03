---
title: Business Central Admin Center API - Environment Outage Reporting
description: Learn about the Business Central administration center API for reporting an environment outage.
author: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 10/05/2021
---

# Environment Outage Reporting

Enables the ability to report that an environment isn't accessible and may require attention

## Get Outage Types

Gets the list of supported categories of outages

```
GET /admin/v2.11/support/outageTypes
```

### Response

Returns a list with information about the supported outage types for reporting

```
{
  "value": [
    {
      "outageType": string, // The identifier of the outage type. 
      "name": string, // A displayable name for the outage type.
      "description": string, // A displayable description for the outage type.
    }]
}
```

### Expected Error Codes

`cannotGetOutages` - an unhandled error occurred when trying to acquire the outage types

`tenantNotFound` - the calling tenant information couldn't be found

## Get Outage Questions

Gets the list of metadata about questions that need to be answered when reporting an environment outage

```
GET /admin/v2.11/support/outageTypes/{outageType}/outageQuestions
```

### Response

Returns the list of question metadata for the provided outage type

```
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

### Expected Error Codes

`cannotGetOutageQuestions` - an unhandled error occurred when trying to acquire the outage types

`tenantNotFound` - the calling tenant information couldn't be found

## Get Reported Outages

Gets the list of outages that have been previously reported 

```
GET /admin/v2.11/support/reportedoutages
```

### Response

Returns the list of outages reported across all environments for the calling tenant

```
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

### Expected Error Codes

`cannotGetReportedOutages` - an unhandled error occurred when trying to acquire the reported outages

`tenantNotFound` - the calling tenant information couldn't be found

## Report Outage

Initiates an outage report indicating that an environment isn't accessible

```
Content-Type: application/json
POST /admin/v2.11/support/applications/{applicationFamily}/environments/{environmentName}/reportoutage
```

### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

### Body

```
{
  "outageType": string, // The category of the outage being reported.
  "outageQuestionAnswers": [{ // The collection of answers to the questions associated with the outage type.
    "id": string, // The identifier of the question being answered.
    "answer": string // The answered value of the question.
  }],
  ("contact": string), // (Optional) - The name of the person whose to contact with updates on the outage report
  ("email": string), // (Optional) - An email to contact with updates on the outage report
  ("phone": string), // (Optional) - A phone number to contact with updates on the outage report
  ("appVersion": string), // (Optional) - If known, the version of the targeted environment's application 
  ("platformVersion": string) //(Optional) - If known, the version of the targeted environment's platform
}
```

### Response

Returns information about the created outage report

```
{
    "creationStatus": string, // The status of the request to create an outage report. (enum | "Unknown", "Created", "UpdatedExisting", "Error")
    "msaasCaseNumber": string, // The identifier of the MSaaS ticket that is associated with the outage report.
}
```

### Expected Error Codes

`requestBodyRequired` - the request body must be provided

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

`failedToReportOutage` - an unhandled error occurred when trying to report the outage

## See Also

[The Business Central Administration Center API](administration-center-api)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 
