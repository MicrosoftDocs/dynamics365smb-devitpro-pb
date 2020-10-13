---
title: "The EventSubscriber method must be local."
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# CodeCop Rule AA0207
The EventSubscriber method must be local.  

## Description
The EventSubscriber method must be local.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Reason for the rule

The method which is marked as an event subscriber must be local, because it must not to used for external calls. Not marking the method as local might cause confusion.

## Bad code example
```AL
[EventSubscriber(ObjectType::Page, Page::"Customer Card", 'OnBeforeValidateEvent', 'Address', true, true)]
procedure CheckAddressLine(var Rec : Record Customer)
begin
   ...
end;
```
 
## Good code example
```AL
[EventSubscriber(ObjectType::Page, Page::"Customer Card", 'OnBeforeValidateEvent', 'Address', true, true)]
local procedure CheckAddressLine(var Rec : Record Customer)
begin
   ...
end;
```

## Good and bad practices for fixing the rule
Make the method local by adding the keyword `local`.

## See Also  
[CodeCop Analyzer](codecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  