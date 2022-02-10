---
title: "Creating an Excel Layout Report"
description: "Describes the steps involved in creating a report that uses an Excel layout."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/04/2022
ms.reviewer: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Creating an Excel Layout Report

When you create a new report, there are two tasks main tasks. First, you define the report dataset of data items and columns. Then, you design the report layout. These steps will show how to create a report based on an Excel layout. For more information about the report object, see [Report Object](devenv-report-object.md) and for report extension objects, see [Report Extension Object](devenv-report-ext-object.md).

## Create a simple Excel layout report

The following example extends the **Customer List** report with a new Excel layout. The layout does not yet exist, but will be generated based on the existing report dataset for Customer List. 

1. Create a new report extension of the **Customer List** page by adding the following lines of code: 

```al
reportextension 50101 MyExtendedCustList extends "Customer - List"
{
    rendering
    {
        layout(LayoutExcel)
        {
            Type = Excel;
            LayoutFile = 'MyExcelCustomerList.xlsx';
        }
    }
}
```

2. Press **Ctrl+Shift+P**, and then choose **AL: Package** and the `MyExcelCustomerList.xlsx` will be generated for you in the right pane of Visual Studio Code. 
1. Right-click the file, and choose **Reveal in File Explorer**. This will open the File Explorer.
1. Choose the `MyExcelCustomerList.xlsx` file, and open it in Excel.


## See also

[Report Design Overview](devenv-report-design-overview.md)  
[Report Object](devenv-report-object.md)  
[Creating a Word Layout Report](devenv-howto-report-layout.md)  
[Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md)  