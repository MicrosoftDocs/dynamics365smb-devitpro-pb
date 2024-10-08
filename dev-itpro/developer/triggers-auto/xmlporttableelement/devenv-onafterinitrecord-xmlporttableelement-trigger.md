---
title: "OnAfterInitRecord (Xml Port Table Element) trigger"
description: "Runs after a record is loaded."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnAfterInitRecord (Xml Port Table Element) trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs after a record is loaded.


## Syntax
```AL
trigger OnAfterInitRecord()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This trigger is only used to import data. It is typically used to set up the preconditions for the record before it is inserted into the database table.  

## Related information  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
