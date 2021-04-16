---
title: "OnInsertRecord (Page Extension) Trigger"
ms.description: "Runs before a new record is inserted into the table."
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

# OnInsertRecord (Page Extension) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs before a new record is inserted into the table.


## Syntax
```
trigger OnInsertRecord(BelowxRec: Boolean): Ok
begin
    ...
end;
```

### Parameters

*BelowxRec*  
&emsp;Type: [Boolean](../../methods-auto/boolean/boolean-data-type.md)  
This return value indicates whether the new record was inserted after the last record in the table (xRec) or not. If false, the record was inserted between an existing record and the last record. If true, the record was inserted below the last record in the table (xRec).  


## Return Value

*Ok*
&emsp;Type: [Boolean](../../methods-auto/boolean/boolean-data-type.md)  
**true** if the record was inserted, otherwise **false**. The return value is checked after each call. The default value is **true**.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnInsertRecord (Page) Trigger](../page/devenv-oninsertrecord-page-trigger.md)  
[OnInsertRecord (Request Page) Trigger](../requestpage/devenv-oninsertrecord-requestpage-trigger.md)  
[OnInsertRecord (Request Page Extension) Trigger](../requestpageextension/devenv-oninsertrecord-requestpageextension-trigger.md)
