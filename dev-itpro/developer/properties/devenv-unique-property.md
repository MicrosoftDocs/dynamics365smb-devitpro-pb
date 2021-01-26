---
title: "Unique Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Unique Property
> **Version**: _Available or changed with runtime version 3.0._

Sets a value that indicates whether a SQL Server unique constraint that corresponds to the key should be created.

## Applies to
-   Table Key

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


> [!NOTE]  
> The `Unique` property cannot be used in table extension objects.

## Property Value
  
**true** if the key value must be unique; otherwise, **false**. The default is **false**.  

## Remarks

A unique index ensures that records in a table do not have identical field values. With a unique index, when a table is validated, values of the field that makes up the key are checked for uniqueness. If the table includes records with duplicate values for the field, the validation fails.

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

## See Also

[Table Keys](../devenv-table-keys.md)  