---
title: "Unique Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# Unique Property

Sets whether the value of a key must be unique. 

## Applies To  
  
Table keys

> [!NOTE]  
> The `Unique` property cannot be used in table extension objects.

## Property Value
  
 **true** if the key value must be unique; otherwise, **false**. The default is **false**.  

## Remarks
A unique index ensures that records in a table do not have identical field values. With a unique index, when a table is validated, values of the field that makes up the key are checked for uniqueness. If the table includes records with duplicate values for the field, the validation fails.

## Example

The following example defines a primary key and two unique secondary keys.

```
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