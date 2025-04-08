---
title: "Extensible property"
description: "Sets whether the Table can be extended or not."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Extensible Property
> **Version**: _Available or changed with runtime version 4.0._

Sets whether the Table can be extended or not.

## Applies to
-   Table
-   Page
-   Report
-   Enum Type

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

## Related information

[Table Properties](devenv-table-properties.md)  
[Properties](devenv-properties.md)  
[Access Property](devenv-access-property.md)  
[Extensible Enums](../devenv-extensible-enums.md)
