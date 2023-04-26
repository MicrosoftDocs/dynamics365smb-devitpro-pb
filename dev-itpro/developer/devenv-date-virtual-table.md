---
title: Date virtual table
description: The date virtual table in AL for Dynamics 365 Business Central
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: 
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.date: 03/17/2023
ms.custom: bap-template
---

# Date virtual table

The Date virtual table (ID 2000000007) gives you easy access to days, weeks, months, quarters, and years. The Date virtual table contains the following fields.

| Field | Description |
|-------|-------------|
|Period Type |Days, weeks, months, quarters, or years.|
|Period Start| The date of the first day in the period.|
|Period End | The date of the last day in the period.|
|Period No.| The number of the period.|
|Period Name |The name of the period.|

For each period type, there are many records in the Date table. 

The `Period End` field returns the closing date at the end of the period. For more information, see [System.ClosingDate(Date) Method](methods-auto/system/system-closingdate-method.md).

You can apply filters to the `Period Type`, `Period Start`, and `Period End` fields to easily get a subset or range of days, weeks, months, quarters, or years to use in your pages or reports.

The date virtual table is most frequently used to provide a range of dates; the **Receivables-Payables** page in [!INCLUDE [prod_short](../includes/prod_short.md)] is a typical example.

You must create a list type page to access the Date virtual table. For more information, see [Page object](devenv-page-object.md).


## See also

[Virtual tables](devenv-virtual-tables.md)  
[Integer virtual table](devenv-integer-virtual-table.md)