---
title: Manage consumption-based billing
description: Learn about managing consumption-based billing for Business Central
author: jobulsin
ms.topic: conceptual
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, telemetry, billing
ms.date: 02/26/2025
ms.author: jobulsin
ms.reviewer: jswymer
---
# Manage consumption-based billing

This article explains how to set up a Business Central environment for billing Copilot and agent capabilities.

## Overview

Selected Copilot and agent capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)] use consumption-based billing, charging per use. These capabilities use Microsoft Copilot Studio messages for AI interactions and tasks, like retrieving information and responding to prompts. *Messages* are the billing units that measure usage. The number of messages per event depends on its complexity. Learn more about messages in [Message scenarios](/microsoft-copilot-studio/requirements-messages-management#message-scenarios).

Learn more about billing and rates in [Power Platform Licensing Guide ](https://go.microsoft.com/fwlink/?LinkId=2085130). <!--[Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/?LinkId=866544).-->

## Set up billing model

[!INCLUDE [prod_short](../includes/prod_short.md)] supports two billing models: prepaid capacity and pay-as-you-go. The prepaid capacity model uses Copilot message pack subscriptions, which are a licensing option for Microsoft Copilot Studio that you purchase in advance. The pay-as-you-go model charges for the actual number of messages consumed by agents during the month. Learn more in [Copilot licensing](/microsoft-copilot-studio/billing-licensing?branch=main).

Both models require that you link your Business Central environment to a Power Platform environment.

> [!NOTE]
> - Both billing models can be used on the Business Central environment. Prepaid capacity is consumed first.
> - Message capacity on the Power Platform environment is consumed by Business Central environments and other Microsoft services on the Power Platform tenant.

### Set up prepaid capacity

Complete these tasks to set up the Business Central environment for prepaid capacity.

1. Purchase a Copilot message pack subscription using the Microsoft 365 admin center.

   Learn more in [Manage self-service purchases and trials (for users)](/microsoft-365/commerce/subscriptions/manage-self-service-purchases-users) or [Manage self-service purchases and trials (for admin)](/microsoft-365/commerce/subscriptions/manage-self-service-purchases-admins).

   > [!TIP]
   > After the first time you purchase a message pack you can use the Power Platform admin center to purchase more capacity later.

1. Assign prepaid capacity to the Power Platform environment using the Power Platform admin center.

   Learn more in [Manage Capacity](/power-platform/admin/manage-copilot-studio-messages-capacity?tabs=new#manage-capacity).

1. Link the Business Central environment to the Power Platform environment:

   1. Sign in to Business Central admin center and open environment.
   1. In the **Linked Power Platform Environment** section on environment page, select the **Link** under **Environment** or **Modify** to change to another Power Platform environment.
   1. In the **Link** pane, select the Power Platform environment, and then select **Link**.  

### Set up pay-as-you-go

Complete these tasks to set up the Business Central environment for pay-as-you-go.

1. Set up pay-as-you-go on the Power Platform tenant:

   To set up pay-as-you-go billing, you first need an active Azure subscription. Then, you link the subscription to your Power Platform environment using the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) or within [Power Apps](https://make.powerapps.com/).

   Learn more in [Set up pay-as-you-go](/power-platform/admin/pay-as-you-go-set-up).
1. Link the Business Central environment to the Power Platform environment:

   1. Sign in to Business Central admin center and open environment.
   1. In the **Linked Power Platform Environment** section on environment page, select the **Link** under **Environment** or **Modify** to change to another Power Platform environment.
   1. In the **Link** pane, select the Power Platform environment, and then select **Link**.  

## Monitor usage and billing information

View usage and billing information for pay-as-you-go and prepaid capacity in the Power Platform admin center. Learn more in [Manage Capacity](/power-platform/admin/manage-copilot-studio-messages-capacity).

For pay-as-you-go, view aggregated billing information in the Azure portal. Learn more in [View usage and billing information](/power-platform/admin/pay-as-you-go-usage-costs).

## Take action on AI quota alerts and notifications




## Related information

[Linked Power Platform Enviroments](administration/tenant-admin-center-environments.md#linked-power-platform-environment)
