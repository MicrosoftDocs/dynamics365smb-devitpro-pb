---
title: Dutch Features that are Moved, Removed, or Replaced | Microsoft Docs
description: We are constantly streamlining and adjusting our app in-step with market developments. Read about the features for the Netherlands that we have moved, removed, or replaced.
services: project-madeira
documentationcenter: ''
author: bholtorf

ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms. search.keywords: deprecated, Dutch, NL, Netherlands, local functionality
ms.date: 10/01/2018
ms.author: bholtorf

---

# Deprecated Features in the Dutch Version of [!INCLUDE[navnow](includes/navnow_md.md)]
This topic lists and describes the local functionality for the Netherlands that has been removed from [!INCLUDE[navnow](includes/navnow_md.md)], made available from a new page or report, made available to one or more additional countries, or replaced by a new feature.

## Checking Totals for Purchase Invoices and Purchase Credit Memos
If the total amount on a purchase document does not match the total amount from the purchase lines, you can find out why by letting [!INCLUDE[navnow](includes/navnow_md.md)] calculate the total amount, total base amount, total VAT amount, and total amount including VAT for the purchase lines. The totals display in fields at the bottom of the **Purchase Invoice** or **Purchase Credit Memo** pages.

By default, [!INCLUDE[navnow](includes/navnow_md.md)] does not show these totals. To display them, on the **Purchases & Payables Setup** page, choose the **Show Totals on Purch. Inv./CM.** check box.

> [!Note]
> To use this feature, your purchase invoices or purchase credit memos must have at least one purchase line, and a quantity. Additionally, when you turn on this feature [!INCLUDE[navnow](includes/navnow_md.md)] recalculates totals on all purchase invoices and credit memos. Depending on the number of documents, this can take some time.

|Moved, Removed, or Replaced?| Why?|
|----|----|
| Moved | The feature to check totals for purchase invoices and credit memos is no longer specific to the Netherlands, so we have made it generally available in the standard product.|

## See Also
[Upgrading to [!INCLUDE[d365fin_long](includes/d365fin_long_md.md)]](upgrading-to-microsoft-dynamics-nav.md)  
[Upgrading the Application Code](upgrading-the-application-code.md)  
[Deprecated Fields, and Fields Marked as Obsolete](deprecated-fields.md)  
[Netherlands Local Functionality in [!INCLUDE[navnow](includes/navnow_md.md)]](/dynamics-nav-app/LocalFunctionality/Netherlands/netherlands-local-functionality)  
