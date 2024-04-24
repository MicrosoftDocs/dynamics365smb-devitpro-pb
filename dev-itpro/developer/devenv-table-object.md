---
title: Table object
description: This article describes the structure, object limits, and extensibility of the table object in AL for Business Central.
author: SusanneWindfeldPedersen
ms.custom: evergreen
ms.date: 04/17/2024
ms.topic: conceptual
ms.author: solsen
--- 

# Table object

Tables are the core objects used to store data in [!INCLUDE [prod_short](includes/prod_short.md)]. No matter how data is registered in the product - from a web service to a finger swipe on the phone app, the results of that transaction will be recorded in a table. 

The structure of a table has four sections:

- The first block contains metadata for the overall table, such as the table type.
- The fields section describes the data elements that make up the table, such as their name and the type of data they can store.
- The keys section contains the definitions of the keys that the table needs to support.
- The final section details the triggers and code that can run on the table.


## Table object limits

The table object has limitations that are mostly dictated by SQL Server, such as the maximum record size, number of fields, and the number of keys.

For more information about current limitations on the table object, see [Object specifications and limitations](devenv-object-specifications-limitations.md).


## Table extensibility limitations

> [!IMPORTANT]  
> Only tables with the [Extensible property](properties/devenv-extensible-property.md) set to **true** can be extended.

> [!NOTE]  
> Extension objects can have a name with a maximum length of 30 characters.

> [!IMPORTANT]  
> System and virtual tables can't be extended. System tables are created in the ID range of 2.000.000.000 and above. For more information about object ranges, see [Object ranges](devenv-object-ranges.md).


## System fields

The [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] platform will automatically add several system fields to tables. For more information, see [System Fields](devenv-table-system-fields.md).


## Defining default values for fields

It is commonly used to have field value set to a default value. To do this, you set the `InitValue` property on the field. 

For more information, see [InitValue Property](properties/devenv-initvalue-property.md).


## Defining validation rules for fields

If you want to run business logic to validate the value of a field, you can define the `OnValidate` trigger on the field. 

For more information, see [OnValidate (Field) Trigger](triggers-auto/field/devenv-onvalidate-field-trigger.md).


## Snippet support

Typing the shortcut `ttable` will create the basic layout for a table object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]


## Add tooltips on table fields

Starting in [!INCLUDE[prod_short](includes/prod_short.md)] 2024 release wave 1, you can define tooltips on table fields. When a tooltip is defined on a table field, any page that uses the field automatically inherits the tooltip. 

For more information, see [Add tooltips to table and page fields](devenv-adding-tooltips.md).

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
            DataClassification = CustomerContent; // all fields must have a data classification. In this example, only the first field has been classified
            Caption = 'Address retrieved by Service';
        }
        field(2; Locality; Text[30])
        {
            Caption = 'Locality retrieved by Service';
            Description = 'Locality feature likely to change in vNext'; // Internal note (not shown in the client)
        }
        field(3; "Town/City"; Text[30])
        {
            Caption = 'Town/City retrieved by Service';
            // in 2024 release wave 1, you can define tooltips on the table field level
            // uncomment the Tooltip line below to try it out
            // ToolTip = 'Town/City retrieved by Service';
        }
        field(4; County; Text[30])
        {
            Caption = 'County retrieved by Service';

            // this is how you define field validation on the table level
            trigger OnValidate()
            begin
                ValidateCounty(County);
            end;

        }
        field(5; IsValidated; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Address validated yet?';
            InitValue = false;                      // this is how you define default values 
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
[Table keys](devenv-table-keys.md)  
[Table, table fields, and table extension properties](properties/devenv-table-properties.md)  
[Object specifications and limitations](devenv-object-specifications-limitations.md)   
[AL development environment](devenv-reference-overview.md)   
 