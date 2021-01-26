---
title: "Filters Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Filters Property
> **Version**: _Available or changed with runtime version 3.0._

Sets a set of filters for the page that will be applied for this page view.
The following syntax is valid for the Filters property:

```
Filters = [WHERE(<TableFilters>)]
<TableFilters> ::= [<TableFilter> {,<TableFilter>}]
<TableFilter> ::= <RunObjectFieldName>=CONST(<FieldConst>) | FILTER(<FilterExpression>)
```

## Applies to
-   Page View

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

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