---
title: "Upgrading Base Application Tables That Are Now Temporary"
description: Describes how to upgrade base application tables that have been changed to temporary starting with version 18
ms.custom: na
ms.date: 04/15/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: jswymer
author: jswymer
---
# Upgrading Base Application Tables That Have Changed to Temporary

Starting in version 18, several base application tables are now temporary tables, as specified by the [TableType property](../developer/properties/devenv-tabletype-property.md). Depending on how you're using these tables, this change may affect the upgrade from version 17 or earlier to a later version.

## Affected tables

|Table|File|
|-----|----|
|Table 49 "Invoice Post. Buffer"|InvoicePostBuffer.Table.al|
|Table 265 "Document Entry"| DocumentEntry.Table.al|
|Table 269 "G/L Account Net Change"|GLAccountNetChange.Table.al|
|Table 338 "Entry Summary" |EntrySummary.Table.al|
|Table 491 "Parallel Session Entry"|ParallelSessionEntry.Table.al|
|Table 1670 "Option Lookup Buffer"|OptionLookupBuffer.Table.al |
|Table 1754 "Field Content Buffer"|FieldContentBuffer.Table.al|
|Table 6305 "Power BI Chart Buffer"|PowerBIChartBuffer.Table.al|
|Table 6302 "Power BI Report Buffer"|PowerBIReportBuffer.Table.al|
|Table 7330 "Bin Content Buffer" |BinContentBuffer.Table.al|

## How this change affects upgrade

With this change, these tables must be empty to complete the upgrade. If a table isn't empty, you can't synchronize the new version of the base application. In this case, you'll get an error stating that the table cannot be deleted from the database because it contains data.

So if there are records in these tables, or the application includes custom code that stores non-temporary records to these tables, you'll have to make some changes before you can run the upgrade.

## How to handle this change

You can either move the records to new tables or delete the records from the tables. Also, rewrite the custom application code to store the non-temporary records in tables other than these base application tables.