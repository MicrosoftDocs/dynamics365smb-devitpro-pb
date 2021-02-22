---
title: Create automationCompany | Microsoft Docs
description: Creates an automation company object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/19/2021
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Create automationCompany

Creates an automation company in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different or there might be more than one -->
```
POST /microsoft/automation/{apiVersion}/companies({companyId})/automationCompanies
```
<!-- END>EDIT_IS_REQUIRED -->
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **automationCompany**, the **automationCompany** will not be updated. |

## Request body

In the request body, supply a JSON representation of a **automationCompany** object.

## Response

If successful, this method returns ```201 Created``` response code and a **automationCompany** object in the response body.


## Example

**Request**

Here is an example of the request.

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v1.0/companies({id})/automationCompanies
Content-type: application/json

{
    "name": "CRONUS",
    "evaluationCompany": false,
    "displayName": "CRONUS",
    "businessProfileId": ""
}
```
<!--
**Response**
Here is an example of the response.-->
<!-- START>EDIT_IS_REQUIRED. Fill in values for properties
```json
HTTP/1.1 201 Created
Content-type: application/json
{
    "id" : "",
    "name" : "",
    "evaluationCompany" : "",
    "displayName" : "",
    "businessProfileId" : ""
}
```
-->
## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[automationCompany](../resources/dynamics_automationCompany.md)  
