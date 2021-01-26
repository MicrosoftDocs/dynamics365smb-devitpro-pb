---
title: "StyleSheets Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
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
# StyleSheets Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies the list of stylesheets to include in the control add-in. The stylesheets could be local files in the package or references to external files using the http or the https protocol.

## Applies to
-   Control Add In

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Values 

A list of comma-separated strings that represent paths to stylesheet files. The default is blank, with no stylesheets being used by the control add-in. 

## Remarks

This property is optional and used to specify stylesheets that apply to the control add-in visuals. Stylesheets can be either external resources referenced using a URL or can be embedded within the extension. Embedded stylesheets must be added to the extension project folder in Visual Studio Code and referenced using a relative path. Stylesheets are loaded immediately when the control add-in is initialized.

> [!IMPORTANT]
> In extensions for Business Central online, don't reference font files in stylesheets, because the fonts won't display in client. Instead, do one of the following:
>
>- Reference the font files from some other source such as a public or private CDN.
>- Base64 encode the fonts and include the encoded fonts in the CSS file.

## Example

```AL
Stylesheets = 'https://www.microsoft.com/stylesheets/colors.css',
              'style.css';
```

## See Also  

[Properties](devenv-properties.md)   
[Control Add-In Object](../devenv-control-addin-object.md)   
 