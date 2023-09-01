---
title: Cloud migration setup troubleshooting
description: Troubleshooting cloud migration setup.
author: jswymer
ms.author: jswymer 
ms.reviewer: jswymer 
ms.service: dynamics365-business-central
ms.topic: troubleshooting 
ms.date: 07/05/2023
ms.custom: bap-template
---

# Cloud migration setup troubleshooting

This article explains how to diagnose and fix problems that you might encounter when you try to set up cloud migration.

## Operation on target NotifyBusinessCentral failed: Invoking Web Activity failed with HttpStatusCode

The full error message is:

**Operation on target NotifyBusinessCentral failed: Invoking Web Activity failed with HttpStatusCode - '500': A user setting up Cloud Migration does not have enough permissions: either not a Delegated Admin, or a Delegated Admin without a customer consent.**

Cause:

The user who running the cloud migration setup has insufficient permissions.

Resolution:

- Make sure the user running the setup is assigned the SUPER permission set in Business Central online. 
- If the user running the setup is a delegated admin, make sure that the customer has consented.

For more information, see [Run cloud migration setup](migration-setup.md#about-delegated-administrators).

## You do not have permission to create or run scheduled tasks

Same as previous issue.

## The EXECUTE (or SELECT) permission was denied on the object

Cause:

The SQL login account used by self-hosted integration runtime to access on-premises database doesn't have the required SQL roles.

Resolution:

Make sure that SQL user that's specified in the Self-hosted Integration Runtime connection string has the following roles on the on-premises database:

- sysadmin server-level role
- db_owner database role

## User does not have permission to perform this action

Same as previous issue

## Invalid database connection string provided

This issue often appears together with the **Keyword not supported:**  or  **Value cannot be null** error.

Cause:

The wrong SQL connection string was configured in **Cloud Migration Setup** guide.

Resolution:

Run the **Cloud Migration Setup** guide again and verify the connection string is correct. For more information, see [Define the SQL Connection](migration-setup.md#sql).

## Activity timed out

Cause:

If an activity times out during Cloud Migration Setup, it may happen either because Integration Runtime couldn't establish a connection to SQL Server or because of index defragmentation in large on-premises databases. If it times out during a migration run, the reason is most likely a weak or busy on-premises SQL Server.

Resolution:

- If SQL connection is permanently broken, check that .NET 4.72 or higher is running on the host of the Integration Runtime.
- Check other Integration Runtime requirements on the Azure Data Factory page. 
- For the database performance problems, we recommend updating statistics and reorganize indexes in the on-premises database before setting up cloud migration.

  - To update statistics, execute the following query (for example, in Microsoft SQL Management Studio connected to the on-premises database):

    ```sql
    EXEC sp_updatestats;
    ```

  - To reorganize indexes, execute the following query:

    ```sql
    EXEC sys.sp_MSforeachtable 'ALTER INDEX ALL ON ? REORGANIZE'
    ```

## Failed to enable your replication. Make sure your integration runtime is successfully connected and try again.

This error is a general error message that's shown to the end user.

Cause:

There could be several reasons for the error message. But the most common reason is a mismatch between the on-premises version and the online Business Central versions and the **Product Type** chosen in the **Cloud Migration Setup** guide.

Resolution:

Run the **Cloud Migration Setup**, and when you get to the **Choose Your Product** page, make sure the **Product Type** is in accordance with your on-premises and online versions. Business Central version numbers have the format *Major.Minor.Revision.Build*, such as 20.1.12345.67890.

- If the major versions of the on-premises and online are the same, like *20*.1 for on-premises and *20*.3 for online, choose **Dynamics Business Central current version**. 
- If the major versions of the on-premises and online are different, like *14*.3  for on-premises and *20*.3  for online, choose **Dynamics Business Central earlier versions**

You can run the following SQL query to verify the on-premises database contains correct version number:

```sql
SELECT [applicationversion]
FROM [$ndo$tenantdatabaseproperty]
```

## Cannot connect to SQL Database, ErrorCode=SqlFailedToConnect

This error often occurs together with the error "Check the linked service configuration is correct, and make sure the SQL Database firewall allows the integration runtime to access."

Cause:

There could be several reasons for the error message. The most common reason is returned inside of the long error message, for example:

"Login failed for user …", "The password of the account must be changed", "The account is disabled" - problems with the user account.
"The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections." - the SQL Server isn't running, or remote access to the SQL Server is disabled.

Resolution:

Run the following Windows PowerShell command on the Integration Runtime host. If the Integration Runtime host can't connect, it returns a descriptive error.

```powershell
sqlcmd –S "{SQL Server Name}" -d "{Database Name}" -U "{SQL Server Authenticated User Name}" -P "{PlaceholderSQLServerAuthenticatedPassword}" -Q 'select * from [dbo].[Intelligent Cloud]'
```

To allow the Integration Runtime client IP address to access the SQL server, run the following command on the on-premises master database:

```powershell
sp_set_firewall_rule
```

To allow remote access to the SQL Server:

```powershell
run sp_configure 'remote access', 1; 
```

<!--## Could not find the self-hosted integration runtime. Please ensure the self-hosted integration runtime is running and connected.-->

## Next steps

[Run cloud migration setup](migration-setup.md)

## See also

[Cloud migration setup overview](migration-setup-overview.md)  
