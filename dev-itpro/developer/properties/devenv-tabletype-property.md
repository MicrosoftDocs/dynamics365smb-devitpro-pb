---
title: "TableType Property"
description: "Specifies the table type."
ms.author: solsen
ms.custom: na
ms.date: 12/08/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TableType Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies the table type.

## Applies to
-   Table

## Property Value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**Normal**|runtime version 1.0|Specifies the table type used for Dynamics 365 Business Central.|
|**CRM**|runtime version 1.0|Specifies the table as an integration table for integrating Dynamics 365 Business Central with Dynamics 365 for Sales.|
|**ExternalSQL**|runtime version 1.0|Specifies the table as a table or view in SQL Server that is not in the Dynamics 365 Business Central database. This table type is not supported in Business Central online.|
|**Exchange**|runtime version 1.0|This table type is not supported in Business Central online.|
|**MicrosoftGraph**|runtime version 1.0|This table type is not supported in Business Central online.|
|**CDS**|runtime version 5.0|Specifies the table as an integration table for integrating Dynamics 365 Business Central with Common Data Service.|
|**Temporary**|runtime version 6.0|Specifies the table as an in-memory table used to store temporary data.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
TableType = CDS;
```

## Remarks

Tables that are marked as **CDS** or **ExternalSQL** are considered external tables that are not managed by [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)]. These tables use a different SQL Server connection than the normal tables in the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] database.

> [!NOTE]  
> Tables of types `CRM` and `CDS` are used to create outgoing service calls towards Dataverse and Dynamics 365 Apps. Such calls are not counted against [Business Central API limits](../../administration/operational-limits-online.md), but are counted against [Power Platform request limits](/power-platform/admin/api-request-limits-allocations#non-licensed-user-request-limits).

> [!IMPORTANT]  
> We advise against creating tables of type CRM/CDS manually. Instead, use the [AL Table Proxy Generator](../devenv-al-table-proxy-generator.md). 
<!-- For more information, see [Introduction to Dynamics 365 for Sales Integration Customization in Dynamics NAV](Introduction-to-Dynamics-CRM-Integration-Customization-in-Dynamics-NAV.md).  
 -->

## Temporary tables

Marking a table as **Temporary** is the same as:

- Setting "SourceTableTemporary" on all pages that use the table. See [SourceTableTemporary Property](devenv-sourcetabletemporary-property.md).  

Temporary tables are not synchronized with the SQL database, so they do not follow the same rules about making destructive changes.

You can change an existing table from **Normal** to **Temporary**. But the table will be deleted from the database when you synchronize the extension. If the table contains data, you'll have to use the ForceSync mode.

For more information, see [Temporary Tables](../devenv-temporary-tables.md).

## See Also  

[Properties](devenv-properties.md)  
[SourceTableTemporary Property](devenv-sourcetabletemporary-property.md)  