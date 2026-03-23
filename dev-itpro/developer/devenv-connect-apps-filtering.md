---
title: Using filters with API/OData calls
description: Learn how to use filters with API calls to get targeted information in return.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.date: 03/23/2026
ms.topic: concept-article
ms.reviewer: solsen
---

# Using filters with OData/API calls

You can provide filters in API calls to get targeted information in return. The syntax for this follows the [Microsoft REST API guidelines](https://github.com/Microsoft/api-guidelines/blob/master/Guidelines.md#97-filtering). For example, to GET all open (unpaid) sales invoices above 1000.00 excl tax, call `<endpoint>/companies(bb6d48b6-c7b2-4a38-9a93-ad5506407f12)/salesInvoices?$filter=status eq 'Open' and totalAmountExcludingTax gt 1000.00`

You can either filter by range or by property. To learn how to develop a good filter expression, see [Entering Criteria in Filters](../developer/devenv-entering-criteria-in-filters.md). To know more about filter expressions and their equivalent AL expressions in web services, check out [Filter expressions](../webservices/use-filter-expressions-in-odata-uris.md#filter-expressions).

> [!NOTE]
> There's a special filter, `journals.templateDisplayName`, which returns journals if a user hasn't defined the filter criteria.

## Related information

[Developing connect apps for Dynamics 365 Business Central](devenv-develop-connect-apps.md)  
[Working with webhooks in Dynamics 365 Business Central](../api-reference/v2.0/dynamics-subscriptions.md)  
[Tips for working with the APIs](devenv-connect-apps-tips.md)  
