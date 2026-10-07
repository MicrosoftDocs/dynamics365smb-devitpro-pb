---
title: Add Tooltips to Table and Page Fields
description: Description of how you use AL to add tooltips to table and page fields so that they're available when users hover over fields in the client.
author: kennieNP
ms.reviewer: jswymer
ms.date: 10/06/2026
ms.topic: how-to
ms.author: kepontop
ms.collection: get-started
---

# Define tooltips for table and page fields

Even a well-designed user interface can confuse some users. You can't predict every question, so the base application includes tooltips for all page fields. Tooltips explain what data users can enter and how Business Central uses it. Keep tooltips in mind when you develop your solution's user interface.

Learn more in [Help users get unblocked (by providing tooltips)](../user-assistance.md#help-users-get-unblocked).

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
> The [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] for Visual Studio Code includes the CodeCop informational rule `AA0234`: *You should write a tooltip in the Tooltip property for all fields on table objects*. Consider enabling the rule if you want to ensure that all fields have a tooltip. Learn more about code analysis in [Using the code analysis tool](devenv-using-code-analysis-tool.md).

## Overriding tooltips on table fields (2024 release wave 1 or later)

Starting in [!INCLUDE[prod_short](includes/prod_short.md)] 2024 release wave 1, you can define tooltips on table fields. A page field inherits a table field's tooltip unless you define another tooltip on the page field. In that case, the client displays the page field's tooltip.

The following example shows how a page field overrides a tooltip defined on a table field:

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
                    ToolTip = 'This tooltip overwrites the tooltip defined on the table field.';
                }

                field(Second; Rec.MySecondField)
                {    
                    ToolTip = 'Tooltip on page field (it was never defined on the table)';
                }
            }
        }
    }
}
```



## Adding tooltips to page fields (2023 release wave 2 or earlier)

In [!INCLUDE[prod_short](includes/prod_short.md)] 2023 release wave 2 or earlier, you can only define tooltips on page fields. 

If you display a table field on multiple pages, such as a card and a list, you must define the tooltip on each page.

## Related information

[Help users get unblocked (by providing tooltips)](../user-assistance.md#help-users-get-unblocked)  
[Build your first sample extension with extension objects, install code, and upgrade code](devenv-extension-example.md)  
[Page object](devenv-page-object.md)  
