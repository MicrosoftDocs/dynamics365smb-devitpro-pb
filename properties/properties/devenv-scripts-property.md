---
title: "Scripts Property"
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

# Scripts Property

Specifies the list of scripts used by the control add-in. 

## Applies to 

- Control add-in objects

## Property Values

A list of comma-separated strings that represent paths to script files. The default is blank, with no images being used by the control add-in. 

## Remarks 

Although this property is optional, the control add-in must either specify the StartupScript property or specify one or more scripts. Scripts can be either external resources referenced using a URL or can be embedded within the extension. Embedded script files must be added to the extension project folder in Visual Studio Code and referenced using a relative path. For security and usability reasons, it is recommended to reference any external scripts by using the HTTPS protocol. Scripts are loaded immediately when the control add-in is initialized. 

## Example

```AL
Scripts = 'https://code.jquery.com/jquery-2.1.0.min.js',
              'js/main.js';
```

## See Also

[Control Add-In Object](../devenv-control-addin-object.md)   
 