---
title: "OnAfterInsertRecord (Xml Port Table Element) Trigger"
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

# OnAfterInsertRecord (Xml Port Table Element) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs after a record has been inserted into a database table


## Syntax
```
trigger OnAfterInsertRecord()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This trigger is only used to import data and can be used to move data from temporary tables to real tables.  
  
 If the [AutoSave Property](../properties/devenv-autosave-property.md) is **false**, then although the record is not inserted automatically, the **OnAfterInsertRecord** trigger is still called after the insertion would have occurred.  
  
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
