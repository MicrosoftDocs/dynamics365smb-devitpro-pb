---
title: "OnBeforePassField (Xml Port Field Element) Trigger"
description: "Runs before a field is passed to the XML document."
ms.author: solsen
ms.custom: na
ms.date: 04/27/2021
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

# OnBeforePassField (Xml Port Field Element) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs before a field is passed to the XML document.


## Syntax
```
trigger OnBeforePassField()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This trigger is only used to export data. This trigger gives you access to the field value in the record just before it is exported and is typically used to manipulate the field.  

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnBeforePassField (Xml Port Field Attribute) Trigger](../xmlportfieldattribute/devenv-onbeforepassfield-xmlportfieldattribute-trigger.md)
