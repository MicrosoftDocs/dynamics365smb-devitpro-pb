---
title: "MultiLine Property"
description: "Sets the value that indicates whether a field can display multiple lines of text."
ms.author: solsen
ms.custom: na
ms.date: 08/02/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# MultiLine Property
> **Version**: _Available or changed with runtime version 3.2._

Sets the value that indicates whether a field can display multiple lines of text.

## Applies to
-   Page Label
-   Page Field

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value  

**True** if you want to display multiple lines; otherwise, **false**. The default is **false**.  

## Syntax

```AL
MultiLine = true;
```

## Remarks

With [!INCLUDE [prod_short](../includes/prod_short.md)] 2023 release wave 2, you can use the `RichContent` option on the [ExtendedDataType property](devenv-extendeddatatype-property.md) to enable a rich text field. To enable a rich text field, the field must have the Multiline property set to `true` and it must reside alone within a FastTab group. For an example of creating a rich text editor, see [Creating a rich text editor](devenv-create-richtexteditor.md).

## See Also

[Properties](devenv-properties.md)