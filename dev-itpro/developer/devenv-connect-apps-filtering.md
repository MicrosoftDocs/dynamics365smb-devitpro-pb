---
title: "Using Filtering with APIs"
author: SusanneWindfeldPedersen
ms.author: solsen
ms.custom: na
ms.date: 09/26/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
---

# Using Filters with API calls

You can provide filters in API calls to get targeted information in return. The syntax for this follows the [Microsoft REST API guidelines](https://github.com/Microsoft/api-guidelines/blob/master/Guidelines.md#97-filtering). For example, to GET all open (unpaid) sales invoices above 1000.00 excl tax, call `<endpoint>/companies(bb6d48b6-c7b2-4a38-9a93-ad5506407f12)/salesInvoices?$filter=status eq 'Open' and totalAmountExcludingTax gt 1000.00`

You can either filter by range or by property. To learn how to develop a good filter expression, see [Entering Criteria in Filters](../developer/devenv-entering-criteria-in-filters.md). To know more about filter expressions and their equivalent AL expressions in web services, check out [Filter Expressions](../webservices/use-filter-expressions-in-odata-uris.md#filter-expressions).

You can include filters for the delta links; which are typically based on the GET query call. When calling the API with the deltaLink to get the changes, each entity that previously didn't match the filter criteria, but matches it now, returns as an `"add"` entity. Each entity that previously matched the query but no longer does, either because the entity was deleted, or the properties of the entity have changed such that it doesn't matches the query parameters, returns as a `"removed"` entry.

>[!Note]
> There is a special filter, `journals.templateDisplayName` which returns journals if a user hasn't defined the filter criteria.


## See Also
[Developing Connect Apps for Dynamics 365 Business Central](devenv-develop-connect-apps.md)  
[Using Deltas With APIs](devenv-connect-apps-delta.md)  
[Tips for working with the APIs](devenv-connect-apps-tips.md)  

