---
title: Migrate On-Premises Data to Business Central Online
description: Learn how to set up cloud data migration to Business Central online from supported versions of Dynamics products, and from Business Central on-premises. Azure Data Factory manages the data migration directly between databases.
author: jswymer
ms.topic: conceptual
ms.reviewer: solsen
ms.search.keywords: cloud, edge
ms.search.form: 2502, 4003
ms.date: 11/11/2024
ms.author: jswymer
ms.custom: bap-template
---

# Migrate On-Premises Data to Business Central Online

Organizations that run their workloads on-premises but are looking to move to the cloud can easily migrate to [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online. By moving to the cloud, users get the benefits of cloud scenarios such as Machine Learning, Power BI, Power Automate, and others to drive suggested actions.  

If you're not already familiar with [!INCLUDE [prod_short](../includes/prod_short.md)] online, take a look [here](/dynamics365/business-central/across-preview?toc=/dynamics365/business-central/dev-itpro/toc.json).

## Supported migration paths

[!INCLUDE [bc-cloud-products](../includes/bc-cloud-products.md)]

If a customer is coming from another product, you can use configuration packages and templates to migrate their data to [!INCLUDE [prod_short](../includes/prod_short.md)] on-premises, and then use the cloud migration tool to switch to [!INCLUDE [prod_short](../includes/prod_short.md)] online. For more information, see [Set Up Company Configuration Packages](set-up-standard-company-configuration-packages.md).  

> [!TIP]
> Customers coming from QuickBooks can use apps from Microsoft to move to [!INCLUDE [prod_short](../includes/prod_short.md)] online. For more information, see [Changing from a QuickBooks App to Dynamics 365 Business Central](/dynamics365/business-central/across-quickbooks-to-business-edition).  

## Next steps

The migration process, including the data flow and tasks that must be done to prepare and run the cloud migration, is similar for Business Central and Dynamics GP. But there are some differences. To continue, select the link that matches your on-premises product:

- [Business Central on-premise to online migration](migrate-business-central-on-premises.md)
- [Dynamics GP on-premise to online migration](migrate-gp-overview.md)
- [Dynamics SL on-premise to online migration](migrate-sl-overview.md)
- [Dynamics NAV to Business Central online](../administration/migrate-nav.md)
- [Forrester Report: The total economic impact of a migration to Business Central](https://go.microsoft.com/fwlink/?linkid=2292320)


## Partner webinars and office hours

Join the upcoming partner webinars and office hours for Dynamics GP partners exploring Dynamics 365 Business Central. Join the webinars to learn more and there will be options to ask questions. Find the topics and dates below. Registration opens end of October 2024 here: [aka.ms/GPtoBCOfficeHours](https://aka.ms/GPtoBCOfficeHours).

| Date	| Office Hour Topic	| Abstract |
|-------|-------------------|----------|
|November 12 |	Architecture	| Join the webinar and open office hour with Microsoft where we will cover how to effectively manage multiple environments and companies, understand the relationship between tenants and environments, manage users from different tenants, transfer environments between Microsoft Entra tenants, optimize capacity, and implement localizations to comply with regional regulations. <br><br>Register here to join at 5:00PM CET/8:00 AM PT on November 12: [Join](https://msit.events.teams.microsoft.com/event/b663ee6f-20cb-471e-a443-05155aa7b02a@72f988bf-86f1-41af-91ab-2d7cd011db47).|
|November 19 |	Performance	| This cloud performance webinar focuses on enhancing the performance of Microsoft Dynamics 365 Business Central through various strategies and tools. It covers real-life workloads, scalable architecture, and factors affecting performance such as configuration, data volume, and concurrent activities. The session also highlights tools like the Business Central Performance Toolkit (BCPT) and telemetry for monitoring and optimizing performance.|
|December 5	| Maintenance |	Join the Microsoft webinar on monitoring and maintenance for Dynamics 365 Business Central, covering key topics such as Backup, Restore, and Disaster Recovery, Security and Compliance, Monitoring, and Code Maintenance within Application Lifecycle Management. Gain insights into keeping your environment secure, monitoring its health, and streamlining your development processes.|
|December 10 | Transformation |	Join the Microsoft webinar and office hour about the cloud transformation. We will provide guidance for transitioning from Dynamics GP to Dynamics 365 Business Central. We will cover key topics such as strategies, tools and processes for data migration. Covering both master data and historical data to ensure a smooth transition. And will share best practices for reducing data stored in Business Central databases.|
|December 17 | Financial Management |	Join the Microsoft webinar and office hour about financial management In Dynamics 365 Business Central. We will provide an overview of setting up and managing the Chart of Accounts and Dimensions, ensuring accurate and efficient financial tracking. Additionally, we will explore the functionalities of the General Ledger, including making corrections and adjustments. The webinar will also cover budgeting techniques and tools, as well as best practices for generating and analyzing financial reports.|
|December 18	|Financial Management |	Repeat |

## Related information

[FAQ about Migrating to the Cloud from On-Premises Solutions](faq-migrate-data.md)  
