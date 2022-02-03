---
title: "ValidateTableRelation Property"
description: "Sets whether to validate a table relationship."
ms.author: solsen
ms.custom: na
ms.date: 01/31/2022
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
# ValidateTableRelation Property
> **Version**: _Available or changed with runtime version 1.0._

Sets whether to validate a table relationship.

## Applies to
-   Table Field

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Value

**true** if you want to validate the table relationship; otherwise, **false**. The default is **true**.  

## Syntax

```AL
ValidateTableRelation = false;
```
  
## Remarks

For fields, use this property to determine whether to validate the user's entry based on the information already in the table set up through the [TableRelation property](devenv-tablerelation-property.md) property.  
  
If you want to let users enter any value without validating the entry, then choose **false**. For example, on the **Item** card, you can specify the vendor that you typically purchase the item from. Set this property to **false** to allow users to select a vendor that may not already be in the **Vendor** table. It will then be up to the field's [OnValidate trigger](triggers-auto/field/devenv-onvalidate-field-trigger.md) to process what the user has typed, for example create a new vendor with that name.
  
If you set the ValidateTableRelation property to **false**, then you should also set the [TestTableRelation property](devenv-testtablerelation-property.md) to **false**. Otherwise, a database test on the field relations in a database may fail.  

### Lookup behavior

Whether the property is set to **true** or **false**, as a user types data in the field, a lookup opens and shows a filtered list of entries that match what was typed. The difference is how the lookup behaves:

- When **true**, the entry that best matches what the user has typed is automatically selected in the lookup. Pressing the Tab or Enter key will save the selected entry. If there's no entry that matches what the user has typed, the empty lookup stays open. Pressing Tab or Enter when there's no match causes a validation error.
- When **false**, no entry is automatically selected in the lookup - focus stays on the field. Pressing Tab or Enter will save whatever value the user has entered so far, letting the user enter free text. If there's no entry that matches what the user has typed, the lookup closes. To select an entry in the lookup, the user has to do it manually, for example, by pressing the down arrow to move focus into the lookup.

> [!NOTE]
> The behavior of the lookup when the ValidateTableRelation property is set to **false** was changed in Business Central 2020 release wave 1 (runtime 9.0). In earlier versions, the lookup has a slightly different behavior. When typing in the field, focus switches to an entry in the lookup. Also, the lookup stays open even if there's no match to what is typed in the field.

> [!TIP]
> If the field isn't part of a key, using the [OnAfterLookup (page field) trigger](../triggers-auto/pagefield/devenv-onafterlookup-pagefield-trigger.md) can be useful way to resolve the right record when a user picks something from a lookup that's not a key.

## See Also  

[TestTableRelation Property](devenv-testtablerelation-property.md)