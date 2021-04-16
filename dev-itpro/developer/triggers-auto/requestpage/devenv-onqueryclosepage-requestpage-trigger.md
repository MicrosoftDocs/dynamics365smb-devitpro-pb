---
title: "OnQueryClosePage (Request Page) Trigger"
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

# OnQueryClosePage (Request Page) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs as a page closes and before the OnClosePage trigger executes.


## Syntax
```
trigger OnQueryClosePage(CloseAction: Action): Ok
begin
    ...
end;
```

### Parameters

*CloseAction*  
&emsp;Type: [Action](../../methods-auto/action/action-option.md)  
The CloseAction chosen by the user; usually OK or Cancel.  


## Return Value

*Ok*
&emsp;Type: [Boolean](../../methods-auto/boolean/boolean-data-type.md)  
**true** if page was closed, otherwise **false**. This value is checked after each call. The default value is **true**.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnQueryClosePage (Page) Trigger](../page/devenv-onqueryclosepage-page-trigger.md)  
[OnQueryClosePage (Request Page Extension) Trigger](../requestpageextension/devenv-onqueryclosepage-requestpageextension-trigger.md)  
[OnQueryClosePage (Page Extension) Trigger](../pageextension/devenv-onqueryclosepage-pageextension-trigger.md)
