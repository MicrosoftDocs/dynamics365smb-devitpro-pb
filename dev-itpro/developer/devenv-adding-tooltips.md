---
title: Add tooltips to table and page fields
description: Description of how you use AL to add tooltips to table and page fields so that they're available when users hover over fields in the client.
author: kennieNP
ms.reviewer: jswymer
ms.date: 03/13/2024
ms.topic: conceptual
ms.author: kepontop
ms.collection: get-started
---

# Add tooltips to table and page fields

Even the best designed user interface can still be confusing to some. It can be difficult to predict what users find confusing, and that's why the base application includes tooltips for all fields on pages. Tooltips help users unblock themselves by providing an answer to the most likely questions the users might have, such as "What data can I input here?" or "What is the data used for?". So keep tooltips in mind when you develop the user interface of your solution.

For more information, see [Help users get unblocked (by providing tooltips)](../user-assistance.md#help-users-get-unblocked).

## Adding tooltips to table fields (2024 release wave 1 or later)

Starting in [!INCLUDE[prod_short](includes/prod_short.md)] 2024 release wave 1, you can define tooltips on table fields. When a tooltip is defined on a table field, any page that uses the field automatically inherits the tooltip. 

The following example shows how tooltips are defined on the table level:

```AL
table 50102 MyTable
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; MyField; Integer)
        {           
            ToolTip = 'Field number one is always the best!';
        }

        field(2; MySecondField; Integer) {  }
    }
}
```

> [!TIP]
> The [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] for Visual Studio Code comes with a CodeCop warning AA0234 - *You must write a tooltip in the Tooltip property for all fields on table objects*. Consider enabling the rule if you want to ensure that all fields get a tooltip defined. For more information, see [Using the code analysis tool](devenv-using-code-analysis-tool.md).

## Overriding tooltips on table fields (2024 release wave 1 or later)

Starting in [!INCLUDE[prod_short](includes/prod_short.md)] 2024 release wave 1, you can define tooltips on table fields. When a tooltip is defined on a table field, any page that uses the field automatically inherits the tooltip, but if you define a tooltip on the page field, then this version of the tooltip will be displayed in the client.

The following example shows how a page overrides tooltips that were defined on the table level:

```AL
page 50103 MyPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = MyTable;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(First; Rec.MyField)
                {                   
                    ToolTip = 'This tooltip overwrites the tooltip defined on the table field.'
                }

                field(Second; Rec.MySecondField)
                {    
                    ToolTip = 'Tooltip on page field (it was never defined on the table)'
                }
            }
        }
    }
}
```



## Adding tooltips to page fields (2023 release wave 2 or earlier)

In [!INCLUDE[prod_short](includes/prod_short.md)] 2023 release wave 2 or earlier, you can only define tooltips on page fields. 

In case you need to display a table field in multiple pages (for example, on a card and a list), then you need to duplicate the code for the definition of the tooltip.

## See also

[Help users get unblocked (by providing tooltips)](../user-assistance.md#help-users-get-unblocked)  
[Build your first sample extension with extension objects, install code, and upgrade code](devenv-extension-example.md)  
[Page object](devenv-page-object.md)  
