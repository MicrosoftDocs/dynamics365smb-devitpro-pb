---
title: GetImageResource Method for Control Add-ins
description: Use the GetImageResource method in a Business Central control add-in to retrieve the URL of an image declared in the control add-in manifest.
author: SusanneWindfeldPedersen
ms.date: 10/05/2026
ms.topic: reference
---

# Use GetImageResource in a control add-in

Gets the URL for an image resource specified in the control add-in manifest. [!INCLUDE[prod_short](../includes/prod_short.md)] stores the resource in the database as part of the control add-in's `.zip` file. The method returns a URL that the control add-in script can use to retrieve the resource.

Learn more about control add-ins in [Control add-in object](../devenv-control-addin-object.md).
  
## Method signature  

`string Microsoft.Dynamics.NAV.GetImageResource(resourceName)`
  
## Parameters  
  
|Parameter|Description|  
|---------------|-----------------|  
|`resourceName`|Type: `String`<br /><br />The name of the image resource as declared in the control add-in manifest.|
  
## Return value  

Type: String  
  
Returns a URL for the specified image resource.  
  
## Example  

The following example assigns the returned URL to an image element with the ID `pushpinImage`.

```javascript
var imageUrl = Microsoft.Dynamics.NAV.GetImageResource('PushpinImage.png');  
document.getElementById('pushpinImage').src = imageUrl;
```  

## Related information

[AL method reference](../methods-auto/library.md)  
[GetEnvironment method](devenv-getenvironment-method.md)   
[InvokeExtensibilityMethod method](devenv-invokeextensibility-method.md)   
[OpenWindow method](devenv-openwindow-method.md)  
