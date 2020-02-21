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

T# Displaying Lists in an Indented Hierarchy

This article explains how to indent records in a list. By indenting specific records, you display records in a parent-child structure. This structure can help organize the list and make it more readable for the user.

There are two kinds of indented hierarchy lists: fixed and tree. In a fixed hierarchy, all indented (child) records are appear. In a tree hierarchy, users can collapse and expand parent records to show and hide child records.

## Sample table and page

To demonstrate how indented hierarchy works, we'll use a basic table and page. For a more detailed implementation, look at the code for **Chart of Accounts** page in the base application.

1. Create the following table object:

    ```
    table 50100 MyTable
    {
        fields
        {      
            field(1; Number; Code[10])
            {
            }
            field(2; Name; Text[50])
            {
            }
            field(3; Indent; Integer)
            {
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

    Typically, you wouldn't display the **Indent** field because it's mainly for layout purposes.

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
                repeater(Control1)
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

## Set up fixed indented hierarchy list

Setting up the fixed indented hierarchy involves configuring two main properties on the page object: IndentColumn and IndentationControls.

- The [IndentationColumn Property](properties/devenv-indentationcolumn-property.md) controls the indentation, determining which records get indented and by how much. The property must resolve to an integer, which determines the indentation level. It can be to either a field in the source table or a variable.

- The [IndentationControl property](properties/devenv-indentationcontrols-property.md) specifies which column in the list gets indented.

Working with the sample page, add the IndentationColumn and IndentationControls to the repeater of the page as shown:  

<!-- 
```
repeater(Control1)
{
    IndentationColumn = Indent;
    IndentationControls = Name;
    ...

```

Now, the code will indent each record based on the value of the **Indent** field.

-->
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
            repeater(Control1)
            {
                IndentationColumn = Indent;
                // IndentationColumn = IndentVariable;
                IndentationControls = Name;

                field(Number; Number)
                {
                }
                field(Name; Name)
                {
                }
                field(Indent; Indent)
                {
                }
            }
        }
    }

    //trigger OnAfterGetRecord()
        //begin
          //IndentVariable := Indent;
        //end;

        //var
           //IndentVariable: Integer;
}  
```

You can achieve the same results using a variable instead of the table field for the IndentationColumn property.  

### Behavior considerations

When using the fixed hierarchy, consider the following behavior:

- Indentation works best on single column. You can specify more than one column [IndentationControl property](properties/devenv-indentationcontrols-property.md), however, in the UI, the columns may not appear as expected.
- When indentation is specified, it's no longer possible to use sorting on the columns in the repeater control.  
- Right-aligned data in columns, such as the integer data type, won't appear as indented.


## Setting up a tree hierarchy

A tree hierarchy is similar to the fixed indented hierarchy, except that records that are indented.

Setting up the tree-view hierarchy involves three main properties: IndentColumn, ShowsAsTree, and TreeInitialState.

- Like in fixed indented hierarchy, the [IndentationColumn Property](properties/devenv-indentationcolumn-property.md) is an integer data type field or variable that determines which records get indented and by how much.
- The [ShowAsTree Property](properties/devenv-showastree-property.md) enables the tree.
- The [TreeInitialState Property](properties/devenv-treeinitialstate-property.md), which is optional, specifies whether the list is collapsed or expanded when the page opens.

With the tree-view, records that have an indent value that is greater than the row above it, appear as a child to the above record.

Working with the sample page, add the IndentationColumn, ShowAsTree, and TreeInitialState to the repeater of the page as shown: 

<!--
```
repeater(Control1)
{
    IndentationColumn = Indent;
    ShowAsTree = true;
    TreeInitialState = CollapseAll;

   ...
}

```
-->
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
            repeater(Control1)
            {
                IndentationColumn = Indent;
                // IndentationColumn = IndentVariable;
                ShowAsTree = true;
                TreeInitialState = CollapseAll;

                field(Number; Number)
                {
                }
                field(Name; Name)
                {
                }
                field(Indent; Indent)
                {
                }
            }
        }
    }

    //trigger OnAfterGetRecord()
        //begin
          //IndentVariable := Indent;
        //end;
    
        //var
           //IndentVariable: Integer;
}  
```

### Behavior considerations

When using the tree hierarchy, consider the following behavior:

- The [IndentationControl property](properties/devenv-indentationcontrols-property.md) is ignored. 
- When indentation is specified, it's no longer possible to use sorting on the columns in the repeater control.  
- Records are indented on the first column.
- If data in the first column is right-aligned, such as with integers, the records won't appear as indented.

## See Also

[IndentationColumn Property](properties/devenv-indentationcolumn-property.md)  
[IndentationControl Property](properties/devenv-indentationcontrols-property.md)  
[ShowAsTree Property](properties/devenv-showastree-property.md)  
[TreeInitialState Property](properties/devenv-treeinitialstate-property.md)