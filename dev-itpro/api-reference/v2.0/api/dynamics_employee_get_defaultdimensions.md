---
title: Get employee defaultDimensions  
description: Gets an employee default dimensions in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 04/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get employee defaultDimensions

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Gets the default dimensions of the employee in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md). 
The following example gets the default dimensions of the employee entity in the response body.

```
GET businesscentralPrefix/companies({companyId})/employees({employeeId})/defaultDimensions
```
## Request header

|Header|Value|
|------|-----|
|Authorization| Bearer {token}. Required.|

## Request body
Don't supply a request body for this method.

## Response 

If successful, this method returns a `200 OK` response code and the **default dimensions** in the response body.

## Example 
**Request**

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({companyId})/employees({employeeId})/defaultDimensions
```
**Response**  
Here's an example of the response.

> [!NOTE]  
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "@odata.context":"https://api.businesscentral.dynamics.com/v2.0/api/v2.0/$metadata#companies(00aa00aa-bb11-cc22-dd33-44ee44ee44ee)/employees(aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb)/defaultDimensions",
    "value":
    [
        {
            "@odata.etag":"W/\"JzQ0OzNPaHFuS0ZQdk5oc3ZkSW9KdzVkdXk2LytjcmNqeHJJOU05SjZ1aFBYVjQ9MTswMDsn\"",
            "parentId":"aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb","dimensionId":"bbbbbbbb-1111-2222-3333-cccccccccccc",
            "dimensionCode":"DEPARTMENT",
            "dimensionValueId":"cccccccc-2222-3333-4444-dddddddddddd",
            "dimensionValueCode":"PROD",
            "postingValidation":"Same Code"
        }
    ]
} 
```

## Related information
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  

[Employees](../resources/dynamics_employee.md)  
[Create employee defaultDimensions](dynamics_employee_create_defaultdimensions.md)  
[Update employee defaultDimensions](dynamics_employee_update_defaultdimensions.md)  
[Delete employee defaultDimensions](dynamics_employee_delete_defaultdimensions.md)  

