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
# Displaying Lists in an Indented Hierarchy (Tree View)

This article explains how to display lists in an indented hierarchy, where related records are arranged in a parent-child type structure.

There are two display options that you can set up for indented hierarchy lists. You can display a static hierarchy, where all records are shown like any other list, or you can setup an interactive hierarchy, where the user can be expand and collapse parent records as they like.

## Overview
To explain indented hierarchy lists, this article uses a simple example. If you want to see a mor detailed implementation, take a look at the source code for **Chart of Accounts** page in the base application.

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


## Setting up static hierarchy

Setting up the static

- Set the IndentColumn property
- Set the IndentationControls property

For example: 

```
repeater(Test)
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

Setting up the static

- Set the IndentColumn property
- Set the ShowsAsTree property
- TreeInitialState property (optinal).

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

[IndentationColumn Property](devenv-indentationcolumn-property.md)  
[IndentationControl Property](devenv-indentationcontrol-property.md)  
[Properties](devenv-properties.md)  