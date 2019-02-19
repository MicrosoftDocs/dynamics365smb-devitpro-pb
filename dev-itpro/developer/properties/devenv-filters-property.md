---
title: "Filters Property"

ms.custom: na
ms.date: 02/19/2019
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Filters Property
Sets the filter that you want to use to define the view of the source table presented to the user. This property can be set on [views](../devenv-views.md).
  
## Applies To  
  
- Views  

## Example

```
page 50101 MyCustomers
{
    PageType = List;
    SourceTable = Customer;
    SourceTableView = sorting (Name) order(descending)
 where ("Balance (LCY)" = filter (>= 50000), "Sales (LCY)" = filter (<> 0));
    layout
    {
        area(Content)
        {
            repeater(MyRepeater)
            {
                field(Name; Name) { }
                field(Address; Address) { }
                field("Balance (LCY)"; "Balance (LCY)") { }
            }
        }
    }
}
```

For more information on how you can scan, find, and limit records in a list, see [Sorting, Searching, and Filtering Lists](https://docs.microsoft.com/en-us/dynamics365/business-central/ui-enter-criteria-filters). 
  
## See Also  
[Properties](devenv-properties.md)