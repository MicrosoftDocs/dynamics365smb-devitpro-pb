---
title: Create item picture 
description: Creates a picture of the item object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/11/2022
ms.author: solsen
---

# Create item picture

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Creates the picture of the item in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
POST businesscentralPrefix/companies({companyId})/items({itemId})/picture
```

## Request headers

|Header         |Value                    |
|---------------|-------------------------|
|Authorization  |Bearer {token}. Required.|
|Content-Type   |application/json         |

## Request body
In the request body, supply a JSON representation of **items** object.

## Response

If successful, this method returns ```201 Created``` response code and a **item** object in the response body.

## Remarks

You will see two links in the response, `pictureContent@odata.mediaEditLink` and `pictureContent@odata.mediaReadLink`. Use these by making a `GET` request to download the picture, or making a `PATCH` request to upload a new picture.

`Content-Type` in the request header must be `application/octet-stream` and the request body should be the image itself in binary format.

On a local instance, using PowerShell you can then do as in the following example:

```
function Upload-File
(
[string] $Etag = '*',
[string] $Url,
[string] $SourceFilePath
)

{
$headers = @{"If-Match"=$Etag}

#Win auth
#Invoke-RestMethod -Uri $Url -Method Patch -InFile $SourceFilePath -Headers $headers -ContentType "application/octet-stream" -UseDefaultCredentials

#NavUserPwd
$Credentials = Get-Credential
Invoke-RestMethod -Uri $Url -Method Patch -InFile $SourceFilePath -Headers $headers -ContentType "application/octet-stream" -Credential $Credentials

}
```

Then run the function as follows:

```
$MyPic = "C:\Pictures\MyDog.png"
$ItemUrl = 'My-PC:19048/.../pictureContent'
Upload-File -Url $ItemUrl -SourceFilePath $MyPic
```

## Example

**Request**  
Here is an example of a request.

> [!NOTE]  
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({companyId})/items({itemId})/picture
```

**Request body**

```json

```

**Response**

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    

[Item](../resources/dynamics_item.md)  
[Get item defaultDimensions](dynamics_item_get_defaultdimensions.md)  
[Update item defaultDimensions](dynamics_item_update_defaultdimensions.md)  
[Delete item defaultDimensions](dynamics_item_delete_defaultdimensions.md)  

