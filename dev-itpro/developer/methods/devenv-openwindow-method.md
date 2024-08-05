---
title: OpenWindow method
description: The OpenWindow method in control add-ins for Business Central.
ms.date: 04/26/2024
ms.topic: reference
author: solsen
---

# OpenWindow method

Opens a new browser window which navigates to the specified URL. The benefit of using this function instead of using the native browser function, is that this function also works when using the control add-in in an app, for example on a phone. If you are using the native browser function in an app, the behavior varies between the different platforms (Windows, iOS, Android).

## Method signature

`void Microsoft.Dynamics.NAV.OpenWindow(url)`  
  
## Parameters  
  
|Parameter|Description|  
|---------|-----------|  
|url      |Type: String <br /><br /> A string that contains the URL for the new browser window to navigate to.|  
  
  
## See also

[AL method reference](../methods-auto/library.md)  
[GetEnvironment method](devenv-getenvironment-method.md)  
[GetImageResource method](devenv-getimageresource-method.md)   
[InvokeExtensibilityMethod method](devenv-invokeextensibility-method.md)   
[Asynchronous considerations](../devenv-control-addin-asynchronous-considerations.md)