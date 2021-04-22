---
title: DELETE projects | Microsoft Docs
description: Deletes project  in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Delete projects

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Deletes projects in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
DELETE businesscentralPrefix/companies({id})/projects({id})
```

## Request headers

|Header         |Value                     |
|---------------|--------------------------|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```204 No Content``` response code and it deletes the project .

## Example

**Request**

Here is an example of the request.

```json
DELETE https://{businesscentralPrefix}/api/v2.0/companies({id})/projects({id})
```

**Response** 


Here is an example of the response. 

```json
HTTP/1.1 204 No Content
```



## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)    
[project](../resources/dynamics_project.md)    
[Get project](dynamics_project_Get.md)    
[Create project](dynamics_project_Create.md)    
[Update project](dynamics_project_Update.md)    
