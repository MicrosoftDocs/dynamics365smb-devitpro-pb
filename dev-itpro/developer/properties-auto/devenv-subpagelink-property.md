---
title: "SubPageLink Property"
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
# SubPageLink Property
Sets a link to a Factbox from a page.
The following syntax is valid for the SubPageLink property:

```
SubPageLink = <TableFilters>
<TableFilters> ::= <TableFilter> {,<TableFilter>}
<TableFilter> ::= <PagePartTableFieldName> = CONST(<FieldConst>) | FILTER(<Filter>) | FIELD(<SourceFieldName>) |
FIELD(UPPERLIMIT(<SourceFieldName>)) | FIELD(FILTER(<SourceFieldName>)) | FIELD(UPPERLIMIT(FILTER(<SourceFieldName>)))
```


## Applies to
-   Page Part
-   Page System Part
-   Page Chart Part

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  