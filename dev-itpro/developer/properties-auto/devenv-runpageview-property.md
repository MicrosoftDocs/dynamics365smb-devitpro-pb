---
title: "RunPageView Property"
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
# RunPageView Property
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
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  