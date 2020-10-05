---
title: "RefreshScript Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: dd671414-a7c3-44bd-a860-a8bda61c7913
caps.latest.revision: 15
author: SusanneWindfeldPedersen
---

 

# RefreshScript Property
Specifies the script which is invoked when the control add-in is refreshed.

## Applies to 
- Control add-in objects.

## Property Values 
A path to a single script file. The default is blank. 

## Remarks 
After the hosting page has been loaded and the control add-in has been initialized, the page can update itself to display the latest data at anytime. For instance, this occurs when the user has used the F5 keyboard shortcut to refresh the content of the page or when the user navigates back to a page that has the [RefreshOnActivate](devenv-refreshonactivate-property.md) property set to **true**.

You can use this property to optimize the control add-in's behavior when the page is refreshed. For example, you can use this to request the latest data that is used to power the control add-in visuals. 

This property is optional. If left blank, the script defined by [StartupScript](devenv-startupscript-property.md) will be invoked when the control add-in is refreshed. The script specified by the [RefreshScript](devenv-refreshscript-property.md) property is not called when the control add-in is initialized. 

## Code Example
```
RefreshScript = 'js/chartData.js'; 
```

## See Also  
 [Properties](devenv-properties.md)    
[Control Add-In Object](../devenv-control-addin-object.md)   

 