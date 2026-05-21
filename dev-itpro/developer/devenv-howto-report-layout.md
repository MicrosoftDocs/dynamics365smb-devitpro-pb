---
title: Creating a Word layout report
description: Learn how to create a report that uses a Word layout.
author: SusanneWindfeldPedersen
ms.custom: bap-template
ms.date: 02/13/2025
ms.reviewer: solsen
ms.topic: how-to
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

## Design guidelines for a report dataset designed for Word layouts

With Word layouts, Word is used as the editor for the report. The person designing the layout interacts with the labels, data items, and fields from the dataset from the XML Mapping Pane. If you want users to be able to change the layout, consider using friendly names for labels, data items, and fields. 

## Using system dataitems 

[!INCLUDE [2025rw1_and_later](includes/2025rw1_and_later.md)]

Similar to Excel layouts, you can access report and request metadata in a Word layout. As a layout designer, this information helps you understand a report dataset better. You can also add the metadata as controls on the Word layouts, making it available to users who run the report.

In Word layouts, metadata is available in the **XML Mapping** pane as columns in two system dataitems: ReportMetadata and ReportRequest.

:::image type="content" source="media/word-xml-part.png" alt-text="Shows the Word XML part with the Business Central report and request metadata in a layout.":::

These two dataitems aren't part of the report dataset but are only present in the Word layout XML.

> [!TIP]
> Using metadata columns from system data items lets you skip adding common fields to the report dataset, such as company name and user name. This practice also ensures consistent naming and placement of these fields in the Word add-in data picker.

### ReportMetadata

The *ReportMetadata* dataitem includes metadata columns that provide information from the report object.

|Metadata column|Description|
|-|-|
|ExtensionID | The unique ID (GUID) of the app or extension for the report. |
|ExtensionName | The name of the app or extension for the report. |
|ExtensionPublisher | The name of the publisher of the app or extension for the report. |
|ExtensionVersion | The version of the app or extension for the report.|
|ReportID | The object ID of the report. |
|ReportName | The object name of the report.|
|AboutThisReportTitle | The *about this report title* as declared in the Request Page setup in the AL report. |
|AboutThisReportText | The *about this report text* as declared in the Request Page setup in the AL report. |
|ReportHelpLink | Help link (if set up) in the extension and report object.|

### ReportRequest

The *ReportRequest* dataitem includes metadata columns from the report request (the report invocation that created the document).

|Metadata column|Description|
|-|-|
| TenantEntraId | The Entra/AAD tenant ID of the environment. |
| EnvironmentName | The name of the environment. Might be empty for on-premises installations. |
| EnvironmentType | The environment type (Production or sandbox). Might be empty for on-premises installations. |
| CompanyName | The company name the user was operating in when running the report. |
| CompanyDisplayName | The display name for the company that the user was operating in when running the report. |
| CompanyId | The company ID (GUID). |
| UserName | The user who ran the report. |
| DateAndTime | The date and time of the report invocation. |
| Language | The application language identified (LCID, Windows language identifier).|
| FormatRegion | The format region applied to the report (specified as a culture tag such as 'en-US' or 'da-DK'). |
| DateTimeValues|The elements of the date (Year, MonthNumber, DayNumber) and time (Hour, Minute) of the report invocation.|

## Report labels in Word layouts

Report labels are used by report layouts as, for example, the heading for a field in a table, the title for a chart, or the title for the report itself. 

Report labels defined in the *Labels* section of the report object and captions included on dataitem columns using the [IncludeCaption property](properties/devenv-includecaption-property.md) are available as in the `Labels` part of the XML Mapping pane in Word:

![Clip of the XML Mapping pane in Word.](/dynamics365/business-central/media/nav_reportlayout_xmlmappingpane-v2.png "NAV_ReportLayout_XMLMappingPane")

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
> The **Different first page** and **Different odd and even** options for headers and footers in Word aren't supported for HTML conversion. If you select either of these options, the header and footer don't appear in rendered output, such as an Email Body.

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
1. In Word in the **Custom XML part** lookup, locate the report, and then open the layout.
1. Right-click on the **Customer** table, and in **Insert Content Control**, select **Repeating** to add the repeater data item.
1. Right-click on the **Name** field and in **Insert Content Control**, select **Plain Text** to add the column as a text box.
1. Save the report layout when you're done and then close it.
1. Back in Visual Studio Code, select <kbd>Ctrl</kbd>+<kbd>F5</kbd>  to compile and run the report.  

The generated report is displayed in preview mode.

> [!NOTE]  
> If the report layout isn't generated, open the `settings.json` from Visual Studio Code. Use **Ctrl+Shift+P**, then choose **Preferences: Open User Settings**, locate the **AL Language extension**. Under **Compilation Options**, choose **Edit in settings.json** and add the following line:  
>
>```json
>"al.compilationOptions": {
>   "generateReportLayout": true
> }
>```

[!INCLUDE [send-report-excel](includes/send-report-excel.md)]

## Enabling the Microsoft Word rendering engine

> **APPLIES TO:** Business Central versions 20, 21, and 22

An application feature key controls the rendering of Word reports. Enabling the key `RenderWordReportsInPlatform` in the **Feature Management** page in [!INCLUDE[prod_short](includes/prod_short.md)] switches the Microsoft Word report rendering to the new platform rendering, which supports multiple layouts and new triggers for **Save** and **Download** actions.

> [!NOTE]  
> Application rendering is obsolete and will be deprecated in a future release. It's recommended to stay on the old platform if you have extensions that use custom Word layouts and therefore can't use the new platform, for example, because of dependencies on the `OnBeforeMergeDocument` or `OnBeforeMergeWordDocument` events.

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

If you're switching from developing reports with RDL layouts to using Word layouts, you might need to change your mindset on how you develop reports and their layouts. RDL allows you to dynamically change many properties in the layout but it isn't possible in Word. For many logic-related conditions, you do them in the report dataset in AL and then utilize the methods outlined in this article.

For reports where you expect customers to adjust the layout or use themes to change the overall look-and-feel of the document, consider using a Word layout over an RDL layout.

## How to create a new Word layout document from scratch

If you need an empty Word document that includes the custom XML part for a report's dataset, you have a few options depending on your [!INCLUDE[prod_short](includes/prod_short.md)] version:

### [From Visual Studio Code](#tab/vscode)

If you have access to the AL code for the report object, add a new layout in the _Rendering_ section and compile. This generates a new Word file on your developer machine. Learn more [Example: Create a Word layout report](#example-create-a-word-layout-report).

### [From client: Import custom XML](#tab/customxml)

[!INCLUDE[2024-releasewave2](../includes/2024-releasewave2.md)]

The **Report layouts** page in the client includes the **Export report schema** action that allows you to download a report schema/dataset as a Microsoft Word custom XML file. You can then use the file to create a new Word layout. This file makes it easier to convert an RDL layout or a customer-supplied Word file into a Word layout for a report.

1. Sign in to [!INCLUDE[prod_short](includes/prod_short.md)] and open the **Report layouts** page.
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

1. Create a new blank Word layout. To learn more, go to [How to create a new Word layout document from scratch](#how-to-create-a-new-word-layout-document-from-scratch).
1. Get a version of the report RDL layout rendered as a Word document:
    1. From the **Report layouts page**, find the RDL layout you want to base the new Word layout on.
    1. From the top pane menu, select the **Run Report** action. This opens the request page for the report.
    1. In the bottom of the request page, select the **Send to...** button. This opens a **Choose file type...** modal dialog.
    1. Select **Microsoft Word Document** and then choose the **OK** button. This downloads the report rendered as a Word document (where the dataset was merged with the layout and where the Custom XML part isn't present.). 
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

