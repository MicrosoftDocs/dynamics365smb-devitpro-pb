---
title: "OnAfterAssignField (Xml Port Field Element) Trigger"
description: "Runs after a field has been assigned a value and before it is validated and imported."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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

# OnAfterAssignField (Xml Port Field Element) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs after a field has been assigned a value and before it is validated and imported.


## Syntax
```AL
trigger OnAfterAssignField()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
This trigger is only used to import data. It gives you access to the values in the imported record and is typically used to manipulate data that is being imported.  

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnAfterAssignField (Xml Port Field Attribute) Trigger](../xmlportfieldattribute/devenv-onafterassignfield-xmlportfieldattribute-trigger.md)
