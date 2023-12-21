---
title: "Creating an RDL Layout Report"
description: "Describes the steps involved in creating a report that uses an RDL layout."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 12/01/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: solsen
---
 
# Creating an RDL Layout Report

When you create a new report for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], there are two things you have to consider; defining the report dataset of data items and columns, and then designing the report layout. These steps show you how to create a simple report based on an RDL layout. For more information about the report object, see [Report Object](devenv-report-object.md). And to learn how to extend an existing report, see [Report Extension Object](devenv-report-ext-object.md). 

[!INCLUDE[RDL_layout_performance](includes/include-rdl-performance.md)]

To create and modify RDL report layouts, you use SQL Server Report Builder or Microsoft RDLC Report Designer. For information about required versions of these tools, see [System Requirements](../deployment/system-requirement-business-central.md).

## Create an RDL layout report

To facilitate testing your report layout, the following simple example extends the Customer List page with a trigger that runs the report as soon as the Customer List page is opened.

1. Create a new extension to the Customer List page that contains code to run the report, and a simple report object by adding the following lines of code:

    ```AL
    pageextension 50123 MyExtension extends "Customer List"
    {
        trigger OnOpenPage();
        begin
            report.Run(Report::MyRdlReport);
        end;
    }

    report 50123 MyRdlReport
    {
        DefaultLayout = RDLC;
        RDLCLayout = 'MyRDLReport.rdl';

    }
    ```

2. Build the extension (**Ctrl+Shift+B**) to generate the MyRDLReport.rdl file.
3. Add the **Customer** table as the data item and the **Name** field as a column to the report by adding the following lines of code to the report:  

    ```AL
    report 50123 MyRdlReport
    {
        DefaultLayout = RDLC;
        RDLCLayout = 'MyRDLReport.rdl';
    
        dataset
        {
            dataitem(Customer; Customer)
            {
                column(Name; Name)
                {
                }
            }
        }   
    }
    ```

4. Build the extension (**Ctrl+Shift+B**). The `MyRDLReport.rdl` file is created in the root of the current project. 
5. Open the generated report layout file in **Microsoft SQL Server Report Builder**.
6. Edit the layout by inserting a table. 
7. Add the **Name** column from the **Datasets** folder into the table and save the .rdl file.
8. Back in Visual Studio Code, press **Ctrl+F5** to compile and run the report in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)].  

You'll now see the generated report in preview mode.

> [!NOTE]  
> If the report layout is not generated, open the `settings.json` from Visual Studio Code. Use **Ctrl+Shift+P**, then choose **Preferences: Open User Settings**, locate the **AL Language extension**. Under **Compilation Options**, choose **Edit in settings.json** and add the following line:

>```json
>"al.compilationOptions": {
>    "generateReportLayout": true
>}
>```

[!INCLUDE [send-report-excel](includes/send-report-excel.md)]

## Report labels in RDL layouts

[!INCLUDE [report_labels](includes/include-report-labels.md)]

> [!NOTE]  
> Report labels defined in the report object are available as parameters in RDL. 

For more information about labels, see [Working with labels](devenv-using-labels.md).

## Formatting data in RDL layouts

[!INCLUDE[formatting_data_in_layouts](../includes/include-formatting-data-in-layouts.md)]

Specifically for RDL layouts, there are many ways to control formatting of data elements in the RDL language. For more information on how to format data in RDL, see [Format paginated report items](/sql/reporting-services/report-design/formatting-report-items-report-builder-and-ssrs)

## Using rich text (HTML) content in RDL layouts

If you've created a [Rich Text content control](devenv-richtext-content-controls.md), you can display the text on an RDL report. This means that you can display multi-line formatted text, emphasize important points, and have clickable hyperlinks.

Rich Text is stored as HTML within the database. In order to display the formatted HTML, you need to change the `Placeholder Properties` within your RDL.

1. After adding the field to your report layout that contains the Rich Text, left-click on the field so that the `<Expr>` tag is highlighted.

2. Right-click on the highlighted `<Expr>` tag and select `Placeholder Properties...`.

3. On the `General` tab, select `HTML - Interpret HTML tags as style` radio button.
4. Select `OK` to close the Placeholder Properties window.

There are limitations imposed by the SQL Reporting Engine as to what HTML markup elements are processed. This [Microsoft Learn article](/previous-versions/sql/sql-server-2008/cc645967(v=sql.100)?redirectedfrom=MSDN) states that the following tags will be processed:

- Hyperlinks
- Fonts
- Header, style and block elements
- Text formatting (bold, italics, underline, strikethrough)
- List handling

Any other HTML markup tags will be ignored during report processing (for example, images and tables). If the HTML isn't well formed, the placeholder will be rendered as plain text. Unfortunately things like font colors and emojis aren't processed for your report layout. 

> [!NOTE]
> If the HTML exceeds the size of the page, it will not trigger a page break and continue onto the next page. This means your HTML will be truncated.

## Contributors

*This article is maintained by Microsoft. Some content was originally written by the following contributors.*

* [Tonya Bricco-Meske](https://www.linkedin.com/in/tonyabriccomeske/) | Senior Developer

## See also

[Report Design Overview](devenv-report-design-overview.md)  
[Report Object](devenv-report-object.md)  
[Creating a Word Layout Report](devenv-howto-report-layout.md)  
[Creating an Excel Layout Report](devenv-howto-excel-report-layout.md)  
[Defining Multiple Report Layouts](devenv-multiple-report-layouts.md)  
