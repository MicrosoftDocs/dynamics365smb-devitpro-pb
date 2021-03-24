---
title: "OnLookup Trigger"
ms.author: solsen
ms.custom: na
ms.date: 03/24/2021
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
# OnLookup Trigger
> **Version**: _Available or changed with runtime version 3.0._

Runs in place of the normal lookup features for the current page.

## Syntax
```
trigger OnLookup(Text: Text): Ok
begin
    ...
end;
```

### Parameters

*Text*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Text string entered into the text box and used as the lookup value.  

## Return Value

*Ok*
    Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)
**true** if the lookup was carried out, otherwise, **false**.

## Applies To
- Field
- Control
- ControlExtension


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  