---
title: "OpenWindow Method"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---

# OpenWindow Method
Opens a new browser window which navigates to the specified URL. The benefit of using this function instead of using the native browser function, is that this function also works when using the control add-in in an app, for example on a phone. If you are using the native browser function in an app, the behavior varies between the different platforms (Windows, iOS, Android).

## Method signature  
 `void Microsoft.Dynamics.NAV.OpenWindow(url)`  
  
## Parameters  
  
|Parameter|Description|  
|---------|-----------|  
|url      |Type: String <br /><br /> A string that contains the URL for the new browser window to navigate to.|  
  
  
## See Also  
 [InvokeExtensibilityMethod Method](devenv-invokeextensibility-method.md)   
 [GetImageResource Method](devenv-getimageresource-method.md)   
 [GetEnvironment Method](devenv-getenvironment-method.md)  
 [Asynchronous Considerations](../devenv-control-addin-asynchronous-considerations.md)