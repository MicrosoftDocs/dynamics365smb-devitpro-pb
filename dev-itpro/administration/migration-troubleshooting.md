---
title: Troubleshooting the Cloud Migration
description: Learn how to troubleshoot problems that you may experience with the cloud migration.
author: dmc-dk
ms.service: dynamics365-business-central
ms.topic: troubleshooting
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms. search.keywords: cloud, edge
ms.date: 04/01/2021
ms.author: dmitrych
ms.review: jswymer
---

# Troubleshooting Cloud Migration

In this article, you learn how to troubleshoot problems that you may experience with the cloud migration of [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. For the cloud migration to work properly, there are certain requirements that must be met on the online and on-premises databases. The following sections talk about these requirements, how you can check them, and correct them as needed.

## SQL Server compatibility level

> Database: on-premises

The SQL Server compatibility level must be 130 or higher.

To check the compatibility level run following query:  

```sql
SELECT compatibility_level FROM sys.databases WHERE name = 'YourDatabaseName';  
```

If your on-premises SQL Server instance is a supported version that allows you to change the compatibility level, you can do so with the following query. If you're using a different version, you must upgrade your current on-premises environment to met the current SQL Server compatibility requirements. For more information, see [View or Change the Compatibility Level of a Database](/sql/relational-databases/databases/view-or-change-the-compatibility-level-of-a-database?view=sql-server-ver15&preserve-view=true)

```sql
ALTER DATABASE YourDatabaseName SET COMPATIBILITY_LEVEL = 130; 
```

> [!NOTE]
> You may also get the following error when compatibility level isn't set to the expected value: *A database operation failed with the following error: Invalid length parameter passed to the LEFT or SUBSTRING function.*

## Migration user

> Database: on-premises

Make sure that the database user that the Integration Runtime uses to connect to your database has access to the database.  

You can verify the database user, for example, by running the following command using Microsoft PowerShell ISE.  

```powershell
sqlcmd -S 'ServerName\ServerInstance' -d 'DatabaseName' -U 'UserID' -P 'Password' -Q 'select * from [dbo].[CRONUS USA, Inc_$Accounting Period$437dbf0e-84ff-417a-965d-ed2bb9650972]' 
```

## Change tracking

> Database: on-premises

Change tracking must be enabled on the database. It should be enabled automatically. However, if you see an error like **Change tracking is not enabled on table \<number\>** during migration, you'll have to enable it manually.

To enable change tracking on your database, run the following query:
  
```sql
ALTER DATABASE [YOUR DATABASE] SET CHANGE_TRACKING = ON (CHANGE_RETENTION = 2 DAYS, AUTO_CLEANUP = ON) 
```

To enable change tracking on specific tables, run the following query:
  
```sql
ALTER TABLE [YOUR TABLE] ENABLE CHANGE_TRACKING 
```

## User permissions  

> Database: online

If a user has problems managing a cloud migration, like starting migration, initializing companies, or migrating data from earlier versions, check that:

- The user has a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] license (Essentials or Premium, depending on their solution). We recommend using free Dynamics 365 Business Central Premium Trial subscription for this user.  
- The user is assigned the SUPER permission set.

Users without a license, such as internal administrators or delegated administrators, aren't allowed to run the migration.  

## Self-Hosted Integration Runtime

> Database: on-premises

- Ensure that you're running the latest, compatible version of Microsoft Integration Runtime (IR).

    You can check for and download the latest version from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=39717).

    When downloading and installing Integration Runtime, choose version 5 (IntegrationRuntime_5.x.x.x.msi) only if your machine runs .NET Framework Runtime 4.7.2. Otherwise, or if in doubt, choose version 4 (IntegrationRuntime_4.x.x.x.msi).

    > [!IMPORTANT]
    > Running Integration Runtime v5 on a machine that doesn't have .NET Framework Runtime 4.7.2 can cause timeouts when connecting to the on-premise SQL Server, which will break the cloud migration setup.
  
    Before you install a new Integration Runtime version, uninstall the old version. When you uninstall the old version, choose to delete the user data (such as authentication key and data source credentials) when prompted. Then, install the Integration Runtime again and connect it to the online environment using the new authentication key.  

- If you get a "Failed to enable your replication." error when running the **Data Migration Setup** assisted setup, check the IR logs.

    You view the logs by using the **Microsoft Integration Runtime Configuration Manager**, which was installed on-premises as part of the IR installation. Launch **Microsoft Integration Runtime Configuration Manager**, select the **Diagnostics** tab, then select **View Logs** action. You can also use the **Test Connection** feature on the page to verify that your user can connect to the database.

- Synchronization errors can sometimes occur because IR is installed on a laptop or desktop computer where the hibernate feature is turned on.

    The computer where IR is installed ideally shouldn't be switched off, go to sleep, or hibernate. If these conditions happen, the IR may get into an error state. In this case, we recommend that you reinstall the IR and turn off sleep hibernate on the computer.  

- Make sure the machine, which you use for hosting IR has plenty of memory (RAM) available. Migration can be interrupted by your machine running out of memory, and you can find this issue described in the IR log. To prevent this situation, avoid running too many migrations simultaneously using the same IR. Every additional parallel migration slows down the overall progress considerably.

If you experience problems with Microsoft Integration Runtime, also see [Troubleshoot self-hosted integration runtime](/azure/data-factory/self-hosted-integration-runtime-troubleshoot-guide).

## Migrating between multiple source and destination databases

> Database: online and on-premises

- If you migrate several on-prem databases to several online environments, it's possible to reuse the same IR for these migrations.

    Once you've successfully connected and migrated data into one online environment, you can reuse the IR for another environment. To reuse an IR, enter its name in **Integration Runtime Name** field of **Data Migration Setup** assisted setup, instead of leaving the field blank.

- Use a restored backup when migrating the same on-premise database to different online environments.

    Cloud migration stores some data in the on-premise database. So using the same on-premise database to migrate into another online environment can affect the next synchronization run. If you need to migrate to several online environments, we recommend you make a backup of the on-premise database before enabling the data migration. Then, restore the on-premise database to this backup before setting up migration to another online environment.  

- Avoid running several migrations of the same on-prem database to different online environment at the same time.

    If you need to do this type of migration, then migrate data sequentially. First, migrate data into the online environment and disable the migration. Then restore the on-prem database from backup and enable the migration again by providing a connection string to this database. You can use the same Integration Runtime and Authorization key.  

- Don't try to migrate data from several on-premise databases into the same online environment at the same time.  

    For example, you may have two companies, where each company is in its own on-premise database. If you need to do this type of migration, the migrate data sequentially. First, migrate data from one database into the online environment and disable the migration. Then set up the migration in the same online environment, provide a new connection string to the next on-prem database. You can use the same Integration Runtime and Authorization key.  

## Product version

> Database: online

- When running the **Data Migration Setup** assisted setup, make sure to select the right product that you want to migrate from. Depending on which Cloud Migration apps you've installed, the assisted setup will let you choose from three options:

    |Option|When to use|
    |------|-----------|
    |Dynamics 365 Business Central|Select this option if you're migrating from the [!INCLUDE[prod_short](../developer/includes/prod_short.md)]  latest version, currently version 18.|
    |Dynamics 365 Business Central - Previous Version|Select this option if you're migrating from the an earlier supported version. [!INCLUDE [bc-cloud-versions](../includes/bc-cloud-versions.md)]|
    |Dynamics GP|Select this option if you're migrating from the Dynamics GP product.|

- When migrating data from [!INCLUDE[prod_short](../developer/includes/prod_short.md)], check the `applicationVersion` field in the `$ndo$tenantdatabaseproperty` table. Set this field to the correct version in the SQL if it's blank or not up to date. The migration code uses the field's value for the following reasons:

  - Verifies that you're migrating from a supported version
  - Verifies that you've selected the right product version in the **Data Migration Setup** assisted setup, **Dynamics 365 Business Central** or **Dynamics 365 Business Central - Previous Version**.
  - Determines which upgrade code will be executed.

    If that field is blank, the migration can't run.  

## Disabling the Cloud Migration

> Database: online

When you've completed the migration, disable cloud migration by using the **Disable Cloud Migration** action on the **Cloud Migration Management** page. This action properly disengages the synchronization and cleans up the Azure Data Factory resources deployed for this migration.

> [!IMPORTANT]
> Just uninstalling the Cloud Migration apps, even with the option to remove the data, won't disable the migration in the same way. If you don't disable **Cloud Migration**, users will experience permission-related errors when they try to modify records in the migrated companies.

## See also

[Running the Cloud Migration Tool](migration-tool.md)  
[Migrate to Business Central Online from Business Central On-premises](migrate-business-central-on-premises.md)  
[Migrate to Business Central Online from Dynamics GP](migrate-dynamics-gp.md)  
[Upgrading from Dynamics NAV to Business Central Online](../upgrade/Upgrade-Considerations.md#online)  
[Migrating On-Premises Data to Business Central Online](migrate-data.md)  
[FAQ about Connecting to Business Central Online from On-Premises Solutions](faq-migrate-data.md)  
