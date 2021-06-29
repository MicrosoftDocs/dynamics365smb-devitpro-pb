---
title: "InternalEvent Attribute"
description: "Specifies that the method is published as an internal event. It can only be subscribed to from within the same module."
ms.author: solsen
ms.custom: na
ms.date: 06/16/2021
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

# InternalEvent Attribute
> **Version**: _Available or changed with runtime version 4.0._

Specifies that the method is published as an internal event. It can only be subscribed to from within the same module.


## Applies To

- Method


## Syntax

```
[InternalEvent(IncludeSender: Boolean)]
```

### Arguments
*IncludeSender*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
Specifies that the firing instance of the object is available as a parameter to subscribers of that event.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Snippet support

Typing the shortcut `teventinternal` will create the basic internal attribute syntax when using the [!INCLUDE[d365al_ext_md](../../includes/d365al_ext_md.md)] in Visual Studio Code.

## Example
Setting the attribute on a method. Each method must be marked with `[InternalEvent]`.

```AL
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