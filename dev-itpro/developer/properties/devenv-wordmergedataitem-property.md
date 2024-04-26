---
title: "WordMergeDataItem Property"
description: "Specifies the root-level DataItem that is used to generate separate reports for multiple records."
ms.author: solsen
ms.date: 02/26/2024
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# WordMergeDataItem Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies the root-level DataItem that is used to generate separate reports for multiple records.

## Applies to
-   Report

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
WordMergeDataItem = MyDataItem; // MyDataItem must be present as a top-level dataitem in the report dataset
```

## Remarks

The `WordMergeDataItem` property is only applied when rendering a report using a Word layout.

When you specify a dataitem in the `WordMergeDataItem` property, the [!INCLUDE[prod_short](../includes/prod_short.md)] server will do a "Mail merge" between that data item (and the ones below it) and the Word layout when rendering the report using the Word layout.


## Example

The following example is showing how the `WordMergeDataItem` property is used on the "Standard Sales - Invoice" report when rendered with a Word layout.

Here, the Word layout will be applied to each element in the *Header* dataitem. Thus, if you have defined a different first page, page numbers, totals at the end, and similar report design elements in the Word layout, they'll be "reset" for each element in the *Header* dataitem.


```AL
report 1306 "Standard Sales - Invoice"
{
    // Other report properties set here

    WordMergeDataItem = Header;

    dataset
    {
        dataitem(Header; "Sales Invoice Header")
        {
            ...
        }
    }

    ...

    rendering
    {
        layout("StandardSalesInvoice.docx")
        {
            Type = Word;
            LayoutFile = './Sales/History/StandardSalesInvoice.docx';
            Caption = 'Standard Sales Invoice (Word)';
            Summary = 'The Standard Sales Invoice (Word) provides a simple layout that is also relatively easy for an end-user to modify.';
        }

        // more layouts here
    }
}
```


## See Also

[Creating a Word layout report](../devenv-howto-report-layout.md)   
[Working with Word layouts](/dynamics365/business-central/ui-how-add-fields-word-report-layout?toc=/dynamics365/business-central/dev-itpro/toc.json)   
[Report object](../devenv-report-object.md)   
[Report overview](../devenv-reports.md)  
