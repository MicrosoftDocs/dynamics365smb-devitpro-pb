---
title: Table object
description: This article describes the structure, object limits, and extensibility of the table object in AL for Business Central.
author: SusanneWindfeldPedersen
ms.custom: evergreen
ms.date: 09/06/2024
ms.topic: conceptual
ms.author: solsen
ms.reviewer: solsen
--- 

# Table object

Tables are the core objects used to store data in [!INCLUDE [prod_short](includes/prod_short.md)]. No matter how data is registered in the product&mdash;from a web service to the phone app&mdash;the results of that transaction are recorded in a table.

## Table syntax

The structure of a table has four sections:

- The first block contains metadata for the overall table, such as the table type.
- The fields section describes the data elements that make up the table, such as their name or the type of data they can store.
- The keys section contains the definitions of the keys that the table needs to support.
- The final section details the triggers and code that can run on the table.

The order in which the sections appear matters. The following example illustrates the ordering:

```AL
table ObjectId TableName
{
    // Specify table properties, for example 
    Caption = 'Sample table';
    DataPerCompany = true;

    // Define the table schema
    fields {}
   
    // Define keys section (optional)
    keys {} 
    
    // Add AL code here (optional)
}
```

## Table object limits

The table object has limitations that are mostly dictated by SQL Server, such as the maximum record size, number of fields, and the number of keys.

For more information about current limitations on the table object, see [Object specifications and limitations](devenv-object-specifications-limitations.md).

## Table extensibility limitations

> [!IMPORTANT]  
> Only tables with the [Extensible property](properties/devenv-extensible-property.md) set to **true** can be extended.

> [!NOTE]  
> Extension objects can have a name with a maximum length of 30 characters.

> [!IMPORTANT]  
> System and virtual tables can't be extended. System tables are created in the ID range of 2.000.000.000 and higher. For more information about object ranges, see [Object ranges](devenv-object-ranges.md).

## System fields

The [!INCLUDE [prod_short](includes/prod_short.md)] platform automatically adds several system fields to tables. For more information, see [System fields](devenv-table-system-fields.md).

## Defining default values for fields

It's common to have field value set to a default value. To set a default, you set the `InitValue` property on the field.

For more information, see [InitValue property](properties/devenv-initvalue-property.md).

## Defining validation rules for fields

If you want to run business logic to validate the value of a field, you can define the `OnValidate` trigger on the field. 

For more information, see [OnValidate (Field) trigger](triggers-auto/field/devenv-onvalidate-field-trigger.md).

## Snippet support

Typing the shortcut `ttable` creates the basic layout for a table object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Add tooltips on table fields

Starting in [!INCLUDE[prod_short](includes/prod_short.md)] 2024 release wave 1, you can define tooltips on table fields. When a tooltip is defined on a table field, any page that uses the field automatically inherits the tooltip. 

For more information, see [Add tooltips to table and page fields](devenv-adding-tooltips.md).

## Enable full-text search on table fields

[!INCLUDE[2024rw2_and_later](includes/2024rw2_and_later.md)]

You can specify whether table fields are optimized for text search by setting the `OptimizeForTextSearch` property to `true`.

Learn more in [Enable text search on table fields](devenv-table-field-text-search.md).

## Table example

This table stores address information and it has five fields; `Address`, `Locality`, `Town/City`, `County`, and `IsValidated`.

```AL
table 50104 Address
{
    Caption = 'Sample table';
    DataPerCompany = true;

    fields
    {
        field(1; Address; Text[50])
        {
            Caption = 'Address retrieved by Service';
            // in 2024 release wave 2, you can define that table fields are included in optimized text search
            OptimizeForTextSearch = true;
        }
        field(2; Locality; Text[30])
        {
            Caption = 'Locality retrieved by Service';
            Description = 'Locality feature likely to change in vNext'; // Internal note (not shown in the client)
            OptimizeForTextSearch = true;
        }
        field(3; "Town/City"; Text[30])
        {
            Caption = 'Town/City retrieved by Service';
            // in 2024 release wave 1, you can define tooltips on the table field level            
            ToolTip = 'Town/City retrieved by Service';
            OptimizeForTextSearch = true;            
        }
        field(4; County; Text[30])
        {
            Caption = 'County retrieved by Service';
            OptimizeForTextSearch = true;

            // this is how you define field validation on the table level
            trigger OnValidate()
            begin
                ValidateCounty(County);
            end;

        }
        field(5; IsValidated; Boolean)
        {
            Caption = 'Address validated yet?';
            InitValue = false; // this is how you define default values 
        }        
    }

    keys
    {
        key(PrimaryKey; Address)
        {
            Clustered = true;
        }
    }
}
```

## See also

[Table overview](devenv-tables-overview.md)  
[Table extension object](devenv-table-ext-object.md)  
[Adding tooltips to table and page fields](devenv-adding-tooltips.md)  
[InitValue Property (defining default values for fields)](properties/devenv-initvalue-property.md)  
[OnValidate (Field) Trigger](triggers-auto/field/devenv-onvalidate-field-trigger.md)  
[Enable text search on table fields](devenv-table-field-text-search.md)  
[Table keys](devenv-table-keys.md)  
[Table, table fields, and table extension properties](properties/devenv-table-properties.md)  
[Object specifications and limitations](devenv-object-specifications-limitations.md)  
[AL development environment](devenv-reference-overview.md)  
