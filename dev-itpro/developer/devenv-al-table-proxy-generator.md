---
title: Generate AL Proxy Tables for Dataverse
description: Use the AL Table Proxy Generator to create Business Central integration tables from Microsoft Dataverse tables and their relationships.
ms.date: 10/07/2026
ms.topic: how-to
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
---

# Create proxy tables for Dataverse

Use the **AL Table Proxy Generator** tool to generate one or more tables for integration with Microsoft Dataverse. When tables are present in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] but not in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], the tool can generate integration or proxy tables for them.

An integration or proxy table is a table that represents a table in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. The integration table includes fields that correspond to columns in the [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] table. The integration table acts as a link or connector between the [!INCLUDE[prod_short](includes/prod_short.md)] table and the [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] table.

> [!NOTE]
> The generator maps supported Dataverse date and time columns to AL `Date` or `DateTime` fields. It skips columns whose Dataverse `DateTimeBehavior` is `TimeZoneIndependent` because the [!INCLUDE[prod_short](includes/prod_short.md)] runtime doesn't support that behavior.

The **AL Table Proxy Generator** is distributed in the `Microsoft.Dynamics.BusinessCentral.Development.Tools.Altpgen` NuGet package. After you restore the package, run the `altpgen` executable from the applicable Windows target-framework folder.

## Generate proxy tables

1. Open PowerShell or another command shell.
2. Use the following syntax to run `altpgen` with the required and optional parameters. You can prefix each parameter name with `/` or `-`.
    ```powershell
    /project:<directory>
    /packagecachepath:<directory>
    /serviceuri:<uri>
    /clientid:<id>
    /redirecturi:<uri>
    /entities:<entity-list>
    /baseid:<id>
    [/tabletype:CDS|CRM]
    [/prefix:<prefix>]
    ```
3. The table or tables are generated in the folder of the specified AL project.

## Parameters

|Parameter|Description|
|---------|-----------|
|`Project`| The AL project folder to create one or more tables in.|
|`PackageCachePath`| The AL project cache folder for symbols. <br> **Note:** Download the latest symbols because the tool uses them for comparison when it runs. |
|`ServiceUri`| The server URL for [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]. For example, `https://tenant.crm.dynamics.com`.|
|`ClientId`| The client ID for the Microsoft Entra application.
|`RedirectUri`| The redirect URI for the Microsoft Entra application.
|`Entities`| One or more tables to create in AL. Separate multiple logical names with a comma, semicolon, or space.<br><br>**Note:** Include related tables that aren't already available in symbols. Otherwise, the generator can't create lookup relationships. Learn more about related tables in [Specify tables](devenv-al-table-proxy-generator.md#specify-tables). |
|`BaseId`| The assigned starting ID for one or more generated new tables in AL. |
|`TableType`| The table type for one or more tables in AL. The options are `CDS` and `CRM`. <br><br>**Note:** If you don't specify a value, the system looks for both `CDS` and `CRM` tables. |
|`Prefix`| An optional prefix for generated table names. The default is `CDS `. |

## Specify tables

Use the `Entities` parameter to specify the logical names of one or more tables to create in AL. Check the main table relationships in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] to determine which related tables to include. Learn more about Dataverse table relationships in [Table relationships overview](/power-apps/maker/data-platform/create-edit-entity-relationships). Specify all tables that you want to create, including related tables that aren't already available in symbols.

### Related tables

For example, you want to generate an AL proxy table for `CDS Worker Address` (`cdm_workeraddress`).

If you run the `altpgen` tool and specify only `cdm_workeraddress`, the tool doesn't generate the `Worker` lookup field because you didn't specify a related `Worker` table.

If you specify `cdm_workeraddress,cdm_worker` in the `Entities` parameter, the `Worker` lookup field is generated. If your symbols contain the `cdm_worker` table definition, the tool doesn't create the `Worker` table again. Otherwise, it creates the `Worker` table together with the `Worker Address` table.

## Creating a new integration table

The following example shows how to create a new integration table in the specified AL project. When the process finishes, the output path contains the `Worker.al` file, which defines the `50000 CDS Worker` integration table. The table type is `CDS`.

```powershell
.\altpgen -project:"C:\myprojectpath" -packagecachepath:"C:\mypackagepath" -serviceuri:"https://tenant.crm.dynamics.com" -clientid:00001111-aaaa-2222-bbbb-3333cccc4444 -redirecturi:"https://localhost:8080" -entities:cdm_worker,cdm_workeraddress -baseid:50000 -tabletype:CDS 
```

## Authentication

Register a Microsoft Entra public-client application and provide its client ID and redirect URI when you run the tool. The application must have the delegated `user_impersonation` permission for the Dynamics CRM API. Configure the redirect URI for a mobile and desktop application.

## Related information

[Overview - integrating Business Central with Microsoft Dataverse](../developer/dataverse-integration-overview.md)  
[Custom integration with Microsoft Dataverse](../administration/administration-custom-cds-integration.md)  
