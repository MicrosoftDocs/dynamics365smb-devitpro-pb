---
title: "OnDelete (Table) Trigger"
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

# OnDelete (Table) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs when a user tries to delete a record.


## Syntax
```
trigger OnDelete()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This trigger runs before the default delete behavior, which checks that the record exists before the deletion occurs. It runs automatically after the user chooses to delete a record in a page from the Web Client. If a user deletes a record using AL code, then the *RunTrigger* argument of [DELETE (Record) Method](../../methods-auto/record/record-delete-method.md) or [DELETEALL (Record) Method](../../methods-auto/record/record-deleteall-method.md) must be set to **true** for the OnDelete Trigger to run, or otherwise it will not. The record is not deleted if an error occurs in the trigger code.  

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnDelete (Table Extension) Trigger](../tableextension/devenv-ondelete-tableextension-trigger.md)
