---
title: "Filters Property"

ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Filters Property

Sets the filter that you want to use to define the view of the source table presented to the user. This property can be set on [views](../devenv-views.md).
  
## Applies to  
  
- Views  

## Example

```AL
pagecustomization MyCustomization customizes "Customer List"
{
    views
    {
        addfirst
        {
            view(BalanceLCY)
            {
                Caption = 'Ordered Balance LCY';
                OrderBy = ascending ("Balance (LCY)");
                Filters = where ("Balance (LCY)" = filter (> 500), Name = filter ('G*'));
            }
        }
    }
}

```

For more information on how you can scan, find, and limit records in a list, see [Sorting, Searching, and Filtering Lists](/dynamics365/business-central/ui-enter-criteria-filters). 
  
## See Also

[Properties](devenv-properties.md)