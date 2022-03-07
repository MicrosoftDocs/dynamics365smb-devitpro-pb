---
title: Business Central Admin Center API - Notifications
description: Learn about the Business Central administration center API for setting up notifications.
author: jswymer
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 10/05/2021
---

# Notifications (API)

Notifications are sent to the recipient email addresses set up for the tenant. For example, notifications are sent for update availability, successful updates, update failures, and extension validations.

## Get Notification Recipients

Returns a list of notification recipients.

```
GET /admin/v2.11/settings/notification/recipients
```

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

### Expected Error Codes

`tenantNotFound` - the calling tenant information couldn't be found

## Create Notification Recipient

Create a new notification recipient.

```
Content-Type: application/json
PUT /admin/v2.11/settings/notification/recipients
```

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

### Expected Error Codes

`invalidInput` - the targeted property is invalid in some way

  - target: {name} - the name property can't be null or whitespace
  - target: {email} - the email property can't be null or whitespace

`requestBodyRequired` - the request body must be provided

`tenantNotFound` - the calling tenant information couldn't be found

## Delete Notification Recipient

Deletes an existing notification recipient.

```
DELETE /admin/v2.11/settings/notification/recipients/{id}
```

### Route Parameters

`id` - The unique identifier of the notification recipient to delete.

### Expected Error Codes

`invalidInput` - the targeted property is invalid in some way

   - target: {id} - provided id can't be the empty guid

`tenantNotFound` - the calling tenant information couldn't be found

## Get Notification Settings

Returns the full set of notification settings including the list of recipients.

```
GET /admin/v2.11/settings/notification
```

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

### Expected Error Codes

`tenantNotFound` - the calling tenant information couldn't be found


## See Also

[The Business Central Administration Center API](administration-center-api.md)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 
