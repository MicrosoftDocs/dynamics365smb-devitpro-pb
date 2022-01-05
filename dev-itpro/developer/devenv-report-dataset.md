---
title: "Report Dataset"
description: "The dataset determines the data extracted to print or display the information from the database."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Defining a Report Dataset

You use a report object in the [!INCLUDE[d365_dev_long_md](includes/d365_dev_long_md.md)] to define the data model, or dataset, of a report. The dataset determines the data that is extracted or calculated from the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] database tables that can be used in a report. For more information, see [Report Object](devenv-report-object.md).

## Using tables in a dataset definition
You build the report dataset from data items and columns. A data item is a table. A column can be: 

- A field in a table 

- A variable

- An expression 

- A text constant

Typically, data items and columns correspond to fields in a table. When the report is run, each data item is iterated for all records in the underlying table. Filters are applied and the dataset is created. 
When a report is based on more than one table, you must set relations between the data items so that you can retrieve and organize the data. 

You can also extend a dataset from an existing report, to add more columns for example. For more information, see [Report Extension Object](devenv-report-ext-object.md).

## Using a query in a dataset definition
Instead of building the report dataset directly from tables, you can also use a query object. To achieve this, you must
- add a global variable that points to the query object
- Use an Integer in the data item definition
- Add OnPreDataItem and OnAfterGetRecord triggers 

See an example of how to do this below.

## Snippet support

Typing the shortcut `treport` will create the basic layout for a report object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code. 

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Example: Using tables to define a report dataset

The following example adds the `Customer` table as the data item and the `CustomerName` and `CompanyName` as fields of a column to the report. For more information on creating a report, see [Creating a Report](devenv-howto-report-layout.md).

```AL
dataset
{
    dataitem(Customer; Customer)
    {
        column(CustomerName; CustomerName)
        {
        }
        column(CompanyName; CompanyName)
        {
        }
    }
}
```

[!INCLUDE [send-report-excel](includes/send-report-excel.md)]

### Example: Using a query to define a report dataset
Let's imagine that you have created the query object `CustomerQuery` that joins the customer data with data from some other table. The following example shows how you can use that query as the data source for a report dataset.

```AL
// Example of how to use a query as the data source for a report dataset.
dataset
{
    dataitem(Integer; Integer)
    {
        column(CustomerName; MyQuery.CustomerName)
        {
        }
        column(SomeFieldFromAnotherTable; MyQuery.SomeFieldFromAnotherTable)
        {
        }
    }

    trigger OnPreDataItem()
    begin
        MyQuery.Open();
    end;

    trigger OnAfterGetRecord()
    begin
        if not MyQuery.Read() then
            CurrReport.Break();
    end;
}

var 
    MyQuery: Query "CustomerQuery";

```


## See Also

[Report Object](devenv-report-object.md)  
[Report Extension Object](devenv-report-ext-object.md)  
[Reports Overview](devenv-reports.md)  
[Report Design Overview](devenv-report-design-overview.md)  
