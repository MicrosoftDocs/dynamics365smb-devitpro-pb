---
title: "PromotedCategory Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: be638302-3a50-41a3-a231-c18da1977a9f
caps.latest.revision: 10
author: SusanneWindfeldPedersen
---

# PromotedCategory Property

Sets a category for a promoted action.  
  
## Applies to  
  
- Page actions  

## Example

The following code sample illustrates how to set the **PromotedCategory** property.

```
page 50110 PageName
{
    PageType = Card;

    actions
    {
        // Adds the action called "My Actions" to the Action menu 
        area(Processing)
        {
            action("My Actions")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

...
```
  
## Remarks  
Promoted actions appear in the action bar on a page. You promote an action by setting the [Promoted Property](devenv-promoted-property.md). Categories allow you to group similar actions under a common caption. You can choose between 10 categories: New, Process, Report, and Category4 through Category10. By default, the category names are used as the captions in the ribbon. <!--For information about changing the captions, see [How to: Define Promoted Action Categories Captions for the Ribbon](How-to-Define-Promoted-Action-Categories-Captions-for-the-Ribbon.md).  -->
  
## See Also  
[Properties](devenv-properties.md)
[Promoted Property](devenv-promoted-property.md)  
[Actions Overview](../devenv-actions-overview.md)  