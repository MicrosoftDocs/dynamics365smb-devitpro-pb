---
title: Creating a Word layout report
description: Describes the steps involved in creating a report that uses a Word layout.
author: SusanneWindfeldPedersen
ms.custom: bap-template
ms.date: 12/30/2024
ms.reviewer: solsen
ms.topic: conceptual
ms.author: solsen
---

# Creating a Word layout report

When you create a new report, there are two main tasks. First, you define the report dataset of data items and columns. Then, you design the report layout. These steps show how to create a report based on a Word layout. Learn more about the report object in [Report object](devenv-report-object.md) and [Report extension object](devenv-report-ext-object.md).

<!-- ony supported in v20 Later in this article you can read more how to enable multiple report layouts. Learn more in [Enabling the Microsoft Word rendering engine](devenv-howto-report-layout.md#enabling-the-microsoft-word-rendering-engine).--> 

## How to create a new Word layout from Visual Studio Code

If you want to create a new Word layout from Visual Studio Code, do the following steps:

1. Open the report object in Visual Studio Code.
1. Navigate to the *rendering* section (or create one).
1. Add a new layout entry of type Word and set the `LayoutFile` property to a value that is a valid name for a Word file, such as 'MyWordReport.docx'.
1. Now build the extension (<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>B</kbd>) to generate the Word file that includes the Custom XML part.

## How to lay out your report with Word layouts

With Word layouts, you use Word as the editor for the report. Microsoft Word offers various features to help you format and layout your document reports. You can customize the margins, page orientation, and line spacing to suit your needs. You can define advanced header/footers, utilize sections to change the layout style in different places of the report layout, and utilize fonts to get just the typography that matches your organization. 

In the Word report layout, you specify the fields of the report dataset to include on report and how the fields are arranged. You also define the general format of the report, such as text font and size, margins, and background images. You typically arrange the content of the report by adding tables to the layout. To make general formatting and layout changes, such as changing text font, adding and modifying a table, or removing a data field, use the basic editing features of Word, like you do with any Word document.

With the following sections, you can learn more about various concepts that you might want to use in your Word layouts:

- [Headers and footers](#headers-and-footers-in-word-layouts)  
- [Using tables to control alignment of text and images](#using-tables-to-control-alignment-of-text-and-images)
- [Working with pictures](#working-with-pictures-in-word-layouts)
- [Using tables to display data from the report dataset (simple repeaters)](#using-tables-to-display-data-from-the-report-dataset-simple-repeaters)
- [Using lists to display data from the report dataset (simple repeaters)](#using-lists-to-display-data-from-the-report-dataset-simple-repeaters)
- [Using nested repeaters to display data from nested dataitems in the report dataset](#using-nested-repeaters-to-display-data-from-nested-dataitems-in-the-report-dataset)
- [Sub totals / running totals](#sub-totalsrunning-totals)
- [Conditional formatting](#conditional-formatting)
- [Using the same table style for all tables in the layout](#using-the-same-table-style-for-all-tables-in-the-layout)
- [Using hyperlinks](#using-hyperlinks-in-word-layouts)  
- [Using sections](#using-sections-in-a-word-layout)  
- [Changing layout properties such as margins or orientation](#changing-layout-properties-such-as-margins-or-orientation)
- [Using watermarks](#using-watermarks-in-word-layouts)  
- [Using fonts](#using-fonts-in-word-layouts)  
- [Using Office document themes](#using-office-document-themes-in-word-layouts)  

Learn more about how to use Word to lay out documents at [Word for Windows training](https://support.microsoft.com/en-us/office/word-for-windows-training-7bcd85e6-2c3d-4c3c-a2a5-5ed8847eae73).

### Headers and footers in Word layouts

It's common to use headers and/or footers in Word layouts to display general information about the report, such as company logo, or company name and address. To define headers and/or footers, go to **Insert** > **Header** or **Footer**. You can have a different header/footer on the first page of your layout than the rest of the page or section. When working with different headers/footers for the first page, consider entering a manual page break (<kbd>Ctrl</kbd>+<kbd>Enter</kbd>) when designing them. This practice makes it easier to see the difference in headers/footers. Just remember to remove the page break again. 

Learn more at [Headers and footers in Word](https://support.microsoft.com/en-us/office/headers-and-footers-in-word-b693b4fb-0d23-4109-a621-1b828b824454) (use <kbd>Ctrl</kbd>+click to open in a new tab)

> [!TIP]  
> It's possible to control the headers and footers for different sections of a document. The formatting you set up extends to each page of the section until another section break is encountered. Learn more at [Configure headers and footers for different sections of a document](https://support.microsoft.com/en-us/office/configure-headers-and-footers-for-different-sections-of-a-document-94332643-a6e9-46aa-ab29-064f1d356db6) (use <kbd>Ctrl</kbd>+click to open in a new tab)

### Using tables to control alignment of text and images

When designing a Word report layout, consider using tables to control alignment of text and images, also for content outside repeaters. 

Using tables, you can design layouts with lines that have text aligned to both the left, middle, and right in the line. You can also control exactly where on the page text elements are placed.

> [!TIP]  
> Show the table gridlines so that you see the boundaries of table cells. Remember to hide the gridlines when you're done editing. To show or hide table gridlines, select the table, and then under **Layout** on the **Table** tab, choose **View Gridlines**.

### Working with pictures in Word Layouts

There are at least two things you should consider when adding pictures to your Word layout:

1. Control how they fit into the layout (don't overflow).
2. Reduce report file size by compressing the pictures.

#### Control how pictures fit into the layouts

When inserting a picture, ensure that it doesn't take up space according to its size, but that it's adjusted to the size that you want in your layout. The best way to do this is to encapsulate the picture in a cell in a table, maybe in a 1x1 table introduced only for this purpose. When you change the size of a table cell for a picture, by default it still adjusts to fit the picture. Therefore, you must also disable the cell's ability to change its size dynamically. 

To control the picture size using a table, do as follows:

1. Mark the cell.
2. Under *Layout*, Set *Height* and *Width* in the Cell size menu.
3. In the *Table* menu, click *Properties*. On the *Table* tab, click *Positioning* and then uncheck the *Automatically resize to fit contents* option.

Controlling how pictures fit into the layouts is important both for static files in the layout and for pictures inserted from the report dataset.

#### Reducing file size by compressing pictures

When adding pictures directly to your layout file, such as background images or logos, consider reducing the file size by compressing picture sizes. With compression options in Word, you can reduce both the file size and picture dimensions based on how you intend to use the picture. For instance, maybe the quality needed for print is different from what is needed when just viewing the document report on screen or attach to an email. You can compress all pictures in the file or just the ones that you select. 

To compress pictures that are part of the layout file, do as follows:

1. When you have inserted your pictures into Word, select the picture or pictures that you want to compress.
2. Under *Picture Tools*, on the *Format* tab, in the *Adjust* group, select *Compress picture*. Then choose what and how you want to compress and select OK.

Learn more at [Reduce the file size of a picture in Microsoft Office](https://support.microsoft.com/en-us/office/reduce-the-file-size-of-a-picture-in-microsoft-office-8db7211c-d958-457c-babd-194109eb9535)

For pictures that are part of the report dataset, you need to adjust the size in Business Central. You can use the codeunit 5080 "Image Handler Management" to scale images in AL (from version 24.1 also available in [!INCLUDE[prod_short](includes/prod_short.md)] online). Learn more at [Codeunit "Image Handler Management"](/dynamics365/business-central/application/base-application/codeunit/system.media.image-handler-management).

### Using tables to display data from the report dataset (simple repeaters)

If you want to add a table to the report layout where data in each row comes from a dataitem from the report dataset, do as follows:

1. Create a table with two rows and a column for each field that you want displayed.

2. In the first row, add text for the headers, either as static text or from the `Labels` part of the XML Mapping pane. This row is the header for the table.

3. The second row is the placeholder for the repeating rows with data fields. Select the entire row.  
  
4. In the **XML Mapping** pane, right-click the control that corresponds to the report data item that contains the fields that you want repeated, choose **Insert Content Control**, and then choose **Repeating**.  
  
5. Add the repeating fields to the row as follows:  
 
    1. Place your pointer in a cell.  
    1. In the **XML Mapping** pane, right-click the field that you want to add, choose **Insert Content Control**, and then choose **Plain Text**.  
    1. For each field, repeat steps a and b.  

Learn more at [Supporting repeating content](/office/client-developer/word/content-controls-in-word#supporting-repeating-content).

> [!TIP]  
> When you work with a very long table, it'll run across multiple pages. It's possible to set up the table so that the table header row appears on each page automatically. To achieve this, do as follows:
>
> 1. Select the header row or rows that you want to repeat on each page. The selection must include the first row of the table.
> 1. Under *Table Tools*, on the *Layout* tab, in the *Data* group, choose *Repeat Header Rows*.
>
> Learn more at [Repeat table header on subsequent pages](https://support.microsoft.com/en-us/office/repeat-table-header-on-subsequent-pages-2ff677e0-3150-464a-a283-fa52794b4b41).

### Using lists to display data from the report dataset (simple repeaters)

If you want to add a bulleted or numbered list to the report layout where data in each row comes from a dataitem from the report dataset, do as follows:

1. Place the cursor on the place where you want the list to be displayed.
  
2. In the **XML Mapping** pane, right-click the control that corresponds to the report data item that contains the fields that you want repeated, choose **Insert Content Control**, and then choose **Repeating**.  

3. Inside the content control of the repeater, start the bulleted or numbered list (from *Home* > *Paragraph*). This adds a single entry in the list.

4. Now add the repeating fields to the list entry as follows:  
 
   1. Place your pointer on the list line.  
   1. In the **XML Mapping** pane, right-click the control that you want to add, choose **Insert Content Control**, and then choose **Plain Text**.  
   1. For each field, repeat steps a and b.  

Learn more at [Supporting repeating content](/office/client-developer/word/content-controls-in-word#supporting-repeating-content).

### Using nested repeaters to display data from nested dataitems in the report dataset

Word supports placing tables within table cells or having multi-level lists. And you can also add a repeater within a repeater. This means that you can have as many levels as needed in your layout, as long as they fit on the page.

### Sub totals/running totals

Word doesn't have a programming model such as RDL and hence it isn't possible to do sub totals/running totals in the Word layout itself. 

Instead, you can do the work in the dataset by defining a dataitem that calculates subtotals per partition and then a nested dataitem with the partitioned data. In the layout, you then add a table that repeats over the top level dataitem and use a nested repeater on the partitioned dataitem.

### Conditional formatting

Word doesn't have a programming model such as RDL and hence it isn't possible to do conditional formatting directly in the Word layout itself. 

But there are ways to work around this limitation by calculating the conditions in AL and adding them to the dataset. In the Word layout, you then utilize the fact that Word don't render XML elements without a value. in the following, you can learn more about different ways to do conditional formatting.

#### How to hide/show values based on a condition

If you want to hide/show a single *value* based on a condition, then make sure that the column in the dataset is set to empty or to a value based on the condition. 

In the Word layout, you now just use the column as-is.

#### How to control text properties based on a condition

If you want to show a text and control text properties such as color, font, style, or size that's based on a condition, add the column twice in the dataset. Set values to empty or to the value based on the condition. Make sure that one of them is empty. 

In the Word layout, you now place both columns next to each other, and then set the text properties on each to what you need.

#### How to mimic the BlankZero or BlankNumbers properties

If you want to mimic the BlankZero or BlankNumbers properties that exist on table and page fields, then set values to empty or to the value based on the condition (zero or the value you would have used for BlankNumbers) in the dataset.

In the Word layout, you now just use the column as-is.

#### How to hide a part of the document based on a condition

If you want to hide a part of the document, such as a table or a list, based on a condition, then create a dummy dataitem with an Integer datasource, which contains a column set to empty or to a value based on the condition. Then place the dummy dataitem on top of the dataitem that your table/list repeats over.

In the Word layout, you now use nested repeaters, where the outer repeater is on the dummy dataitem.

### Using the same table style for all tables in the layout

If your document layout contains multiple tables, consider using table styles to ensure that the formatting of your tables is consistent. In case you need to later on apply changes to table layouts, styles save you time because changes only need to be done once.

To set a default table style, do as follows:

1. Mark the table.
2. Navigate to the **Table Design** menu.
3. For the table style you want to use as default, right-click it. 
4. In the menu that appears, select **Set as Default**. A dialog box appears.
5. Select **This document only**, and then choose **OK**.

### Using hyperlinks in Word layouts

In a Word report layout, you can set up hyperlinks on text and picture fields, for example to add a link on invoice reports that targets the URL of a payment service. This link is then present when rendering the report as a Word or PDF document. 

Learn more in [Using hyperlinks in Word layouts](devenv-hyperlinks-in-word-report-layouts.md).  

### Using sections in a Word layout

If you need your report to change style for different types of content, consider using different *Sections* in your Word layout. Within each section, you can have different formatting, such as page or table layouts, paper orientation, watermarks, and headers/footers.

> [!NOTE]  
> Before [!INCLUDE[prod_short](includes/prod_short.md)] 2024 release wave 2, you couldn't include Word sections in report layouts that used the `WordMergeDataItem` property. This restriction is removed starting from 2024 release wave 2. Learn more in [How to iterate a Word layout over a data item](#how-to-iterate-a-word-layout-over-a-data-item).

Sections are created using section breaks. To start a new section, select where you want it to begin. Then go to **Layout** > **Breaks**. Learn more in [Insert a section break](https://support.microsoft.com/en-us/office/insert-a-section-break-eef20fd8-e38c-4ba6-a027-e503bdf8375c) (use <kbd>Ctrl</kbd>+click to open in a new tab).

> [!TIP]  
> When working with sections in a layout, it's recommended to turn the display of formatting marks on. This makes it much easier to see in which section of the layout you are working. Learn more in [Show or hide tab marks in Word](https://support.microsoft.com/en-us/office/show-or-hide-tab-marks-in-word-84a53213-5d02-404a-b022-09cae1a3958b) (use <kbd>Ctrl</kbd>+click to open in a new tab).

### Changing layout properties such as margins or orientation

If you need to change layout properties such as margins, orientation (portrait or landscape), 
or columns inside your Word layout, then use sections. Your choice of these properties is in scope until the next section break, where they can be overridden.

Learn more at [Change page orientation to landscape or portrait](https://support.microsoft.com/en-us/office/change-page-orientation-to-landscape-or-portrait-9b5ac1af-9998-4a37-962b-a82b689572a9).

### Using watermarks in Word layouts

A watermark is text or a picture that sits behind your text and pictures, faint or washed-out so that it doesn't interfere with what's on the page. Like headers and footers, a watermark usually appears on all the pages of your document. You define and manage the watermark from the **Design** tab, select **Watermark**.

Learn more at [Watermarks in Word](https://support.microsoft.com/en-us/office/watermarks-in-word-e8317e40-ba36-493f-9cb8-6b93537b14d8) (use <kbd>Ctrl</kbd>+click to open in a new tab).

#### Using different watermarks in sections

The internal data model in Word only allows one watermark for the entire document. If you try to insert a second watermark, whether in a first page, other pages, or sections, Word deletes or replaces the previous watermark. 

In case you want to apply different watermarks to different sections, this work-around might work:

1. On the **Home** tab, click **Select** > **Selection Pane**. The Selection pane is used to manage objects in your document: reorder them, show or hide them, and group or ungroup them.
2. Within the first section, open the header or footer and insert the watermark you want to use. Just use the normal approach. In the Selection pane, the watermark now shows as "PowerPlusWaterMarkObject" for a text object or "WordPictureWaterMark" for a picture object (each name followed by an identifier). Double-click on the name to make it editable and change it to something else (maybe to the watermark text, such as 'Customer copy' or 'Original'). Now Word won't treat the object as a (global) watermark.
3. Within each subsequent section, repeat step number 2.
4. On the **Home** tab, choose **Select** > **Selection Pane** to turn off the Selection pane again.

### Using fonts in Word layouts

[!INCLUDE[using_fonts](../includes/include-excel-word-layouts-fonts.md)]

Fonts don't have to be installed on your machine when working with the layout. You can just mark content and type in the name of the font you want to use. When the report is generated on the server, if the font is installed on the server, then it's used in the rendered report document. If the font isn't available on the server or embedded in the layout, then the report still renders, but the font defined in the *Normal* style is used.

In case your favorite (true-type) font isn't installed on the [!INCLUDE[prod_short](includes/prod_short.md)] server, then you can embed it in the layout. Learn more at [Embedding custom fonts](https://support.microsoft.com/en-us/office/benefits-of-embedding-custom-fonts-cb3982aa-ea76-4323-b008-86670f222dbc).

> [!NOTE]
> Embedding fonts increases the size of the generated documents.

### Using Office document themes in Word layouts

[!INCLUDE[using_office_themes](../includes/include-excel-word-layouts-themes.md)]

To apply a theme to your Word layout, use the standard styles for text and headers. Then the colors and fonts follow the chosen theme.

For tables, for the table header be respect theme changes, you need to do this:

1. Mark the header row.
2. In the *Table Design* menu, expand the *Shading* menu in *Table Styles*.
3. Now pick a theme color.

If you use the prebuilt Table Styles, you must manually change the color in the Shading menu for the header color to respect theme changes.

To learn more about templates, themes, and Word styles, see [Differences between templates, themes, and Word styles](https://support.microsoft.com/en-us/office/differences-between-templates-themes-and-word-styles-101c2774-296b-4bb7-b084-2e936f6ee390)

### Design layouts for precision printing

If you need to design Word layouts where placement of design components on the page needs to be precise, then you can set their absolute position, both horizontal and vertical. It's possible to set precision to two decimals of cm/inch.

For tables, you can control their absolute position on the page in *Table Properties*. In the *Tables* tab, choose *Around* for the text wrapping. Now the *Positioning* button is unlocked, and you can set the horizontal and vertical position of the table. Learn more at [Set or change table properties](https://support.microsoft.com/en-us/office/set-or-change-table-properties-3237de89-b287-4379-8e0c-86d94873b2e0).

For text boxes, you can control their absolute position on the page in the *Shape format* menu: *Position* > *More Layout Options* (you can also navigate here by right-clicking on the text box). Now you can set the horizontal and vertical position of the text box. Learn more at [Ways to customize a text box](https://support.microsoft.com/en-us/office/ways-to-customize-a-text-box-0570ef01-1f4d-4f37-a787-7be3ce6b6380).

> [!TIP]  
> When designing layouts for precision printing, consider enabling the ruler and gridlines (find them under *View* > *Show*). Learn more at [Show the ruler](https://support.microsoft.com/en-us/office/show-the-ruler-dc8a4e0d-209f-43b8-b967-8e65da24d4c7).

## Design guidelines for a report dataset designed for Word layouts

With Word layouts, Word is used as the editor for the report. The person designing the layout interacts with the labels, data items, and fields from the dataset from the XML Mapping Pane. If you want users to be able to change the layout, consider using friendly names for labels, data items, and fields. 

## Report labels in Word layouts

Report labels are used by report layouts as, for example, the heading for a field in a table, the title for a chart, or the title for the report itself. 

Report labels defined in the *Labels* section of the report object and captions included on dataitem columns using the [IncludeCaption property](properties/devenv-includecaption-property.md) are available as in the `Labels` part of the XML Mapping pane in Word:

![Clip of the XML Mapping pane in Word.](/dynamics365/business-central/media/nav_reportlayout_xmlmappingpane.png "NAV_ReportLayout_XMLMappingPane")

Learn more about labels in [Report labels](./devenv-report-object.md#report-labels).

## Formatting data in Word layouts

[!INCLUDE[formatting_data_in_layouts](../includes/include-formatting-data-in-layouts.md)]

Specifically for Word layouts, there's no way to control formatting of data elements in Word. Therefore, you need to do the formatting in the report dataset. Learn more in [Formatting field values in report datasets](devenv-format-report-field-data.md).

## How to iterate a Word layout over a data item

When you specify a data item in the `WordMergeDataItem` property, the [!INCLUDE[server](includes/server.md)] iterates over that dataitem and does a "Mail merge" between that data item (and the ones below it) and the Word layout when rendering the report using the Word layout. This way, the Word layout is applied to each element in the specified data item.

> [!NOTE]
> Before [!INCLUDE[prod_short](includes/prod_short.md)] 2024 release wave 2, defining design elements like first pages, page numbers, and totals didn’t work properly in Word layouts that included sections. The elements would reset for each data item, causing errors when using the `WordMergeDataItem` property. Users would get an error message about conflicting section breaks: `You cannot run the report because the {0} layout contains section breaks that conflict with the sections in the report. Remove the section breaks from the report layout, and then run the report`. Starting from version 2024 release wave 2, this restriction is removed.

Learn more, including an example, in [WordMergeDataItem Property](properties/devenv-wordmergedataitem-property.md).

## How to do totals in Word layouts

Compared to the layout types Excel or RDL, it isn't possible to do calculations in a Word layout. If you want to add totals to your report, you need to calculate them in AL variables in the report object and then use a data item based on an Integer table to expose them to the XML Mapping pane in Word.

The following example illustrates how to code totals. The example is based on report 1306 "Standard Sales - Invoice" from the base application.

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

1. Add the **Customer** table as the data item and the **Name** field as a column to the report by adding the following lines of code to the report. Learn more about defining a dataset in [Report Dataset](devenv-report-dataset.md).  

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

1. Build the extension (<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>B</kbd>) to generate the MyWordReport.docx file.
1. Open the generated report layout file in Word.
1. In Word, edit the layout using the **XML Mapping Pane** on the **Developer** tab.  
    > [!NOTE]  
    > If you don't see the Developer tab, go to **Options**, then **Customize Ribbon**, and in the **Main tabs** section, select the **Developer** check box.
1. In Word, to the right, in the **Custom XML part** lookup, locate the report, and then open the layout.
1. Right-click on the **Customer** table, and in **Insert Content Control**, select **Repeating** to add the repeater data item.
1. Right-click on the **Name** field and in **Insert Content Control**, select **Plain Text** to add the column as a text box.
1. Save the report layout when you're done and then close it.
1. Back in Visual Studio Code, select <kbd>Ctrl</kbd>+<kbd>F5</kbd>  to compile and run the report.  

You now see the generated report in preview mode.

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

> **APPLIES TO:** Business Central versions 20, 21, and 22

The rendering of Word reports is controlled by an application feature key. Enabling the key `RenderWordReportsInPlatform` in the **Feature Management** page in Business Central switches the Microsoft Word report rendering to the new platform rendering, which supports multiple layouts and new triggers for **Save** and **Download** actions.

> [!NOTE]  
> Application rendering is obsolete and will be deprecated in a future release. It's recommended to stay on the old platform if you have extensions that use custom Word layouts and therefore cannot use the new platform, for example, because of dependencies on the `OnBeforeMergeDocument` or `OnBeforeMergeWordDocument` events.

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

Learn more about feature management in [Enabling Upcoming Features Ahead of Time](../administration/feature-management.md).

## Report limit - maximum number of documents that can be merged in report

The [!INCLUDE[prod_short](includes/prod_short.md)] platform has built-in limits to protect the stability of the system from a single report consuming too many resources. For example, there's a limit on the maximum number of documents that can be merged in a report using a Word layout.

Learn more about report limits in [Report limits](devenv-report-object.md#report-limits).

## Difference between RDL and Word layouts

If you're switching from developing reports with RDL layouts to using Word layouts, you might need to change your mindset on how you develop reports and their layouts. RDL allows you to dynamically change many properties in the layout but it isn't possible in Word. For many logic-related conditions, instead you have to do them in the report dataset in AL and then utilize the methods outlined in this article.

For reports where you expect customers to adjust the layout or use themes to change the overall look-and-feel of the document, consider using a Word layout over an RDL layout.

## How to create a new Word layout document from scratch

If you need an empty Word document that includes the custom XML part for a report's dataset, you have a few options depending on your [!INCLUDE[prod_short](includes/prod_short.md)] version:

### [From Visual Studio Code](#tab/vscode)

If you have access to the AL code for the report object, add a new layout in the _Rendering_ section and compile. This generates a new Word file on your developer machine. Learn more [Example: Create a Word layout report](#example-create-a-word-layout-report).

### [From client: Import custom XML](#tab/customxml)

[!INCLUDE[2024-releasewave2](../includes/2024-releasewave2.md)]

The **Report layouts** page in the client includes the **Export report schema** action that allows you to download a report schema/dataset as a Microsoft Word custom XML file. You can then use the file to create a new Word layout. This file makes it easier to convert an RDL layout or a customer-supplied Word file into a Word layout for a report.

1. Sign in to Business Central and open the **Report layouts** page.
1. Select the report in the list that you want to export the XML and then select **Export report schema** to download an XML file with the custom XML.
1. Open the Word document that you want to use for the report.

   > [!IMPORTANT]
   > The Word document can't already have a custom XML part for a [!INCLUDE[prod_short](includes/prod_short.md)] report.

1. In the **Developer** tab, select **XML Mapping Pane**.

   By default, the **Developer** tab isn't present in the ribbon. Learn more [Show the Developer Tab on the Ribbon](/visualstudio/vsto/how-to-show-the-developer-tab-on-the-ribbon). 
1. In the **XML Mapping** pane, select the **Custom XML Part:** field, and then in the dropdown select **(Add new part...)**.
1. Browse for the XML file that you downloaded and then select **Open**.

   The report dataset is now available for selection in the **Custom XML Part:** field of the **XML Mapping** pane.

### [From client: Use existing report](#tab/existingreport)

[!INCLUDE[2024-releasewave2](../includes/2024-releasewave2.md)]

The **Report layouts** page includes the **New** action that you can use to create a blank Word layout from an existing report. The blank layout contains a custom XM part based on the reports dataset. 

1. Sign in to [!INCLUDE[prod_short](includes/prod_short.md)] and open the **Report layouts** page.
1. Select the report in the list and then select **New**.
1. In the **Add New Layout for a Report** page, fill in the name of your new layout, set **Format Options** to Word, turn on the **Create a Blank Layout from the report object** toggle switch, and select **OK**.

    The new (empty) layout is now available in the **Report layouts** page.
1. Now download it using the **Export Layout** action.
1. After you update the layout, import it back to [!INCLUDE[prod_short](includes/prod_short.md)], either as a new layout using the *New* action or replace the existing layout using the *Replace Layout* action.

---

## How to update a layout with the latest report dataset definition

[!INCLUDE[2024-releasewave2](../includes/2024-releasewave2.md)]

The **Report layouts** page in the client, helps you update a layout with the latest report dataset definition.

1. Sign in to [!INCLUDE[prod_short](includes/prod_short.md)] and open the **Report layouts** page.
1. Select the report in the list and then select **Update and Export Layout**.

    The updated layout file is downloaded to your computer.
1. Open the updated layout file in Word. Then make changes and save the file.
1. In [!INCLUDE[prod_short](includes/prod_short.md)], import the updated layout either as a new layout, by using the **New** action, or as a replacement to the existing layout, by the **Replace Layout** action.


## How to convert an RDL layout to a Word layout

There's no way to directly convert an RDL layout to a Word layout, but if you want to create a new Word layout based on an RDL layout, then do as follows:

1. Create a new blank Word layout. See [How to create a new Word layout document from scratch](#how-to-create-a-new-word-layout-document-from-scratch) for more information.
1. Get a version of the report RDL layout rendered as a Word document:
    1. From the **Report layouts page**, find the RDL layout you want to base the new Word layout on.
    1. From the top pane menu, select the **Run Report** action. This opens the request page for the report.
    1. In the bottom of the request page, select the **Send to...** button. This opens a **Choose file type...** modal dialog.
    1. Select **Microsoft Word Document** and then choose the **OK** button. This downloads the report rendered as a Word document (where the dataset has been merged with the layout and where the Custom XML part isn't present.). 
1. Mark all content that you want to base the new layout on from the rendered Word document and copy it to the empty Word layout that you created in step 1.
1. Now it's time to adjust the Word document to make it a real layout:
    1. For each table, keep the header and remove all but one row with values. For the latter row, add a repeater from the **XML Mapping** pane. For the header row, add labels/captions from the **XML Mapping** pane.
    1. For each text not in a table, replace the text with the corresponding content control from the **XML Mapping** pane.
    1. For each image not in the dataset, encapsulate it with a table to control overflow. Consider resizing it.
    1. For each image in the dataset, replace the text with the corresponding content control from the **XML Mapping** pane.
1. You can test the layout either by launching a new session from Visual Studio Code or directly from the **Report layouts page**:
    1. For the initial test of the new layout, from the **Report layouts page**, find the report you want to add the new Word layout to. From the top pane menu, select the **New** action to upload the layout for the first time.
    1. For subsequent tests of the new layout, from the **Report layouts page**, find the report you want to add the new Word layout to. From the top pane menu, select the **Replace layout** action to replace the layout with the latest version.

## How to convert an existing document design to a Word layout

In implementation projects, a common specification for document layouts is to design them to match  the client’s existing document layouts. There's no way to directly convert a PDF document to a Word layout, but if you want to create a new Word layout based on a PDF document, then do as follows:

1. Get a version of the PDF document as a Word document as follows:
   1. Open Word.
   1. From the **File** menu, select the **Open** action and find the PDF document. Select **OK**. This opens a dialog stating that "Word will now convert your PDF to an editable Word document". Select **OK**. The resulting Word document might not match the PDF 100%, but it's a start.
   1. If the PDF document is read-only, the resulting Word document is also read-only. In this case, mark all content by selecting <kbd>Ctrl</kbd>+<kbd>a</kbd>, copy to clipboard, create a new Word document, and paste the content in the new Word document.

1. Follow the step-by-step guide in the section [How to convert an RDL layout to a Word layout](#how-to-convert-an-rdl-layout-to-a-word-layout), skipping the step *Get a version of the report RDL layout rendered as a Word document*.

## How to compare two versions of a Word layout

If you need to compare two versions of a Word layout, then do as follows:

1. Open Word.
1. On the **Review** menu, select **Compare Documents**.
1. In the **Original document** list, select the original document.
1. In the **Revised document** list, browse to the other version of the document, and then select **OK**.

Learn more in [Compare and merge two versions of a Word document](https://support.microsoft.com/office/compare-and-merge-two-versions-of-a-document-f5059749-a797-4db7-a8fb-b3b27eb8b87e).

## Related information

[Using hyperlinks in Word layouts](devenv-hyperlinks-in-word-report-layouts.md)  
[WordMergeDataItem property](properties/devenv-wordmergedataitem-property.md)  
[Report design overview](devenv-report-design-overview.md)  
[Report object](devenv-report-object.md)  
[Report extension object](devenv-report-ext-object.md)  
[Developing a custom report render](devenv-report-custom-render.md)  
[Creating an RDL layout report](devenv-howto-rdl-report-layout.md)  
[Creating an Excel layout report](devenv-howto-excel-report-layout.md)  
