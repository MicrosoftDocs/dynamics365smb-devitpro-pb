---
title: AL Table Proxy Generator
description: Tool for creating integration or proxy tables for integration with Microsoft Dataverse from Business Central
ms.date: 06/16/2025
ms.topic: overview
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
---

# AL Table Proxy Generator

The **AL Table Proxy Generator** tool can be used to generate one or more tables for integration with Microsoft Dataverse. When one or more tables are present in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)], but not in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], the tool can be run to generate integration or proxy tables for the specified table or tables.

An integration or proxy table is a table that represents a table in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. The integration table includes fields that correspond to columns in the [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] table. The integration table acts as a link or connector between the [!INCLUDE[prod_short](includes/prod_short.md)] table and the [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] table.  

> [!NOTE]
> [!INCLUDE [cds_long_md](includes/cds_long_md.md)] and [!INCLUDE [prod_short](includes/prod_short.md)] store dates in different formats. In [!INCLUDE [prod_short](includes/prod_short.md)], all users see the same date across all time zones, whereas [!INCLUDE [cds_long_md](includes/cds_long_md.md)]-based apps render the dates based on the current user's time zone.
>
> The **AL Table Proxy Generator** tool doesn't support time zones for dates and converts dates from [!INCLUDE [cds_long_md](includes/cds_long_md.md)] to the [!INCLUDE [prod_short](includes/prod_short.md)] format.

The **AL Table Proxy Generator** tool is available with the **AL Language** extension. Look for the **altpgen.exe** tool in the equivalent folder of `c:\users\<username>\.vscode\extensions\<al extension version>\bin`. 

## Generating proxy tables

1. Start Windows PowerShell as an administrator.
2. From the command prompt, write `.\altpgen.exe` followed by the parameters:  
    ```powershell
    -Project
    -PackageCachePath
    -ServiceUri
    -ClientId
    -RedirectUri
    -Entities
    -BaseId
    -[TableType]
    ```
3. The table or tables are generated in the folder of the specified AL project.

## Parameters

|Parameter|Description|
|---------|-----------|
|*Project*| The AL project folder to create one or more tables in.|
|*PackageCachePath*| The AL project cache folder for symbols. <br> **Note:** It's important that the latest symbols are downloaded because these are used for comparison when the tool runs. |
|*ServiceUri*| The server URL for [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. For example, `https://tenant.crm.dynamics.com`.|
|*ClientId*| The client ID for Microsoft Entra application.
|*RedirectUri*| The redirect URI for Microsoft Entra application.
|*Entities*| One or more tables to create in AL. If multiple tables, these must be specified as a comma-separated list.<br><br>**Note:** It's important that all related tables are specified too. Related tables are, for example, used for lookups and if the related tables aren't found, a lookup will no longer be working. For more information, see the section [Specifying tables](devenv-al-table-proxy-generator.md#specifying-tables). |
|*BaseId*| The assigned starting ID for one or more generated new tables in AL. |
|*TableType*| The table type for one or more tables in AL. The options are `CDS` and `CRM`. <br><br>**Note:** If unspecified, the system looks both for `CDS` and `CRM` tables. |

## Specifying tables

The `Entities` parameter specifies the logical names of one or more tables to create in AL. To know which ones to specify, you need to check the *main* table relationships in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. For more information, see [Table relationships overview](/powerapps/maker/common-data-service/create-edit-entity-relationships). You specify all tables that you want created, including the related tables, in the `Entities` parameter separated by commas.

### Related tables

An example could be, that you want to generate an AL proxy table for the **CDS Worker Address** (cdm_workeraddress). 
 
If you run the altpgen tool and only specify `cdm_workeraddress`, the tool doesn't generate the `Worker` lookup field, because no related table `Worker` is specified.

If you specify `cdm_workeraddress, cdm_worker` in the `Entities` parameter, the `Worker` lookup field is generated. Furthermore, if your *symbols contain* the `cdm_worker` table definition, the `Worker` table won't be created as it's already in your symbols. If your *symbols don't contain* the `cdm_worker` table, the `Worker` table is created together with the `Worker Address` table.  

## Creating a new integration table

The following example starts the process for creating a new integration table in the specified AL project. When complete, the output path contains the **Worker.al** file that contains the description of the **50000 CDS Worker** integration table. This table is set to the table type **CDS**.

```powershell
.\altpgen -project:"C:\myprojectpath" -packagecachepath:"C:\mypackagepath" -serviceuri:"https://tenant.crm.dynamics.com" -clientid:00001111-aaaa-2222-bbbb-3333cccc4444 -redirecturi:"https://localhost:8080" -entities:cdm_worker,cdm_workeraddress -baseid:50000 -tabletype:CDS 
```

## Authentication

Users are required to register a Microsoft Entra application and provide its client ID and redirect URI as arguments when running the tool. To register an application, sign in to the Microsoft Entra admin center as a Cloud Application Administrator. The application must have the **user_impersonation** permission for Dynamics CRM API. The Redirect URI type must be **Public client/native** (mobile & desktop).

## Related information

[Overview - integrating Business Central with Microsoft Dataverse](../developer/dataverse-integration-overview.md)  
[Custom integration with Microsoft Dataverse](../administration/administration-custom-cds-integration.md)  
