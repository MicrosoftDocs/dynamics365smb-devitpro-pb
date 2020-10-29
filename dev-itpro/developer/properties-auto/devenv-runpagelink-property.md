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
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  