---
title: "TableType Property"
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
# TableType Property
Specifies the table type.

## Applies to
-   Table

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|Normal|Specifies the table type used for Dynamics 365 Business Central.|
|CRM|Specifies the table as an integration table for integrating Dynamics 365 Business Central with Dynamics 365 for Sales.|
|ExternalSQL|Specifies the table as a table or view in SQL Server that is not in the Dynamics 365 Business Central database.|
|Exchange|This is for internal use only.|
|MicrosoftGraph|This is for internal use only.|
|CDS|Specifies the table as an integration table for integrating Dynamics 365 Business Central with Common Data Service.|
|Temporary|Specifies the table as an in-memory table used to store temporary data.|
[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
TableType = CDS;
```

## Remarks

Tables that are marked as **CDS** or **ExternalSQL** are considered external tables that are not managed by [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)]. These tables use a different SQL Server connection than the normal tables in the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] database. 

> [!IMPORTANT]  
> We advise against creating tables of type CDS manually. Instead, use the integration mapping functionality.
<!-- For more information, see [Introduction to Dynamics 365 for Sales Integration Customization in Dynamics NAV](Introduction-to-Dynamics-CRM-Integration-Customization-in-Dynamics-NAV.md).  
 -->

## Temporary tables

Marking a table as **Temporary** is the same as:

- Setting all Record variables in AL code to "Temporary". See [Temporary Property](devenv-temporary-property.md).
- Setting "SourceTableTemporary" on all pages that use the table. See [SourceTableTemporary Property](devenv-sourcetabletemporary-property.md).  

Temporary tables are not synchronized with the SQL database, so they do not follow the same rules about making destructive changes.

You can change an existing table from **Normal** to **Temporary**. But the table will be deleted from the database when you synchronize the extension. If the table contains data, you'll have to use the ForceSync mode.

For more information, see [Temporary Tables](../devenv-temporary-tables.md).

## See Also  

[Properties](devenv-properties.md)  
[SourceTableTemporary Property](devenv-sourcetabletemporary-property.md)  
[Temporary Property](devenv-temporary-property.md)  