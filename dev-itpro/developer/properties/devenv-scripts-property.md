---
title: "Scripts Property"
ms.author: solsen
ms.custom: na
ms.date: 11/12/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Scripts Property
> **Version**: _Available from runtime version 1.0._

Specifies the list of scripts to include in the control add-in. The scripts could be local files in the package or references to external files using the http or the https protocol.

## Applies to
-   Control Add In

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

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