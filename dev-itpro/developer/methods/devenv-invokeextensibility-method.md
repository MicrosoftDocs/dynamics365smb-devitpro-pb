---
title: "InvokeExtensibilityMethod Method"
description: "The InvokeExtensibilityMethod in control add-in for Business Central"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---

# InvokeExtensibilityMethod Method

Invokes an AL trigger on the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] on the page that contains the control add-in. For more information, see [Control Add-in Object](../devenv-control-addin-object.md).

For information about best practices on making control add-ins performant, see [Control Add-in Best Practices](../devenv-control-addin-bestpractices.md).
  
## Method signature

`void Microsoft.Dynamics.NAV.InvokeExtensibilityMethod(name, arguments, skipIfBusy, successCallback, errorCallback)`  
  
## Parameters  
  
|Parameter|Description|  
|---------------|-----------------|  
|*name*|Type: String<br /><br /> A string that contains the name of the AL trigger to invoke. This must be the name of the specified event using the `[ApplicationVisible]` attribute that defines the control add-in.|  
|*arguments*|Type: Array<br /><br /> An array that contains the arguments to pass to the AL trigger. Note that the arguments must be supplied in an array even when the trigger only takes one argument.|  
|*skipIfBusy*|Type: Boolean<br /><br /> A value to indicate whether to invoke the extensibility method if the client is busy. This parameter is optional and the default value is **false**.|  
|*successCallback*|Type: function<br /><br /> A function that is called when the extensibility method has finished execution on the server. This parameter is optional.<br /><br /> **Function Syntax**<br /><br /> The syntax of the function is the following:<br /><br /> `function successCallback()`|  
|*errorCallback*|Type: function<br /><br /> A function that is called when the extensibility method could not be executed on the server. This parameter is optional.<br /><br /> **Function Syntax**<br /><br /> The syntax of the function is the following:<br /><br /> `function errorCallback()`|
  
> [!IMPORTANT]  
> The callback functions are useful for synchronizing multiple calls to the server. This is used, for example, when transferring multiple data blocks to the server to prevent overflowing the communication channel between the client and the server.  
 
## skipIfBusy Options

The following table illustrates the different settings of `skipIfBusy` combined with the client’s status.  
  
|skipIfBusy set to|Client is busy|Action|  
|-----------------|--------------|------------|  
|**false**|**false**|Method call invoked.|  
|**false**|**true**|Method call is queued and will be invoked once the client is no longer busy.|  
|**true**|**false**|Method call invoked.|  
|**true**|**true**|No method call. The `errorCallback` is invoked instead.|  

<!-- 
## Example  
For a detailed code example, see [Walkthrough: Creating and Using a Client Control Add-in](Walkthrough--Creating-and-Using-a-Client-Control-Add-in.md)  -->
  
```javascript
var map = new VEMap('controlAddIn');  
map.onLoadMap = function () {  
    var arguments = [map.GetCenter()];  
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('MapLoaded', arguments);  
};  
map.LoadMap(...);  
```
## See Also

[AL Method Reference](../methods-auto/library.md)  
[GetEnvironment Method](devenv-getenvironment-method.md)   
[GetImageResource Method](devenv-getimageresource-method.md)  
[OpenWindow Method](devenv-openwindow-method.md)  
[Asynchronous Considerations](../devenv-control-addin-asynchronous-considerations.md)
