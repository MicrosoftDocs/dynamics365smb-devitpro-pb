---
title: Page extension object
description: Extend page objects with page extension objects in AL for Business Central.
author: SusanneWindfeldPedersen
ms.date: 11/13/2024
ms.topic: conceptual
ms.author: solsen
ms.reviewer: solsen
---

# Page extension object

The page extension object extends a [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] page object and adds or overrides the functionality. 

The structure of a page is hierarchical and breaks down into three sections. The first block contains metadata for the overall page; the type of the page and the source table it is showing data from. The next section; the layout, describes the visual parts on the page. The final section details the actions that are published on the page.

Learn more about Page and Page Extension objects in [Pages overview](devenv-pages-overview.md).

> [!IMPORTANT]  
> Only pages with the [Extensible property](properties/devenv-extensible-property.md) set to **true** can be extended.

> [!NOTE]  
> Extension objects can have a name with a maximum length of 30 characters.

> [!IMPORTANT]  
> A page of type *API page* can't be extended by creating a page extension object. Instead, create a new API page by adding a new [page object](devenv-page-object.md).

> [!NOTE]  
> Modifying actions in Cue groups on page extensions isn't supported.

## Snippet support

Typing the shortcut `tpageext` will create the basic layout for a page extension object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Views

Views in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] are used on list pages to define a different view of the data on a given page. Views can be defined for [Pages](devenv-page-object.md), [Page extensions](devenv-page-ext-object.md), and [Page customizations](devenv-page-customization-object.md). Learn more in [Views](devenv-views.md).

## Add tooltips on page fields

Starting in [!INCLUDE[prod_short](includes/prod_short.md)] 2024 release wave 1, you can define tooltips on table fields. When a tooltip is defined on a table field, any page that uses the field automatically inherits the tooltip. 

Learn more about adding tooltips in [Add tooltips to table and page fields](devenv-adding-tooltips.md).

## Using keywords to place actions and controls

You can use the following keywords in the `layout` section to place and move fields and groups on the page extension. Similarly, in the `actions` section, you use these keywords to place actions in the ribbon. 

|Keywords        |Syntax | Applies to |
|-----------------------|-------|-------------|
|`addfirst`|`addfirst(Anchor)`|**Anchor**: areas and groups|
|`addlast` |`addlast(Anchor)` |**Anchor**: areas and groups|
|`addafter` |`addafter(Anchor)` |**Anchor**: controls, actions, and groups|
|`addbefore`|`addbefore(Anchor)` |**Anchor**: controls, actions, and groups|
|`movefirst`|`movefirst(Anchor; Target1, Target2)`|**Anchor**: area, group <br>**Target**: list of actions or list of controls|
|`movelast` |`movelast(Anchor; Target1, Target2)` |**Anchor**: area, group <br>**Target**: list of actions or list of controls|
|`moveafter` |`moveafter(Anchor; Target1, Target2)`|**Anchor**: controls, actions, and groups <br>**Target**: list of actions or list of controls|
|`movebefore`|`movebefore(Anchor; Target1, Target2)`|**Anchor**: controls, actions, and groups <br>**Target**: list of actions or list of controls|
|`modify`|`modify(Target)`|**Target**: controls, actions, and groups|

### Example

To modify the existing fields and groups on a page, use the `modify` keyword. See the code snippet below for `addlast`, `modify` and `action` syntax. In the following example, the `actions` section creates a new group in the ribbon and places it last in the `Creation` group. The group contains an action that displays a message when the user chooses it. The `layout` section adds a new field control `ShoeSize` to the `General` group on the page. The field control is added as the last control in the group using the `addlast` method. The example also illustrates how to modify the caption of an existing field on the page.

```AL
pageextension 70000020 CustomerCardExtension extends "Customer Card"
{
    layout
    {
        // Adding a new control field 'ShoeSize' in the group 'General'
        addlast(General)
        {
            field("Shoe Size"; ShoeSize)
            {
                Caption = 'Shoe size';

                trigger OnValidate();
                begin
                    if (ShoeSize < 10) then
                        Error('Feet too small');
                end;
            }
        }

        // Modifying the caption of the field 'Address'
        modify("Address 2")
        {
            Caption = 'New Address 2';
        }

        // Moving the two fields 'CreditLimit' and 'CalcCreditLimitLCYExpendedPct'
        // to be the first ones in the 'Balance' group.
        movefirst(Balance; CreditLimit, CalcCreditLimitLCYExpendedPct)
    }
    actions
    {
        // Adding a new action group 'MyNewActionGroup' in the 'Creation' area
        addlast(Creation)
        {
            group(MyNewActionGroup)
            {
                action(MyNewAction)
                {
                    Caption = 'My New Action';

                    trigger OnAction();
                    begin
                        Message('My message');
                    end;
                }
            }
        }
    }
}

tableextension 70000020 CustomerTableExtension extends Customer
{
    fields
    {
        // Adding a new table field in the 'Customer' table
        field(50100; ShoeSize; Integer) { }
    }
}
```

## Page extension examples

In the following example, we use a table extension to extend the Customer table with a new field named `ShoeSize` of the datatype Integer. Then we create a page extension object that extends the Customer Card page object by adding a field control `ShoeSize` to the `General` group on the page. The field control is added as the last control in the group using the `addlast` method. The example also illustrates how to add a display-only control to the page.
In the actions area, you can see what the syntax looks like for actions that execute triggers and actions that run objects.

```AL
tableextension 50115 RetailWinterSportsStore extends Customer
{
    fields
    {
        field(50116;ShoeSize;Integer)
        {
            Caption = 'ShoeSize';
            
            trigger OnValidate();
            begin
                if (rec.ShoeSize < 0) then
                begin
                   message('Shoe size not valid: %1', rec.ShoeSize);
                end;
            end;
        }
    }

    procedure HasShoeSize() : Boolean
    begin
        exit(ShoeSize <> 0);
    end;

    trigger OnBeforeInsert();
    begin
        if not HasShoeSize then
            ShoeSize := Random(42);
    end;
}

pageextension 50110 CustomerCardExtension extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            // control with underlying datasource
            field("Shoe Size"; ShoeSize)
            {
                ApplicationArea = All;

                trigger OnValidate();
                begin
                    if (ShoeSize < 10) then
                        Error('Feet too small');
                end;
            }
            // display-only control (without underlying datasource)
            field(ShoesInStock; 10)
            {
                ApplicationArea = All;
                Caption = 'Shoes in stock';

            }
        }

        modify("Address 2")
        {
            Caption = 'New Address 2';
        }
    }

    actions
    {
        addlast(Creation)
        {
            group(MyActionGroup)
            {
                Action(MyAction1)
                {
                    ApplicationArea = All;
                    Caption = 'Hello!';

                    trigger OnAction();
                    begin
                        Message('My message');
                    end;
                }

                Action(MyAction2)
                {
                    ApplicationArea = All;
                    
                    // Run page to test how actions work
                    RunObject = page "Absence Registration";                    
                }
            }
        }
    }
}
```

You can reference Report and XMLPort objects and use these objects in the **RunObject** property, as well as, declare variables of the types **Report** and **XMLPort** and call AL methods on them. This page extension object extends the Customer List page object by adding two actions; the first action calls the **Customer - List** report, the second action calls the **Export Contact** XMLPort.

```AL
pageextension 50114 AddCustomerReport extends "Customer List"
{
    actions
    {
        AddLast("&Customer")
        {
            action("Customer List Report")
            {
                trigger OnAction();
                var
                    rep : Report "Customer - List";
                begin
                    rep.Run;
                end;
            }

            action("Export Contact List")
            {
                trigger OnAction();
                var
                    xml : XmlPort "Export Contact";
                begin
                    xml.Run;
                end;
            }
        }
    }
}
```

## Related information

[Page object](devenv-page-object.md)  
[Views](devenv-views.md)  
[Page, page fields, and page extension properties](properties/devenv-page-property-overview.md)  
[Extending pages previously based on the Date Virtual Table](devenv-extend-pages-based-on-date-virtual-table.md)
[Developing extensions](devenv-dev-overview.md)  
[AL development environment](devenv-reference-overview.md)  
