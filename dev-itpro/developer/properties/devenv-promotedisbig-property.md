---
title: "PromotedIsBig Property"
description: "Sets the action to appear before other promoted actions in the action bar, regardless of its position in the AL code of the page."
ms.author: solsen
ms.custom: na
ms.date: 07/08/2021
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
# PromotedIsBig Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the action to appear before other promoted actions in the action bar, regardless of its position in the AL code of the page.

## Applies to
-   Page Action

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
PromotedIsBig = true;
```
 
## Property Value  

**true** display the action before other actions in the action bar; otherwise, **false**. The default is **false**.  

## Remarks

If there is more than one action that has the PromotedIsBig property set to **true**, then the actions will appear before other actions, in the order that they are defined in AL.

For more information about promoting actions, see [Promoted Actions](../devenv-promoted-actions.md).

> [!NOTE]
> In the [!INCLUDE[prod_short](../includes/nav_windows_md.md)], this property behaves differently. Setting the property to **true** will display a bigger icon than normal in the client. It will not reposition the action.

## Example

The following code snippet adds the **Sales Invoice** and the **Sales Quote** actions to a page, and promotes them to the category named **New**. In AL, the **Sales Invoice** action is defined after the **Sales Quote** action. But because the **PromotedIsBig** property on the **Sales Invoice** action is **true** , it will appear before the **Sales Quote** action in the user interface.

```AL
actions
    {
        area(Creation)
        {
            action("Sales Quote")
            {
                Promoted = true;
                PromotedCategory = New;
                PromotedOnly = true;
                Image = NewSalesQuote;
                ApplicationArea = All;
            }
            action("Sales Invoice")
            {
                Promoted = true;
                PromotedCategory = New;
                Image = SalesInvoice;
                PromotedIsBig = true;
                ApplicationArea = All;
            }
        }
    }
```

## See Also  

[Promoted Property](devenv-promoted-property.md)   
[Promoted Actions](../devenv-promoted-actions.md)  
[Actions Overview](../devenv-actions-overview.md)  