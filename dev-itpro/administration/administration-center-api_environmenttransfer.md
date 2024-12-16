---
title: Business Central Admin Center API - Transfer environments
description: Learn about the Business Central administration center API for transferring environments between Microsoft Entra tenants.
author: jobulsin
ms.topic: conceptual
ms.devlang: al
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 01/19/2024
---

# Business Central Admin Center API - Transfer environments

Environments can be transferred between Microsoft Entra tenants by internal administrators, for example when multiple Microsoft Entra tenants are consolidated, when a business is acquired by or merging with another business, or when a partner prepares a demo environment in their tenant that needs to be transferred to the customer tenant for the customer to evaluate.

> [!IMPORTANT]
> All environment transfer operations must be executed by internal administrators; it is not possible to authenticate API calls to the endpoints described on this page as delegated administrator or Microsoft Entra app.

> [!NOTE]  
> The API endpoints described on this page are supported from v2.20 of the Admin Center API.

## Request an environment transfer

Creates a request to transfer an environment to another Microsoft Entra tenant. 

> [!NOTE]  
> This API call must be authenticated on the source tenant.

```
POST /admin/v2.21/transfers/outgoing/applications/{applicationFamily}/environments/{environmentName}
```

### Route parameters

`applicationFamily` - Family of the environment's application as is. (for example, "BusinessCentral")
`environmentName` - Name of the environment

### Body

Specifies the Microsoft Entra tenant ID of the destination tenant and the date and time at which the transfer should run, if accepted on the destination tenant.

```
{
    "DestinationEntraTenantId": Guid, //The Microsoft Entra tenant ID of the destination tenant
    "RunAt": datetime // The date and time at which the transfer should run, if accepted on the destination tenant. Expressed as UTC timestamp.
}
```

### Response

Returns details of the operation created to request the environment transfer.

```
{
    "id": Guid, // Guid of the created operation
    "type": string, // Type of the created operation, i.e. "requestTransferToAnotherEntraTenant"
    "status": string, // Status of the created operation, i.e. "queued"
    "aadTenantId": Guid, // Microsoft Entra tenant id of the tenant for which the operation was created, the source tenant
    "createdOn": datetime, // Date and time at which the operation was created, expressed as UTC timestamp
    "createdBy": string, // Email address of the user that created the operation
    "creatorPrincipalType": string, // Authentication type for the created operation, i.e. "user"
    "errorMessage": string, // Error message, if any
    "parameters": {
        "sourceEntraTenantId": Guid, // Microsoft Entra tenant ID of the source tenant
        "destinationEntraTenantId": Guid, // Microsoft Entra tenant ID of the destination tenant
        "sourceEnvironmentName": string, // Name of the environment in the source tenant
        "environmentType": string, // Environment type, i.e. "production" or "sandbox"
        "productFamily": string, // Product family of the environment, e.g. "BusinessCentral"
        "runAt": datetime, // Date and time at which the transfer will run, if accepted on the destination tenant. Expressed as UTC timestamp
        "isAcceptedByDestinationEntraTenant": boolean, // Indicates whether the environment transfer has been accepted on the destination tenant
        "expiresOn": datetime // Date and time at which the environment transfer request expires, i.e. the time before which the transfer must be accepted on the destination tenant for it to be executed on or after the RunOnUtc time specified in the request body.
    },
    "environmentName": string, // Name of the environment
    "environmentType": string, // Type of the environment, i.e. "production" or "sandbox"
    "productFamily": string // Product family of the environment, e.g. "BusinessCentral"
}

```

## Accept an incoming environment transfer

Accepts an environment transfer on the destination tenant.

> [!NOTE]  
> This API call must be authenticated on the destination tenant.

```
POST /admin/v2.21/transfers/incoming
```

### Body

Specifies the details of the environment for which a transfer is to be accepted.

```
{
    "SourceEnvironmentName" : string, // Name of the environment in the source tenant
    "ApplicationFamily" : string, // Name of the Application Family of the environment
    "SourceEntraTenantId" : Guid, // Microsoft Entra tenant ID of the source tenant
    "DestinationEnvironmentName": string // Name the environment will have in the destination tenant
}
```

### Response

Returns the details of the operation created in the destination tenant for the environment transfer.

```
{
    "id": Guid, // ID of the operation created
    "type": string, // Type of the created operation, i.e. "moveToAnotherAadTenant"
    "status": string, // Status of the created operation, i.e. "queued"
    "aadTenantId": Guid, // Microsoft Entra tenant ID of the source tenant
    "createdOn": datetime, // Date and time at which the operation was created
    "createdBy": string, // Email address of the user that created the transfer request in the source tenant
    "creatorPrincipalType": string, // Authentication type for the created operation, i.e. "user"
    "errorMessage": string, // Error message, if any
    "parameters": {
        "sourceAadTenantId": Guid, // Microsoft Entra tenant ID of the source tenant
        "sourceEnvironmentName": string, // Environment name of the environment in the source tenant
        "destinationAadTenantId": Guid, // Microsoft Entra tenant ID of the destination tenant
        "destinationEnvironmentName": string, // Environment name of the environment in the destination tenant
        "runAt": datetime // // Date and time at which the transfer will run, expressed as UTC timestamp
    },
    "environmentName": string, // Environment name of the environment in the source tenant
    "environmentType": string, // // Type of the environment, i.e. "production" or "sandbox"
    "productFamily": string // Product family of the environment, e.g. "BusinessCentral"
}
```

## Cancel a pending outgoing transfer

Cancels a created transfer request on the source tenant.

> [!NOTE]  
> This API call must be authenticated on the source tenant.

```
DELETE /admin/v2.21/transfers/outgoing/applications/{applicationFamily}/environments/{environmentName}
```

### Route parameters

`applicationFamily` - Family of the environment's application as is. (for example, "BusinessCentral")
`environmentName` - Name of the environment

### Response

Returns the details of the operation that was canceled in the source tenant.

```
{
    "id": Guid, // ID of the operation cancelled
    "type": string, // Type of the cancelled operation, i.e. "requestTransferToAnotherEntraTenant"
    "status": string, // Status of the created operation, i.e. "canceled"
    "aadTenantId": Guid, // Microsoft Entra tenant ID of the tenant for which the operation was created, the source tenant
    "createdOn": datetime, // Date and time at which the operation was created, expressed as UTC timestamp
    "completedOn": datetime, // Date and time at which the operation was completed, expressed as UTC timestamp
    "createdBy": string, // Email address of the user that created the operation
    "creatorPrincipalType": string, // Authentication type for the created operation, i.e. "user"
    "errorMessage": string, // Error message, if any
    "parameters": {
        "sourceEntraTenantId": Guid, // Microsoft Entra tenant ID of the source tenant
        "destinationEntraTenantId": Guid, // Microsoft Entra tenant ID of the destination tenant
        "sourceEnvironmentName": string, // Environment name of the environment in the source tenant
        "environmentType": string, // Environment type, i.e. "production" or "sandbox"
        "productFamily": string, // Product family of the environment, e.g. "BusinessCentral"
        "runAt": datetime // Date and time at which the transfer would have ran. Expressed as UTC timestamp
        "isAcceptedByDestinationEntraTenant": boolean, // Indicates whether the environment transfer has been accepted on the destination tenant
        "expiresOn": datetime // Date and time at which the environment transfer request would have expired
    },
    "environmentName": string, // Name of the environment
    "environmentType": string, // Type of the environment, i.e. "production" or "sandbox"
    "productFamily": string // Product family of the environment, e.g. "BusinessCentral"
}
```

## Get list of outgoing transfers

Get a list of transfer requests on the source tenant that haven't yet been completed.

> [!NOTE]  
> This API call must be authenticated on the source tenant.

```
GET /admin/v2.21/transfers/outgoing
```

### Response
```
{
    "value": [
        {
            "id": Guid, // ID of the operation
            "type": string, // Type of the cancelled operation, i.e. "requestTransferToAnotherEntraTenant"
            "status": string, // Status of the created operation, i.e. "queued"
            "aadTenantId": Guid, // Microsoft Entra tenant ID of the tenant for which the operation was created, the source tenant
            "createdOn": datetime, // Date and time at which the operation was created, expressed as UTC timestamp
            "createdBy": string, // Email address of the user that created the operation
            "creatorPrincipalType": string, // Authentication type for the created operation, i.e. "user"
            "errorMessage": string, // Error message, if any
            "parameters": {
                "sourceEntraTenantId": Guid, // Microsoft Entra tenant ID of the source tenant
                "destinationEntraTenantId": Guid, // Microsoft Entra tenant ID of the destination tenant
                "sourceEnvironmentName": string, // Environment name of the environment in the source tenant
                "environmentType": string, // Environment type, i.e. "production" or "sandbox"
                "productFamily": string, // Product family of the environment, e.g. "BusinessCentral"
                "runAt": datetime // // Date and time at which the transfer will run, expressed as UTC timestamp
                "isAcceptedByDestinationEntraTenant": boolean, // Indicates whether the environment transfer has been accepted on the destination tenant
                "expiresOn": datetime // Date and time at which the environment transfer request expires, i.e. the time before which the transfer must be accepted on the destination tenant for it to be executed on or after the RunOnUtc time specified in the request body.
            },
            "environmentName": string, // Name of the environment
            "environmentType": string, // Type of the environment, i.e. "production" or "sandbox"
            "productFamily": string // Product family of the environment, e.g. "BusinessCentral"
        }
    ]
}
```

## Get list of incoming transfers from the specified Microsoft Entra tenant

Get a list incoming transfers on the destination tenant from a specific source tenant that haven't yet been completed.

> [!NOTE]  
> This API call must be authenticated on the destination tenant.

```
GET /admin/v2.21/transfers/incoming/{sourceEntraTenantId}
```

### Route parameters

`sourceEntraTenantId` - Microsoft Entra tenant ID for the source tenant

### Response
```
{
    "value": [
        {
            "id": Guid, // ID of the operation in the source tenant
            "type": string, // Type of the cancelled operation, i.e. "requestTransferToAnotherEntraTenant"
            "status": string, // Status of the created operation, i.e. "queued"
            "aadTenantId": Guid, // Microsoft Entra tenant ID of the tenant for which the operation was created, the source tenant
            "createdOn": datetime, // Date and time at which the operation was created, expressed as UTC timestamp
            "createdBy": string, // Email address of the user that created the operation
            "creatorPrincipalType": string, // Authentication type for the created operation, i.e. "user"
            "errorMessage": string, // Error message, if any
            "parameters": {
                "sourceEntraTenantId": Guid, // Microsoft Entra tenant ID of the source tenant
                "destinationEntraTenantId": Guid, // Microsoft Entra tenant ID of the destination tenant
                "sourceEnvironmentName": string, // Environment name of the environment in the source tenant
                "environmentType": string, // Environment type, i.e. "production" or "sandbox"
                "productFamily": string, // Product family of the environment, e.g. "BusinessCentral"
                "runAt": datetime // // Date and time at which the transfer will run, expressed as UTC timestamp
                "isAcceptedByDestinationEntraTenant": boolean, // Indicates whether the environment transfer has been accepted on the destination tenant
                "expiresOn": datetime // Date and time at which the environment transfer request expires, i.e. the time before which the transfer must be accepted on the destination tenant for it to be executed on or after the RunOnUtc time specified in the request body.
            },
            "environmentName": string, // Name of the environment
            "environmentType": string, // Type of the environment, i.e. "production" or "sandbox"
            "productFamily": string // Product family of the environment, e.g. "BusinessCentral"
        }
    ]
}
```


## Related information

[The Business Central Administration Center API](administration-center-api.md)  
[Transfer environments](tenant-admin-center-environments-move.md)
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 
