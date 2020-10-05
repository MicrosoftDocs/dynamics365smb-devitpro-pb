---
title: "Extensible Enums"
description: "Overview of the concept of extending enumerables "
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Extensible Enums
An enumeration type, also known as an enum in programming, is a keyword used to declare a type that consists of a set of named constants. The list of named constants is called the enumeration list. Enums can be used as table fields, local and global variables, and parameters.

To declare an `enum` in AL you must specify an ID and a name. The enumeration list consists of values and each of the values are declared with an ID and a value. The value ID is the ordinal value on the enumeration list and must be unique. The following example shows the declaration of an enum, which can be extended, and has the four values; **None**, **Bronze**, **Silver**, and **Gold**. 

```
enum 50121 Loyalty
{
    Extensible = true;
    
    value(0; None) { }
    value(1; Bronze) { }
    value(2; Silver) { }
    value(3; Gold)
    {
        Caption = 'Gold Customer';
    }
}
```

> [!NOTE]  
> While enums and enumextension objects have object IDs, these are not enforced by the license. In previous versions they reused the range for tables, and were checked against the license at deployment time, but this is no longer the case. Uniqueness validation is now enforced during installation, which will fail if an enum object ID clashes with an already installed enum. Thus, as always, it is important that you use object IDs in your assigned range. This is enforced for AppSource apps, but not for per-tenant extensions, or on-premise. The enum does not have to use the same ID as the table it is put on.

> [!IMPORTANT]  
> Only enums with the [Extensible Property](properties/devenv-extensible-property.md) set to **true** can be extended.

## Enumextension object

Enums can be extended in order to add more values to the enumeration list in which case the `Extensible` property must be set to `true`. The syntax for an enum extension, which extends the **Loyalty** enum with the value **Diamond**, is shown below.

```
enumextension 50130 LoyaltyWithDiamonds extends Loyalty
{
    value(50130; Diamond)
    {
        Caption = 'Diamond Level';
    }
}
```

## Usage
When referencing a defined enum from code, you use the syntax as illustrated below.

`enum Loyalty`

If you want to define an enum as a table field type, use the syntax illustrated below:
 
```
field(50100; Loyal; enum Loyalty) {}
```

Or, as a variable:

```
var
    LoyaltyLevel: enum Loyalty;
```

In code, you address a specific enum value like in the following example:

```
codeunit 50140 EnumUsage
{
    procedure Foo(p: enum Loyalty)
    var
        LoyaltyLevel: enum Loyalty;
    begin
        if p = p::Gold then begin
            LoyaltyLevel := p;
        end;
    end;
}
```

## Example
The following example illustrates how to define an enum extension of `TypeEnum`, using this in a table extension `TableWithRelationExt` and displaying this as a control on a new page.

```
enumextension 50133 TypeEnumExt extends TypeEnum
{
    value(10; Resource) { }
}

tableextension 50135 TableWithRelationExt extends TableWithRelation
{
    fields
    {
        modify(Relation)
        {
            TableRelation = if (Type = const (Resource)) Resource;
        }
    }
}

page 50133 PageOnRelationTable
{
    SourceTable = TableWithRelation;
    SourceTableView = where (Type = const (Resource));
    PageType = List;

    layout
    {
        area(Content)
        {
            repeater(MyRep)
            {
                field(Id; Id)
                {
                    ApplicationArea = All;
                }
                field(Type; Type)
                {
                    ApplicationArea = All;
                }
                field(Relation; Relation)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
```

> [!TIP]  
> For another example of how to extend the usage of the `TableRelation` property in connection with enums, see [TableRelation Property](properties/devenv-tablerelation-property.md).

## Business Central On-Premises
If you want to extend an existing [!INCLUDE[d365fin_md](includes/d365fin_md.md)] on-premises enum, it is possible to mark a table field in C/SIDE as extensible. To enable running C/SIDE and AL side-by-side, see [Running C/SIDE and AL Side-by-Side](devenv-running-cside-and-al-side-by-side.md).

Table field options in C/SIDE have three properties to enable enum support:

|Property name|Data type|
|-------------|---------|
|Extensible   | Boolean, default value is **No**. |
|EnumTypeId   | Integer |
|EnumTypeName | Text    |

Some table fields share options that are semantically identical. In those cases the **EnumTypeId** and **EnumTypeName** must be the same across all the fields. There is no design or runtime check for collision of IDs, but loading generated symbols, see [Running C/SIDE and AL Side-by-Side](devenv-running-cside-and-al-side-by-side.md), into the compiler will show collision errors.

### Conversions
Conversion to and from `enum` is more strict than for `Options` in C/SIDE. 

- An enum can be assigned/compared to an enum of the same type. 
- To be backwards compatible we support conversion to/from any `Option` for now.

For information about assigment compatibility, see [AssignmentCompatibility Property](properties/devenv-assignmentcompatibility-property.md).

## See Also
[AL Data Types](datatypes/devenv-al-data-types.md)  
[TableRelation Property](properties/devenv-tablerelation-property.md)  
[Extensible Property](properties/devenv-extensible-property.md)  
[Enum Data Type](methods-auto/enum/enum-data-type.md)  
[AssignmentCompatibility Property](properties/devenv-assignmentcompatibility-property.md)  
