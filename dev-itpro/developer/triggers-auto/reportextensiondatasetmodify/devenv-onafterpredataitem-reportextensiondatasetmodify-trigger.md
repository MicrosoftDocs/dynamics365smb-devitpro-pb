---
title: "OnAfterPreDataItem (Report Extension Data Set Modify) Trigger"
description: "Runs after the OnPreDataItem trigger of the base data item."
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

# OnAfterPreDataItem (Report Extension Data Set Modify) Trigger
> **Version**: _Available or changed with runtime version 7.1._

Runs after the OnPreDataItem trigger of the base data item.


## Syntax
```
trigger OnAfterPreDataItem()
begin
    ...
end;
```

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This trigger is run before a data item is processed, but after the associated variable is initialized and table views and filters are set. The base object trigger is run before this trigger. For more information, see [OnPreDataItem (Report Data Item) Trigger](../reportdataitem/devenv-onpredataitem-reportdataitem-trigger.md).


## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  