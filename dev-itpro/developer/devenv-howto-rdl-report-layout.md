---
title: "Creating an RDL Layout Report"
description: "Describes the steps involved in creating a report that uses an RDL layout."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 01/03/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# Creating an RDL Layout Report
When you create a new report for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], there are two things you have to think about; defining the report dataset of data items and columns, and then designing the report layout. These steps will show you how to create a very simple report based on an RDL layout. For more information about the report object, see [Report Object](devenv-report-object.md).

## Create an RDL layout report
To facilitate testing your report layout, the following example extends the Customer List page with a trigger that runs the report as soon as the Customer List page is opened.

1. Create a new extension to the Customer List page that contains code to run the report, as well as a simple report object by adding the following lines of code:

```
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
    RDLCLayout = 'MyRDLCReport.rdl';

}
```
2. Build the extension (Ctrl+Shift+B) to generate the MyRDLCReport.rdl file.
3. Add the **Customer** table as the data item and the **Name** field as a column to the report by adding the following lines of code:

```
  dataset
    {
        dataitem(Customer; Customer)
        {
            column(Name; Name)
            {

            }
        }
    }   

```
4. Build the extension (Ctrl+Shift+B).
5. Open the generated report layout file in Microsoft SQL Server Report Builder.
6. Edit the layout by inserting a table. 
7. Add the **Name** column from the datasets folder into the table and save the file.
8. Back in Visual Studio Code, press Shift+F5 to compile and run the report.  
You will now see the generated report in preview mode.

## See Also
[Report Object](devenv-report-object.md)  
[Creating a Word Layout Report](devenv-howto-report-layout.md)  
