---
title: Calculate only visible FlowFields feature key
description: Learn about the Calculate only visible FlowFields feature key.
ms.custom: bap-template
ms.date: 03/12/2025
ms.reviewer: jswymer
ms.topic: conceptual
author: jswymer
ms.author: jswymer
---
# Feature: Calculate only visible FlowFields feature key

[!INCLUDE [2025rw1_and_later](includes/2025rw1_and_later.md)]

By default, FlowFields are calculated even if their [Visible property](../developer/properties/devenv-visible-property.md) is set to `false`, either explicitly or dynamically. This behavior can lead to unnecessary computations and performance issues. When the **Calculate only visible FlowFields** feature is enabled, the AL runtime calculates values only for FlowFields that are visible on pages. Learn more about when FlowFields are calculated in [FlowFields overview](devenv-flowfields.md#when-are-flowfields-calculated).

## Related information

[Enabling upcoming features ahead of time](/dynamics365/business-central/dev-itpro/administration/feature-management)  
[Release plan: Calculate values only for visible FlowFields](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/calculate-values-only-visible-flowfields)  