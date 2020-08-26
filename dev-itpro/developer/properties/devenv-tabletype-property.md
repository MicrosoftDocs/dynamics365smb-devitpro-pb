---
title: "TableType Property"
ms.custom: na
ms.date: 05/04/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# TableType Property
Specifies the table type.  

## Applies to  

- Tables  

## Property Value  

|Value|Description|  
|-----------|-----------------|  
|**Normal**|Specifies the table as a normal table in the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] database. This value is the default.|  
|**CDS**|Specifies the table as an integration table for integrating [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] with [!INCLUDE[crm](../includes/crm_md.md)]. The table is typically based on an entity in [!INCLUDE[crm](../includes/crm_md.md)], such as the Accounts entity.|  
|**ExternalSQL**|Specifies the table as a table or view in SQL Server that isn't in the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] database.|  
|**Temporary**|Specifies the table as an in-memory only table in the [!INCLUDE[server](../includes/server.md)]. This table type isn't synchronized to the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] database. **APPLIES TO:** [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] 2020 release wave 2 and later.|
|**Exchange**|For internal use only.|
|**MicrosoftGraph**|For for internal use only.|

<!-- 
|**Temporary**|Specifies the table as a temporary table in the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] database. This table type is not synchronized.| -->


## Syntax
```
TableType = CDS;
```

## Remarks  
 Tables that are marked as **CDS** or **ExternalSQL** are considered external tables that are not managed by [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)]. These tables use a different SQL Server connection than the normal tables in the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] database. <!-- For more information, see [External Tables](External-Tables.md).  -->

> [!IMPORTANT]  
>  We advise against creating tables of type CDS manually. Instead, use the integration mapping functionality.
<!-- For more information, see [Introduction to Dynamics 365 for Sales Integration Customization in Dynamics NAV](Introduction-to-Dynamics-CRM-Integration-Customization-in-Dynamics-NAV.md).  
 -->

### Temporary tables

Marking a table as **Temporary** is the same as:

-  Setting all Record variables in AL code to "Temporary". See [Temporary Property](devenv-temporary-property.md).
-  Setting "SourceTableTemporary" on all pages that use the table. See [SourceTableTemporary Property](devenv-sourcetabletemporary-property.md).  

Temporary tables aren't synchronized to the SQL database, so they don't follow the same rules about making destructive changes.

You can change an existing table from **Normal** to **Temporary**. But the table will be deleted from the database when you synchronize the extension. If the table contains data, you'll have to use the ForceSync mode.


## See Also  

[Properties](devenv-properties.md)  
[SourceTableTemporary Property](devenv-sourcetabletemporary-property.md)  
[Temporary Property](devenv-temporary-property.md)  
<!--  [External Tables](External-Tables.md)   
 [Table Designer](uiref/-$-S_2102-Table-Designer-$-.md)  -->


