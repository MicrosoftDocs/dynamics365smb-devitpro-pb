---
title: "OnPreDataItem (Report Data Item) Trigger"
description: "Runs before a data item is processed."
ms.author: solsen
ms.custom: na
ms.date: 04/27/2021
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

# OnPreDataItem (Report Data Item) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs before a data item is processed.


## Syntax
```
trigger OnPreDataItem()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

This trigger is run before a data item is processed, but after the associated variable is initialized and table views and filters are set.  

You can use this trigger to add additional filtering beyond what is established by the [DataItemLink Property (Reports)](../../properties/devenv-dataitemlink-reports-property.md) or [DataItemTableView Property](../../properties/devenv-dataitemtableview-property.md). For example, use this trigger if you need to filter an indented data item based on the result of a calculation. Use the [SetRange Record](../../methods-auto/record/record-setrange-method.md) or [SetFilter Record](../../methods-auto/record/record-setfilter-method.md)  to add extra delimiters.  

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
