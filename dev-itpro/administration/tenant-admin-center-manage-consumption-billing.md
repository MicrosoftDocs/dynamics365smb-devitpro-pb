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

This article explains how to set up a Business Central tenant with a payment model for Copilot and agent capabilities. 

## Overview

Selected Copilot and agent capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)] use a consumption-based billing model, charging for usage. These capabilities use Microsoft Copilot Studio for AI interactions and tasks (events), like retrieving information and responding to prompts. *Messages* are the unit of measure these event. The number of messages per event depends on its complexity. Learn more about messages in [Manage message capacity](/microsoft-copilot-studio/requirements-messages-management#message-scenarios)

Learn more about about agent billing and rates in [Dynamics 365 Licensing Guide](https://go.microsoft.com/fwlink/?LinkId=866544).

## Set up payment

[!INCLUDE [prod_short](../includes/prod_short.md)] supports two payment models: pay-as-you-go and prepaid capacity. Both models require that you link your Business Central environmet to a Power Platform enviroment.

> [!NOTE]
> You can use both payment models on the Business Central environment. In this case, the prepaid capacity is consumed first.

## Set up pay-as-you-go

Complete these tasks to set up the Business Central enviroment for pay-as-you-go.

1. Set up pay-as-you-go on the Power Platform tenant:

   To set up pay-as-you-go billing, you first need an active Azure subscription. Then, you link the subscription to your Power Platform environment using the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) or withing [Power Apps](https://make.powerapps.com/).

   Learn more in [Set up pay-as-you-go](/power-platform/admin/pay-as-you-go-set-up).
2. Link the Business Central environment to the Power Platform environment:

   1. Sign in to Business Central admin center, and then open enviroment.
   1. In the **Linked Power Platform Environment** on enviroment page, select the **Link** under **Enviroment** or **Modify** if you want to change to another Power Platform environment.
   1. In the **Link** pane, select the Power Platform environment, and then select **Link**.  

   ![NOTE]
   > , and are consumed by [!INCLUDE [prod_short](../includes/prod_short.md)] environments alongside other Microsoft services in use on your tenant.


## View usage

View 

https://review.learn.microsoft.com/en-us/power-platform/admin/pay-as-you-go-usage-costs?branch=main