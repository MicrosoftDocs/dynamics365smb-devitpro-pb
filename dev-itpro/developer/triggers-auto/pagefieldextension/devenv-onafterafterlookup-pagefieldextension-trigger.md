---
title: "OnAfterAfterLookup (Page Field Extension) Trigger"
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

# OnAfterAfterLookup (Page Field Extension) Trigger
> **Version**: _Available or changed with runtime version 7.0._

Runs after a lookup is activated passing the selected record as a RecordRef.


## Syntax
```
trigger OnAfterAfterLookup(Selected: RecordRef)
begin
    ...
end;
```

### Parameters

*Selected*  
&emsp;Type: [RecordRef](../../methods-auto/recordref/recordref-data-type.md)  
The selected record.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
