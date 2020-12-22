---
title: "Width Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 59701d5d-65f8-42e8-9b1b-8c47709cf4bc
caps.latest.revision: 22
author: jswymer
---

# Width Property
> **Version**: _Available from runtime version 1.0._

Sets the width of a field when it appears as a column in a list. The width is specified by an integer that corresponds to the number of characters. <!-- and must be a fixed number when specified. --> 
  
## Applies to  
  
-   Table Field
-   Page Field
-   Page Label

## Syntax

```AL
Width = Integer;
```

## Remarks  

You use the Width property to help to improve readability in lists. The property only takes effect on pages of the type List, ListPlus, ListPart, Document, or Worksheet; when the `field` control is used in a `repeater` control. It has no effect on Card pages.

- If you omit the property or set it to `0`, the platform will automatically determine the optimal value based on the field's data type and other columns in the list.

- Setting the property on a table field means that any page that uses the field will inherent the width from the setting on the table. However, if the property is set on both the page and its source table, the value of the property on the page is used.

- Because font sizes can vary depending on the screen, the specified number of characters might not display entirely.
- Users can override the width by personalizing the page that displays the field.
- You can use Designer to adjust column widths.

<!--
For controls, the width specifies the width of the column. 
 For example, use the **Width** property to set decimals so that they do not take up too much space in a grid.
-->
## Example

The following example sets the column width of a field to 50 characters.

```AL
 repeater(GroupName)
            {
                field(MyField; MyField)
                {
                   ApplicationArea = All;
                   Width = 50;
                }

            }
```
  
<!-- For controls on the [!INCLUDE[rtc](includes/rtc_md.md)] you always have the option of resizing column width in the UI, but when running the [!INCLUDE[nav_web](includes/nav_web_md.md)] the **Width** property can be set to a fixed number to increase readability. -->

## See Also

[Properties](devenv-properties.md)  
[Using Designer](../devenv-inclient-designer.md)  
[Personalizing Your Workspace](/dynamics365/business-central/ui-personalization-user  ) 