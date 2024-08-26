---
title: "OnBeforePassField (Xml Port Field Attribute) trigger"
description: "Runs before a field is passed to the XML document."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnBeforePassField (Xml Port Field Attribute) trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs before a field is passed to the XML document.


## Syntax
```AL
trigger OnBeforePassField()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This trigger is only used to export data. This trigger gives you access to the field value in the record just before it is exported and is typically used to manipulate the field.  


## See Also  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnBeforePassField (Xml Port Field Element) Trigger](../xmlportfieldelement/devenv-onbeforepassfield-xmlportfieldelement-trigger.md)
