---
title: Update configurationPackage | Microsoft Docs
description: Updates a  configuration package object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Update configurationPackage

Updates the properties of a configuration package object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

### Upload RapidStart package

```json
PATCH /microsoft/automation/v2.0/companies({companyId})/configurationPackages({packageId})/file('{packageCode}')/content
Content-type: application/octet-stream
Body: binary content of the RapidStart package
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **configurationPackage**, the **configuration package** will not be updated. |

## Request body

In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response

If successful, this method returns a ```204 No Content```.

## Example

**Request**

Here is an example of the request.
```json
PATCH https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/configurationPackages({packageId})/file('{packageCode}')/content
Authorization : Bearer {token}
Content-type : application/octet-stream
If-Match:*
Body: binary stream
```
<!--
**Response**
Here is an example of the response.

<!-- START>EDIT_IS_REQUIRED. Fill in values for properties
```json
HTTP/1.1 200 OK
Content-type: application/json
{
    "id" : ,
    "code" : ,
    "packageName" : ,
    "languageId" : ,
    "productVersion" : ,
    "processingOrder" : ,
    "excludeConfigurationTables" : ,
    "numberOfTables" : ,
    "numberOfRecords" : ,
    "numberOfErrors" : ,
    "importStatus" : ,
    "importError" : ,
    "applyStatus" : ,
    "applyError" :
}
```
<!-- END>EDIT_IS_REQUIRED-->
## See Also

[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)  
[configurationPackage](../resources/dynamics_configurationPackage.md)