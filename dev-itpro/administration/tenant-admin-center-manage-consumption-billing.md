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
> - This is a preview feature that's available with version 26.0 sandbox environments in the United Kingdom (UK) and United States (US).
> - Preview features aren’t meant for production use and might have restricted functionality. These features are subject to [supplemental terms of use](https://go.microsoft.com/fwlink/?linkid=2189520), and are available before an official release so that customers can get early access and provide feedback.-->

## Overview

Selected agent capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)] use consumption-based billing, charging per use. These capabilities use Microsoft Copilot Studio messages for AI interactions and tasks, like retrieving information and responding to prompts. *Messages* are the billing units that measure usage. The number of messages per agent task depends on its complexity. Learn more about messages in [Message scenarios](/microsoft-copilot-studio/requirements-messages-management#message-scenarios).

<!--Learn more about billing in [Copilot Studio licensing](/microsoft-copilot-studio/billing-licensing). [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/?LinkId=866544).Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?LinkId=2085130)-->

Watch this YouTube video for a visual summary of how to manage consumption-based billing.

[![Watch the video](https://img.youtube.com/vi/9esVS6I4wrY/0.jpg)](https://www.youtube.com/watch?v=9esVS6I4wrY)

### Billable agent capabilities

- [Payables Agent](/dynamics365/business-central/payables-agent)
- [Sales Order Agent](/dynamics365/business-central/sales-order-agent)

## Set up billing model

[!INCLUDE [prod_short](../includes/prod_short.md)] supports two billing models: prepaid capacity and pay-as-you-go. The prepaid capacity model uses Copilot Studio message pack subscriptions, which are a licensing option for Microsoft Copilot Studio that you purchase in advance. The pay-as-you-go model charges for the actual number of messages consumed by agents during the month. Learn more in [Copilot licensing](/microsoft-copilot-studio/billing-licensing).

Both models require that you link your Business Central environment to a Power Platform environment.

> [!NOTE]
>
> - Both billing models can be used in the Business Central environment. Prepaid capacity is consumed first.
> - Message capacity on the Power Platform environment is consumed by Business Central environments and other Microsoft services on the tenant.

### Set up prepaid capacity

Complete these tasks to set up the Business Central environment for prepaid capacity. Tasks 1 and 2 can be done by a customer or a reseller. If you're a customer, contact your reseller if you prefer them to handle these tasks. Task 3 is done by the customer's internal admin for Business Central.

1. Purchase a Copilot Studio message pack subscription using the Microsoft 365 admin center (customer) or Partner Center (reseller).

   Learn more in [Manage self-service purchases and trials (for users)](/microsoft-365/commerce/subscriptions/manage-self-service-purchases-users) or [Manage self-service purchases and trials (for admin)](/microsoft-365/commerce/subscriptions/manage-self-service-purchases-admins).

1. Assign part or all of the Copilot Studio message pack as prepaid capacity to the Power Platform environment through the Power Platform admin center (for customers or resellers)

   Learn more in [Manage Capacity](/power-platform/admin/manage-copilot-studio-messages-capacity?tabs=new#manage-capacity).

1. Link the Business Central environment to the Power Platform environment (internal admin).

   Learn more in [Linked Power Platform environments](tenant-admin-center-environments.md#linked-power-platform-environment).

### Set up pay-as-you-go

Complete these tasks to set up the Business Central environment for pay-as-you-go.

1. Set up pay-as-you-go on the Power Platform tenant (reseller):

   As a customer, contact your reseller. As a reseller, set up an Azure subscription for your customer and link it to their Power Platform environment using the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) or [Power Apps](https://make.powerapps.com/).

   Learn more in [Set up pay-as-you-go](/power-platform/admin/pay-as-you-go-set-up).
1. Link the Business Central environment to the Power Platform environment (internal admin).

   As a reseller, contact the customer's internal admin. As an internal admin, use the Business Central admin center to link the Business Central environment to the Power Platform environment. Learn more in [Linked Power Platform environments](tenant-admin-center-environments.md#linked-power-platform-environment).

## Manage capacity and usage

You can view Copilot Studio message capacity and usage for prepaid capacity and pay-as-you-go in the Power Platform admin center. Learn more in [Manage Copilot Studio messages and capacity](/power-platform/admin/manage-copilot-studio-messages-capacity).

Business Central regularly checks the available capacity (quota) of Copilot Studio messages. If your organization's quota is low or depleted, users receive in-app notifications about the status and necessary actions. It's important to take timely action on these notifications by reallocating existing capacity or purchasing more capacity.

- For prepaid capacity, use the Power Platform admin center to allocate more capacity to the environment from the total available on the tenant. Learn more in [Manage capacity](/power-platform/admin/manage-copilot-studio-messages-capacity#manage-capacity).

  If there's no quantity to allocate, purchase capacity. Learn more in [Manage self-service purchases and trials (for users)](/microsoft-365/commerce/subscriptions/manage-self-service-purchases-users). You can do this yourself or contact your reseller.

- For pay-as-you-go, use Microsoft Cost Management in the Azure portal to view detailed usage and adjust spending limits (budgets) to free up more capacity. Learn more in [View usage and billing information](/power-platform/admin/pay-as-you-go-usage-costs).

  If there's no quantity to allocate, purchase more. This task is done by a reseller. If you're a customer, contact your reseller.

> [!IMPORTANT]
> When the quota is depleted, the AI capability is unavailable until more capacity is added.

## Related information

[Pay-as-you-go plan](/power-platform/admin/pay-as-you-go-overview)  
[Linked Power Platform Environments](tenant-admin-center-environments.md#linked-power-platform-environment)  
