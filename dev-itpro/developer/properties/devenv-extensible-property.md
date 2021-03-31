---
title: "Extensible Property"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Extensible Property
> **Version**: _Available or changed with runtime version 7.0._

Sets whether the report can be extended.

## Applies to
-   Report
-   Enum Type
-   Table
-   Page

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value  

**True** if the table, page, report, or enum can be extended; otherwise, **false**. The default is **true** on tables, pages, and reports, whereas it is **false** on enums.  

## Syntax

```AL
table 50111 MyTable
{
    DataClassification = CustomerContent;
    Extensible = true;
    ...

```

## Remarks

If the value is **true**, the object can be extended using a `tableextension`, `pageextension`, `reportextension`, or `enumextension` respectively.

## See Also

[Table Properties](devenv-table-properties.md)  
[Properties](devenv-properties.md)  
[Access Property](devenv-access-property.md)  
[Extensible Enums](../devenv-extensible-enums.md)
