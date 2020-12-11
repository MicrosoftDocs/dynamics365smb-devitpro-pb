---
title: "StartupScript Property"
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

# StartupScript Property

Specifies the script which is invoked when a page with the control add-in is loaded.

## Applies to

- Control add-in objects

## Property Values

A path to a single script file. The default is blank, with no script being specified. 

## Remarks 

This property is typically JavaScript representing the main body of the control add-in. The script is invoked when the page that hosts the control add-in has loaded and after other scripts referenced by the [Scripts](devenv-scripts-property.md) property have loaded. 
Although this property is optional, the control add-in must either specify the StartupScript property or specify one or more scripts.
The script is embedded within the extension and must be added to the extension project folder in Visual Studio Code and referenced using a relative path. 

## Example

```AL
StartupScript = 'js/chart.js';
```

## See Also

[Properties](devenv-properties.md)   
[Control Add-In Object](../devenv-control-addin-object.md)   
 