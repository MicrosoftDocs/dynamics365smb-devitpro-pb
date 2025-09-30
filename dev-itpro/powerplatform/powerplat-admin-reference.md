---
title: Business Central Virtual Table for Microsoft Dataverse admin reference
description: The admin reference for working with Business Central and Microsoft Dataverse tables.
ms.date: 09/17/2025
ms.reviewer: solsen
ms.topic: reference
author: SusanneWindfeldPedersen
ms.author: solsen
---

# Business Central virtual table for [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] admin reference

This article provides step-by-step instructions on how to set up and configure virtual tables for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] in [!INCLUDE[dataverse_short](../includes/dataverse_short.md)].

## Get the Business Central Virtual Table solution

1. Go to [Business Central Virtual Table on AppSource](https://appsource.microsoft.com/product/dynamics-365/microsoftdynsmb.businesscentral_virtualentity), select **Get it now** and follow the instructions.
1. If prompted, sign in to the Power Platform admin center.
1. Select the Power Platform environment that includes Dataverse, and then select **Install**.

The following solutions are installed in [!INCLUDE[dataverse_short](../includes/dataverse_short.md)] once the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] virtual tables are installed from [AppSource](https://appsource.microsoft.com/product/dynamics-365/microsoftdynsmb.businesscentral_virtualentity).

- **Dynamics365Company** - Add the **cdm_company** table, which is referenced by all [!INCLUDE[prod_short](../developer/includes/prod_short.md)] virtual tables. All communication to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] requires the company ID in the request. 
- **MicrosoftBusinessCentralVESupport** - Provides the core support for the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] virtual table feature.
- **MicrosoftBusinessCentralERPCatalog** - Provides provides a list of available tables, including ones based on custom APIs, in a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] instance.
- **MicrosoftBusinessCentralVEAnchor** - Serves as a container, holding information needed for AppSource. 
- **MicrosoftBusinessCentralERPVE** - Contains virtual tables generated for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] in this solution. Tables are added automatically at runtime once they're made visible in the **MicrosoftBusinessCentralERPCatalog**.

## Set up authentication and authorization

After the solutions are installed in the [!INCLUDE[dataverse_short](../includes/dataverse_short.md)] environment, a connection can be set up to a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment. *Both environments have to be in the same tenant*.  

The next step in the process is to provide [!INCLUDE[dataverse_short](../includes/dataverse_short.md)] with the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment and company to connect to. The following steps walk through this part of the process.

1. In [!INCLUDE[prod_short](../developer/includes/prod_short.md)], open the **Microsoft Entra applications** and set the **Dynamics 365 Business Central for Virtual tables** to **Enabled**. This action allows [!INCLUDE[dataverse_short](../includes/dataverse_short.md)] to communicate with [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

1. In [!INCLUDE[dataverse_short](../includes/dataverse_short.md)], go to the table **Business Central Virtual Data Source Configuration**.

   1. Sign in to [Power Apps](https://make.powerapps.com).
   1. Select **Tables** on the left navigation pane to open the **Tables** page.
   1. Select the **All** tab to display all visible tables, then search for *Business Central Virtual Data Source Configuration* and select it to open for editing.

   > [!TIP]
   > Power Apps is the primary tool for creating and modifying tables in Dataverse.

1. In the **[!INCLUDE[prod_short](../developer/includes/prod_short.md)] Virtual Data Source Configuration columns and data** section, use the **+ more** button to show the **environment** and **Default Company** columns in the **Business Central** row if the they are hidden.
1. Enter the name of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment to connect to in the **environment** column.

   By default, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenants have an environment called `production`.

1. Set the **Default Company** value to the Business Central company in the enviroment that you want to connect to by default.

## Making virtual tables visible

Due to the large number of OData enabled tables available in [!INCLUDE[prod_short](../developer/includes/prod_short.md)], by default, the tables aren't available as virtual tables in [!INCLUDE[dataverse_short](../includes/dataverse_short.md)]. Follow the steps to make tables visible, using either the **Business Central Configuration** app or **Available Business Central Tables** table. Both methods have the same result.

# [Using Business Central Configuration](#tab/bcconfig)

1. In [Power Apps](https://make.powerapps.com), select **Apps** > **Business Central Configuration**.
1. Select **Available Tables** in the left navigation pane.
1. Select the table to open it for editing.
1. Select the **Visible** checkbox.
1. Select **Save** or **Save and Close**.

# [Using Available Business Central Tables table](#tab/bctables)

1. In [Power Apps](https://make.powerapps.com), select **Tables** in the left navigation, select the **All** tab, then search for and select *Available Business Central table*.

    The tables list contains all visible tables, including tables based on custom APIs.

1. Locate the table you want to enable, and set the **Visible** switch to **Yes**.
1. Select another row to save the change. This action generates the virtual table in the **MicrosoftBusinessCentralERPVE** solution.

---

A table appears in all of the appropriate menus, including **Data -> Tables**, and in the advanced find dialog box.

## Refreshing virtual table metadata

You can force-refresh the virtual table metadata when you expect the table metadata in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] to change. Set **Refresh** to **Checked**, and then save. This action syncs the latest table definition from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] to [!INCLUDE[dataverse_short](../includes/dataverse_short.md)] and updates the virtual table.

## Referencing virtual tables

The virtual tables are all generated in the **MicrosoftBusinessCentralERPVE** solution. Items in the solution change as you make tables visible or hidden, but it's still a managed solution you can depend on. In a standard ALM flow, you take a reference to a virtual table from this solution by selecting the **Add existing** option in the ISV solution. The solution then shows a missing dependency, which is checked at import time. If a specified virtual table doesn't exist during import, the system automatically makes it visible without extra steps.

To consume virtual tables:

1. Create a separate solution as usual in [!INCLUDE[dataverse_short](../includes/dataverse_short.md)], which will contain the consuming logic.
1. Select **tables \> Add Existing**. Select the virtual table that you want to reference from the list.
1. When prompted to select assets to add, select any forms, views, or other elements that you want to customize, then select **Finish**.

From the development tooling, existing elements such as forms can be modified for the virtual table. Additionally, new forms, views, and other elements can also be added.

When the solution is exported, it contains hard dependencies on the virtual table generated in the **MicrosoftBusinessCentralVE** solution.

## Related information

[Overview - Integrating Business Central with Microsoft Dataverse](../developer/dataverse-integration-overview.md)  
[Microsoft Power Platform Integration with Business Central](powerplat-overview.md)  
[Table Modeling](powerplat-entity-modeling.md)  
[Application Lifecycle Management for Solutions that use Virtual tables](powerplat-app-lifecycle-management.md)  
[FAQ](powerplat-faq.md)
