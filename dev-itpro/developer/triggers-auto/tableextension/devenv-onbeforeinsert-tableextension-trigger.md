---
title: "OnBeforeInsert (Table Extension) trigger"
description: "Runs when a user inserts a new record into the table."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnBeforeInsert (Table Extension) trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs when a user inserts a new record into the table.


## Syntax
```AL
trigger OnBeforeInsert()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This trigger is run before default insert behavior, which checks that the record to be inserted does not already exist before the insertion occurs. It runs automatically after the user chooses to insert a new record in a page from the Web Client. The new record is not inserted if an error occurs in the trigger code.  

## Related information  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
