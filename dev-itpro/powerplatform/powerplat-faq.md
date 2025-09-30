---
title: Business Central Virtual Tables FAQ
description: Frequently asked questions for working with Business Central virtual tables.
ms.date: 09/30/2025
ms.reviewer: solsen
author: SusanneWindfeldPedersen
ms.topic: faq
---

# Business Central Virtual Tables FAQ

This article is a collection of frequently asked questions about [!INCLUDE[prod_short](../developer/includes/prod_short.md)] virtual tables.

## Can a solution from an independent software vendor (ISV) take a dependency on virtual tables? What does the application lifecycle management (ALM) look like? 

Yes. The virtual tables are all generated in the **MicrosoftBusinessCentralERPVE** solution, which is API-managed. In other words, the items in the solution change as you make tables visible or hidden, but the solution is still a managed solution that you can take dependency on. The standard ALM flow just takes a standard reference to a virtual table from this solution with the **Add existing** option in the ISV solution. Missing dependency of the solution is checked when the solution is imported and during import, if a specified virtual table doesn't yet exist, the virtual table is automatically made visible.

## Which tables from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] do users see in the catalog in [!INCLUDE[cds_long_md](../includes/cds_long_md.md)]?

Generally, users can see all tables exposed as API (v.2.0) and data exposed via custom APIs. Remember that you need to make them visible before they appear in the **Table** view.

## Do all Microsoft Power Platform users have to be users in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]?

Any user of Microsoft Power Platform who tries to access [!INCLUDE[prod_short](../developer/includes/prod_short.md)] data through a virtual table must also exist as a user in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. Therefore, technically, not *all* users have to be users in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. Only those users who access [!INCLUDE[prod_short](../developer/includes/prod_short.md)] data through virtual tables must be users in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

## Where do I find available tables to be exposed inside Dataverse? 

In the **Table** view, the table is named **Available Business Central tables**. You can also run our preinstalled app called **Business Central Configuration**.

## Can I change the prefix for the virtual tables?

No. All [!INCLUDE[prod_short](../developer/includes/prod_short.md)] virtual tables should be generated in the **MicrosoftBusinessCentralERPVE** solution, and they all have the "dyn365bc_" prefix. This prefix can't be changed.

## How can I show, in the same grid, data from multiple virtual tables that are joined to a physical table record in [!INCLUDE[dataverse_short](../includes/dataverse_short.md)]?

This approach isn't currently possible in [!INCLUDE[dataverse_short](../includes/dataverse_short.md)].

## If I want a default value to be entered in a column during precreate, will an initValue on the data table then work?

Yes. Here's the order of calls:

1. [!INCLUDE[dataverse_short](../includes/dataverse_short.md)] sends a create or update message.
2. All the existing logic on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] table and backing tables is invoked. This logic includes default value entry that might change values.
3. [!INCLUDE[dataverse_short](../includes/dataverse_short.md)] sends another Retrieve (single) message to get the latest copy of the data, including any columns that default values were entered for.

## How do I verify the version of your Business Central Virtual Table Plugin?

Depending on the region, the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Virtual Table Plugin version might vary. To verify your version, you need to: 

1. Sign in to [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Open the environment you use, locate **Resources**, and select **Dynamics 365 apps**.
1. Locate the **Business Central Virtual Entity** app in the list, and then select **... (More application actions)** > **Details**.  

   :::image type="content" source="../developer/media/power-plat-bc-virtual-table.svg"" alt-text="Ellipsis button for Business Central Virtual Table details in Power Platform admin center.":::

In the **Business Central Virtual Entity Details** pane, the **Version** column under **Package(s)** displays the current version number.


## Related information

[Overview - Integrating Business Central with Microsoft Dataverse](../developer/dataverse-integration-overview.md)  
[Microsoft Power Platform Integration with Business Central](powerplat-overview.md)  
[Table Modeling](powerplat-entity-modeling.md)  
[Business Central and [!INCLUDE[cds_long_md](../includes/cds_long_md.md)] Admin Reference](powerplat-admin-reference.md)  
[Application Lifecycle Management for Solutions that use Virtual tables](powerplat-app-lifecycle-management.md)
