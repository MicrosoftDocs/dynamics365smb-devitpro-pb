---
title: Arrange Fields with Grid and Fixed Controls
description: Compare Grid and Fixed controls for Business Central page layouts, understand web client limitations, and choose a suitable structure for grouped fields.
ms.date: 10/09/2026
ms.topic: conceptual
author: SusanneWindfeldPedersen
---
# Arranging fields by using grid and fixed controls

Use a `grid` control to arrange groups of page fields in columns, or a `fixed` control to display read-only values in a matrix-like layout. Ordinary FastTabs arrange fields automatically and adjust to screen space. Learn more in [Field arrangement on FastTabs](devenv-arranging-fields-on-fasttab.md).

[!INCLUDE[Personalization of the controls](../includes/designer_experience_of_the_controls_Note.md)]

> [!IMPORTANT]
> The web client doesn't support `GridLayout = Rows`, `RowSpan`, or `ColumnSpan`. Use column layouts rather than the row and spanning layouts of the former Windows client.

## Comparing grid and fixed controls

Choose the control based on the presentation and editability your page needs.

| Characteristic | Grid control | Fixed control |
|----------------|--------------|---------------|
| Layout | Groups arranged in columns in the web client. | Matrix-like layout with row and column headings. |
| Captions | Group and field captions can be shown or hidden. | Group captions form column headings. Field captions from the first column form row headings. |
| Editing | Normal field and page editability applies. | Fields are read-only. |
| Row and column spanning | Not supported in the web client. | Not supported. |
| Screen sizes | More constrained than ordinary FastTabs. Test at the screen sizes your users need. | More constrained than ordinary FastTabs. Test at the screen sizes your users need. |

## Supported structure for using the grid and fixed controls

Use the following structure for the column-based examples in these articles. Define the controls in the page's `layout` section.

| Type | Subtype |
|----|---------|
|Container|`area(content)`|
|Control    |`group`      |
|Control    |`grid` or `fixed`|
|Control    |`group`     |
|Control  |`field`     |

Place a `group` inside `area(content)`, then place the `grid` or `fixed` control inside that group. Add a child group for each column and fields inside those column groups.

Keep the structure as simple as the page requires. The grid example also demonstrates a nested grid. Test more complex arrangements in the web client rather than assuming that every nested control combination has the same layout behavior.

Learn more in [Arranging fields in rows and columns using the grid control](devenv-arrange-fields-in-rows-and-columns-using-gridlayout-control.md) and [Arrange fields in rows and columns using the fixed control](devenv-arrange-fields-in-rows-and-columns-using-fixedlayout-control.md).

## Related information

[Field arrangement on FastTabs](devenv-arranging-fields-on-fasttab.md)  
[Pages overview](devenv-pages-overview.md)  
[GridLayout property](properties/devenv-gridlayout-property.md)  
