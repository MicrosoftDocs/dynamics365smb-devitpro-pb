---
title: Adding Menus to the Navigation Pane
description: "Enable users to quickly navigate and perform actions by adding the menu items to the navigation pane."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 01/19/2018
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

# Adding Menus to the Navigation Pane
The navigation area appears at the top of the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] window, and contains multiple sections that enable users to quickly navigate and perform actions in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. A single section in the navigation Pane can be defined as a menu group that contains multiple sub-menu items. 

The navigation area displays the Home menu items by default; the other menu items can be accessed by clicking on the small drop-down arrow placed next to the *selected* menu category in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. For users, the menu groups that display in the navigation area could change depending on the Role Center page that they access. 

## Example
The example below explains how to add the menu group called `My New Action Group` to the Navigation Pane. The sub-menu items for the `My Customers` contains the actions which are named as `Customer Bank Account List` and `Customer Ledger Entries`, each opening the equivalent page object. In this example, the `My Customers` will appear on the navigation area for the **Sales Order Processor** Role Center. 

```al
pageextension 50120 ExtendNavigationPane extends "Order Processor Role Center"
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

## See Also
[AL Development Environment](devenv-reference-overview.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Actions Overview](devenv-actions-overview.md)  
[Adding Pages and Reports to Search](devenv-al-menusuite-functionality.md)  