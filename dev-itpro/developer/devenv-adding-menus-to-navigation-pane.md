---
title: Adding Menus to the Navigation Area
description: "Enable users to quickly navigate and perform actions by adding the menu items to the navigation area."
author: jswymer
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
---
# Adding Menus to the Navigation and Actions Area

The navigation area appears at the top of the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] window, and contains multiple sections that enable users to quickly navigate and perform actions in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. In the client, the navigation area is separated into three separate areas: navigation menu, navigation area, and actions area. For an illustration that identifies the different areas in a Role Center, see [Designing Role Centers](devenv-designing-role-centers.md). In AL, these areas are defined by the `area()` control, as described in the sections that follow.

## Adding to the navigation menu

The top-level navigation area is referred to as the navigation menu. The navigation menu contains one or more root menu items that expand to display a set of links to pages, and other objects like reports, XMLPorts, and codeunits. These links are defined by `action()` controls. You can also group `action()` controls in sub-menus. This enables you to create a logical hierarchy that matches the needs of the user role. The pages targeted by the links in the navigation menu will open in the content area of the Role Center.

> [!NOTE]
> The [!INCLUDE[nav_windows_md](includes/nav_windows_md.md)] doesn't support sub-menus in the navigation menu.

You define the navigation menu by using an `area(Sections)` control in the page code.

<!--
The top-level navigation should provide access to relevant entity lists for the role's areas of business. For example, typical root items for a business manager could be finance, sales, and purchasing. You should place the root items in order of importance, starting from the left.The actions in this area are defined by a `area(Sections)` keyword. plays the Home menu items by default; the other menu items can be accessed by clicking on the small drop-down arrow placed next to the *selected* menu category in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. For users, the menu groups that display in the navigation area could change depending on the Role Center page that they access. 
-->

## Example

The example below adds the root menu item called `My Customers` to the navigation menu of the **Sales Order Processor** Role Center. The `My Customers` menu item  contains two actions, the `Customer Bank Account List` and `Customer Ledger Entries` actions, which open corresponding page objects. The `My Customers` menu item also includes a group that contains two other actions, which open sales-related documents.

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

                // Creates a sub-menu
                group("Sales Documents")
                {
                    action("Sales Document Entity")
                    {
                        ApplicationArea = All;
                        RunObject = page "Sales Document Entity";
                    }
                    action("Sales Document Line Entity")
                    {
                        ApplicationArea = All;
                        RunObject = page "Sales Document Line Entity";
                    }
                }
            }
        }
    }
}
```

You can also enable pages and reports to appear in the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] search for a quick navigational support. For more information, see [Adding Pages and Reports to Tell Me](devenv-al-menusuite-functionality.md).

## Adding to the navigation bar

The second-level navigation is referred to as the navigation bar. The navigation bar offers a flat list of links to other pages. These should be the most relevant pages needed for a user's business process. We recommend to have only the most important items on this level and to place the others in the top-level navigation instead. 

You define the navigation bar by using an `area(Embedding)` control in the page code.

### Example
The following code adds a new link to the navigation bar by defining this area with an `area(Embedding)` control in the page code. The object targeted in this case is the `Sales Cycles` page and it will appear as the last one. 

```
...
addlast(Embedding)
{
    action("Sales Cycles")
    {
        RunObject = page "Sales Cycles";
        ApplicationArea = All;
    }
}
```

## Adding to actions

The actions area displays the most important or most often used tasks and operations required by users. It contains links to pages, reports, and codeunits. The links are placed on the root-level, and they can be grouped in a submenu.

You can define the actions by using three different `area()` controls.

The first action area that appears at the top of the Role Center page is `area(Creation)`. The following example adds the item last, and it allows opening the `Sales Journal` page.

### Example

```
...
addlast(Creation)
{
    action("Sales Journal")
    {
        ApplicationArea = All;
        RunObject = page "Sales Journal";
    }
}
```

The actions in the `area(Processing)` control appears after the `area(Creation)` items. 
The example below shows how you can use the group control to organize similar actions under a common parent. The created group is placed at the end of this action area, and it targets pages needed for processing sales documents. 

### Example

```
...
addlast(Processing)
{
    group(Documents)
    {
        action("Sales Document Entity")
        {
            ApplicationArea = All;
            RunObject = page "Sales Document Entity";
        }
        action("Sales Document Line Entity")
        {
            ApplicationArea = All;
            RunObject = page "Sales Document Line Entity";
        }
    }
}
```


The actions in the `area(Reporting)` control will appear last in the action area and they display with a default report icon. This control's purpose is to target report objects and the following example opens the `Customer Sales Statistics` report. 

### Example

```
...
addlast(Reporting)
{
    action("Customer Statistics")
    {
        ApplicationArea = All;
        RunObject = report "Customer Sales Statistics";
    }
}
```
  

## See Also
[AL Development Environment](devenv-reference-overview.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Actions Overview](devenv-actions-overview.md)  
[Adding Pages and Reports to Tell Me](devenv-al-menusuite-functionality.md)  