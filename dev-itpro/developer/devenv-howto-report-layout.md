---
title: Creating a Word layout report
description: Describes the steps involved in creating a report that uses a Word layout.
author: SusanneWindfeldPedersen
ms.custom: bap-template
ms.date: 01/17/2024
ms.reviewer: jswymer
ms.topic: conceptual
ms.author: solsen
---

# Creating a Word layout report

When you create a new report, there are two main tasks. First, you define the report dataset of data items and columns. Then, you design the report layout. These steps will show how to create a report based on a Word layout. For more information about the report object, see [Report object](devenv-report-object.md) and [Report extension object](devenv-report-ext-object.md).

Later in this article you can read more how to enable multiple report layouts. For more information, see [Enabling the Microsoft Word rendering engine](devenv-howto-report-layout.md#enabling-the-microsoft-word-rendering-engine).

## How to layout your report with Word layouts

With Word layouts, you use Word as the editor for the report. Microsoft Word offers a variety of features to help you format and layout your document reports. You can customize the margins, page orientation, and line spacing to suit your needs. You can define advanced header/footers, utilize sections to change the layout style in different places of the report layout, and utilize fonts to get just the typography that match your organization. 

In the Word report layout, you specify the fields of the report dataset to include on report and how the fields are arranged. You also define the general format of the report, such as text font and size, margins, and background images. You typically arrange the content of the report by adding tables to the layout. To make general formatting and layout changes, such as changing text font, adding and modifying a table, or removing a data field, just use the basic editing features of Word, like you do with any Word document.

With the following sections, you can learn more about various concepts that you might want to use in your Word layouts:

- [Using hyperlinks](#using-hyperlinks-in-word-layouts)  
- [Using sections](#using-sections-in-a-word-layout)  
- [Headers and footers](#headers-and-footers-in-word-layouts)  
- [Using watermarks](#using-watermarks-in-word-layouts)  
- [Using fonts](#using-fonts-in-word-layouts)  
- [Using Office document themes](#using-office-document-themes-in-word-layouts)  


### Using hyperlinks in Word layouts

In a Word report layout, you can set up hyperlinks on text and picture fields, for example to add a link on invoice reports that targets the URL of a payment service. This link will then be present when rendering the report as a Word or PDF document. 

For more information, see [Using hyperlinks in Word layouts](devenv-hyperlinks-in-word-report-layouts.md).  

### Using sections in a Word layout

If you need your report to change style for different types of content, consider using different *Sections* in your Word layout. Within each section, you can have different formatting, such as page or table layouts, and headers/footers.

Sections are created using section breaks. To start a new section, select where you want it to begin. Then go to **Layout** > **Breaks**. For more information, see [Insert a section break](https://support.microsoft.com/en-us/office/insert-a-section-break-eef20fd8-e38c-4ba6-a027-e503bdf8375c) (use <kbd>Ctrl</kbd>+click to open in a new tab).

> [!TIP]  
> When working with sections in a layout, it's recommended to turn the display of formatting marks on. This makes it much easier to see in which section of the layout you are working. For more information, see [Show or hide tab marks in Word](https://support.microsoft.com/en-us/office/show-or-hide-tab-marks-in-word-84a53213-5d02-404a-b022-09cae1a3958b) (use <kbd>Ctrl</kbd>+click to open in a new tab)


### Headers and footers in Word layouts

It is common to use headers and/or footers in Word layouts to display general information about the report, such as company logo, or company name and address. To define headers and/or footers, go to **Insert** > **Header** or **Footer**. Note that you can have a different header/footer on the first page of your layout than the rest of the page or section (see tip below). When working with different headers/footers for the first page, consider entering a manual page break (Ctrl+Enter) when designing them. This makes it easier to see the difference in headers/footers (remember to remove the page break again). 

For more information, see [Headers and Footers in Word](https://support.microsoft.com/en-us/office/headers-and-footers-in-word-b693b4fb-0d23-4109-a621-1b828b824454) (use <kbd>Ctrl</kbd>+click to open in a new tab)

> [!TIP]  
> It's possible to control the headers and footers for different sections of a document. The formatting you set up extends to each page of the section until another section break is encountered. For more information, see [Configure headers and footers for different sections of a document](https://support.microsoft.com/en-us/office/configure-headers-and-footers-for-different-sections-of-a-document-94332643-a6e9-46aa-ab29-064f1d356db6) (use <kbd>Ctrl</kbd>+click to open in a new tab)

### Using watermarks in Word layouts

A watermark is text or a picture that sits behind your text and pictures, usually faint or washed-out so that it doesn't interfere with what's on the page. Like headers and footers, a watermark usually appears on all the pages of your document. You define and manage the watermark from the **Design** tab, select **Watermark**.

For more information, see [Watermarks in Word](https://support.microsoft.com/en-us/office/watermarks-in-word-e8317e40-ba36-493f-9cb8-6b93537b14d8) (use CTRL+click to open in a new tab)


#### Using different watermarks in sections

The internal data model in Word only allows one watermark for the entire document. If you try to insert a second watermark, whether in a first page, other pages, or sections, Word will delete or replace the previous watermark. 

In case you want to apply different watermarks to different sections, this work-around might work:
1. On the **Home** tab, click **Select** > **Selection Pane**. The Selection pane is used to manage objects in your document: re-order them, show or hide them, and group or ungroup them.
2. Within the first section, open the header or footer and insert the watermark you want to use. Just use the normal approach. In the Selection pane, the watermark will now show as "PowerPlusWaterMarkObject" for a text object or "WordPictureWaterMark" for a picture object (each name followed by an identifier). Doubleclick on the name to make it editable, and change it to something else (maybe to the watermark text, such as 'Customer copy' or 'Original'). Now Word will not treat the object as a (global) watermark. 
3. Within each subsequent section, repeat step number 2.
4. On the **Home** tab, choose **Select** > **Selection Pane** to turn off the Selection pane again.


### Using fonts in Word layouts

[!INCLUDE[using_fonts](../includes/include-excel-word-layouts-fonts.md)]

Note that fonts don't have to be installed on your machine when working with the layout, you can just mark content and type in the name of the font you want to use. When the report is generated on the server, if the font is installed on the server, then it's used in the rendered report document. If the font isn't available on the server or embedded in the layout, then the report still renders, but the font defined in the *Normal* style is used.

In case your favorite (true-type) font isn't installed on the [!INCLUDE[prod_short](includes/prod_short.md)] server, then you can embed it in the layout. For more information, see [Embedding custom fonts](https://support.microsoft.com/en-us/office/benefits-of-embedding-custom-fonts-cb3982aa-ea76-4323-b008-86670f222dbc).

> [!NOTE]
> Embedding fonts increases the size of the generated documents.


### Using Office document themes in Word layouts

[!INCLUDE[using_office_themes](../includes/include-excel-word-layouts-themes.md)]


## Report labels in Word layouts

Report labels are used by report layouts as, for example, the heading for a field in a table, the title for a chart, or the title for the report itself. 

Report labels defined in the *Labels* section of the report object and captions included on dataitem colums using the [IncludeCaption property](properties/devenv-includecaption-property.md) are available as in the `Labels` part of the XML Mapping pane in Word:

![Clip of the XML Mapping pane in Word.](/dynamics365/business-central/media/nav_reportlayout_xmlmappingpane.png "NAV_ReportLayout_XMLMappingPane")

For more information about labels, see [Report labels](./devenv-report-object.md#report-labels).

## Formatting data in Word layouts

[!INCLUDE[formatting_data_in_layouts](../includes/include-formatting-data-in-layouts.md)]

Specifically for Word layouts, there is no way to control formatting of data elements in Word. Therefore, you need to do the formatting in the report dataset. For more information, see [Formatting field values in report datasets](devenv-format-report-field-data.md).


## How to iterate a Word layout over a data item

When you specify a data item in the `WordMergeDataItem` property, the [!INCLUDE[server](includes/server.md)] will do a "Mail merge" between that data item (and the ones below it) and the Word layout when rendering the report using the Word layout. The Word layout is applied to each element in the specified data item. So, if you've defined a different first page, page numbers, totals at the end, and similar report design elements in the Word layout, they'll be "reset" for each element in the specified data item.

For more information and an example, see [WordMergeDataItem Property](properties/devenv-wordmergedataitem-property.md).


## How to do totals in Word layouts

Compared to the layout types Excel or RDL, it is not possible to do calculations in a Word layout. If you want to add totals to your report, you need to calculate these in AL variables in the report object and then use a data item based on an Integer table to expose them to the XML Mapping pane in Word.

The following example illustrates how to code this. The example is based on report 1306 "Standard Sales - Invoice" from the base application.

```al
report 50142 "My Sales Invoice report"
{
  // report properties

  dataset
  {
    // In some dataitem here, vTotalAmount and vTotalVATBaseLCY are calculated in the OnAfterGetRecord trigger

    ...

    dataitem(Totals; "Integer")
    {
      // maybe some dataitem properties here

      column(TotalNetAmount; Format(vTotalAmount, 0, AutoFormat.ResolveAutoFormat("Auto Format"::AmountFormat, Header."Currency Code")))
      {
      }
      column(TotalVATBaseLCY; vTotalVATBaseLCY)
      {
      }
    }
  }

  // layouts defined here
  rendering {}

  // labels defined here
  labels {}

  ...

  protected var
    vTotalVATBaseLCY: Decimal;
    vTotalAmount: Decimal

}
```

## Example: Create a Word layout report

The following example extends the Customer List page with a trigger that runs the report as soon as the Customer List page is opened.

> [!NOTE]
> The **Different first page** and **Different odd and even** options for headers and footers in Word aren't supported for HTML conversion. If you select either of these options, the header and footer won't appear in rendered output, such as an Email Body.

1. Create a new extension to the **Customer List** page that contains code to run the report and a report object by adding the following lines of code: 
 
    ```AL
    pageextension 50100 MyExtension extends "Customer List"
    {
      trigger OnOpenPage();
      begin
        report.Run(Report::MyWordReport);
      end;
    }

    report 50124 MyWordReport
    {
    }
    ```
2. Add the **Customer** table as the data item and the **Name** field as a column to the report by adding the following lines of code to the report. For more information about defining a dataset, see [Report Dataset](devenv-report-dataset.md).  

    ```AL
    report 50124 MyWordReport
    {
      WordMergeDataItem = Customer; // Set this if you want to iterate the report layout over each customer
      // Maybe also set other report properties

      dataset
      {
        dataitem(Customer; Customer)
        {
          column(Name; Name)
          {
          }
        }
      } 

      rendering 
      {
        layout(MyWordLayout)
        {
          Type = Word;
          Caption = 'Customer list for print';
          Summary = 'Customer list in Word that is designed for printing.';
          LayoutFile = 'MyWordReport.docx';
        }
      }
    }
    ```
4. Build the extension (<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>B</kbd>) to generate the MyWordReport.docx file.
5. Open the generated report layout file in Word.
6. In Word, edit the layout using the **XML Mapping Pane** on the **Developer** tab.  
    > [!NOTE]  
    > If you do not see the Developer tab, go to **Options**, then **Customize Ribbon**, and in the **Main tabs** section, select the **Developer** check box.
7. In Word, to the right, in the **Custom XML part** lookup, locate the report, and then open the layout.
8. Right-click on the **Customer** table, and in **Insert Content Control**, select **Repeating** to add the repeater data item.
9. Right-click on the **Name** field and in **Insert Content Control**, select **Plain Text** to add the column as a text box.
10. Save the report layout when you're done and then close it.
11. Back in Visual Studio Code, select <kbd>Ctrl</kbd>+<kbd>F5</kbd>  to compile and run the report.  

You'll now see the generated report in preview mode.

> [!NOTE]  
> If the report layout is not generated, open the `settings.json` from Visual Studio Code. Use **Ctrl+Shift+P**, then choose **Preferences: Open User Settings**, locate the **AL Language extension**. Under **Compilation Options**, choose **Edit in settings.json** and add the following line:  
>
>```json
>"al.compilationOptions": {
>   "generateReportLayout": true
> }
>```

[!INCLUDE [send-report-excel](includes/send-report-excel.md)]


## Enabling the Microsoft Word rendering engine

[!INCLUDE [2022_releasewave1](../includes/2022_releasewave1.md)]

The rendering of Word reports is controlled by an application feature key. Enabling the key `RenderWordReportsInPlatform` in the **Feature Management** page in Business Central will switch the Microsoft Word report rendering to the new platform rendering, which supports multiple layouts and new triggers for **Save** and **Download** actions.

<!-- 
For more information about the custom render, see [Developing a Custom Report Render](devenv-report-custom-render.md).-->

> [!NOTE]  
> Application rendering is obsolete and will be deprecated in a future release. It is recommended to stay on the old platform if you have extensions that use custom Word layouts and therefore cannot use the new platform, for example, because of dependencies on the `OnBeforeMergeDocument` or `OnBeforeMergeWordDocument` events.

The following AL snippet can be used in code to implement rendering differentiation in extensions.

```al
 var
    FeatureKey: Record "Feature Key";
    PlatformRenderingInPlatformTxt: Label 'RenderWordReportsInPlatform', Locked = true;

// code snippet
if (FeatureKey.Get(PlatformRenderingInPlatformTxt) and (FeatureKey.Enabled = FeatureKey.Enabled::"All Users")) then
    // Platform rendering of Word reports, Custom layout types will be handled by the OnCustomDocumentMerger event
    ....
else
    // App rendering - The report type will be treated like a Word file and rendered by the application
    ...
```

For more information about feature management, see [Enabling Upcoming Features Ahead of Time](../administration/feature-management.md).


## Report limit - maximum number of documents that can be merged in report

The [!INCLUDE[prod_short](includes/prod_short.md)] platform has built-in limits to protect the stability of the system from a single report consuming too many resources. For example, there's a limit on the maximum number of documents that can be merged in a report using a Word layout.

For more information on report limits, see [Report limits](devenv-report-object.md#report-limits).


## See Also

[Using Hyperlinks in Word Layouts](devenv-hyperlinks-in-word-report-layouts.md)  
[WordMergeDataItem Property](properties/devenv-wordmergedataitem-property.md)   
[Report Design Overview](devenv-report-design-overview.md)  
[Report Object](devenv-report-object.md)  
[Report Extension Object](devenv-report-ext-object.md)  
[Developing a Custom Report Render](devenv-report-custom-render.md)  
[Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md)  
[Creating an Excel Layout Report](devenv-howto-excel-report-layout.md)  
