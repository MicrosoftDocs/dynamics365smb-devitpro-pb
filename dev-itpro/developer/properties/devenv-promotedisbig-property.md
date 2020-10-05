---
title: "PromotedIsBig Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: e83bfe80-9c0e-468e-80b6-c9d184e64afe
caps.latest.revision: 10
author: jswymer
---

# PromotedIsBig Property
Sets a value that indicates whether to display the action before other actions in the action bar, regardless of its position in the AL page definition.  
  
## Applies to  
  
- Page actions  
 
## Syntax
```
PromotedIsBig = true;
```
 
## Property Value  

**true** display the action before other actions in the action bar; otherwise, **false**. The default is **false**.  

## Remarks
If there is more than one action that has the PromotedIsBig property set to **true**, then the actions will appear before other actions, in the order that they are defined in AL.

> [!NOTE]
> In the [!INCLUDE[prodshort](../includes/nav_windows_md.md)], this property behaves differently. Setting the property to **true** will display a bigger icon than normal in the client. It will not reposition the action.

## Example

In the following code snippet, the **Sales Invoice** action is defined after the **Sales Quote** action, However, because the **PromotedIsBig** property is **true**, it will appear before the **Sales Quote** action in the client.

```
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