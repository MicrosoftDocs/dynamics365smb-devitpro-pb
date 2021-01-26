---
title: "Report Extension Example"
description: "Reports are used to print or display information from a database."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 01/20/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Report Extension Example

The following topic illustrates an example of ...

## Creating a Base Application

### Creating a base table

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

And defining the enum `FoodColor`.

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

## Creating a page to display

To be able to display data from and enter data in the `BaseFoodTable`, we will create the following page called `BaseFoodPage`.

```al
page 50101 BaseFoodPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BaseFoodTable;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Name; Rec.Name) { }
                field(Color; Rec.Color) { }
            }
        }
    }
}
```



## See Also

[Report Object](devenv-report-object.md)  
[Report Extension Object](devenv-report-ext-object.md)