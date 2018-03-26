---
title: Adding Menus to the Navigation Pane
description: "Enable users to quickly navigate and perform actions by adding the menu items to the navigation area."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 03/28/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18 

---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# Adding Menus to the Navigation Area
The navigation area appears at the top of the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] window, and contains multiple sections that enable users to quickly navigate and perform actions in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. A single section in the navigation area can be defined as a menu group that contains multiple sub-menu items. 

## Adding to the top-level navigation

The top-level navigation area displays the Home menu items by default; the other sub-menu items can be accessed by clicking on the small drop-down arrow placed next to the *selected* menu category in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. For users, the menu groups in the navigation area could change depending on the Role Center page that they access. 

## Example
The example below explains how to add the menu group called `My Customers` to the top-level navigation area. The sub-menu items for `My Customers` contain the `Customer Bank Account List` and `Customer Ledger Entries` actions, each opening the corresponding page object. In this example, the `My Customers` menu will appear in the navigation area for the **Sales Order Processor** Role Center. 

```
pageextension 50120 ExtendNavigationArea extends "Order Processor Role Center"
{

    actions
    {
        addlast(Sections)
        {
            group("My Customers")
            {
                action("Customer Bank Account List")
                {
                    RunObject = page "Customer Bank Account List";
                    ApplicationArea = All;
                }
                 action("Customer Ledger Entries")
                {
                    RunObject = page "Customer Ledger Entries";
                    ApplicationArea = All;
                }
            }
        }
    }
}
```

You can also enable pages and reports to appear in the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] search for a quick navigational support. For more information, see [Adding Pages and Reports to Search](devenv-al-menusuite-functionality.md).   

## Adding to the secondary-level navigation
<!--
General introduction
-->

<!--
Implementation details and example(s)
-->

Add the following code to actions.

```
        addfirst(Embedding)
        {
            action("Sales Cycles")
            {
                RunObject = page "Sales Cycles";
                ApplicationArea = All;
            }
        }
```

## Adding to actions 

<!--
General introduction
-->

<!--
Implementation details and example(s) for:
1. area(creation)
2. area(processing)
3. area(reporting)

-->

## See Also
[AL Development Environment](devenv-reference-overview.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Actions Overview](devenv-actions-overview.md)  
[Adding Pages and Reports to Search](devenv-al-menusuite-functionality.md)  