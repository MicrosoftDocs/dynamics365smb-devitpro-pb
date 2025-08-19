---
title: "Unique property"
description: "Sets a value that indicates whether a SQL Server unique constraint that corresponds to the key should be created."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Unique Property
> **Version**: _Available or changed with runtime version 3.0._

Sets a value that indicates whether a SQL Server unique constraint that corresponds to the key should be created.

## Applies to
-   Table key

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


> [!NOTE]  
> The `Unique` property cannot be used in table extension objects.

## Property Value
  
**true** if the key value must be unique; otherwise, **false**. The default is **false**.  

## Remarks

A unique index ensures that records in a table do not have identical field values. With a unique index, when a table is validated, values of the field that makes up the key are checked for uniqueness. If the table includes records with duplicate values for the field, the validation fails.

> [!CAUTION]
> In online environments, the `Unique` property must be set only when a table is first introduced.
>
> Adding this property to existing tables is not supported. Although the change may pass app validation and allow the app to be published to AppSource, it cannot be installed due to data consistency requirements when existing table data could possibly contains duplicates. Once published with the `Unique` property, removing this property is considered a breaking change and is no longer possible.

## Example

The following example defines a primary key and two unique secondary keys.

```AL
keys
{
    key(PrimaryKey; ID)
    {

    }
    key(CustomerInfo; Name,Address,City)
    {
        Unique = true;
    }
   key(Email; Email)
    {    
        Unique = true;
    }
}

```

## Related information

[Table Keys](../devenv-table-keys.md)  
