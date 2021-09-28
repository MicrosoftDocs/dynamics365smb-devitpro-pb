---
title: "RecreateScript Property"
description: "Specifies the script which is invoked when the control add-in is recreated."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RecreateScript Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies the script which is invoked when the control add-in is recreated.

## Applies to
-   Control Add In

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Values

A path to a single script file. The default is blank. 

## Remarks

After the hosting page has been loaded and the control add-in has been initialized, the page may need to recreate the control add-in during specific situations, such as if the user has moved the add-in during personalization.

You can use this property to optimize re-initialization of the control add-in when it has already been initialized earlier. For example, this could be used to redraw some of the visuals without the need for expensive fetching of data.

This property is optional. If left blank, the script defined by [StartupScript](devenv-startupscript-property.md) will be invoked when the control add-in is recreated. 

## Code Example

```AL
RecreateScript = 'js/chartCached.js';
```

## See Also

[Control Add-In Object](../devenv-control-addin-object.md)   
 