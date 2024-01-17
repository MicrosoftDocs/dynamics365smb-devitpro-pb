---
title: Creating a Word layout report
description: Describes the steps involved in creating a report that uses a Word layout.
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 01/11/2023
ms.reviewer: na
ms.topic: conceptual
ms.author: solsen
---

# Creating a Word layout report

When you create a new report, there are two main tasks. First, you define the report dataset of data items and columns. Then, you design the report layout. These steps will show how to create a report based on a Word layout. For more information about the report object, see [Report object](devenv-report-object.md) and [Report extension object](devenv-report-ext-object.md).

Later in this article you can read more how to enable multiple report layouts. For more information, see [Enabling the Microsoft Word rendering engine](devenv-howto-report-layout.md#enabling-the-microsoft-word-rendering-engine).

## Report labels in Word layouts

Report labels are used by report layouts as, for example, the caption for a field, the title for a chart, or the title for the report itself. 

Report labels defined in the report object are available as in the `Labels` part of the XML Mapping pane in Word:

![Clip of the XML Mapping pane in Word.](/dynamics365/business-central/media/nav_reportlayout_xmlmappingpane.png "NAV_ReportLayout_XMLMappingPane")

For more information about labels, see [Report labels](./devenv-report-object.md#report-labels).


## Formatting data in Word layouts
[!INCLUDE[formatting_data_in_layouts](../includes/include-formatting-data-in-layouts.md)]

Specifically for Word layouts, there is no way to control formatting of data elements in Word. Therefore, you need to do the formatting in the report dataset. For more information, see [Formatting field values in report datasets](devenv-format-report-field-data.md).


## How to iterate a Word layout over a dataitem

When you specify a dataitem in the `WordMergeDataItem` property, the [!INCLUDE[prod_short](../includes/prod_short.md)] server will do a "Mail merge" between that data item (and the ones below it) and the Word layout when rendering the report using the Word layout. The Word layout will be applied to each element in the specified dataitem. Thus, if you have defined a different first page, page numbers, totals at the end, and similar report design elements in the Word layout, they'll be "reset" for each element in the specified dataitem.

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


## Using fonts in Word layouts

[!INCLUDE[using_fonts](../includes/include-excel-word-layouts-fonts.md)]


## Using Office document themes in Word layouts

[!INCLUDE[using_office_themes](../includes/include-excel-word-layouts-themes.md)]


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
    WordMergeDataItem = Customer; // set this if you want to iterate the report layout over each customer

    // maybe also set other report properties

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
3. Build the extension (<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>B</kbd>) to generate the MyWordReport.docx file.
4. Open the generated report layout file in Word.
5. In Word, edit the layout using the **XML Mapping Pane** on the **Developer** tab.  
    > [!NOTE]  
    > If you do not see the Developer tab, go to **Options**, then **Customize Ribbon**, and in the **Main tabs** section, select the **Developer** check box.
6. In Word, to the right, in the **Custom XML part** lookup, locate the report, and then open the layout.
7. Right-click on the **Customer** table, and in **Insert Content Control**, select **Repeating** to add the repeater data item.
8. Right-click on the **Name** field and in **Insert Content Control**, select **Plain Text** to add the column as a text box.
9. Save the report layout when you're done and then close it.
10. Back in Visual Studio Code, select <kbd>Ctrl</kbd>+<kbd>F5</kbd>  to compile and run the report.  

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


## See Also

[Setting up Hyperlinks in Word Report Layouts](devenv-hyperlinks-in-word-report-layouts.md)  
[WordMergeDataItem Property](properties/devenv-wordmergedataitem-property.md)   
[Report Design Overview](devenv-report-design-overview.md)  
[Report Object](devenv-report-object.md)  
[Report Extension Object](devenv-report-ext-object.md)  
[Developing a Custom Report Render](devenv-report-custom-render.md)  
[Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md)  
[Creating an Excel Layout Report](devenv-howto-excel-report-layout.md)  
