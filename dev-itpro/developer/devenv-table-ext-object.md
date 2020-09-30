---
title: "Table Extension Object"
description: "Description of the table extension object."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Table Extension Object
The table extension object allows you to add additional fields or to change some properties on a table provided by the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] service. In this way, you can add data to the same table and treat it as a single table. For example, you may want to create a table extension for a retail winter sports store. In your solution you want to have `ShoeSize` as an additional field on the customer table. Adding this as an extension allows you to write code for the customer record and also include values for the `ShoeSize`.

Along with defining other fields, the table extension is where you write trigger code for your additional fields.

When developing a solution for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] , you will follow the code layout for a table extension as shown in the example below.

> [!IMPORTANT]  
> Only tables with the [Extensible Property](properties/devenv-extensible-property.md) set to **true** can be extended.

> [!NOTE]  
> Extension objects can have a name with a maximum length of 30 characters.

> [!IMPORTANT]  
> System and virtual tables cannot be extended. System tables are created in the ID range of 2.000.000.000 and above. For more information about object ranges, see [Object Ranges](devenv-object-ranges.md).

> [!IMPORTANT]  
> Extending tables from Dynamics 365 for Sales is currently not supported.


## Snippet support
Typing the shortcut `ttableext` will create the basic layout for a table extension object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

## Properties

Using a table extension allows you to overwrite some properties on fields in the base table. For a list of Table properties, see [Table and Table Extension Properties](properties/devenv-table-properties.md).

## Table extension syntax
```
tableextension Id MyExtension extends MyTargetTable
{
    fields
    {
        // Add changes to table fields here
    }
    
    var
        myInt: Integer;
}
```

## Table extension example

This table extension object extends the Customer table object by adding a field `ShoeSize`, with ID 50116 and the data type `Integer`. It also contains a procedure to check if the `ShoeSize` field is filled in.

```
tableextension 50115 RetailWinterSportsStore extends Customer
{
    fields
    {
        field(50116;ShoeSize;Integer)
        {
            trigger OnValidate();
            begin
                if (rec.ShoeSize < 0) then
                begin
                   message('Shoe size not valid: %1', rec.ShoeSize);
                end;
            end;
        }
    }

    procedure HasShoeSize() : Boolean;
    begin
        exit(ShoeSize <> 0);
    end;

    trigger OnBeforeInsert();
    begin
        if not HasShoeSize then
            ShoeSize := Random(42);
    end;
}
```

## See Also

[AL Development Environment](devenv-reference-overview.md)  
[Table Overview](devenv-tables-overview.md)  
[Table Object](devenv-table-object.md)  
[Table, Table Fields, and Table Extension Properties](properties/devenv-table-properties.md)  
[Table Keys](devenv-table-keys.md)
