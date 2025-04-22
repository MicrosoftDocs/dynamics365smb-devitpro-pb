---
title: "OnAfterDelete (Table Extension) trigger"
description: "Runs when the user tries to delete a record."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnAfterDelete (Table Extension) trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs when the user tries to delete a record.


## Syntax
```AL
trigger OnAfterDelete()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This trigger runs after the default delete behavior is executed on a record to be deleted. It runs automatically after the user chooses to delete a record in a page from the Web Client. The record is not deleted if an error occurs in the trigger code. 

## Related information  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
