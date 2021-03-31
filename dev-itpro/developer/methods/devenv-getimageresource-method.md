---
title: "GetImageResource Method"
description: "The GetImageResource method in AL for Business Central"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
---

# GetImageResource Method

Gets the URL for an image resource specified in the control add-in manifest. The image resource is stored in the database as part of the .zip file for the control add-in and is exposed to the control add-in script running on the Business Central client using the URL that this method returns. 

For more information, see [Control Addin Object](../devenv-control-addin-object.md). 
  
## Method signature  

`string Microsoft.Dynamics.NAV.GetImageResource(imageName)`  
  
## Parameters  
  
|Parameter|Description|  
|---------------|-----------------|  
|imageName|Type: String<br /><br /> A string that contains the name of the image resource to get a URL for. The image name is the name that is used in the control add-in manifest to reference the image.|  
  
## Return value  

Type: String  
  
Returns a URL for the specified image resource.  
  
## Example  
  
```javascript
var map = new VEMap('controlAddIn');  
    map.LoadMap(...);  
    var pushpin = map.AddPushpin(map.GetCenter());  
    var imageUrl = Microsoft.Dynamics.NAV.GetImageResource('PushpinImage.png');  
    pushpin.SetCustomIcon("<div><img src='" + imageUrl +"'/></div>");   
```  

## See Also

[AL Method Reference](../methods-auto/library.md)  
[InvokeExtensibilityMethod Method](devenv-invokeextensibility-method.md)