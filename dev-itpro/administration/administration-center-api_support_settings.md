---
title: Business Central Admin Center API - Support Settings
description: Learn about the Business Central administration center API for managing support settings.
author: jswymer
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 10/05/2021
---

# Support Settings

Allows for the management of support settings, such as changing the contact, for a specific environment

## Get Support Contact

Get information about the support contact for a specified environment.

```
GET /admin/v2.13/support/applications/{applicationFamily}/environments/{environmentName}/supportcontact
```

### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

### Response

Returns information about the support contact for that environment.

```
{
  "name": string, // The name of the support contact.
  "email": string, // The email address of the support contact.
  "url": string, // A freeform url for additional support contact information such as a support website.
}
```

### Expected Error Codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

`resourceDoesNotExist` - couldn't find the necessary information to communicate with the targeted environment's API

`businessCentralCommunicationException` - an unhandled error occurred when communicating with the targeted environment's API

## Set Support Contact

Sets the support contact information for a specified environment

```
Content-Type: application/json
PUT /admin/v2.13/support/applications/{applicationFamily}/environments/{environmentName}/supportcontact
```

### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

### Body
 
```
{
  "name": string, // The name of the support contact.
  "email": string, // The email address of the support contact.
  "url": string, // A freeform url for additional support contact information such as a support website.
}
```

### Response

Returns the newly updated support contact information.
```
{
  "name": string, // The name of the support contact.
  "email": string, // The email address of the support contact.
  "url": string // A freeform url for additional support contact information such as a support website.
}
```

### Expected Error Codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

`requestBodyRequired` - the request body must be provided

`resourceDoesNotExist` - couldn't find the necessary information to communicate with the targeted environment's API

`businessCentralCommunicationException` - an unhandled error occurred when communicating with the targeted environment's API


## See Also

[The Business Central Administration Center API](administration-center-api.md)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 
