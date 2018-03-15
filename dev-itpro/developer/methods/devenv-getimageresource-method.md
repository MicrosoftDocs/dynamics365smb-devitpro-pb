---
title: "GetImageResource Method"
author: solsen
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 1f2b2168-cf53-4859-98ec-99d170f05625
caps.latest.revision: 8
---
# GetImageResource Method
Used to get the URL for an image resource specified in the control add-in manifest. The image resource is stored in the NAV database as part of the .zip file for the control add-in and is exposed to the control add-in script running on the Microsoft Dynamics NAV client using the URL that this function returns.  
  
## Method Signature  
 `string Microsoft.Dynamics.NAV.GetImageResource(imageName)`  
  
## Parameters  
  
|Parameter|Description|  
|---------------|-----------------|  
|imageName|Type: String<br /><br /> A string that contains the name of the image resource to get a URL for. The image name is the name that is used in the control add-in manifest to reference the image.|  
  
## Return Value  
 Type: String  
  
 Returns a URL for the specified image resource.  
  
## Example  
<!--
 For a detailed code example, see [Walkthrough: Creating and Using a Client Control Add-in](Walkthrough--Creating-and-Using-a-Client-Control-Add-in.md)  -->
  
```  
var map = new VEMap('controlAddIn');  
    map.LoadMap(...);  
    var pushpin = map.AddPushpin(map.GetCenter());  
    var imageUrl = Microsoft.Dynamics.NAV.GetImageResource('PushpinImage.png');  
    pushpin.SetCustomIcon("<div><img src='" + imageUrl +"'/></div>");  
  
```  
  
## See Also  
 [InvokeExtensibilityMethod Method](devenv-invokeextensibility-method.md)