---
title: "InternalEvent Attribute"
description: "The InternalEvent attribute in AL for Business Central"
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

# InternalEvent Attribute

[!INCLUDE[2019_releasewave2.md](../../includes/2019_releasewave2.md)]

Specifies that the method is published as an internal event. It can only be subscribed to from within the same module.

## Snippet support

Typing the shortcut `teventinternal` will create the basic internal attribute syntax when using the [!INCLUDE[d365al_ext_md](../../includes/d365al_ext_md.md)] in Visual Studio Code.

## Syntax  
```  
[InternalEvent(IncludeSender : Boolean)]
```
  
### Arguments  
*IncludeSender*  
Type: Boolean  

Specifies that the firing instance of the object is available as a parameter to subscribers of that event.

## Example
Setting the attribute on a method. Each method must be marked with `[InternalEvent]`.

```
codeunit 50131 MyInternalCodeunit
{
    Access = Internal;

    [InternalEvent(true)]
    procedure MyEvent()
    begin

    end;
}

codeunit 50132 MySubscriber
{
    [EventSubscriber(ObjectType::Codeunit, 50131, 'MyEvent', '', false, false)]
    procedure MySubscriber(sender: Codeunit MyInternalCodeunit)
    begin

    end;
}

```
 
## See Also

[AL Method Reference](../methods-auto/library.md)  
[Events in AL](../devenv-events-in-al.md)  
[Publishing Events](../devenv-publishing-events.md)   
[Raising Events](../devenv-raising-events.md)   
[Subscribing to Events](../devenv-subscribing-to-events.md)   
[Method Attributes](devenv-method-attributes.md)