---
title: "Clustered Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 78bf605e-99ae-40b3-8c93-f46c2c808e64
caps.latest.revision: 4
author: SusanneWindfeldPedersen
---

# Clustered Property

Sets a value that indicates whether the index is clustered.  
  
## Applies to  

Table keys  

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