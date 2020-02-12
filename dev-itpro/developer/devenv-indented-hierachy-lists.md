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

There are two display options that you can set up for indented hierarchy lists. You can display a static hierarchy or a tree view hierarchy. A tree view hierarchy displays records in a parent-child structure, where users can be expand and collapse parent records to show and hide child records.

## Sample table and page

To explain indented hierarchy lists, this article uses a simple table and page as an example. If you want to see a more detailed implementation, take a look at the source code for **Chart of Accounts** page in the base application.

1. Create an editable table that has the following fields:

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

Setting up the static indented hierarchy list involves two main properties: IndentColumn property and IndentationControls property.

- The IndentColumn property controls the indentation, determining which records get indented and by how much.  This property can be must resolve to an integer, which determines the indentation level. It can be to either a field in the source table or a variable.

- The IndentationControls property specifies which column in the list gets indented.

Working with the sample page, add the IndentationColumn and IndentationControls to the repeater of the page as shown:  

```
repeater(Control1)
{
    IndentationColumn = Indent;
    IndentationControls = Name;
    ...

```

This will display a list that is indents each subsequent record according to the value of the **Indent** field.


## Setting up a tree-view hierarchy

A tree-view hierarchy is similar to the static indented hierarchy, except that records that are indented   

Setting up the tree-view hierarchy involves three main properties: IndentColumn, ShowsAsTree , and TreeInitialState.

- Like the static indented hierarchy, the IndentColumn property controls the indentation, determining which records get indented and how they are structured. This property must resolve to an integer, which determines the indentation level. It can be to either a field in the source table or a variable. 
- The ShowsAsTree property enables the tree view.
- The TreeInitialState property, which is optional, specifies whether the list is collapsed or expanded when the page opens.

With the tree-view, starting from the top of the page, subsequent records that have a indent value that that is greater that the row above it, will appear d above, then it appears as a child to that record. 

For example: 

```
repeater(Control1)
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
[ShowAsTree Property](properties/devenv-showastree-property.md)  
[TreeInitialState Property](properties/devenv-treeinitialstate-property.md)  