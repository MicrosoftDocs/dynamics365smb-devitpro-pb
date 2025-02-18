---
title: Integrating with Microsoft Power Platform
description: Learn how to integrate Business Central with the Microsoft Power Platform
author: kennienp
ms.reviewer: jswymer
ms.topic: overview
ms.author: kepontop
ms.date: 02/19/2024
---

# Integrating Business Central with Microsoft Power Platform

Integrating [!INCLUDE [prod_short](../developer/includes/prod_short.md)] with Microsoft Power Platform offers a solution that enhances business productivity and efficiency. It provides a set of tools that enable you to analyze data, build solutions, automate processes, and create virtual agents. By integrating Microsoft Power Platform with [!INCLUDE [prod_short](../developer/includes/prod_short.md)], you can apply the data and business logic of [!INCLUDE [prod_short](../developer/includes/prod_short.md)], and benefit from the analytical and automation capabilities of Microsoft Power Platform. This article explains you can integrate [!INCLUDE [prod_short](../developer/includes/prod_short.md)] with Microsoft Power Platform.

## Business Central connector for Power Platform

A *connector* is a proxy or a wrapper around an API that allows the user of the connector to talk to the underlying service. [!INCLUDE[prod_short](../includes/prod_short.md)] has its own connector that allows Power Platform products such as Power Automate, Power Apps, and Logic apps to communicate with [!INCLUDE[prod_short](../includes/prod_short.md)] through REST APIs (this is another reason for using REST APIs compared to OData/SOAP enabled pages/queries/codeunits).

[![Shows how the Power Platform connector integrates to Business Central](../developer/media/power-platform-connector-diagram.svg)](../developer/media/power-platform-connector-diagram.svg#lightbox)

For more information, see [Power Platform Connectors Overview](/connectors/connectors) and [Dynamics 365 Business Central Connector](/connectors/dynamicssmbsaas) in the Power Platform documentation.

## Integrating Business Central with Microsoft Power Apps

You can integrate [!INCLUDE[prod_short](../includes/prod_short.md)] with Microsoft Power Apps by using the [!INCLUDE[prod_short](../includes/prod_short.md)] connector for Power Platform. With Power Apps, you have the flexibility to build the perfect solution for your business domain&mdash;one that uses [!INCLUDE[prod_short](../includes/prod_short.md)] data and processes and maximizes your productivity. With Power Apps custom UI, AI builder, and augmented-reality (AR)/mixed-reality (MR) technologies, you can take your business to the next level with cutting-edge innovation and customized UI. 

For more information, see [Integrating with Microsoft Power Apps overview](../powerplatform/power-apps-overview.md)

## Integrating Business Central with Microsoft Power Automate

You can integrate [!INCLUDE[prod_short](../includes/prod_short.md)] with Microsoft Power Automate by using the [!INCLUDE[prod_short](../includes/prod_short.md)] connector for Power Platform. With Power Automate, you can set up and use flows to connect business-process tasks performed by different users. System tasks, such as automatic posting, can be included as steps in flows, preceded or followed by user tasks. Requesting and granting approval to create new records are typical flow steps.

For more information, see [Integrating with Microsoft Power Automate overview](../powerplatform/power-automate-overview.md)

## Integrating Business Central with Microsoft Power BI

You can integrate [!INCLUDE[prod_short](../includes/prod_short.md)] with Microsoft Power BI in two ways:

- Connect a Power BI semantic model to [!INCLUDE[prod_short](../includes/prod_short.md)] to read data.
- Embed a Power BI report, page, or visual in the [!INCLUDE[prod_short](../includes/prod_short.md)] client.

### How to connect a Power BI semantic model to Business Central to read data

[!INCLUDE[prod_short](../includes/prod_short.md)] integrates with Power BI through a connector using OData. The connector can read data from API pages/queries and from UI pages exposed as OData web services.

:::image type="content" source="/dynamics365/business-central/media/power-bi-architecture.svg" alt-text="Image alt text." lightbox="/dynamics365/business-central/media/power-bi-architecture.svg":::

For more information, see [Power BI integration overview](/dynamics365/business-central/admin-powerbi-overview).

### How to embed a Power BI report, page, or visual in the Business Central client

[!INCLUDE[prod_short](../includes/prod_short.md)] supports that a Power BI report, page, or visual can be embedded in the Business Central client by using an iframe. 

There are two ways that a Power BI report, page, or visual can be added to a page in the [!INCLUDE[prod_short](../includes/prod_short.md)] client:

1. A user can embed a Power BI report, page, or scorecard on pages that include a Power BI part. For more information, see [Working with Power BI Reports in Business Central](/dynamics365/business-central/across-working-with-powerbi).
1. A developer can programmatically add them from AL. For more information, see [Adding Power BI Report parts to pages](../developer/devenv-power-bi-report-parts.md).


## Integrating Business Central with Microsoft Power Pages (preview)

You can integrate [!INCLUDE[prod_short](../includes/prod_short.md)] with Microsoft Power Pages by using virtual tables in Dataverse. With Power Pages, you can allow unlicensed external users to access data stored in [!INCLUDE[prod_short](../includes/prod_short.md)] online.

[![Shows how data virtualization works between Business Central and Dataverse](../developer/media/dataverse-virtual-tables.svg)](../developer/media/dataverse-virtual-tables.svg#lightbox)

For more information, see [Integrating with Microsoft Power Pages (preview)](../developer/power-pages-on-virtual-tables-overview.md).

## Related information

[Business Central connector for Power Platform](/connectors/dynamicssmbsaas)   
[Integrating with Microsoft Power Apps overview](../powerplatform/power-apps-overview.md)  
[Integrating with Microsoft Power Automate overview](../powerplatform/power-automate-overview.md)  
[Integrating with Microsoft Power Pages (preview)](../developer/power-pages-on-virtual-tables-overview.md)  
[Integrating with Microsoft Power BI](/dynamics365/business-central/admin-powerbi-overview)  
[How users can embed Power BI Reports in Business Central](/dynamics365/business-central/across-working-with-powerbi)  
[How AL developers can add Power BI Reports to pages](../developer/devenv-power-bi-report-parts.md)  
[Business Central integrations overview](../developer/integration-overview.md)   