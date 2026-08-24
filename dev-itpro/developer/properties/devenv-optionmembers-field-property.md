---
title: OptionMembers Property for Table Fields
description: Learn how the OptionMembers property defines the available values for an Option field in Dynamics 365 Business Central and see an example.
ms.date: 08/21/2026
ms.topic: reference
ms.author: solsen
ms.reviewer: solsen
author: SusanneWindfeldPedersen
---

# OptionMembers property on table fields

> **Version**: _Available from runtime version 1.0._

<!-- this article is manually created, and the parent node is devenv-optionmembers-property.md -->

Specifies the values that are available in an `Option` table field.

## Applies to

- Table fields

## Example

The following example defines three option values.

```al
field(2; OptionField; Option)
{
    OptionMembers = Open,Released,Closed;
}
```

The `OptionCaptionML` property is used only when the field has an `OptionMembers` property. Learn more in [OptionCaptionML property](devenv-optioncaptionml-property.md).

## Related information

[Properties](devenv-properties.md)  
[OptionMembers property for reports](devenv-optionmembers-report-property.md)  
[Option data type](../methods-auto/option/option-data-type.md)