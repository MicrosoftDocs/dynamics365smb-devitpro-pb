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

**True** if you want to validate the table relationship; otherwise, **false**. The default is **true**.  

## Syntax

```AL
ValidateTableRelation = false;
```
  
## Remarks

For fields, use this property to determine whether to validate the user's entry based on the information already in the table set up through the [TableRelation Property](devenv-tablerelation-property.md) property.  
  
If you want to let users enter any value without validating the entry, then choose **false**. For example, on the item card, you can specify the vendor that you typically purchase the item from. Set this property to **false** to allow users to select a vendor that may not already be in the **Vendor** table.  
  
If you set the ValidateTableRelation property to **false**, then you should also set the TestTableRelation property to **false**. Otherwise, a database test on the field relations in a database may fail.  

With either setting, as a user enters data in the field, the lookup opens and filtered to list rows that match what is entered. The difference is when there's match.

- With ValidateTableRelation property to **true**, the row that best matches the entered value is automatically selected in the lookup. Pressing Tab or Enter will save the selected row. If there's no match, the empty lookup remains opens. Pressing Tab or Enter when there's no match causes a validation error.
- With ValidateTableRelation property to **false**, no row is automatically selected in the lookup. The user can use down arrow to move focus into the lookup and manually select a row. If there are no rows that match what the user entered, the lookup closes. Pressing Tab or Enter will save whatever value the user has entered so far.



- When a user opens the lookup by pressing Alt+Arrow Down, the focus remains in the field. When true focus will move to the first line on the lookup
- 
When a lookup is opened, we no longer indicate which row is selected. Unless these two cases:
User presses arrow down to move into the grid.
If the lookup already has a value in the input field, then there are two cases:
The table field used by the lookup has ValidateTableRelation=True (this is the default value), we indicate where the currently selected row is.
If ValidateTableRelation=False, then the lookup does not indicate the currently selected row.
When opening a lookup and it already has a value in the input field, there are two behaviors.
If ValidateTableRelation = True, then the lookup is shown with filtered content based on the value. (Previously, we used to show all rows) The currently selected row is shown.
If ValidateTableRelation = False, then the lookup is not filtered, and shows all rows. The currently selected row is not shown.
If ValidateTableRelation = False, typing text into the input field filters the lookup as it used to, but pressing Enter will save the value typed. (Previously, this used to select whatever it was selected in the lookup.) If user wants to select a value from the lookup, he/she needs to move into the grid (arrow+down), select a row, and press Enter.
If ValidateTableRelation = False, then if user types a value that doesn't match with any rows in the lookup, the lookup will automatically close. Pressing Enter will save that value.
When the value of the input value is cleared, then pressing Enter will save the empty value. (Previsouly, this used to select whatever row it was selected in the lookup.
  
## See Also  

[TestTableRelation Property](devenv-testtablerelation-property.md)