---
title: "OnNewRecord (Page Extension) Trigger"
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

# OnNewRecord (Page Extension) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs after a new record is initialized, but before it is inserted as a record in the table.


## Syntax
```
trigger OnNewRecord(BelowxRec: Boolean)
begin
    ...
end;
```

### Parameters

*BelowxRec*  
&emsp;Type: [Boolean](../../methods-auto/boolean/boolean-data-type.md)  
This return value indicates whether the new record is to be inserted after the last record in the table (xRec). If false, the record is to be inserted between an existing record and the last record. If true, the record is to be inserted below the last record in the table (xRec).  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnNewRecord (Page) Trigger](../page/devenv-onnewrecord-page-trigger.md)  
[OnNewRecord (Request Page) Trigger](../requestpage/devenv-onnewrecord-requestpage-trigger.md)  
[OnNewRecord (Request Page Extension) Trigger](../requestpageextension/devenv-onnewrecord-requestpageextension-trigger.md)
