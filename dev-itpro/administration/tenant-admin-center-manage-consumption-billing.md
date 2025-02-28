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

This article explains how to connect your Business Central tenant with a payment method for Copilot and agent capabilities.

## Overview

Selected Copilot and agent capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)] use a consumption-based billing model, chanring  that charges charging for usage . These capablities use Microsoft Copilot Studio for handling interactions and tasks.

*Messages* are the common currency of Copilot Studio and the unit that measures agent usage. There are different merates for . Learn more in [Microsoft Copilot Studio messages](/microsoft-copilot-studio/billing-licensing).

Events have different [billing rates](/microsoft-copilot-studio/requirements-messages-management) depending on the type of Copilot feature




the common currency of [Microsoft Copilot Studio messages](/microsoft-copilot-studio/billing-licensing) per event.

## Set up payment


Set up pay as 
Events have different [billing rates](/microsoft-copilot-studio/requirements-messages-management) depending on the type of Copilot feature. Messages are available in prepaid capacities and pay-as-you-go billing policies, and are consumed by [!INCLUDE [prod_short](../includes/prod_short.md)] environments alongside other Microsoft services in use on your tenant.

You manage prepaid capacities and [pay-as-you-go billing policies](/power-platform/admin/pay-as-you-go-overview) in the Power Platform Admin Center. To use messages in a [!INCLUDE [prod_short](../includes/prod_short.md)] environment, [link it to a Power Platform environment](tenant-admin-center-environments.md#linked-power-platform-environment). Any prepaid capacities and pay-as-you-go billing policies assigned to the linked Power Platform environment automatically apply to the [!INCLUDE [prod_short](../includes/prod_short.md)] environment.

To use Copilot features with consumption-based billing beyond a limited monthly allowance, link the [!INCLUDE [prod_short](../includes/prod_short.md)] environment to a Power Platform environment with sufficient prepaid capacity or a pay-as-you-go billing policy. Settings [managing capacity and overages](/power-platform/admin/manage-copilot-studio-messages-capacity) applied to the linked environment in the Power Platform are inherited on the [!INCLUDE [prod_short](../includes/prod_short.md)] environment.


## View usage

View 

https://review.learn.microsoft.com/en-us/power-platform/admin/pay-as-you-go-usage-costs?branch=main