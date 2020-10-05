---
title: "Extensible Property"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Extensible Property

[!INCLUDE[2019_releasewave2.md](../../includes/2019_releasewave2.md)]

Sets a value that indicates whether a table, page, or enum can be extended. If the value is **true**, the object can be extended using a `tableextension`, `pageextension`, or `enumextension` respectively.

## Applies to  

- Tables
- Pages
- Enums

## Property Value  

**True** if the table, page, or enum can be extended; otherwise, **false**. The default is **true** on tables and pages, and **false** on enums.  

## Syntax

```
table 50111 MyTable
{
    DataClassification = CustomerContent;
    Extensible = true;
    ...

```

## See Also  
[Table Properties](devenv-table-properties.md)  
[Properties](devenv-properties.md)  
[Access Property](devenv-access-property.md)  
[Extensible Enums](../devenv-extensible-enums.md)
