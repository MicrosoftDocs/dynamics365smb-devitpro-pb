---
title: "OnDeleteRecord (Page) Trigger"
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

# OnDeleteRecord (Page) Trigger
> **Version**: _Available or changed with runtime version 1.0._

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

## Remarks  

The action is canceled but the page is not closed if an error occurs in the trigger code. You can use this trigger to write to the database.  

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnDeleteRecord (Request Page) Trigger](../requestpage/devenv-ondeleterecord-requestpage-trigger.md)  
[OnDeleteRecord (Request Page Extension) Trigger](../requestpageextension/devenv-ondeleterecord-requestpageextension-trigger.md)  
[OnDeleteRecord (Page Extension) Trigger](../pageextension/devenv-ondeleterecord-pageextension-trigger.md)
