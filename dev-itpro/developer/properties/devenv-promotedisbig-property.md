---
title: "PromotedIsBig Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# PromotedIsBig Property
> **Version**: _Available from runtime version 1.0._

Sets a value that indicates whether the promoted action is displayed on the ribbon with a large icon.

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

> [!NOTE]
> In the [!INCLUDE[prod_short](../includes/nav_windows_md.md)], this property behaves differently. Setting the property to **true** will display a bigger icon than normal in the client. It will not reposition the action.

## Example

In the following code snippet, the **Sales Invoice** action is defined after the **Sales Quote** action, However, because the **PromotedIsBig** property is **true**, it will appear before the **Sales Quote** action in the client.

```AL
actions
    {
        area(Creation)
        {
            action("Sales Quote")
            {
                Promoted = true;
                PromotedCategory = Category5;  // PromotedActionCategories = New Document
                PromotedOnly = true;
                Image = NewSalesQuote;
                ApplicationArea = All;
            }
            action("Sales Invoice")
            {
                Promoted = true;
                PromotedCategory = Category5;  // PromotedActionCategories = New Document
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