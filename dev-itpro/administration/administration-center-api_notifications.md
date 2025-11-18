---
title: Business Central Admin Center API - Notifications
ms.author: jswymer
description: Learn how to set up and manage notifications using the Business Central Admin Center API. Discover endpoints for creating, retrieving, and deleting recipients.
author: jswymer
ms.topic: reference
ms.devlang: al
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 11/17/2025
---

# Business Central Admin Center API - Notifications (API)

Notifications are sent to the recipient email addresses that are set up for the tenant. For example, notifications are sent for update availability, successful updates, update failures, and extension validations.

## Get notification recipients

Returns a list of notification recipients.

```
GET /admin/{apiVersion}/settings/notification/recipients
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

### Response

Returns a wrapped array of recipients.

```
{
  "value": 
  [
    {
      "id": GUID, // Unique identifier of the recipient
      "email": string, // Email address of the recipient
      "name": string // Full name of the recipient
    }
  ]
}
```

### Expected error codes

`tenantNotFound` - the calling tenant information couldn't be found

## Create notification recipient

Create a new notification recipient.

```
Content-Type: application/json
PUT /admin/{apiVersion}/settings/notification/recipients
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

### Body

```
{
  "email": string, // Email address of the recipient
  "name": string // Full name of the recipient
}
```

### Response

Returns the newly created recipient.

```
{
  "id": GUID, // Unique identifier of the recipient
  "email": string, // Email address of the recipient
  "name": string // Full name of the recipient
}
```

### Expected error codes

`invalidInput` - the targeted property is invalid in some way

  - target: {name} - the name property can't be null or whitespace
  - target: {email} - the email property can't be null or whitespace

`requestBodyRequired` - the request body must be provided

`tenantNotFound` - the calling tenant information couldn't be found

## Delete notification recipient

Deletes an existing notification recipient.

```
DELETE /admin/{apiVersion}/settings/notification/recipients/{id}
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`id` - The unique identifier of the notification recipient to delete.

### Expected error codes

`invalidInput` - the targeted property is invalid in some way

   - target: {id} - provided ID can't be the empty GUID

`tenantNotFound` - the calling tenant information couldn't be found

## Get notification settings

Returns the full set of notification settings including the list of recipients.

```
GET /admin/{apiVersion}/settings/notification
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

### Response

Returns the notification settings.

```
{
  "aadTenantId": GUID, // AAD Tenant ID of the caller
  "recipients": [
    {
      "id": GUID, // Unique identifier of the recipient
      "email": string, // Email address of the recipient
      "name": string // Full name of the recipient
    }
  ]
}
```

### Expected error codes

`tenantNotFound` - the calling tenant information couldn't be found


## Related information

[The Business Central Administration Center API](administration-center-api.md)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 

