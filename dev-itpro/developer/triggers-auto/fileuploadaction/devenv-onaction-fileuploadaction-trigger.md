---
title: "OnAction (File Upload Action) trigger"
description: "Runs when a user uploads files on a page."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnAction (File Upload Action) trigger
> **Version**: _Available or changed with runtime version 13.0._

Runs when a user uploads files on a page.


## Syntax
```AL
trigger OnAction(Files: List of [FileUpload])
begin
    ...
end;
```

### Parameters

*Files*  
&emsp;Type: [List of [FileUpload]](../../methods-auto/list/list-data-type.md)  
List of the files uploaded.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  