---
title: Custom migration from any SQL source
description: Learn how to set up and run custom migrations from any SQL-based source to Business Central online, including no-code options and custom migration apps.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.date: 05/29/2026
ms.custom: bap-template 
---

# Custom migration from any SQL source

Custom migrations let you migrate data from any SQL-based source to a [!INCLUDE [prod_short](../includes/prod_short.md)] environment. This article explains how to set up and run custom migrations.

## Determine your migration approach

There are three ways to run a custom migration, depending on your source system and requirements:

| Approach | What gets migrated | When to use |
|----------|-------------------|-------------|
| [No-code custom migration](#no-code-custom-migration-from-any-sql-source) | Only the tables you manually select | Small number of tables, testing, or post-migration additions |
| [Full custom migration app](#create-your-own-migration-tool) | Only what your app defines | Migrating from non-Business Central systems where you need full control |
| [Extend Business Central 14 reimplementation](#extend-the-business-central-14-reimplementation) | Standard Business Central data plus your custom tables | Business Central 14 on-premises to Business Central online with custom tables to migrate |

> [!TIP]
> If you're migrating from Business Central 14 on-premises and only need to add a few custom tables, **extending the Business Central 14 reimplementation** is the fastest path. You get all standard data migration for free and only write code for your custom entities.

> [!TIP]
> Even if you're not migrating from Business Central, the [Business Central 14 reimplementation app](migrate-bc14-reimplementation.md) is a useful reference. Study its patterns for buffer tables, phased execution, and error handling when building your own custom migration.

## No-code custom migration from any SQL source

For specific scenarios, you need to migrate only a small number of individual tables to a cloud environment. For example:

- You're migrating some additional tables to a company that has previously migrated.
- You want to test performance in a sandbox environment using large tables with real data from your on-premises database before committing to a full migration.

No-code custom migration is highly controlled. You select exactly which tables to copy, and nothing else is migrated. This approach lets you migrate individual tables manually without writing any code.

### Table mapping types

To set up a no-code custom migration scenario, you create one or more *table mappings*. A table mapping defines how data moves from your source database to Business Central online. Each mapping specifies a source table, a destination table, and settings that control how the data is copied.

When you create a table mapping, you also choose the mapping type, which determines when the data is copied:

| Mapping type | When data is copied | Use for |
|--------------|---------------------|---------|
| **Replication** | During data replication runs | Most tables — this is the standard way to move data |
| **Setup** | During the assisted setup guide, before companies are created | Small configuration tables needed to configure the migration itself |

Use **Replication** for most tables. Use **Setup** only for small tables that your migration logic needs to read during the assisted setup guide — for example, a table that lists which companies to create. Setup mappings run before companies exist in the cloud, so keep them minimal to avoid slowing down the assisted setup guide.

> [!NOTE]
> Setup mappings are for advanced scenarios only. The standard Business Central, Dynamics GP, and Dynamics SL migration tools don't use them. Most custom migrations only need Replication mappings.

### Prerequisites

The source database must contain a table with company names. The table can have any name, but it must contain the following fields:

| Field | Type | Notes |
|-------|------|-------|
| `Name` | nvarchar(30) | Primary key |
| `Display Name` | nvarchar(250) | |

If this table doesn't exist, create it using a SQL script before running the migration.

> [!NOTE]
> System tables that are inaccessible by AL code can't be migrated. This limitation applies to all migration tools built on the cloud migration platform.

### Run a no-code custom migration

1. [Sign in to Business Central online](https://businesscentral.dynamics.com) and open the environment you want to migrate data to.
1. Search for and open the **Cloud Migration Management** page.
1. Select **Enable/Disable Custom Migration** to enable custom migration. A message confirms the setting is enabled.
1. Select **Manage table mappings** to open the **Custom Migration Table Mappings** page.
1. Select **Add Table Mapping** and configure the mapping:
   - **Mapping Type** — Select **Replication** for data moved during replication or **Setup** for data needed during assisted setup.
   - **Data per-company** — Enable if the table contains company-specific data.
   - **Company name** — Specify the company name, or enable **All companies** to apply to all migrated companies.
   - **Preserve cloud data** — Enable to keep existing cloud data (recommended for per-database tables).
   - **Source: Table name** — Enter the SQL table name from the source database.
   - **Target: Table name** — Use the assist-edit to select the Business Central table you want to migrate data into. This field identifies the logical table and auto-populates the destination table name.
   - **Target: Destination table name** — The physical SQL table name in the cloud database. This field is auto-populated when you select a target table, but you can edit it manually if the source table name doesn't match the standard Business Central naming convention.
1. Repeat the previous step for each table you want to migrate.
1. Select the **Setup cloud migration** action to run the **Cloud Migration Setup** assisted setup guide.
1. Read the information on the page and provided links. If you consent, switch on **I accept warning & privacy notice**, and then select **Next** to continue.
1. Set the **Product** field to **Custom Migration**, and then select **Next**.
1. On the **Configure custom cloud migration** page, verify the SQL table names. For no-code migrations, the defaults are usually correct:
   - **Replication Mappings SQL Table Name** - The table storing replication mappings (default: `Replication Table Mapping$<app-id>`).
   - **Setup Mappings SQL Table Name** - The table storing setup mappings (default: `Migration Setup Table Mapping$<app-id>`).
   - **Companies SQL Table Name** - The table in your source database containing company names (default: `Company`).
1. Enter the connection string for your on-premises database.
1. Select the companies to migrate.
1. Complete the assisted setup guide, then select **Run data replication** to start the migration.

> [!TIP]
> You can export your table mappings and import them into another tenant. On the **Custom Migration Table Mappings** page, use the **Export** and **Import** actions.

## Create your own migration tool

Developers can create their own apps to migrate from any SQL-based source to [!INCLUDE [prod_short](../includes/prod_short.md)] online using the existing migration tooling. A custom migration app defines the table mappings and setup data needed to migrate data from the source database.

### Implementation overview

Custom migration apps extend the **Intelligent Cloud Base** app published by Microsoft. The migration framework uses two interfaces that your app must implement:

- `"Custom Migration Provider"` - Defines the migration provider metadata and table mapping setup logic.
- `"Custom Migration Table Mapping"` - Defines where table mappings are stored and the company table name.

Your app registers itself by extending enum 4010 `"Custom Migration Provider"`, which makes it available in the cloud migration assisted setup guide.

### Interfaces to implement

#### Custom Migration Provider interface

The `"Custom Migration Provider"` interface requires implementing the following procedures:

| Procedure | Description |
|-----------|-------------|
| `GetDisplayName(): Text[250]` | Returns the display name shown in the **Cloud Migration Setup** assisted setup guide. |
| `GetDescription(): Text` | Returns a description of the migration type. |
| `GetAppId(): Guid` | Returns the app ID of your migration app. |
| `SetupReplicationTableMappings()` | Registers the table mappings used during data replication. Called after companies are created online. |
| `SetupMigrationSetupTableMappings()` | Registers table mappings needed during the setup phase, before companies are created. Use for per-database tables only. |
| `GetDemoDataType(): Enum "Company Demo Data Type"` | Returns the demo data type for new companies. Common values: `"Production - Setup Data Only"` (populates setup data) or `"Create New - No Data"` (empty company). |

#### Custom Migration Table Mapping interface

The `"Custom Migration Table Mapping"` interface requires implementing the following procedures:

| Procedure | Description |
|-----------|-------------|
| `GetReplicationTableMappingName(): Text` | Returns the SQL table name that stores replication mappings. |
| `GetMigrationSetupTableMappingName(): Text` | Returns the SQL table name that stores setup table mappings. |
| `GetCompaniesTableName(): Text` | Returns the name of the company table in the source database. |
| `ShowConfigureMigrationTablesMappingStep(): Boolean` | Returns `true` to show the table mapping configuration step in the assisted setup guide. Default should be `false`. |

### Table mapping structure

Table mappings define how data moves from source to destination. Both `Replication Table Mapping` (table 40034) and `Migration Setup Table Mapping` (table 40033) use the same structure:

| Field | Type | Description |
|-------|------|-------------|
| `Source Sql Table Name` | Text[128] | The exact SQL table name in the source database. |
| `Destination Sql Table Name` | Text[128] | The exact SQL table name in the cloud environment. |
| `Company Name` | Text[30] | The company name. Leave blank for per-database tables. |
| `Table Name` | Text[128] | A friendly name for the table (for example, "Customer"). |
| `Preserve Cloud Data` | Boolean | If `true`, existing cloud data isn't overwritten. Set to `true` for per-database tables, `false` for per-company tables. |

### Company table requirement

The source database must contain a table with company information. The table can have any name, but it must contain these fields:

| Field | Type | Notes |
|-------|------|-------|
| `Name` | nvarchar(30) | Primary key |
| `Display Name` | nvarchar(250) | |

Create this table using a SQL script in the source database before running the migration.

### Implementation example

The following example shows the minimum code needed to create a custom migration provider.

#### Step 1: Extend the enum

```al
enumextension 50100 "My Migration Provider Ext" extends "Custom Migration Provider"
{
    value(50100; "My Custom Migration")
    {
        Caption = 'My Custom Migration'; // Display name shown in assisted setup guide 
        Implementation = "Custom Migration Provider" = "My Migration Provider", 
                         "Custom Migration Table Mapping" = "My Migration Provider";
    }
}
```

#### Step 2: Implement the provider codeunit

```al
codeunit 50100 "My Migration Provider" implements "Custom Migration Provider", "Custom Migration Table Mapping"
{
    procedure GetDisplayName(): Text[250]
    begin
        exit('My Custom Migration');
    end;

    procedure GetDescription(): Text
    begin
        exit('Migrates data from my source system to Business Central online.');
    end;

    procedure GetAppId(): Guid
    begin
        exit('00001111-aaaa-2222-bbbb-3333cccc4444'); // Your app ID
    end;

    procedure SetupReplicationTableMappings()
    var
        HybridCloudManagement: Codeunit "Hybrid Cloud Management";
    begin
        // Map source tables to destination tables in Business Central online by table ID
        // Called after companies are created online
        HybridCloudManagement.CreateReplicationMapping(
            CompanyName(),
            Database::"Source Table Name",  // Source table to migrate 
            Database::"Target Table Name"   // Destination table in Business Central online
        );
    end;

    procedure SetupMigrationSetupTableMappings()
    var
        HybridCloudManagement: Codeunit "Hybrid Cloud Management";
    begin
        // Register per-database tables needed during setup
        // Called before companies are created - use sparingly
        // Example (uncomment if needed):
        // HybridCloudManagement.CreateMigrationSetupMapping(
        //     '',  // Empty company name for per-database tables
        //     Database::"Migration Config",  // Small config table
        //     Database::"Migration Config"
        // );
    end;

    procedure GetDemoDataType(): Enum "Company Demo Data Type"
    begin
        exit(Enum::"Company Demo Data Type"::"Production - Setup Data Only");
    end;

    // Custom Migration Table Mapping interface
    procedure GetReplicationTableMappingName(): Text
    var
        CustomMigrationProvider: Codeunit "Custom Migration Provider";
    begin
        exit(CustomMigrationProvider.GetReplicationTableMappingName());
    end;

    procedure GetMigrationSetupTableMappingName(): Text
    var
        CustomMigrationProvider: Codeunit "Custom Migration Provider";
    begin
        exit(CustomMigrationProvider.GetMigrationSetupTableMappingName());
    end;

    procedure GetCompaniesTableName(): Text
    begin
        exit('Company'); // Or your custom company table name
    end;

    procedure ShowConfigureMigrationTablesMappingStep(): Boolean
    begin
        exit(false);
    end;
}
```

### Best practices

- **Setup table mappings run before companies exist**: Only use `SetupMigrationSetupTableMappings()` for per-database tables. Per-company data must be registered through `SetupReplicationTableMappings()`, which runs after companies are created.
- **Use buffer tables for data transformation**: If you need to transform data during migration, replicate to buffer tables first, then process the data into the target tables.
- **Provide integration events**: Add events like `OnBeforeMigrate` and `OnAfterMigrate` to allow extensions to customize the migration behavior.
- **Preserve cloud data for per-database tables**: Set `Preserve Cloud Data` to `true` for per-database tables to avoid overwriting existing cloud data.

### Working implementations for reference

Use these examples as templates for your own custom migration app. Study the patterns, copy the code structure, and adapt it to your source system. You don't need to take a dependency on these apps - they're meant to illustrate how to build a migration from scratch.

- [BC14 Item Category Migration Example](https://github.com/microsoft/BCTech/tree/master/samples/CloudMigration/BC14ItemCategoryMigrationExample) on GitHub - A simple example showing the basic structure for migrating a single entity.
- **Business Central 14 Reimplementation app** - A complete implementation that migrates master data, setup data, and transactions. Use this app as a reference for building comprehensive migrations with buffer tables, phased execution, and error handling.

## Extend the Business Central 14 reimplementation

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/preview-note-d365.md)]

The Business Central 14 reimplementation app provides an extensible architecture for migrations that require data transformation. Instead of building a custom migration from scratch, you can extend the Business Central 14 reimplementation to add migrators for custom tables while getting all standard Business Central data migration for free.

Your extension must declare a dependency on `HybridBC14` in your app.json. The Business Central 14 reimplementation app handles all standard Business Central entities (customers, vendors, items, G/L accounts, and more). You only need to create migrators for custom tables that aren't already covered.

### Extension patterns

The Business Central 14 reimplementation supports three extension patterns:

| Pattern | Use case |
|---------|----------|
| **Add fields to existing entities** | Carry extra fields on Customer, Item, etc. alongside standard migration |
| **Add new entities** | Migrate your own custom tables that aren't part of standard Business Central |
| **Add post-migration logic** | Run validations or actions after migration completes |

For detailed implementation guidance, working code samples, and best practices, see [Extending the BC14 Reimplementation Tool](https://github.com/microsoft/BCTech/blob/master/samples/CloudMigration/BC14ReimplementationToolExtendingSample/Extending.md) on GitHub.

### Disable standard modules

The Business Central 14 reimplementation includes per-company settings that let you disable standard migrators. This is useful when you want to use the Business Central 14 reimplementation framework and tooling but only migrate your custom tables.

To disable standard modules:

1. Open the **BC14 Migration Configuration** page.
2. In the **Modules** section, clear the checkboxes for modules you don't want to migrate:
   - **General Ledger** - Disables G/L Account and related ledger migration
   - **Receivables** - Disables Customer migration
   - **Payables** - Disables Vendor migration
   - **Inventory** - Disables Item migration
3. Your custom migrators (which return `true` from `IsEnabled()`) still run.

> [!NOTE]
> Module settings are locked after migration starts. Configure them before running your first replication.

## Related information

- [Migrate on-premises data to Business Central online](migrate-data.md)
- [Business Central 14 reimplementation tool](migrate-bc14-reimplementation.md)
- [Extending the BC14 Reimplementation Tool](https://github.com/microsoft/BCTech/blob/master/samples/CloudMigration/BC14ReimplementationToolExtendingSample/Extending.md) on GitHub
- [Cloud migration API overview](cloudmigrationapi/cloud-migration-api-overview.md)
