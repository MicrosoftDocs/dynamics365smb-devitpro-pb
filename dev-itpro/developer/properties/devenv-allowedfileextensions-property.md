---
title: "AllowedFileExtensions Property"
description: "Specifies the list of allowed file extensions."
ms.author: solsen
ms.date: 02/26/2024
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AllowedFileExtensions Property
> **Version**: _Available or changed with runtime version 13.0._

Specifies the list of allowed file extensions.

## Applies to
-   Page File Upload Action

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The `AllowedFileExtensions` property allows you to specify, which file types the user can drag to a drop zone. The property is a comma-separated list of file extensions. For example, if you want to allow the user to drag .jpg, .jpeg, and .png files to the drop zone, you would set the property to `AllowedFileExtensions = '.jpg','.jpeg','.png';`. For mor information, see [Add drop zones for file uploads](devenv-extending-drop-zones.md).

## See also

[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  