---
title: "Report Extension Example"
description: "Reports are used to print or display information from a database."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Report Extension Example

The following topic illustrates how an existing table and report is extended by using extension objects. The code snippets shown in this example do not provide a full end-to-end scenario that can be deployed, but illustrates the way to extend existing functionality by using the [Table Extension Object](devenv-table-ext-object.md) and [Report Extension Object](devenv-report-ext-object.md).

## The base table - BaseFoodTable

The report extension will be based on the following base table which holds information about food and specific details that applies to that. The `Color` field in this table is an enum, which is defined with the `FoodColor` enum next.

```al
table 50100 BaseFoodTable
{
    DataClassification = ToBeClassified;
    DataPerCompany = false;

    fields
    {
        field(1; Name; Text[256]) { }
        field(2; Color; Enum FoodColor) { }
        field(3; Flavour; Text[256]) { }
        field(4; "Vegan Friendly"; Boolean) { }
        field(5; "Vegetarian Friendly"; Boolean) { }
        field(7; Price; Decimal)
        {
            DecimalPlaces = 2;
        }

        field(8; Restaurant; Integer) { }
    }

    keys
    {
        key(PK; Name)
        {
            Clustered = true;
        }
    }
}
```

### Defining an enum - FoodColor

The `FoodColor` enum enables selecting a descriptive color of an item in the `BaseFoodTable`.

```al
enum 50100 FoodColor
{
    Extensible = true;

    value(0; White) { }
    value(1; Red) { }
    value(2; Black) { }
    value(3; Brown) { }
    value(4; Orange) { }
    value(5; Green) { }
    value(6; Blue) { }
}
```

## The base report - FoodReport

The following `FoodReport` object defines a report based on `BaseFoodTable` as a data source. There's a `DataItemLink` to a second table that displays restaurant information. The report is defined with an RDL layout. For more information, see [Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md).

```al
report 50100 FoodReport
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'FoodReport.rdl';
    AllowScheduling = true;

    dataset
    {
        dataitem(FoodTable; BaseFoodTable)
        {
            column(Name; Name) { }
            column(Color; Color) { }
            column(Flavour; Flavour) { }
            column(Vegan_Friendly; "Vegan Friendly") { }
            column(Vegetarian_Friendly; "Vegetarian Friendly") { }
            column(Price; Price) { }
            dataitem(Restaurant; Restaurant)
            {
                DataItemLink = ID = field(Restaurant);
                column(RestaurantName; Name) { }
            }

        }
    }
}
```

## The table extension - GMOFood

In the next code snippet, the table extension `GMOFood` is defined. This table extension extends the `BaseFoodTable` with extra fields to register more details about food. `GMOFood` adds a relation to the `Producer` table through the `ProducerID` key.

```al
tableextension 50200 GMOFood extends BaseFoodTable
{
    fields
    {
        field(100; "GMO Free"; Boolean) { }
        field(101; Organic; Boolean) { }

        field(103; Calories; Decimal)
        {
            DecimalPlaces = 3;
        }
        field(102; ProducerID; Integer) { }
    }
}


table 50202 Producer
{
    DataPerCompany = false;
    fields
    {
        field(1; ID; Integer) { }
        field(2; Name; Text[256]) { }
    }
}
```

## The report extension - FoodExtension

As we have seen in the previous sections, the base table `BaseFoodTable` was extended with the `GMOFood` extension. To reflect that change, it makes sense to extend the `FoodReport` to enable displaying the additional set of fields that were added; both to the existing `FoodTable` and to the new table `Producer`. To do that, we need to use a report extension object. For more information, see [Report Extension Object](devenv-report-ext-object.md). In the `dataset` element, three new columns are added to the `FoodTable` dataitem, and a new `dataitem` element is introduced that adds columns corresponding to the reports source table.


```al
reportextension 50200 FoodExtension extends FoodReport
{
    RDLCLayout = 'ExtendedFoodReport.rdl';

    dataset
    {
        add(FoodTable)
        {
            column(GMO_Free; "GMO Free") { }
            column(Organic; Organic) { }
            column(Calories; Calories) { }
        }

        addfirst(Restaurant)
        {
            dataitem(Producer; Producer)
            {
                DataItemLink = ID = field(ProducerID);
                DataItemLinkReference = FoodTable;
                column(ProducerName; Name) { }
            }
        }
    }
}
```

The example code above illustrates how additive changes to tables that are used on reports can use report extension objects to reflect these changes.

## See Also

[Reports Overview](devenv-reports.md)  
[Report Object](devenv-report-object.md)  
[Report Extension Object](devenv-report-ext-object.md)  
[Request Pages](devenv-request-pages.md)