---
title: "Using Filtering with APIs"
author: SusanneWindfeldPedersen
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---

# Using Filtering

+ You can provide filters in API calls. The syntax for this follows the [Microsoft REST API guidelines](https://github.com/Microsoft/api-guidelines/blob/master/Guidelines.md#97-filtering). For example, to GET all open (unpaid) sales invoices above 1000.00 excl tax, call `<endpoint>/companies(bb6d48b6-c7b2-4a38-9a93-ad5506407f12)/salesInvoices?$filter=status eq 'Open' and totalAmountExcludingTax gt 1000.00`

+ You can include filters for the delta links; which are typically based on the GET query call. When calling the API with the deltaLink to get the changes, each entity that previously did not match the filter criteria, but matches it now, returns as an `"add"` entity. Each entity that previously matched the query but no longer does, either because the entity was deleted, or the properties of the entity have changed such that it no longer matches the query parameters. In this case, it returns as a `"removed"` entry.

## See Also
[Developing Connect Apps for Dynamics 365 Business Central](devenv-develop-connect-apps.md)  
[Using Deltas With APIs](devenv-connect-apps-delta.md)  
[Tips for working with the APIs](devenv-connect-apps-tips.md)  

