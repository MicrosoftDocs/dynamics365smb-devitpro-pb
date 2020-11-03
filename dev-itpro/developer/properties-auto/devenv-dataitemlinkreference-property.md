---
title: "DataItemLinkReference Property"
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
# DataItemLinkReference Property
Sets the parent data item to which a child (indented) data item is linked. After you specify the DataItemLinkReference value, use the DataItemLink Property (Reports) to specify a field from each data item on which to base the link.

## Applies to
-   Report Data Item

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Remarks  
The default value is the name of the last preceding data item in the report with lower indentation. You can set **DataItemLinkReference** and **DataItemLink** properties for a data item that is not a child of another data item, however, this will not have any effect.  

## See Also  
[Properties](devenv-properties.md)  
[DataItemLink Property (Reports)](devenv-dataitemlink-reports-property.md)  