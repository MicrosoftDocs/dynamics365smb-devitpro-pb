---
title: "ShowFilter property"
description: "Sets whether the filter pane is shown on a page by default."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ShowFilter Property
> **Version**: _Available or changed with runtime version 1.0._

Sets whether the filter pane is shown on a page by default.

## Applies to
-   Request Page
-   Page
-   Page System Part
-   Page Chart Part
-   Page Part

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Values  

**True** to show the filter pane; otherwise, **false**. The default value is **true**.

## Syntax

```AL
ShowFilter = false;
``` 
  
## Remarks  

Using customization, a user can override the ShowFilter property setting to show or hide the filter except when the page is displayed in a part of another page, such as a FastTab or FactBox. When the page is displayed in a page part, the ShowFilter property permanently hides or shows the filter pane.

## Related information
[Properties](devenv-properties.md)