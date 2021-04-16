---
title: "OnModifyRecord (Page Extension) Trigger"
ms.author: solsen
ms.custom: na
ms.date: 04/14/2021
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

# OnModifyRecord (Page Extension) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs before a record is modified in the table.



## Syntax
```
trigger OnModifyRecord(): Ok
begin
    ...
end;
```


## Return Value

*Ok*
&emsp;Type: [Boolean](../../methods-auto/boolean/boolean-data-type.md)
**true** if the record was modified, otherwise **false**. The return value is checked after each call. The default value is **true**.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnModifyRecord (Page) Trigger](../page/devenv-onmodifyrecord-page-trigger.md)  
[OnModifyRecord (Request Page) Trigger](../requestpage/devenv-onmodifyrecord-requestpage-trigger.md)  
[OnModifyRecord (Request Page Extension) Trigger](../requestpageextension/devenv-onmodifyrecord-requestpageextension-trigger.md)
