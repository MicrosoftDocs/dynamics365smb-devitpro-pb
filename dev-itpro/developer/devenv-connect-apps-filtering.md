---
title: "Using Filtering"
author: SusanneWindfeldPedersen
ms.author: solsen
ms.custom: na
ms.date: 02/23/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
---

[!INCLUDE[newdev_dev_preview](includes/newdev_dev_preview.md)]

# Using Filtering

+ You can provide filters in API calls. The syntax for this follows the [Microsoft REST API guidelines](https://github.com/Microsoft/api-guidelines/blob/master/Guidelines.md#97-filtering). For example, to GET all open (unpaid) sales invoices above 1000.00 excl tax, call `<endpoint>/companies(bb6d48b6-c7b2-4a38-9a93-ad5506407f12)/salesInvoices?$filter=status eq 'Open' and totalAmountExcludingTax gt 1000.00`.

+ You can include filters for the delta links; which are typically based on the GET query call. When calling the API with the deltaLink to get the changes, each entity that previously did not match the filter criteria, but matches it now, returns as an `"add"` entity. Each entity that previously matched the query but no longer does, either because the entity was deleted, or the properties of the entity have changed such that it no longer matches the query parameters. In this case, it returns as a `"removed"` entry.
