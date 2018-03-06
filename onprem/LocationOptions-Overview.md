---
title: "LocationOptions Overview"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 197f03a2-ac34-4f5f-af82-bc297bf58de8
caps.latest.revision: 4
---
# LocationOptions Overview
When implementing location from C/AL, there are some options that you can optionally pass to `LocationProvider.RequestLocationAsync(options)`. The options can be accessed by using `Microsoft.Dynamics.Nav.Client.Capabilities.LocationOptions` found in the `Microsoft.Dynamics.Nav.ClientExtensions` dll.  

 For most scenarios it is not necessary to specify options.  

## Location Options List  

||  
|-|  
|`bool EnableHighAccuracy`<br /><br /> A value to provide a hint to the device that this request must have the best possible location accuracy.|  
|`int Timeout`<br /><br /> The maximum length of time \(milliseconds\) that is allowed to pass to a location request.|  
|`int MaximumAge`<br /><br /> The maximum length of time \(milliseconds\) of a cached location.|  

## See Also  
 [How to: Implement Location in C/AL](How-to--Implement-Location-in-C-AL.md)
