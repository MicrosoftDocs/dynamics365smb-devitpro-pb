---
title: "OnBeforeDelete (Table Extension) Trigger"
description: "Runs when the user tries to delete a record."
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

# OnBeforeDelete (Table Extension) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs when the user tries to delete a record.


## Syntax
```AL
trigger OnBeforeDelete()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This trigger runs before the default delete behavior is executed on a record to be deleted. It runs automatically after the user chooses to delete a record in a page from the Web client. The record is not deleted if an error occurs in the trigger code. 

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
