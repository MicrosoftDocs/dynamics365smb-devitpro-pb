---
title: "Clustered Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
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
# Clustered Property
> **Version**: _Available from runtime version 1.0._

Sets a value that indicates whether the key also defines the clustered index in the database.  

By default the primary key is configured as the clustered key.

## Applies to
-   Table Key


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [!NOTE]  
> The `Clustered` property cannot be used in table extension objects.

## Property value
**True** if the index is clustered, otherwise **false**. The default is **false**.

## Syntax

```AL
Clustered = true;
```

## Remarks

A clustered index determines the physical order in which records are stored in the table. Using a clustered key can improve the time it takes to retrieve records. 

There can be only one clustered key on a table.

## Example

The following example defines a secondary key to be a clustered index. 

```AL
keys
{
    // the first key defined in the keys section is the primary key
    key(PrimaryKey; ID)
    {
        Clustered = false;
    }
    key(CustomerInfo; Name,Address,City)
    {
        Clustered = true;
    }
}

```

## See Also  

[Table Key](devenv-key-properties.md)  