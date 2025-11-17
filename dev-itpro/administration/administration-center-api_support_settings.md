---
title: Business Central Admin Center API - Support settings
ms.author: jswymer
description: Learn how to resolve support contact issues in Business Central environments using the Admin Center API. Get detailed guidance on API routes and responses.
author: jswymer
ms.topic: reference
ms.devlang: al
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 11/17/2025
---
# Business Central Admin Center API - Support settings

Allows for the management of support settings, such as changing the contact, for a specific environment

## Get support contact

Get information about the support contact for a specified environment.

```
GET /admin/{apiVersion}/support/applications/{applicationFamily}/environments/{environmentName}/supportcontact
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment

### Response

Returns information about the support contact for that environment.

```
{
  "name": string, // The name of the support contact.
  "email": string, // The email address of the support contact.
  "url": string, // A freeform url for additional support contact information such as a support website.
}
```

### Expected error codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

`resourceDoesNotExist` - couldn't find the necessary information to communicate with the targeted environment's API

`businessCentralCommunicationException` - an unhandled error occurred when communicating with the targeted environment's API

## Set support contact

Sets the support contact information for a specified environment

```
Content-Type: application/json
PUT /admin/{apiVersion}/support/applications/{applicationFamily}/environments/{environmentName}/supportcontact
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment

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

### Expected error codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

`requestBodyRequired` - the request body must be provided

`resourceDoesNotExist` - couldn't find the necessary information to communicate with the targeted environment's API

`businessCentralCommunicationException` - an unhandled error occurred when communicating with the targeted environment's API

## Related information

[The Business Central Administration Center API](administration-center-api.md)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 
