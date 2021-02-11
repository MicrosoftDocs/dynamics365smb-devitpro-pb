---
title: Field Groups
description: A field group defines the fields to display in a drop-down control in Dynamics 365 Business Central. 
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Field Groups (Drop-Down Controls)

A field group in table or table extension objects defines the fields to display in a drop-down control on pages that use the table. 

In a table object, you define field groups by first adding a `fieldgroups` control, and then adding one or more `fieldgroup(<Name>; <Field>)` keyword for each group, where:

- `<Name>` can be either `DropDown`, for adding fields to the drop-down control, or `Brick` to display data as tiles.
- `<Field>` is a comma-separated list of the fields, by name, to include in the group.  

> [!NOTE]
> A field group can also be used to specify fields that display when list type pages are shown in the tile view. For more information, see [Displaying Data as Tiles](devenv-lists-as-tiles.md).

```AL
fieldgroups
{
  fieldgroup(DropDown; Field1, Field2)
  {
        
  }
  fieldgroup(Brick; Field1, Field2)
  {
        
  }
}
```
> [!NOTE]  
> The `fieldgroups` keyword cannot be inserted before the `key` control.

> [!IMPORTANT]  
> The syntax for using a DropDown, must be exactly `DropDown` with the right capitalization.


In a table extension object, the `fieldgroups` control allows you to add more fields to a field group defined for the table object. This can be done by using the `addlast(<name>; <field>)` keyword.
<!--
In order to add fields to a field group, you create a table extension and specify the `fieldgroups` control and the fields you want to append to the field group. 
 

> [!NOTE]  
> You can only place the fields at the end of the field group members list using the `addlast` keyword. 

-->

> [!WARNING]  
> The server will remove the duplicates, if multiple extensions attempt to add the same field more than once. A field can only be added to the field group once.

## Define fields for a drop-down control

You define a field to include in a drop-down control by using the `DropDown` field group name in the keyword.

The following example illustrates how to add the field 

```AL
tableextension 50100 CustomerExercise extends Customer
{
    fields
    {
        field(50100; "V02Max"; Decimal) { }
    }
   
    fieldgroups
    {
        addlast(DropDown; V02Max) { }
    }
}
```

<!--
## Define fields to display in tile view

To specify which fields are included in a tile for a record in a list page object, you use the `Brick` field group name. The following example defines the `Brick` field group that includes two fields of a table object:


```
table 50101 MyTable
{
    DataClassification = ToBeClassified;
    
    
    fields
    
    {
        field(1;MyField1; Integer)
        {
            DataClassification = ToBeClassified;
            
        }
        field(2;MyField2; Integer)
        {
            DataClassification = ToBeClassified;
            
        }
    }

    keys
    {
        key(PK; MyField)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; MyField1, MyField2)
        {
            
        }
    }

```
-->
## See Also

[Debugging in AL](devenv-debugging.md)  
[Developing Extensions](devenv-dev-overview.md)  
[Microsoft .NET Interoperability from AL](devenv-get-started-call-dotnet-from-al.md)  
