---
title: "OnInsert (Table Extension) Trigger"
description: "Runs when a user inserts a new record into the table."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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

# OnInsert (Table Extension) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs when a user inserts a new record into the table.


## Syntax
```AL
trigger OnInsert()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This trigger is run before default insert behavior, which checks that the record to be inserted does not already exist before the insertion occurs. It runs automatically after the user chooses to insert a new record in a page from the Web client. If a user inserts a record using AL code, then the *RunTrigger* argument of [INSERT (Record) Method](../../methods-auto/record/record-insert-method.md) must be set to **true** for the **OnInsert** Trigger to run, or otherwise it will not. The new record is not inserted if an error occurs in the trigger code.  
  
 In tables where records are entered in pages that have the [DelayedInsert Property](../../properties/devenv-delayedinsert-property.md) set to **true**, we recommend that you write any code that is in an OnInsert trigger so that it will always succeed. For example, this applies to journal lines.  

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnInsert (Table) Trigger](../table/devenv-oninsert-table-trigger.md)
