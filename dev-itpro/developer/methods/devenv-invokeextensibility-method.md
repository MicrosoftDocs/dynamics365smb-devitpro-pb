---
title: InvokeExtensibilityMethod method
description: Learn about the InvokeExtensibilityMethod in control add-ins for Business Central.
ms.author: solsen
ms.date: 04/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---

# InvokeExtensibilityMethod method

Invokes an AL trigger on the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] on the page that contains the control add-in. For more information, see [Control add-in object](../devenv-control-addin-object.md).

For information about best practices on making control add-ins performant, see [Control add-in best practices](../devenv-control-addin-bestpractices.md).
  
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
 
## `skipIfBusy` options

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

## See also

[AL method reference](../methods-auto/library.md)  
[GetEnvironment method](devenv-getenvironment-method.md)   
[GetImageResource method](devenv-getimageresource-method.md)  
[OpenWindow method](devenv-openwindow-method.md)  
[Asynchronous considerations](../devenv-control-addin-asynchronous-considerations.md)
