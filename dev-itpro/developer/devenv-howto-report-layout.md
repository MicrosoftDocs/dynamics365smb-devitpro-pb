---
title: Creating a Word layout report
description: Describes the steps involved in creating a report that uses a Word layout.
author: SusanneWindfeldPedersen
ms.custom: bap-template
ms.date: 01/24/2024
ms.reviewer: jswymer
ms.topic: conceptual
ms.author: solsen
---

# Creating a Word layout report

When you create a new report, there are two main tasks. First, you define the report dataset of data items and columns. Then, you design the report layout. These steps show how to create a report based on a Word layout. For more information about the report object, see [Report object](devenv-report-object.md) and [Report extension object](devenv-report-ext-object.md).

Later in this article you can read more how to enable multiple report layouts. For more information, see [Enabling the Microsoft Word rendering engine](devenv-howto-report-layout.md#enabling-the-microsoft-word-rendering-engine).

## How to layout your report with Word layouts

With Word layouts, you use Word as the editor for the report. Microsoft Word offers various features to help you format and layout your document reports. You can customize the margins, page orientation, and line spacing to suit your needs. You can define advanced header/footers, utilize sections to change the layout style in different places of the report layout, and utilize fonts to get just the typography that matches your organization. 

In the Word report layout, you specify the fields of the report dataset to include on report and how the fields are arranged. You also define the general format of the report, such as text font and size, margins, and background images. You typically arrange the content of the report by adding tables to the layout. To make general formatting and layout changes, such as changing text font, adding and modifying a table, or removing a data field, just use the basic editing features of Word, like you do with any Word document.

With the following sections, you can learn more about various concepts that you might want to use in your Word layouts:

- [Headers and footers](#headers-and-footers-in-word-layouts)  
- [Using tables to control alignment of text and images](#using-tables-to-control-alignment-of-text-and-images)
- [Working with pictures](#working-with-pictures-in-word-layouts)
- [Using the same table style for all tables in the layout](#using-the-same-table-style-for-all-tables-in-the-layout)
- [Using hyperlinks](#using-hyperlinks-in-word-layouts)  
- [Using sections](#using-sections-in-a-word-layout)  
- [Changing layout properties such as margins or orientation](#changing-layout-properties-such-as-margins-or-orientation)
- [Using watermarks](#using-watermarks-in-word-layouts)  
- [Using fonts](#using-fonts-in-word-layouts)  
- [Using Office document themes](#using-office-document-themes-in-word-layouts)  

For more information about how to use Word to layout documents, see [Word for Windows training](https://support.microsoft.com/en-us/office/word-for-windows-training-7bcd85e6-2c3d-4c3c-a2a5-5ed8847eae73)


### Headers and footers in Word layouts

It's common to use headers and/or footers in Word layouts to display general information about the report, such as company logo, or company name and address. To define headers and/or footers, go to **Insert** > **Header** or **Footer**. You can have a different header/footer on the first page of your layout than the rest of the page or section. When working with different headers/footers for the first page, consider entering a manual page break (<kbd>Ctrl</kbd>+<kbd>Enter</kbd>) when designing them. This makes it easier to see the difference in headers/footers. Just remember to remove the page break again. 

For more information, see [Headers and footers in Word](https://support.microsoft.com/en-us/office/headers-and-footers-in-word-b693b4fb-0d23-4109-a621-1b828b824454) (use <kbd>Ctrl</kbd>+click to open in a new tab)

> [!TIP]  
> It's possible to control the headers and footers for different sections of a document. The formatting you set up extends to each page of the section until another section break is encountered. For more information, see [Configure headers and footers for different sections of a document](https://support.microsoft.com/en-us/office/configure-headers-and-footers-for-different-sections-of-a-document-94332643-a6e9-46aa-ab29-064f1d356db6) (use <kbd>Ctrl</kbd>+click to open in a new tab)

### Using tables to control alignment of text and images

When designing a Word report layout, consider using tables to control alignment of text and images, also for content outside repeaters. 

Using tables, you can design layouts with lines that have text aligned to both the left, middle, and right in the line. You can also control exactly where on the page text elements are placed.

> [!TIP]  
> Show the table gridlines so that you see the boundaries of table cells. Remember to hide the gridlines when you're done editing. To show or hide table gridlines, select the table, and then under **Layout** on the **Table** tab, choose **View Gridlines**.

### Working with pictures in Word Layouts

There are at least two things you should consider when adding pictures to your Word layout:
1. Control how they fit into the layout (don't overflow),
2. Reduce report file size by compressing the pictures.

#### Control how pictures fit into the layouts

Before inserting a picture, either as a static file in the layout or from the report dataset, you need to ensure that it doesn't take up space according to its size, but that it's adjusted to the size that you want in your layout. The best way to do this is to encapsulate the picture in a cell in a table, maybe in a 1x1 table introduced only for this purpose. When changing the size of a table cell for a picture, by default it still adjusts to fit the picture. Therefore, you must also disable the cells ability to change its size dynamically. 

To control the picture size using a table, do as follows:

1. Mark the cell.
2. Under *Layout*, Set *Height* and *Width* in the Cell size menu.
3. In the *Table* menu, click *Properties*. On the *Table* tab, click *Positioning* and then uncheck the *Automatically resize to fit contents* option.

#### Reducing file size by compressing pictures

When adding pictures directly to your layout file, such as background images or logos, consider reducing the file size by compressing picture sizes. With compression options in Word, you can reduce both the file size and picture dimensions based on how you intend to use the picture, such as the quality needed for print or viewing the document report on screen or attach to an email. You can compress all pictures in the file or just the ones that you select. 

To compress pictures that are part of the layout file, do as follows:

1. When your pictures have been inserted into Word, select the picture or pictures that you want to compress.
2. Under *Picture Tools*, on the *Format* tab, in the *Adjust* group, select *Compress picture*. Then choose what and how you want to compress and select OK.

For more information, see [Reduce the file size of a picture in Microsoft Office](https://support.microsoft.com/en-us/office/reduce-the-file-size-of-a-picture-in-microsoft-office-8db7211c-d958-457c-babd-194109eb9535)

For pictures that are part of the report dataset, you need to adjust the size in Business Central.


### Using the same table style for all tables in the layout

If your document layout contains multiple tables, consider using table styles to 
ensure that the formatting of your tables is consistent. In case you need to later on apply changes to table layouts, 
this will also save you time as such a change only needs to be done once. 

To set a default table style, do as follows:

1. Mark the table.
2. Navigate to the *Table Design* menu.
3. For the table style you want to use as default, right-click it. 
4. In the Menu that appears, select *Set as Default*. A dialog box appears.
5. Select *This document only*. Select OK.


### Using hyperlinks in Word layouts

In a Word report layout, you can set up hyperlinks on text and picture fields, for example to add a link on invoice reports that targets the URL of a payment service. This link is then present when rendering the report as a Word or PDF document. 

For more information, see [Using hyperlinks in Word layouts](devenv-hyperlinks-in-word-report-layouts.md).  

### Using sections in a Word layout

If you need your report to change style for different types of content, consider using different *Sections* in your Word layout. Within each section, you can have different formatting, such as page or table layouts, and headers/footers.

> [!NOTE]  
> Use of section breaks in Word layouts are currently only supported for reports that do not use the **WordMergeDataItem** property. If section breaks are present in a layout used in such a report, then the user will see this error message:
>
> `You cannot run the report because the {0} layout contains section breaks that conflict with the sections in the report. Remove the section breaks from the report layout, and then run the report.`


Sections are created using section breaks. To start a new section, select where you want it to begin. Then go to **Layout** > **Breaks**. For more information, see [Insert a section break](https://support.microsoft.com/en-us/office/insert-a-section-break-eef20fd8-e38c-4ba6-a027-e503bdf8375c) (use <kbd>Ctrl</kbd>+click to open in a new tab).

> [!TIP]  
> When working with sections in a layout, it's recommended to turn the display of formatting marks on. This makes it much easier to see in which section of the layout you are working. For more information, see [Show or hide tab marks in Word](https://support.microsoft.com/en-us/office/show-or-hide-tab-marks-in-word-84a53213-5d02-404a-b022-09cae1a3958b) (use <kbd>Ctrl</kbd>+click to open in a new tab)


### Changing layout properties such as margins or orientation

If you need to change layout properties such as margins, orientation (portrait or landscape), 
or columns inside your Word layout, then use sections. Your choice of these properties is in scope until the next section break, where they can be overridden.

For more information, see [Change page orientation to landscape or portrait](https://support.microsoft.com/en-us/office/change-page-orientation-to-landscape-or-portrait-9b5ac1af-9998-4a37-962b-a82b689572a9)


### Using watermarks in Word layouts

A watermark is text or a picture that sits behind your text and pictures, faint or washed-out so that it doesn't interfere with what's on the page. Like headers and footers, a watermark usually appears on all the pages of your document. You define and manage the watermark from the **Design** tab, select **Watermark**.

For more information, see [Watermarks in Word](https://support.microsoft.com/en-us/office/watermarks-in-word-e8317e40-ba36-493f-9cb8-6b93537b14d8) (use <kbd>Ctrl</kbd>+click to open in a new tab)


#### Using different watermarks in sections

The internal data model in Word only allows one watermark for the entire document. If you try to insert a second watermark, whether in a first page, other pages, or sections, Word will delete or replace the previous watermark. 

In case you want to apply different watermarks to different sections, this work-around might work:

1. On the **Home** tab, click **Select** > **Selection Pane**. The Selection pane is used to manage objects in your document: reorder them, show or hide them, and group or ungroup them.
2. Within the first section, open the header or footer and insert the watermark you want to use. Just use the normal approach. In the Selection pane, the watermark now shows as "PowerPlusWaterMarkObject" for a text object or "WordPictureWaterMark" for a picture object (each name followed by an identifier). Double-click on the name to make it editable, and change it to something else (maybe to the watermark text, such as 'Customer copy' or 'Original'). Now Word won't treat the object as a (global) watermark. 
3. Within each subsequent section, repeat step number 2.
4. On the **Home** tab, choose **Select** > **Selection Pane** to turn off the Selection pane again.


### Using fonts in Word layouts

[!INCLUDE[using_fonts](../includes/include-excel-word-layouts-fonts.md)]

Fonts don't have to be installed on your machine when working with the layout, you can just mark content and type in the name of the font you want to use. When the report is generated on the server, if the font is installed on the server, then it's used in the rendered report document. If the font isn't available on the server or embedded in the layout, then the report still renders, but the font defined in the *Normal* style is used.

In case your favorite (true-type) font isn't installed on the [!INCLUDE[prod_short](includes/prod_short.md)] server, then you can embed it in the layout. For more information, see [Embedding custom fonts](https://support.microsoft.com/en-us/office/benefits-of-embedding-custom-fonts-cb3982aa-ea76-4323-b008-86670f222dbc).

> [!NOTE]
> Embedding fonts increases the size of the generated documents.

### Using Office document themes in Word layouts

[!INCLUDE[using_office_themes](../includes/include-excel-word-layouts-themes.md)]

To apply a theme to your Word layout, use the standard styles for text and headers. Then the colors and fonts follow the chosen theme.

For tables, for the table header be respect theme changes, you need to do the following:

1. Mark the header row.
2. In the *Table Design* menu, expand the *Shading* menu in *Table Styles*.
3. Now pick a theme color.

If you use the prebuilt Table Styles, you must manually change the color in the Shading menu for the header color to respect theme changes.

To learn more about templates, themes, and Word styles, see [Differences between templates, themes, and Word styles](https://support.microsoft.com/en-us/office/differences-between-templates-themes-and-word-styles-101c2774-296b-4bb7-b084-2e936f6ee390)


### Design layouts for precision printing

If you need to design Word layouts where placement of design components on the page needs to be precise, then you can set their absolute position, both horizontal and vertical. It's possible to set precision to two decimals of cm/inch.

For tables, you can control their absolute position on the page in *Table Properties*. In the *Tables* tab, choose *Around* for the text wrapping. Now the *Positioning* button is unlocked and you can set the horizontal and vertical position of the table. For more information, see [Set or change table properties](https://support.microsoft.com/en-us/office/set-or-change-table-properties-3237de89-b287-4379-8e0c-86d94873b2e0)


For text boxes, you can control their absolute position on the page in the *Shape format* menu: *Position* > *More Layout Options* (you can also navigate here by right-clicking on the text box). Now you can set the horizontal and vertical position of the text box. For more information, see [Ways to customize a text box](https://support.microsoft.com/en-us/office/ways-to-customize-a-text-box-0570ef01-1f4d-4f37-a787-7be3ce6b6380)


> [!TIP]  
> When designing layouts for precision printing, consider enabling the ruler and gridlines (find them under *View* > *Show*). For more information, see [Show the ruler](https://support.microsoft.com/en-us/office/show-the-ruler-dc8a4e0d-209f-43b8-b967-8e65da24d4c7)


## Design guidelines for a report dataset designed for Word layouts

With Word layouts, Word is used as the editor for the report. The person designing the layout interacts with the labels, data items, and fields from the dataset from the XML Mapping Pane. If you want users to be able to change the layout, consider using friendly names for labels, data items, and fields. 


## Report labels in Word layouts

Report labels are used by report layouts as, for example, the caption for a field, the title for a chart, or the title for the report itself. 

Report labels defined in the report object are available as in the `Labels` part of the XML Mapping pane in Word:

![Clip of the XML Mapping pane in Word.](/dynamics365/business-central/media/nav_reportlayout_xmlmappingpane.png "NAV_ReportLayout_XMLMappingPane")

For more information about labels, see [Report labels](./devenv-report-object.md#report-labels).

## Formatting data in Word layouts

[!INCLUDE[formatting_data_in_layouts](../includes/include-formatting-data-in-layouts.md)]

Specifically for Word layouts, there's no way to control formatting of data elements in Word. Therefore, you need to do the formatting in the report dataset. For more information, see [Formatting field values in report datasets](devenv-format-report-field-data.md).


## How to iterate a Word layout over a data item

When you specify a data item in the `WordMergeDataItem` property, the [!INCLUDE[server](includes/server.md)] does a "Mail merge" between that data item (and the ones below it) and the Word layout when rendering the report using the Word layout. The Word layout is applied to each element in the specified data item. So, if you've defined a different first page, page numbers, totals at the end, and similar report design elements in the Word layout, they are "reset" for each element in the specified data item.

For more information and an example, see [WordMergeDataItem Property](properties/devenv-wordmergedataitem-property.md).


## How to do totals in Word layouts

Compared to the layout types Excel or RDL, it isn't possible to do calculations in a Word layout. If you want to add totals to your report, you need to calculate these in AL variables in the report object and then use a data item based on an Integer table to expose them to the XML Mapping pane in Word.

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
    > If you don't see the Developer tab, go to **Options**, then **Customize Ribbon**, and in the **Main tabs** section, select the **Developer** check box.
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

The rendering of Word reports is controlled by an application feature key. Enabling the key `RenderWordReportsInPlatform` in the **Feature Management** page in Business Central switches the Microsoft Word report rendering to the new platform rendering, which supports multiple layouts and new triggers for **Save** and **Download** actions.

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


## Difference between RDLC and Word layouts

If you're switching from developing reports with RDL layouts to using Word layouts, you might need to change your mindset on how you develop reports and their layouts. RDL allows you to dynamically change many properties in the layout. This isn't possible in Word. For many logic-related conditions, instead you have to do them in the report dataset in AL and then utilize the methods outlined in this article. 

For reports where you expect customers to adjust the layout or use themes to change the overall look-and-feel of the document, consider using a Word layout over an RDL layout. 


## See Also

[Using Hyperlinks in Word Layouts](devenv-hyperlinks-in-word-report-layouts.md)  
[WordMergeDataItem Property](properties/devenv-wordmergedataitem-property.md)   
[Report Design Overview](devenv-report-design-overview.md)  
[Report Object](devenv-report-object.md)  
[Report Extension Object](devenv-report-ext-object.md)  
[Developing a Custom Report Render](devenv-report-custom-render.md)  
[Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md)  
[Creating an Excel Layout Report](devenv-howto-excel-report-layout.md)  
