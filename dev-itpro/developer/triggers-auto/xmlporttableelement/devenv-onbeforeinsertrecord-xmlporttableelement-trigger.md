---
title: "OnBeforeInsertRecord (Xml Port Table Element) trigger"
description: "Runs after a record has been loaded and before it is inserted into a database table."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnBeforeInsertRecord (Xml Port Table Element) trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs after a record has been loaded and before it is inserted into a database table.


## Syntax
```AL
trigger OnBeforeInsertRecord()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This trigger is only used to import data. It is typically used for evaluation or calculations before the record is inserted into the database table.  
  
 If the [AutoSave Property](../../properties/devenv-autosave-property.md) is **false**, then although the record is not inserted automatically, the OnBeforeInsertRecord trigger is still called before the insertion would have occurred.  

## Related information  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
