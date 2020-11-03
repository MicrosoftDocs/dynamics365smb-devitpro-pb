---
title: "Extensible Property"
ms.author: solsen
ms.custom: na
ms.date: 10/29/2020
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
# Extensible Property
Sets whether an Enum can be extended or not.

## Applies to
-   Enum Type
-   Table
-   Page

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Property Value  

**True** if the table, page, or enum can be extended; otherwise, **false**. The default is **true** on tables and pages, and **false** on enums.  

## Syntax

```AL
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
