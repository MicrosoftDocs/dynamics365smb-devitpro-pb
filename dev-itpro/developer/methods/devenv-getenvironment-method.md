---
title: "GetEnvironment Method"
description: "The GetEnvironment method in AL for Business Central"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---

# GetEnvironment Method

Gets information about the environment that the control add-in is using.  
  
## Method signature  

`object Microsoft.Dynamics.NAV.GetEnvironment()`  
  
## Return value 

Returns an object that contains the following members:  
  
|Member|Description|  
|------------|-----------------|  
|UserName|Type: String<br /><br /> The name of the user that is logged into the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)].|  
|CompanyName|Type: String<br /><br /> The name of the company that the current user is using on the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)].|  
|DeviceCategory|Type: Integer<br /><br /> An integer indicating the type of device that the control add-in is being rendered on. Possible values:<br /><br /> 0 – Desktop client, either [!INCLUDE[nav_windows](../includes/nav_windows_md.md)] or [!INCLUDE[nav_web](../includes/nav_web_md.md)].<br /><br /> 1 – [!INCLUDE[nav_tablet](../includes/nav_tablet_md.md)].<br /><br /> 2 – [!INCLUDE[nav_phone](../includes/nav_phone_md.md)].|  
|Busy|Type: Boolean<br /><br /> A boolean indicating whether the client is currently busy. The client could, for example, be busy performing an asynchronous call to the server.|  
|OnBusyChanged|Type: Function<br /><br /> A function that is called when the **Busy** state of the client has changed.<br /><br /> **Function Syntax**<br /><br /> The syntax of the function is the following:<br /><br /> `function callback()`|  
|Platform|Type: Integer<br /><br /> An integer indicating the underlying platform that the control add-in is being rendered on. Possible values:<br /><br /> 0 – [!INCLUDE[nav_windows](../includes/nav_windows_md.md)].<br /><br /> 1 – [!INCLUDE[nav_web](../includes/nav_web_md.md)], [!INCLUDE[nav_tablet](../includes/nav_tablet_md.md)], or [!INCLUDE[nav_phone](../includes/nav_phone_md.md)] in a browser.<br /><br /> 2 – [!INCLUDE[nav_uni_app](../includes/nav_uni_app_md.md)].<br /><br /> 3 - Microsoft Office add-in.|
|UserInteractionMode|Type: Integer <br /><br />An integer indicating the user interaction mode that the control add-in is being rendered under. Possible values:<br /><br /> 0 - Mouse <br /><br /> 1 - Touch|  
  
## Example

This code example illustrates how you can assign members of the object return type to variables and use the **Busy** member to determine whether the client is busy or not.  
  
```  
var environment = Microsoft.Dynamics.NAV.GetEnvironment();  
  
var userName = environment.UserName;  
var companyName = environment.CompanyName;  
  
environment.OnBusyChanged = function()   
{  
    if (environment.Busy) {  
        // The client is now busy.  
    }  
    else {  
        // The client is not busy anymore.  
    }   
}  
  
```  
  
## See Also 

[AL Method Reference](../methods-auto/library.md)  
[InvokeExtensibilityMethod Method](devenv-invokeextensibility-method.md)   
[GetImageResource Method](devenv-getimageresource-method.md)   
