---
title: Extending Currency Exchange Rate Adjustments
description: Explore opportunities to add capabilities to exchange rate adjustments. 
author: brentholtorf
ms.author: bholtorf
ms.reviewer: ivkoleti
ms.date: 09/06/2023
ms.topic: conceptual
ms.custom: bap-template
---

# Extending Currency Exchange Rate Adjustments

In 2023 release wave 2 we've added new capabilities to the process for adjusting currency exchange rates. This article can help you understand how to extend exchange rate adjustments to comply with the requirements that apply to your business.

You can use [!INCLUDE [prod_short](includes/prod_short.md)] to do business in multiple currencies, so it's important that you can easily and accurately keep your exchange rates up to date.

Exchange rate adjustments are sometimes subject to local regulations. Different countries/regions have different requirements for how companies adjust the exchange rates they use. Financial institutions might also have special requirements that you might need to allow for.

> [!IMPORTANT]
> The new implementation described in this article doesn't yet cover the reporting requirements for exchange rate adjustments in Switzerland. We working to address that in a future release.

## Objects you can use in your extension

This section describes the objects that the implementation used before 2023 release wave 2, and the objects to use in that and later versions.

### Before 2023 release wave 2

* **Report 595 Adjust Exchange Rates** runs as batch job that does all processing, calculations, and posting. This report also lets you print details about adjustments for selected countries/regions, such as Austria, Germany, and Switzerland. There isn't a preview option, so you can only check the posted entries after you run the report. The report creates the following entries:

  * G/L entries
  * Detailed customer and vendor ledger entries for exchange rate gains and losses
  * Entries in the **Exch. Rate Adjmt. Register** table

### In 2023 release wave 2

The **Report 596 Exch. Rate Adjustment** request page is still the user interface. However, **codeunit 699 Exch. Rate. Adjmt. Process** does all processing. The codeunit also offers the ability to preview entries before you post.

The new **Exch. Rate. Adjmt. Parameters** table passes parameters from the request page to **codeunit 699 Exch. Rate. Adjmt. Process**. The table provides the following capabilities:

* Allows for the many parameters to process.
* Let's us include table filters in the base implementation.
* Allows you to extend it with additional business logic. 
 
We save a detailed history of adjustments in the new **Exch. Rate. Adjmt. Ledger Entry** table, which is linked to each adjustment register. Here, you'll find all of the information you need to export and print a detailed report about adjustments.

## Enable the new feature

When you turn on the new feature, [!INCLUDE [prod_short](includes/prod_short.md)] checks whether you have extensions that subscribe to the legacy events. It also checks whether there are subscribers to the new implementation in the same extension. If there are subscribers to the earlier implementation, but aren't subscribers to the new, you can't enable the feature.

## See Also

[Extending Application Areas](devenv-extending-application-areas.md)  
[Module System Application](/dynamics365/business-central/application/system-application/module/system-application)  
[Module Base Application](/dynamics365/business-central/application/reference/base%20application/)  