---
title: GetEnvironment Method for Control Add-ins
description: Use the GetEnvironment method in a Business Central control add-in to read user, company, client platform, interaction mode, and busy-state details.
ms.date: 10/05/2026
ms.topic: reference
author: solsen
---

# Use the GetEnvironment method in a control add-in

Gets information about the environment that the control add-in is using. Learn more about control add-ins in [Control add-in object](../devenv-control-addin-object.md).

Learn more about control add-in performance in [Control add-in best practices](../devenv-control-addin-bestpractices.md).
  
## Method signature  

`object Microsoft.Dynamics.NAV.GetEnvironment()`  
  
## Return value 

Returns an object that contains the following members:  
  
|Member|Description|  
|------------|-----------------|  
|`UserName`|Type: `String`<br /><br />The name of the user who is signed in to the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)].|
|CompanyName|Type: String<br /><br /> The name of the company that the current user is using on the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)].|  
|DeviceCategory|Type: Integer<br /><br /> An integer indicating the type of device that the control add-in is being rendered on. Possible values:<br /><br /> 0 – Desktop client, either [!INCLUDE[nav_windows](../includes/nav_windows_md.md)] or [!INCLUDE[nav_web](../includes/nav_web_md.md)].<br /><br /> 1 – [!INCLUDE[nav_tablet](../includes/nav_tablet_md.md)].<br /><br /> 2 – [!INCLUDE[nav_phone](../includes/nav_phone_md.md)].|  
|Busy|Type: Boolean<br /><br /> A boolean indicating whether the client is currently busy. The client could, for example, be busy performing an asynchronous call to the server.|  
|`OnBusyChanged`|Type: `Function`<br /><br />A callback that runs when the client's `Busy` state changes.<br /><br />Syntax: `function onBusyChanged(busy)`, where `busy` is a `boolean` that contains the new state.|
|Platform|Type: Integer<br /><br /> An integer indicating the underlying platform that the control add-in is being rendered on. Possible values:<br /><br /> 0 – [!INCLUDE[nav_windows](../includes/nav_windows_md.md)].<br /><br /> 1 – [!INCLUDE[nav_web](../includes/nav_web_md.md)], [!INCLUDE[nav_tablet](../includes/nav_tablet_md.md)], or [!INCLUDE[nav_phone](../includes/nav_phone_md.md)] in a browser.<br /><br /> 2 – [!INCLUDE[nav_uni_app](../includes/nav_uni_app_md.md)].<br /><br /> 3 - Microsoft Office add-in.|
|UserInteractionMode|Type: Integer <br /><br />An integer indicating the user interaction mode that the control add-in is being rendered under. Possible values:<br /><br /> 0 - Mouse <br /><br /> 1 - Touch|  
|`OnClosed`|Type: `Function`<br /><br />A callback that runs when the page containing the control add-in closes. The control add-in can perform local cleanup before the page unloads it.<br /><br />**Important**<br /><br />The control add-in can't invoke an AL trigger through [InvokeExtensibilityMethod](devenv-invokeextensibility-method.md) at this point because the control add-in is already disconnected from the page.<br /><br />Syntax: `function onClosed()`|
  
## Example

This example assigns object members to variables, handles changes to the `Busy` state through `OnBusyChanged`, and uses `OnClosed` to detect when the control add-in closes.
  
```javascript
var environment = Microsoft.Dynamics.NAV.GetEnvironment();  
  
var userName = environment.UserName;  
var companyName = environment.CompanyName;  
  
environment.OnBusyChanged = function(busy)
{
    if (busy) {
        // The client is now busy.
    }
    else {
        // The client is not busy anymore.
    }
}

environment.OnClosed = function() 
{
    // This control is being closed.
}
  
```  
  
## Related information 

[AL method reference](../methods-auto/library.md)  
[GetImageResource method](devenv-getimageresource-method.md)   
[InvokeExtensibilityMethod method](devenv-invokeextensibility-method.md)   
[OpenWindow method](devenv-openwindow-method.md)  
