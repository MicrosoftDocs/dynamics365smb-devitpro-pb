---
title: Promoted Property for Page Actions
description: Learn how the legacy Promoted property adds a page action to a promoted category in Dynamics 365 Business Central and review its behavior.
ms.date: 08/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
---

# Promoted property on page actions

> **Version**: _Available from runtime version 1.0._

<!-- this article is manually created, and the parent node is devenv-promoted-property.md -->

Specifies whether a page action is added to a promoted category in the action bar.

> [!IMPORTANT]
> The `Promoted` property is part of the legacy syntax for promoted actions. We recommend that you use the `actionref` syntax introduced in [!INCLUDE [prod_short](../includes/prod_short.md)] 2022 release wave 2. Learn more in [Promoted actions](../devenv-promoted-actions.md).

> [!NOTE]
> Removing the `Promoted` property from a published action is a breaking change. Learn more in [AppSourceCop error AS0031](../analyzers/appsourcecop-as0031.md).

The `Promoted` property also applies to profiles. Learn more in [Promoted property for profiles](devenv-promoted-profile-property.md).

## Applies to

- Page actions

## Property value

Set the property to `true` to promote the action. Otherwise, set it to `false`. The default is `false`.

## Example

The following example uses the legacy syntax to promote an action to the **Process** category.

```al
action(MyAction)
{
    Caption = 'Process order';
    ApplicationArea = All;
    Promoted = true;
    PromotedCategory = Process;

    trigger OnAction()
    begin
        Message('The order was processed.');
    end;
}
```

## Remarks

Use the [PromotedCategory property](devenv-promotedcategory-property.md) to specify where the promoted action appears. The `Promoted` property has an effect on actions on `Card`, `Document`, `List`, `ListPlus`, and `Worksheet` pages. It has no effect on actions in cue groups.

For information about using `Promoted` with `Scope`, see [Scope property for page actions](devenv-scope-action-property.md).

## Related information

[PromotedIsBig property](devenv-promotedisbig-property.md)  
[PromotedOnly property](devenv-promotedonly-property.md)  
[Promoted property for profiles](devenv-promoted-profile-property.md)  
[Actions overview](../devenv-actions-overview.md)
