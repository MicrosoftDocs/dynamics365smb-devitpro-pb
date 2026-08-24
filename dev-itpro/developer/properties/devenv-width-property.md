---
title: Width Property for Table and Page Fields
description: Learn how the Width property suggests a column width for table fields, page fields, and page labels in Dynamics 365 Business Central.
ms.date: 08/21/2026
ms.topic: reference
author: jswymer
ms.author: solsen
ms.reviewer: solsen
---

# Width property on table and page fields

<!-- this article is manually created -->

Specifies a suggested column width as an integer number of characters.

## Applies to

- Table fields, from runtime version 1.0
- Page fields, from runtime version 4.4
- Page labels, from runtime version 4.4

## Syntax

```al
Width = 50;
```

## Remarks

For page fields and labels, the property affects controls in a `repeater` on `List`, `ListPlus`, `ListPart`, `Document`, and `Worksheet` pages. It doesn't affect `Card` pages.

- If you omit the property or set it to `0`, the platform determines the column width.
- A width set on a page field overrides a width inherited from its source table field.
- The number of visible characters can vary with the font and screen size.
- Users can override the width by personalizing the page.
- Developers can use the designer to adjust column widths.

## Example

```al
field(MyField; Rec.MyField)
{
    Caption = 'My field';
    ToolTip = 'Specifies a value.';
    ApplicationArea = All;
    Width = 50;
}
```

## Related information

[Use the designer](../devenv-inclient-designer.md)  
[Personalize your workspace](/dynamics365/business-central/ui-personalization-user)  
[Width property for XMLport elements](devenv-width-xmlport-property.md)  
[Properties](devenv-properties.md)
