---
title: "Troubleshooting: Long Running SQL Queries Involving FlowFields"
description: Troubleshoot slow pages in Business Central on-premises by disabling SmartSQL to isolate FlowField queries and investigate their execution plans.
author: jswymer
ms.date: 11/27/2026
ms.topic: troubleshooting
ms.assetid: 014e3285-02be-459c-9a54-eae45ea71e04
ai-usage: ai-assisted
---

# Troubleshooting: Long running SQL queries involving FlowFields by disabling SmartSQL

If a page that contains FlowFields loads slowly, isolate and test its FlowField queries to identify expensive calculations. This article describes how to disable SmartSQL temporarily to investigate those queries in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises.

## What SmartSQL does

Introduced in [!INCLUDE[nav_current_long_md](../developer/includes/nav_current_long_md.md)], SmartSQL combines eligible FlowField calculations with the query that retrieves the page records. This query reduces the number of network roundtrips from the server to the database.

## How SmartSQL works
To understand how SmartSQL works, consider this example from the [!INCLUDE[demolonglight_md](../developer/includes/demolonglight_md.md)]. Page 22, **Customer List**, includes the following FlowFields:

- **Balance (LCY)**
- **Balance Due (LCY)**
- **Sales (LCY)**

To inspect the generated SQL statement, start SQL Server Profiler with the following events selected:

- **Stored Procedures** > **SP:StmtCompleted**
- **Performance** > **Showplan XML**

Then, open the page in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client. Capture only the workload needed for troubleshooting because execution-plan tracing can add overhead.

The following historical SQL trace illustrates the query structure and is formatted for readability. Table names, columns, filters, SIFT views, and generated SQL vary by version and database.

```sql
SELECT TOP (50)
       ISNULL("Customer"."timestamp",@0) AS "timestamp"
     , ISNULL("Customer"."No_",@1) AS "No_"
     , ISNULL("Customer"."Name",@2) AS "Name"
       /* many more columns from the table dbo."MSFT$Customer" */
     , ISNULL("Customer"."OIOUBL Profile Code Required",@6) AS "OIOUBL Profile Code Required"
       -- SIFT columns start here
     , ISNULL("SUB$Balance (LCY)"."Balance (LCY)$Detailed Cust_ Ledg_ Entry$SUM$Amount (LCY)",@3) AS "Balance (LCY)"
     , ISNULL("SUB$Balance Due (LCY)"."Balance Due (LCY)$Detailed Cust_ Ledg_ Entry$SUM$Amount (LCY)",@3) AS "Balance Due (LCY)"
     , ISNULL("SUB$Sales (LCY)"."Sales (LCY)$Cust_ Ledger Entry$SUM$Sales (LCY)",@3) AS "Sales (LCY)"
  FROM dbo."MSFT$Customer" AS "Customer"

 -- SIFT calculations start here
OUTER APPLY (
SELECT TOP (1)
       ISNULL(SUM("Balance (LCY)$Detailed Cust_ Ledg_ Entry"."SUM$Amount (LCY)"),@3) AS "Balance (LCY)$Detailed Cust_ Ledg_ Entry$SUM$Amount (LCY)"
FROM dbo."MSFT$Detailed Cust_ Ledg_ Entry$VSIFT$5" AS "Balance (LCY)$Detailed Cust_ Ledg_ Entry"
WHERE ("Balance (LCY)$Detailed Cust_ Ledg_ Entry"."Customer No_"="Customer"."No_"
AND ISNULL("Balance (LCY)$Detailed Cust_ Ledg_ Entry"."Posting Date",@8)>=@12
AND ISNULL("Balance (LCY)$Detailed Cust_ Ledg_ Entry"."Posting Date",@8)<=@13)
) AS "SUB$Balance (LCY)"  

OUTER APPLY (
SELECT TOP (1)
       ISNULL(SUM("Balance Due (LCY)$Detailed Cust_ Ledg_ Entry"."SUM$Amount (LCY)"),@3) AS "Balance Due (LCY)$Detailed Cust_ Ledg_ Entry$SUM$Amount (LCY)"
FROM dbo."MSFT$Detailed Cust_ Ledg_ Entry$VSIFT$5" AS "Balance Due (LCY)$Detailed Cust_ Ledg_ Entry"
WHERE ("Balance Due (LCY)$Detailed Cust_ Ledg_ Entry"."Customer No_"="Customer"."No_"
AND ISNULL("Balance Due (LCY)$Detailed Cust_ Ledg_ Entry"."Posting Date",@8)<=@14
AND ISNULL("Balance Due (LCY)$Detailed Cust_ Ledg_ Entry"."Initial Entry Due Date",@8)>=@15
AND ISNULL("Balance Due (LCY)$Detailed Cust_ Ledg_ Entry"."Initial Entry Due Date",@8)<=@16)
) AS "SUB$Balance Due (LCY)"  

OUTER APPLY (
SELECT TOP (1)
       ISNULL(SUM("Sales (LCY)$Cust_ Ledger Entry"."SUM$Sales (LCY)"),@3) AS "Sales (LCY)$Cust_ Ledger Entry$SUM$Sales (LCY)"
FROM dbo."MSFT$Cust_ Ledger Entry$VSIFT$1" AS "Sales (LCY)$Cust_ Ledger Entry"
WHERE ("Sales (LCY)$Cust_ Ledger Entry"."Customer No_"="Customer"."No_"
AND ISNULL("Sales (LCY)$Cust_ Ledger Entry"."Posting Date",@8)>=@17
AND ISNULL("Sales (LCY)$Cust_ Ledger Entry"."Posting Date",@8)<=@18)
) AS "SUB$Sales (LCY)"  

 WHERE (ISNULL("Customer"."No_",@1)>@19)
 ORDER BY "No_" ASC
```

In this example, each `OUTER APPLY` subquery calculates a FlowField. The generated SQL can group compatible FlowField calculations into one subquery.

## How to isolate and test FlowField queries
To investigate the cost of the FlowField queries, temporarily disable SmartSQL on the server instance. These server-configuration steps apply to on-premises deployments.

1. Run the [Business Central Administration Shell](administration-shell.md) as an administrator.
1. Run the following command. Replace `<ServerInstanceName>` with the name of the server instance.

   ```powershell
   Set-NAVServerConfiguration -ServerInstance <ServerInstanceName> -KeyName DisableSmartSql -KeyValue true -ApplyTo All
   ```

1. Open the page again and inspect its SQL statements in a trace or in Query Store. Query Store is available in SQL Server 2016 and later and must be enabled and configured to capture the workload.
1. After troubleshooting, restore SmartSQL by running the following command:

   ```powershell
   Set-NAVServerConfiguration -ServerInstance <ServerInstanceName> -KeyName DisableSmartSql -KeyValue false -ApplyTo All
   ```

`DisableSmartSql` defaults to `false`. The `-ApplyTo All` parameter applies the change dynamically and saves it to the configuration file. If you update only the configuration file, restart the server instance before testing.

> [!NOTE]
> Starting in version 21, the Administration tool is no longer available. In earlier versions that include the tool, you can select **Disable SmartSQL** in the **Database** section instead.

Disabling SmartSQL separates FlowField calculations from the page-record retrieval query, making their SQL statements easier to investigate. After you identify a slow query, inspect its execution plan. Depending on the plan, an appropriate index or enabling the key's `MaintainSIFTIndex` property might improve performance.

Poor performance might not be caused by SmartSQL itself. Result-set caching behavior depends on the platform version and query characteristics. Don't assume that every SmartSQL query is uncached.

By default, page FlowFields can be calculated even when their controls aren't visible. Starting in version 26.0, enabling **Calculate only visible FlowFields** in **Feature Management** changes automatic page calculation to calculate only visible FlowFields. Learn more in [Calculate only visible FlowFields feature key](../developer/calculate-only-visible-flowfields-feature-key.md).

## Related information

[Business Central Administration Shell](administration-shell.md)  
[Business Central Server Administration Tool](administration-tool.md)  
[SQL Server Profiler](/sql/tools/sql-server-profiler/sql-server-profiler)  
[Troubleshooting: Using Query Store to monitor query performance in Business Central](troubleshoot-query-performance-using-query-store.md)  
[SQL trace](/sql/relational-databases/sql-trace/sql-trace)  
