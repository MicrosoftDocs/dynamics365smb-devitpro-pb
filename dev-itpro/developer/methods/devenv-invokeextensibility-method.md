---
title: "InvokeExtensibilityMethod Method"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# InvokeExtensibilityMethod Method

Invokes an AL trigger on the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] on the page that contains the control add-in.  
  
## Method signature

`void Microsoft.Dynamics.NAV.InvokeExtensibilityMethod(name, arguments, skipIfBusy, callback)`  
  
## Parameters  
  
|Parameter|Description|  
|---------------|-----------------|  
|*name*|Type: String<br /><br /> A string that contains the name of the AL trigger to invoke. This must be the name of the specified event using the `[ApplicationVisible]` attribute that defines the control add-in.|  
|*arguments*|Type: Array<br /><br /> An array that contains the arguments to pass to the AL trigger. Note that the arguments must be supplied in an array even when the trigger only takes one argument.|  
|*skipIfBusy*|Type: Boolean<br /><br /> A value to indicate whether to invoke the extensibility method if the client is busy. This parameter is optional and the default value is **false**.|  
|*callback*|Type: function<br /><br /> A function that is called when the extensibility method has finished execution on the server. This parameter is optional.|  
  
> [!IMPORTANT]  
> The callback function is useful for synchronizing multiple calls to the server. This is used, for example, when transferring multiple data blocks to the server to prevent overflowing the communication channel between the client and the server.  
  
## Callback Function Syntax
  
The syntax of the callback function is the following:  
```  
function callback()
```
  
## skipIfBusy Options

The following table illustrates the different settings of `skipIfBusy` combined with the client’s status.  
  
|skipIfBusy set to|Client is busy|Action|  
|-----------------|--------------|------------|  
|**false**|**false**|Method call invoked.|  
|**false**|**true**|Method call is queued and will be invoked once the client is no longer busy.|  
|**true**|**false**|Method call invoked.|  
|**true**|**true**|No method call.|  

<!-- 
## Example  
For a detailed code example, see [Walkthrough: Creating and Using a Client Control Add-in](Walkthrough--Creating-and-Using-a-Client-Control-Add-in.md)  -->
  
```  
var map = new VEMap('controlAddIn');  
    map.onLoadMap = function () {  
    var arguments = [map.GetCenter()];  
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('MapLoaded', arguments);  
    };  
    map.LoadMap(...);  
```
## See Also

[AL Method Reference](../methods-auto/library.md)  