---
title: "OnDeleteRecord (Request Page Extension) Trigger"
ms.author: solsen
ms.custom: na
ms.date: 04/16/2021
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

# OnDeleteRecord (Request Page Extension) Trigger
> **Version**: _Available or changed with runtime version 7.0._

Runs before a record is deleted from the table.


## Syntax
```
trigger OnDeleteRecord(): Ok
begin
    ...
end;
```


## Return Value

*Ok*
&emsp;Type: [Boolean](../../methods-auto/boolean/boolean-data-type.md)  
**true** if the record was deleted, otherwise, **false**. The return value is checked after each call. The default value is **true**.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnDeleteRecord (Page) Trigger](../page/devenv-ondeleterecord-page-trigger.md)  
[OnDeleteRecord (Request Page) Trigger](../requestpage/devenv-ondeleterecord-requestpage-trigger.md)  
[OnDeleteRecord (Page Extension) Trigger](../pageextension/devenv-ondeleterecord-pageextension-trigger.md)  
