---
title: "InDataSet attribute"
description: "Sets whether the AL variable's value is included in the dataset."
ms.author: solsen
ms.date: 08/19/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# InDataSet attribute
> **Version**: _Available or changed with runtime version 1.0 until version 11.0 where it was deprecated for the following reason: "The InDataset attribute is unused."_

Sets whether the AL variable's value is included in the dataset.


## Applies to

- Variable


## Syntax

```AL
[InDataSet]
```

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

The following legacy example shows how earlier runtime versions used the attribute on page variables:

```al
var
    [InDataSet]
    StyleIsStrong: Boolean;
    [InDataSet]
    NameIndent: Integer;
```

## Remarks

The `InDataSet` attribute is obsolete as of runtime 11.0 and has no effect. Don't use it in new code.

Earlier runtime versions used the attribute on page variables in dynamic control expressions, such as the [Editable](../properties/devenv-editable-property.md), [Enabled](../properties/devenv-enabled-property.md), [Visible](../properties/devenv-visible-property.md), [StyleExpr](../properties/devenv-styleexpr-property.md), and [IndentationColumn](../properties/devenv-indentationcolumn-property.md) properties. The attribute included those variables in the dataset.

## Related information

[AL Method Reference](../methods-auto/library.md)  
[StyleExpr Property](../properties/devenv-styleexpr-property.md)  
[Editable Property](../properties/devenv-editable-property.md)  
[Enabled Property](../properties/devenv-enabled-property.md)  
[Visible Property](../properties/devenv-visible-property.md)
