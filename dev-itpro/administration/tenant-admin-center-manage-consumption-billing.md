---
title: Manage consumption-based billing
description: Learn about managing consumption-based billing for Business Central.
author: jobulsin
ms.topic: how-to
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, telemetry, billing
ms.date: 06/04/2025
ms.author: jobulsin
ms.reviewer: jswymer
---
# Manage consumption-based billing for agent capabilities

<!--[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]-->

This article explains how to set up a Business Central environment for billing Copilot and agent capabilities.

<!--
> [!IMPORTANT]
>
> - This is a preview feature that's available with version 26.4 sandbox and production environments in the United States (US), United Kingdom (UK), Australia (AU), New Zealand (NZ), Canada (CA), Denmark (DK), Germany (DE), Spain (ES), France (FR) and Italy (IT).
> - Preview features aren’t meant for production use and might have restricted functionality. These features are subject to [supplemental terms of use](https://go.microsoft.com/fwlink/?linkid=2189520), and are available before an official release so that customers can get early access and provide feedback.-->

## Overview

Selected agent capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)] use consumption-based billing, charging per use. These capabilities use Copilot Credits for AI interactions and tasks, like retrieving information and responding to prompts. *Copilot Credits* are the billing units that measure usage. The number of Copilot Credits consumed by an agent depends on the design of the agent, how often customers interact with it, and the features they use. Learn more about Copilot Credits in [Billing rates and management](/microsoft-copilot-studio/requirements-messages-management#message-scenarios).

<!--Learn more about billing in [Copilot Studio licensing](/microsoft-copilot-studio/billing-licensing). [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/?LinkId=866544).Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?LinkId=2085130)-->


### Billable agent capabilities

- [Payables Agent](/dynamics365/business-central/payables-agent)
- [Sales Order Agent](/dynamics365/business-central/sales-order-agent)

Billable agent capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)] use the *Generative answer* and *Agent action* [event scenarios](/microsoft-copilot-studio/requirements-messages-management#copilot-credits-and-events-scenarios) to bill for consumption as they complete their tasks.

### Sales Order Agent

You have the Sales Order agent connected to a shared mailbox that processes customer requests for sales quotes and orders.
The following table illustrates how the Business Central scenarios performed by the Sales Order agent are mapped to Copilot Studio events.

| Feature | Copilot Studio Event Scenario | Copilot Credits |
|----------|----------|----------|
| Analyze incoming email | Generative answer | 2 Copilot Credits |
| Analyze e-mail attachment (per attachment of supported format) | Generative answer | 2 Copilot Credits |
| Extract sales data from quotation attachment (per attachment of supported format) | Agent action | 5 Copilot Credits |
| Create or update sales quote | Agent action | 5 Copilot Credits |
| Create or update sales order | Agent action | 5 Copilot Credits |
| Generate response email | Generative answer | 2 Copilot Credits |

An average [Sales Order Agent run](/dynamics365/business-central/sales-order-agent#agent-process-flow) comprises of one generative answer to analyse the incoming email (2 Copilot Credits), one agent action to create or update a sales quote or order (5 Copilot Credits), and one generative answer to generate the response email (2 Copilot Credits).

Typically about 40% of requests include one quotation attachment, which adds a generative answer to analyze the attachment (2 Copilot Credits) and an agent action to extract sales data from it (5 Copilot Credits). 

The average usage is 100 requests per month.

The estimated cost per month is based on the following calculation:

**[(2+5+2) + 0.4x(5+2)] x 100 requests = 1,180 Copilot Credits/month.**


### Payables Agent
You have a Payables Agent connected to a shared mailbox that processes vendor invoices (e-documents).
The following table illustrates how the Business Central scenarios performed by the Payables agent are mapped to Copilot Studio events.

| Feature | Copilot Studio Event Scenario | Copilot Credits |
|----------|----------|----------|
| Create incoming E-Document (per attachment) | Agent Action | 5 Copilot Credits |
| Analyze incoming E-Document | Generative answer | 2 Copilot Credits |
| Extract invoice data from E-Document | Agent Action | 5 Copilot Credits |
| Create purchase document draft | Agent Action | 5 Copilot Credits |
| Match or create vendor | Agent Action | 5 Copilot Credits |
| Process invoice line (per line) | Agent Action | 5 Copilot Credits |
| Create purchase invoice | Agent Action | 5 Copilot Credits |

An average [Payables Agent run](/dynamics365/business-central/payables-agent#payables-agent-process-floww) is for an invoice with five lines.

An average run comprises one agent action to create the incoming e-document from the attachment (5 Copilot Credits), one generative answer to analyze the e-document (2 Copilot Credits), one agent action to extract invoice data (5 Copilot Credits), one agent action to create a purchase document draft (5 Copilot Credits), one agent action to match or create the vendor (5 Copilot Credits), five agent actions to process five invoice lines (5 Copilot Credits each), and one agent action to create the purchase invoice (5 Copilot Credits). 

Assuming the average workload is 100 e-documents per month, and every request has one attachment, the estimated cost per month is based on the following calculation:

**[(5 + 2 + 5 + 5 + 5 + (5×5) + 5)] × 100 requests = 5,200 Copilot Credits/month**

The cost per run therefore depends on the number of invoice lines in each e-document, as shown in the examples below:
| Lines per e-document| Copilot Credits | 
|----------|----------|
| 1 | 32 Copilot Credits |
| 5 | 52 Copilot Credits |
| 10 | 77 Copilot Credits |
| 25 | 152 Copilot Credits |
| 50 | 277 Copilot Credits |


## Set up billing model

[!INCLUDE [prod_short](../includes/prod_short.md)] supports two billing models: prepaid capacity and pay-as-you-go. The prepaid capacity model uses Copilot Credit pack subscriptions, which are a licensing option for Microsoft Copilot Studio that you purchase in advance. The pay-as-you-go model charges for the actual number of messages consumed by agents during the month. Learn more in [Copilot licensing](/microsoft-copilot-studio/billing-licensing).

> [!NOTE]
>
> - Both billing models can be used in the [!INCLUDE [prod_short](../includes/prod_short.md)] environment. When available, prepaid capacity is consumed first.
> - Copilot Credit capacity on the tenant is consumed by [!INCLUDE [prod_short](../includes/prod_short.md)] environments and other Microsoft services on the tenant.

### Set up prepaid capacity

Purchase a Copilot Credit pack subscription using the Microsoft 365 admin center (customer) or Partner Center (reseller) to enable prepaid Copilot Credit capacity on your tenant. Learn more in [Manage self-service purchases and trials (for users)](/microsoft-365/commerce/subscriptions/manage-self-service-purchases-users) or [Manage self-service purchases and trials (for admin)](/microsoft-365/commerce/subscriptions/manage-self-service-purchases-admins).

[!INCLUDE [prod_short](../includes/prod_short.md)] environments will automatically consume from Copilot Credit capacity available in your tenant without any additional setup. This consumption is reported against the [Default Power Platform environment](/power-platform/admin/environments-overview#environment-types) in your tenant. If needed, administrators can [allocate a portion of the prepaid capacity](/power-platform/admin/manage-copilot-studio-messages-capacity#manage-capacity) to the default environment to reserve it for consumption by [!INCLUDE [prod_short](../includes/prod_short.md)].

To allocate a portion of prepaid capacity to a specific [!INCLUDE [prod_short](../includes/prod_short.md)] environment, for example to limit consumption on Sandbox environments or to ensure sufficient capacity on Production environments, complete these tasks:

1. Assign part or all of the Copilot Studio message pack as prepaid capacity to the Power Platform environment through the Power Platform admin center (for customers or resellers)

   Learn more in [Manage Capacity](/power-platform/admin/manage-copilot-studio-messages-capacity?tabs=new#manage-capacity).

1. Link the [!INCLUDE [prod_short](../includes/prod_short.md)] environment to the Power Platform environment. This operation can only be completed by internal administrators.

   Learn more in [Linked Power Platform environments](tenant-admin-center-environments.md#linked-power-platform-environment).

Once completed, consumption of Copilot Credits in the [!INCLUDE [prod_short](../includes/prod_short.md)] environment will be limited by the capacity allocated to the linked Power Platform environment.

> [!NOTE]
> Other Microsoft services running in the linked Power Platform environment may also consume from the environment's allocated Copilot Credit capacity. It is not possible to allocate capacity to specific Microsoft services or features.

### Set up pay-as-you-go

Complete these tasks to set up the Business Central environment for pay-as-you-go.

1. Set up pay-as-you-go on the Power Platform tenant (reseller):

   As a customer, contact your reseller. As a reseller, set up an Azure subscription for your customer and link it to their Power Platform environment using the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) or [Power Apps](https://make.powerapps.com/).

   Learn more in [Set up pay-as-you-go](/power-platform/admin/pay-as-you-go-set-up).
1. Link the Business Central environment to the Power Platform environment (internal admin).

   As a reseller, contact the customer's internal admin. As an internal admin, use the Business Central admin center to link the Business Central environment to the Power Platform environment. Learn more in [Linked Power Platform environments](tenant-admin-center-environments.md#linked-power-platform-environment).

Watch this YouTube video for summary of how to manage pay-as-you-go billing:

[![Watch the video](../developer/media/pay-as-you-go-video.png)](https://www.youtube.com/watch?v=9esVS6I4wrY)

## Manage capacity and usage

You can view Copilot Credit capacity and usage for prepaid capacity and pay-as-you-go in the Power Platform admin center. Learn more in [Manage Copilot Credits and capacity](/power-platform/admin/manage-copilot-studio-messages-capacity).

Business Central regularly checks the available capacity (quota) of Copilot Credits. If your organization's quota is low or depleted, users receive in-app notifications about the status and necessary actions. It's important to take timely action on these notifications by reallocating existing capacity or purchasing more capacity.

- For prepaid capacity, use the Power Platform admin center to allocate more capacity to the environment from the total available on the tenant. Learn more in [Manage capacity](/power-platform/admin/manage-copilot-studio-messages-capacity#manage-capacity).

  If there's no quantity to allocate, purchase capacity. Learn more in [Manage self-service purchases and trials (for users)](/microsoft-365/commerce/subscriptions/manage-self-service-purchases-users). You can do this yourself or contact your reseller.

- For pay-as-you-go, use Microsoft Cost Management in the Azure portal to view detailed usage and adjust spending limits (budgets) to free up more capacity. Learn more in [View usage and billing information](/power-platform/admin/pay-as-you-go-usage-costs).

  If there's no quantity to allocate, purchase more. This task is done by a reseller. If you're a customer, contact your reseller.

> [!IMPORTANT]
> When the quota is depleted, the AI capability is unavailable until more capacity is added.




## Related information

[Pay-as-you-go plan](/power-platform/admin/pay-as-you-go-overview)  
[Linked Power Platform Environments](tenant-admin-center-environments.md#linked-power-platform-environment)  
