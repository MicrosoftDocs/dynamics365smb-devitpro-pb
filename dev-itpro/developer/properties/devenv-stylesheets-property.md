---
title: "StyleSheets Property"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: dd671414-a7c3-44bd-a860-a8bda61c7913
caps.latest.revision: 15
author: SusanneWindfeldPedersen
---

 

# StyleSheets Property
Specifies the list of stylesheets used by the control add-in.


## Applies to 
- Control add-in objects

## Property Values 
A list of comma-separated strings that represent paths to stylesheet files. The default is blank, with no stylesheets being used by the control add-in. 

## Remarks
This property is optional and used to specify stylesheets that apply to the control add-in visuals. Stylesheets can be either external resources referenced using a URL or can be embedded within the extension. Embedded stylesheets must be added to the extension project folder in Visual Studio Code and referenced using a relative path. Stylesheets are loaded immediately when the control add-in is initialized. 

## Code Example
```
Stylesheets = 'https://www.microsoft.com/stylesheets/colors.css',
              'style.css';
```
  


## See Also  
 [Properties](devenv-properties.md)   
[Control Add-In Object](../devenv-control-addin-object.md)   
 