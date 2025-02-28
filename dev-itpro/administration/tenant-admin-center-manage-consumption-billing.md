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

This article explains how to set up a Business Central environment with a payment model for Copilot and agent capabilities.

## Overview

Selected Copilot and agent capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)] use a consumption-based billing model, charging for usage. These capabilities use Microsoft Copilot Studio for AI interactions and tasks (events), like retrieving information and responding to prompts. *Messages* are the unit of measure of these events used for billing consumption. The number of messages per event depends on its complexity. Learn more about messages in [Message scenarios](/microsoft-copilot-studio/requirements-messages-management#message-scenarios).

Learn more about billing and rates in [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/?LinkId=866544).

## Set up payment model 

[!INCLUDE [prod_short](../includes/prod_short.md)] supports two payment models: pay-as-you-go and prepaid capacity. Both models require that you link your Business Central environment to a Power Platform environment.

> [!NOTE]
> - You can use both payment models on the Business Central environment. In this case, the prepaid capacity is consumed first.
> - Message capacity on the Power Platform environment is consumed by Business Central environments and other Microsoft services in use on the Power Platform tenant.

### Set up prepaid capacity

Complete these tasks to set up the Business Central environment for prepaid capacity.

1. Purchase a Copilot message pack.

   The first time you purchase a message pack, use Microsoft 365 admin center. To purchase more capacity later, you can use the Power Platform admin center.

<!--# [Microsoft 365 admin center](#tab/m365) -->

   1. Sign in to the [Microsoft 365 admin center](https://admin.microsoft.com).
   1. On the navigation pane, select **Marketplace**
   1. Search for Microsoft Copilot Studio.
   1. Select the message package.
   1. Follow the prompts to complete the purchase.
<!--
   # [Power Platform admin center](#tab/ppac)

   1. Sign in to the [Power Platform dmin center](https://admin.powerplatform.microsoft.com/).
   1. On the navigation pane, select **Licensing**.
   1. Under **Summaries**, select Copilot Studio.
   1. Look for the **Message Pack** card.
   1. Click on the link provided to manage and purchase new message packs.
   1. Follow the prompts to complete your purchase.-->

1. Assign prepaid capacity to the Power Platform environment using the Power Platform admin center.

   Learn more in [Manage Capacity](/power-platform/admin/manage-copilot-studio-messages-capacity?tabs=new#manage-capacity).

<!-- 
   1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
   1. On the navigation pane, select **Licensing**.
   1. Under **Summaries**, select **Copilot Studio**.
   1. Look for the **Message Pack** card.
-->
1. Link the Business Central environment to the Power Platform environment:

   1. Sign in to Business Central admin center, and then open environment.
   1. In the **Linked Power Platform Environment** on environment page, select the **Link** under **Environment** or **Modify** if you want to change to another Power Platform environment.
   1. In the **Link** pane, select the Power Platform environment, and then select **Link**.  

### Set up pay-as-you-go

Complete these tasks to set up the Business Central environment for pay-as-you-go.

1. Set up pay-as-you-go on the Power Platform tenant:

   To set up pay-as-you-go billing, you first need an active Azure subscription. Then, you link the subscription to your Power Platform environment using the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) or withing [Power Apps](https://make.powerapps.com/).

   Learn more in [Set up pay-as-you-go](/power-platform/admin/pay-as-you-go-set-up).
2. Link the Business Central environment to the Power Platform environment:

   1. Sign in to Business Central admin center, and then open environment.
   1. In the **Linked Power Platform Environment** on environment page, select the **Link** under **Environment** or **Modify** if you want to change to another Power Platform environment.
   1. In the **Link** pane, select the Power Platform environment, and then select **Link**.  

## View usage and billing information

You can view usage and billing information for pay-as-you-go and prepaid capacity in the Power Platform admin center. Learn more in [Manage Capacity](/power-platform/admin/manage-copilot-studio-messages-capacity).

With pay-as-you-go, you can also view aggregated billing information in the Azure portal. Learn more in [View usage and billing information](/power-platform/admin/pay-as-you-go-usage-costs).