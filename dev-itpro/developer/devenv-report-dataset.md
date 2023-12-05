---
title: Report dataset
description: The dataset determines the data extracted to print or display the information from the database.
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 12/01/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: solsen
---

# Defining a report dataset

You use a report object in the [!INCLUDE[d365_dev_long_md](includes/d365_dev_long_md.md)] to define the data model, or dataset, of a report. The dataset determines the data that is extracted or calculated from the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] database tables that can be used in a report. For more information, see [Report Object](devenv-report-object.md).

## Using tables in a dataset definition

You build the report dataset from data items and columns. A data item is a table. A column can be: 

- A field in a table 

- A variable

- An expression 

- A text constant

Typically, data items and columns correspond to fields in a table. When the report is run, each data item is iterated for all records in the underlying table. Filters are applied and the dataset is created. When a report is based on more than one table, you must set relations between the data items so that you can retrieve and organize the data. 

You can also extend a dataset from an existing report, to add more columns for example. For more information, see [Report Extension Object](devenv-report-ext-object.md).

## Formatting field values in report datasets

It's often useful to format data in the report dataset to reduce the complexity of the report layout. For example, if a decimal field in a table has precision of five digits, the same level of precision might not be needed in the report. Or maybe you want to format dates or currencies in a different way in the report as they appear on the page in [!INCLUDE[prod_short](./includes/prod_short.md)].

For more information, see [Formatting field values in report datasets](devenv-format-report-field-data.md).


## Using a query in a dataset definition

Instead of building the report dataset directly from tables, you can also use a query object. To achieve this, you must

- Add a global variable that points to the query object
- Use an Integer in the data item definition
- Add OnPreDataItem and OnAfterGetRecord triggers 

See an example of how to do this in the next section.

## Snippet support

Typing the shortcut `treport` creates the basic layout for a report object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code. 

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Testing the dataset
[!INCLUDE [send-report-excel](includes/send-report-excel.md)]


## Example: Joining tables to define a report dataset

The following example adds the `Customer` table as the data item and the `CustomerName` and `CompanyName` as fields of a column to the report. It then adds a secondary dataitem with data from the `Cust. Ledger Entry` table and joins the two.

```AL
dataitem(Customer; Customer)
{
    // For each field that you want to display you add a column control.
    
    column(No_Customer; "No.")
    {
        // Include the caption of the "No." field in the dataset of the report.
        IncludeCaption = true;
    }
    column(Name_Customer; Name)
    {
        IncludeCaption = true;
    }
    column(Phone_Customer; "Phone No.")
    {
        IncludeCaption = true;
    }
    column(Address_Customer; Address)
    {
        IncludeCaption = true;
    }
    column(EMail_Customer; "E-Mail")
    {
        IncludeCaption = true;
    }

    // If your dataset joins multiple tables, add secondary dataitems and link them
    dataitem(CustLedger; "Cust. Ledger Entry")
    {
        // Set a filter on the child data item, **CustLedgerEntry** to select only the records where the 
        // value of `Customer."No."` field and the `"Customer Ledger Entry"."Customer No."` field matches.
        DataItemLink = "Customer No." = field("No.");
        column(EntryNo_CustLedgerEntry; "Entry No.")
        {
            IncludeCaption = true;
        }
        column(CustomerNo_CustLedgerEntry; "Customer No.")
        {
            IncludeCaption = true;
        }
        column(PostingDate_CustLedgerEntry; "Posting Date")
        {
            IncludeCaption = true;
        }
        column(DocumentType_CustLedgerEntry; "Document Type")
        {
            IncludeCaption = true;
        }
        column(DocumentNo_CustLedgerEntry; "Document No.")
        {
            IncludeCaption = true;
        }
    }
}
```

## Example: Define a report dataset with multiple top-level dataitems 
The following example adds the `Cust. Ledger Entry` table as a top-level data item. It then add dimension data as a second top-level data item.

```AL
// Example of how to have two top-level dataitems in a report dataset.
dataset
{
    dataitem(CustLedger; "Cust. Ledger Entry")
    {
        column(EntryNo_CustLedgerEntry; "Entry No.")
        {
            IncludeCaption = true;
        }
        column(CustomerNo_CustLedgerEntry; "Customer No.")
        {
            IncludeCaption = true;
        }
        column(PostingDate_CustLedgerEntry; "Posting Date")
        {
            IncludeCaption = true;
        }
        column(DocumentType_CustLedgerEntry; "Document Type")
        {
            IncludeCaption = true;
        }
        column(DocumentNo_CustLedgerEntry; "Document No.")
        {
            IncludeCaption = true;
        }
        column(GlobalDim1Code_CustLedgerEntry; "Global Dimension 1 Code")
        {
            IncludeCaption = true;
        }
        column(GlobalDim2Code_CustLedgerEntry; "Global Dimension 2 Code")
        {
            IncludeCaption = true;
        }
    }
    dataitem(Dimensions; "Dimension Set Entry")
    {
        column(EntryNo_CustLedgerEntry; "Dimension Code")
        {
            IncludeCaption = true;
        }
        column(EntryNo_CustLedgerEntry; "Dimension Value Code")
        {
            IncludeCaption = true;
        }
        column(EntryNo_CustLedgerEntry; "Dimension Value ID")
        {
            IncludeCaption = true;
        }
    }
}
```



## Example: Using a query to define a report dataset

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
}

var 
    MyQuery: Query "CustomerQuery";

```


## See Also

[Report Object](devenv-report-object.md)  
[Report Extension Object](devenv-report-ext-object.md)  
[Reports Overview](devenv-reports.md)  
[Report Design Overview](devenv-report-design-overview.md)  
