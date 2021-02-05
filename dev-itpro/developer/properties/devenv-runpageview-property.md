---
title: "RunPageView Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RunPageView Property
> **Version**: _Available from runtime version 1.0._

Sets a tableview for the page that will be launched for this action.
The following syntax is valid for the RunPageView property:

```
RunPageView =
[[SORTING(<KeyList>)] [ORDER(Ascending|Descending)] [WHERE(<TableFilters>)]]
<KeyList> ::= RunObjectTableKey1, RunObjectTableKey2, ...
<TableFilters> ::= [<TableFilter> {,<TableFilter>}]
<TableFilter> ::= <RunObjectFieldName>=CONST(<FieldConst>) | FILTER(<FilterExpression>)
```

The filters defined by this property are not visible in the UI and cannot be modified by end-users. If it was intended to reveal them to end-users, consider using the RunPageLink property instead.
    

## Applies to
-   Page Action


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Remarks  

The table view is the view of the table that you present to the user. You determine what records the user can see by setting filters, determining the sorting order, and selecting the keys.  
  
You can use this property to indicate how information should be sorted.  
  
## See Also  

[RunObject Property](devenv-runobject-property.md)   
[RunPageLink Property](devenv-runpagelink-property.md)