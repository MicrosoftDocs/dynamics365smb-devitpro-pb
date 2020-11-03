---
title: "RunPageLink Property"
ms.author: solsen
ms.custom: na
ms.date: 10/29/2020
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
# RunPageLink Property
Sets a link to a page that will be launched for this action.
The following syntax is valid for the RunPageLink property:

```
RunPageLink = <TableFilters>
<TableFilters> ::= <TableFilter> {,<TableFilter>}
<TableFilter> ::= <RunObjectFieldName> = CONST(<FieldConst>) | FILTER(<Filter>) | FIELD(<SourceFieldName>) |
FIELD(UPPERLIMIT(<SourceFieldName>)) | FIELD(FILTER(<SourceFieldName>)) | FIELD(UPPERLIMIT(FILTER(<SourceFieldName>)))
```

The filters defined by this property are visible in the UI and can be modified by end-users. If it was intended to hide them from end-users, consider using the RunPageView property instead.


## Applies to
-   Page Action

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [!NOTE]  
> This property is supported only on actions for pages.

> [!IMPORTANT]  
> For performance reasons, always set the `RunPageView` property if the `RunPageLink` property is also set. In fact, the sort order chosen in the `RunPageView` property must contain the fields listed in the `RunPageLink` property or else the performance is decreased.

## Syntax example

```AL
action(ShowVendors)
{ 
    ...
    RunObject = page "Vendor Card";
    RunPageLink = "ID"=field(Id);
    ...
}
```

```AL
action(CustomerBalance)
{   
    ...
    RunObject = page "Customer List";
    RunPageLink = "Balance (LCY)"=filter(>=10000);
    ...
}
```

## Remarks

For example, if the current page is the customer card and you need to provide a way to see the outstanding sales orders for the current customer, you would use the [RunObject Property](devenv-runobject-property.md) to run the customer sales orders page. In this property you would select the `Customer No.` field as the link between the two pages.  
  
## See Also  

[RunPageView Property](devenv-runpageview-property.md)  
[RunObject Property](devenv-runobject-property.md)