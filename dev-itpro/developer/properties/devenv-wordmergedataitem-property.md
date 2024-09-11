---
title: "WordMergeDataItem Property"
description: "Specifies the root-level DataItem that is used to generate separate reports for multiple records."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
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

When you specify a dataitem in the `WordMergeDataItem` property, the [!INCLUDE[prod_short](../includes/prod_short.md)] server does a "Mail merge" between that data item (and the ones below it) and the Word layout when rendering the report using the Word layout.

In versions before [!INCLUDE[prod_short](../includes/prod_short.md)] 2024 release wave 2, [!INCLUDE[server](../includes/server.md)] implements the document merging by first generating the full merged document in Word. Then, it inserts Word sections to reset headers, footers, and page numbers between each document generated from the `WordMergeDataItem`. This behavior means that the use of Word sections in layouts for reports using the `WordMergeDataItem` property aren't allowed. At runtime, the [!INCLUDE[server](../includes/server.md)] shows an error message such as `You cannot run the report because the {0} layout contains section breaks that conflict with the sections in the report. Remove the section breaks from the report layout, and then run the report`.

Starting from version 2024 release wave 2, the [!INCLUDE[server](../includes/server.md)] implements the document merging by generating one document in Word for each row in the WordMergeDataItem. It then converts each document to a PDF and merges all the PDF documents. As a result, there's no longer the restriction on using Word sections in layouts for reports using the `WordMergeDataItem` property. 

## Example

The following example is showing how the `WordMergeDataItem` property is used on the "Standard Sales - Invoice" report when rendered with a Word layout.

Here, the Word layout is applied to each element in the *Header* dataitem.  So, if you defined a different first page, page numbers, totals at the end, and similar report design elements in the Word layout, they're "reset" for each element in the *Header* dataitem.

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
