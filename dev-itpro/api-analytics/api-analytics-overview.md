---
title: Analytics API overview
description: Overview of the Analytics API in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/12/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Analytics API overview

The Analytics API for [!INCLUDE [prod_short](../includes/prod_short.md)] provides read-only endpoints that are optimized as data sources for Power BI apps and reports.

Use this API to extract analytical and reporting data. The Analytics API isn't intended for transactional scenarios, and it doesn't support create, update, or delete operations.

## Why use the Analytics API

- Provides read-only datasets for reporting and analysis.
- Supports Power BI app and custom Power BI report scenarios.
- Uses the same OAuth-based API access model as other [!INCLUDE [prod_short](../includes/prod_short.md)] APIs.

## Power BI apps and the Analytics API

The standard Power BI apps for [!INCLUDE [prod_short](../includes/prod_short.md)] use the Analytics API for reading data. In the articles below, you can learn more about how each API is used for KPIs in different functional areas.

| If you want to analyze ... | Learn more in... | 
| -------------------------- | --- |
| Finance | [Finance KPI overview](/dynamics365/business-central/finance-powerbi-kpis)  |
| Sales   | [Sales Power BI app semantic model](/dynamics365/business-central/sales-powerbi-app-semantic-model)<br>[Sales KPI overview](/dynamics365/business-central/sales-powerbi-sales-kpis) |
| Purchasing | [Purchasing KPI overview](/dynamics365/business-central/purchases-powerbi-kpis) | 
| Inventory | [Inventory KPI overview](/dynamics365/business-central/inventory-powerbi-kpis)<br>[Inventory Valuation KPI overview](/dynamics365/business-central/inventory-valuation-powerbi-kpis) |
| Projects | [Projects KPI overview](/dynamics365/business-central/projects-powerbi-kpis) |
| Manufacturing | [Manufacturing KPIs](/dynamics365/business-central/manufacturing-powerbi-kpis) |
| Sustainability | [Sustainability KPI overview](/dynamics365/business-central/sustainability-powerbi-kpis) |


## Analytics APIs by Power BI app

The following table shows which Power BI app uses each Analytics API entity.

| API | Used for analyzing |
| --- | ------------------ |
| abcAnalysisSetup | Inventory |
| accountCategory | Finance |
| assemblyHeader | Manufacturing |
| assemblyLine | Manufacturing |
| balanceSheetGeneralLedgerEntry | Finance |
| bin | Inventory |
| calendarEntry | Manufacturing |
| capacityLedgerEntry | Manufacturing |
| closeIncomeStmtSourceCode | Finance |
| closeOpportunityCode | Sales |
| closingGeneralLedgerEntry | Finance |
| contact | Sales |
| customer | Finance, Sales |
| customerLedgerEntry | Finance |
| dateSetup | Finance |
| dimension | Finance, Sales, Purchasing, Inventory, Manufacturing, Projects, Sustainability |
| dimensionSetEntry | Finance, Sales, Purchasing, Inventory, Manufacturing, Projects, Sustainability |
| dynamicDimension | Finance |
| fromBinWarehouseJournalLine | Inventory |
| generalLedgerAccount | Finance |
| generalLedgerAccountCategory | Finance |
| generalLedgerBudget | Finance |
| generalLedgerBudgetEntry | Finance |
| generalLedgerSetup | Finance |
| incomeStatementGeneralLedgerEntry | Finance |
| incomeStmtGeneralLedgerEntry | Finance |
| inventoryAdjustmentEntryOrder | Inventory |
| inventoryProdOrderComponentLine | Manufacturing, Inventory |
| inventoryProdOrderLine | Manufacturing, Inventory |
| item | Sales, Purchasing, Inventory, Manufacturing, Projects |
| itemBudget | Sales |
| itemCategory | Sales, Inventory |
| itemJobPlanningLine | Projects |
| itemLedgerEntry | Inventory, Sales |
| itemOutstandingPurchaseLine | Purchasing |
| itemOutstandingSalesLine | Sales |
| itemReceivedNotInvoicedPurchaseLine | Purchasing |
| itemShippedNotInvoicedSalesLine | Sales |
| itemValueEntry | Inventory |
| job | Projects |
| jobLedgerEntry | Projects |
| jobOutstandingPurchaseLine | Projects |
| jobPlanningLine | Projects |
| jobReceivedNotInvoicedPurchaseLine | Projects |
| jobTask | Projects |
| location | Sales, Purchasing, Inventory, Manufacturing, Projects |
| machineCenter | Manufacturing |
| manufacturingProdOrderComponent | Manufacturing |
| manufacturingProdOrderLines | Manufacturing |
| manufacturingProductionOrder | Manufacturing |
| manufacturingSetup | Manufacturing |
| manufacturingValueEntry | Manufacturing |
| opportunity | Sales |
| opportunityEntry | Sales |
| orderServiceLine | Sales |
| outstandingPurchaseLine | Purchasing |
| outstandingSalesLine | Sales |
| pbiCountryRegion | Sustainability |
| pbiEmissionFee | Sustainability |
| pbiEmployee | Sustainability |
| pbiEmployeeAbsence | Sustainability |
| pbiEmployeeLedgerEntry | Sustainability |
| pbiEmployeeQualification | Sustainability |
| pbiResponsibilityCentre | Sustainability |
| pbiSustainabilityAccount | Sustainability |
| pbiSustainabilityAccountCategory | Sustainability |
| pbiSustainabilityGoal | Sustainability |
| pbiSustainabilityLedgerEntry | Sustainability |
| pbiSustainabilitySubAccountCategory | Sustainability |
| planningComponentLine | Manufacturing |
| prodItemLedgerEntry | Manufacturing, Inventory |
| prodOrderCapacityNeed | Manufacturing |
| prodOrderRoutingLine | Manufacturing |
| purchaseCreditMemoLine | Purchasing |
| purchaseInvoiceLine | Purchasing |
| purchaseItemBudgetEntry | Purchasing |
| purchaseLine | Purchasing |
| purchaseValueEntry | Purchasing |
| requisitionLine | Purchasing |
| resource | Sales, Projects |
| returnReasonCode | Sales, Purchasing |
| routing | Manufacturing |
| routingLink | Manufacturing |
| salesCreditLine | Sales |
| salesCrProjectLedgerEntry | Sales, Projects |
| salesCycleStage | Sales |
| salesInvoiceLine | Sales |
| salesInvoiceProjectLedgerEntry | Sales, Projects |
| salesItemBudgetEntry | Sales |
| salesLine | Sales |
| salespersonPurchaser | Finance, Sales, Purchasing, Projects |
| salesValueEntry | Sales |
| toBinWarehouseJournalLine | Inventory |
| transferLine | Inventory |
| vendor | Finance, Purchasing |
| vendorLedgerEntry | Finance |
| warehouseActivityLine | Inventory |
| warehouseEntry | Inventory |
| workCenter | Manufacturing |
| workCenterGroup | Manufacturing |
| workingDay | Manufacturing |
| zone | Inventory |

## Endpoint pattern

Analytics API endpoints use the `microsoft/analytics` publisher and the `v1.0` version:

```http
GET https://api.businesscentral.dynamics.com/v2.0/{environmentName}/api/microsoft/analytics/v1.0/companies({companyId})/{entitySet}
```

For example:

```http
GET https://api.businesscentral.dynamics.com/v2.0/{environmentName}/api/microsoft/analytics/v1.0/companies({companyId})/accountCategories
```

## Authentication and authorization

Calls to the Analytics API require a Microsoft Entra access token and permissions to the target company data.

## Next steps

- Explore entity definitions under the Analytics API resource reference.
- Use the corresponding GET operation pages for request and response examples.
- Connect Power BI to these endpoints as data sources for analytics apps.

## Related information

[Tips for working with APIs](../developer/devenv-connect-apps-tips.md)  
[Enabling the APIs for Dynamics 365 Business Central](../api-reference/v2.0/enabling-apis-for-dynamics-nav.md)  
[API endpoint structure](../webservices/api-endpoint-structure.md)  
[Business Central API (v2.0)](../api-reference/v2.0/index.md)  
[Work with Power BI in Business Central](/dynamics365/business-central/across-working-with-powerbi)  
[Finance KPI overview](/dynamics365/business-central/finance-powerbi-kpis)  
[Power BI Sales app semantic model](/dynamics365/business-central/sales-powerbi-app-semantic-model)  
[KPIs and measures in the Power BI Sales app](/dynamics365/business-central/sales-powerbi-sales-kpis)
