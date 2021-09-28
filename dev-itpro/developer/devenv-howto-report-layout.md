---
title: "Creating a Word Layout Report"
description: "Describes the steps involved in creating a report that uses a Word layout."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 05/28/2021
ms.reviewer: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Creating a Word Layout Report

When you create a new report, there are two tasks main tasks. First, you define the report dataset of data items and columns. Then, you design the report layout. These steps will show how to create a report based on a Word layout. For more information about the report object, see [Report Object](devenv-report-object.md).

## Create a Word layout report

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
        DefaultLayout = Word;
        WordLayout = 'MyWordReport.docx';
    }
    ```
2. Build the extension (**Ctrl+Shift+B**) to generate the MyWordReport.docx file.
3. Add the **Customer** table as the data item and the **Name** field as a column to the report by adding the following lines of code to the report. For more information about defining a dataset, see [Report Dataset](devenv-report-dataset.md).  
    ```AL
    report 50124 MyWordReport
    {
        DefaultLayout = Word;
        WordLayout = 'MyWordReport.docx';
    
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
4. Build the extension (**Ctrl+Shift+B**).
5. Open the generated report layout file in Word.
6. In Word, edit the layout using the **XML Mapping Pane** on the **Developer** tab.  
    > [!NOTE]  
    > If you do not see the Developer tab, go to **Options**, then **Customize Ribbon**, and in the **Main tabs** section, select the **Developer** check box.
7. In Word, to the right, in the **Custom XML part** lookup, locate the report, and then open the layout.
8. Right-click on the **Customer** table, and in **Insert Content Control**, select **Repeating** to add the repeater data item.
9. Right-click on the **Name** field and in **Insert Content Control**, select **Plain Text** to add the column as a text box.
10. Save the report layout when you're done and then close it.
11. Back in Visual Studio Code, press **Ctrl+F5** to compile and run the report.  

You'll now see the generated report in preview mode.

> [!NOTE]  
> If the report layout is not generated, open the `settings.json` from Visual Studio Code. Use **Ctrl+Shift+P**, then choose **Preferences: Open User Settings**, locate the **AL Language extension**. Under **Compilation Options**, choose **Edit in settings.json** and add the following line:  
>```json
>"al.compilationOptions": {
>   "generateReportLayout": true
> }
>```

[!INCLUDE [send-report-excel](includes/send-report-excel.md)]

## See Also

[Report Design Overview](devenv-report-design-overview.md)  
[Report Object](devenv-report-object.md)  
[Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md)  
