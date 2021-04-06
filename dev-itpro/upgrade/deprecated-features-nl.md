---
title: Dutch Features that are Moved, Removed, or Replaced | Microsoft Docs
description: We are constantly streamlining and adjusting our app in-step with market developments. Read about the features for the Netherlands that we have moved, removed, or replaced.
author: bholtorf

ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms. search.keywords: deprecated, Dutch, NL, Netherlands, local functionality
ms.date: 04/01/2021
ms.author: bholtorf

---

# Deprecated Features in the Dutch Version of [!INCLUDE [prod_long](../developer/includes/prod_long.md)]
This topic lists and describes the local functionality for the Netherlands that has been removed from [!INCLUDE[prod_short](../developer/includes/prod_short.md)], made available from a new page or report, made available to one or more additional countries, or replaced by a new feature.

## Checking Totals for Purchase Invoices and Purchase Credit Memos
If the total amount on a purchase document does not match the total amount from the purchase lines, you can find out why by letting [!INCLUDE[prod_short](../developer/includes/prod_short.md)] calculate the total amount, total base amount, total VAT amount, and total amount including VAT for the purchase lines. The totals display in fields at the bottom of the **Purchase Invoice** or **Purchase Credit Memo** pages.

By default, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] does not show these totals. To display them, on the **Purchases & Payables Setup** page, choose the **Show Totals on Purch. Inv./CM.** check box.

> [!Note]
> To use this feature, your purchase invoices or purchase credit memos must have at least one purchase line, and a quantity. Additionally, when you turn on this feature [!INCLUDE[prod_short](../developer/includes/prod_short.md)] recalculates totals on all purchase invoices and credit memos. Depending on the number of documents, this can take some time.

|Moved, Removed, or Replaced?| Why?|
|----|----|
| Moved | The feature to check totals for purchase invoices and credit memos is no longer specific to the Netherlands, so we have made it generally available in the standard product.|

## Standard Sales and Purchase Codes
If you often need to create sales and purchase lines with similar information, you can set up standard codes representing sales and purchase lines that you can then insert on recurring sales and purchase documents, for example, for recurring replenishment orders.

|Moved, Removed, or Replaced?| Why?|
|----|----|
| Removed | The feature has been removed from the Dutch version because it is generally available in the standard product.|

## Fields marked as ObsoleteState:Pending

[!INCLUDE [fields-obsolete-nl](../includes/fields-obsolete-nl.md)]

## See Also

[Upgrading to [!INCLUDE[d365fin_long](../developer/includes/d365fin_long_md.md)]](upgrading-to-business-central.md)  
[Upgrading the Application Code](upgrading-the-application-code.md)  
[Deprecated Fields, and Fields Marked as Obsolete](deprecated-fields.md)  
[Netherlands Local Functionality](/dynamics365/business-central/LocalFunctionality/Netherlands/netherlands-local-functionality)  
