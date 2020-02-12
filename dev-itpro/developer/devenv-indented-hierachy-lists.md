---
title: "TreeInitialState Property"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Displaying Lists in an Indented Hierarchy

This article explains how to display lists in an indented hierarchy, where related records are arranged in a parent-child type structure.

There are two display options that you can set up for indented hierarchy lists. You can display a static hierarchy or an interactive hierarchy, where users can be expand and collapse parent records to show or hide children.

## Overview
To explain indented hierarchy lists, this article uses a simple example. If you want to see a more detailed implementation, take a look at the source code for **Chart of Accounts** page in the base application.

1. Create an editable table that has the following fields:

    |Field|Data type|
    |-----|---------|
    |Number|integer|
    |Name|text|
    |Indent|integer|
    
    For example:

    ```
    table 50100 MyTable
    {
    
        fields
        {
            DataClassification = ToBeClassified;
        
            field(1; Number; Integer)
            {
                DataClassification = ToBeClassified;
        
            }
            field(2; Name; Text[50])
            {
                DataClassification = ToBeClassified;
        
            }
            Field(3; Indent; Integer)
            {
                DataClassification = ToBeClassified;
        
            }
        }
        
        keys
        {
            key(PK; Number)
            {
                Clustered = true;
            }
        }
    }
    ```

2. Create a page that displays the fields of the table.

    Typically, you would not display the **Indent** field because this is strictly used for layout purposes.

    ```
    page 50100 MyPage
    {
        PageType = List;
        ApplicationArea = All;
        UsageCategory = Lists;
        SourceTable = MyTable;
        Editable = true;
    
        layout
        {
            area(Content)
            {
                repeater(Test)
                {
    
                    field(Number; Number)
                    {
                        ApplicationArea = All;
                    }
    
                    field(Name; Name)
                    {
                        ApplicationArea = All;
                    }
                    field(Indent; Indent)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
    }
    
    ```
3. In the client, run the page and add records to the table.

    Be sure to set the **Indent** field.

## Set up static indented hierarchy list

Setting up the static indented hierarchy list involves two main properties:

- The IndentColumn property controls the indentation, determining which records get indented and how they are structured. This property must resolve to an integer, which determines the indentation level. It can be to either a field in the source table or a variable.

- The IndentationControls property specifies which column in the list gets indented. This cannot be an integer data type.

For example: 

```
repeater(Control1)
{
    IndentationColumn = Indent;
    IndentationControls = Name;

    field(Number; Number)
    {
        ApplicationArea = All;
    }

    field(Name; Name)
    {
        ApplicationArea = All;
    }
    field(Indent; Indent)
    {
        ApplicationArea = All;
    }
}

```
  
## Setting up dynamics hierarchy

Setting up the static indented hierarchy list involves three main properties:

- The IndentColumn property controls the indentation, determining which records get indented and how they are structured. This property must resolve to an integer, which determines the indentation level. It can be to either a field in the source table or a variable.
- The ShowsAsTree property enables the tree view.
- The TreeInitialState property, which is optional, specifies whether the list is collapsed or expanded when the page

For example: 

```
repeater(Test)
{
    IndentationColumn = Indent;
    ShowAsTree = true;
    TreeInitialState = CollapseAll;

    field(Number; Number)
    {
        ApplicationArea = All;
    }

    field(Name; Name)
    {
        ApplicationArea = All;
    }
    field(Indent; Indent)
    {
        ApplicationArea = All;
    }
}

```

## See Also

[IndentationColumn Property](properties/devenv-indentationcolumn-property.md)  
[IndentationControl Property](properties/devenv-indentationcontrols-property.md)  
[Properties](properties/devenv-properties.md)  