---
title: "OnAfterInsertRecord (Xml Port Table Element) trigger"
description: "Runs after a record has been inserted into a database table"
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnAfterInsertRecord (Xml Port Table Element) trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs after a record has been inserted into a database table


## Syntax
```AL
trigger OnAfterInsertRecord()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This trigger is only used to import data and can be used to move data from temporary tables to real tables.  
  
 If the [AutoSave Property](../../properties/devenv-autosave-property.md) is **false**, then although the record is not inserted automatically, the **OnAfterInsertRecord** trigger is still called after the insertion would have occurred.  
  
## Related information  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
