---
title: "BusinessEvent attribute"
description: "Specifies that the method is published as a business type event."
ms.author: solsen
ms.date: 08/19/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# BusinessEvent attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies that the method is published as a business type event.


## Applies to

- Method


## Syntax

```AL
[BusinessEvent(IncludeSender: Boolean [, Isolated: Boolean])]
```

### Arguments
*IncludeSender*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
Specifies that the firing instance of the object is available as a parameter to subscribers of that event.  

*[Optional] Isolated*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
Specifies if event subscribers should be invoked in an isolated transaction.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Snippet support
Typing the shortcut `teventbus` will create the basic BusinessEvent attribute syntax when using the [!INCLUDE[d365al_ext_md](../../includes/d365al_ext_md.md)] in Visual Studio Code.

## Remarks
Learn more about the different event types in [Event types](../devenv-event-types.md).

When you set `IncludeSender` to `true`, an event subscriber can declare a `sender` parameter that references the publishing object, as shown in the following example:

```AL
codeunit 50100 MyPublishingCodeunit
{
    [BusinessEvent(true)]
    procedure MyBusinessEvent()
    begin
    end;
}

codeunit 50101 MySubscribingCodeunit
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::MyPublishingCodeunit, 'MyBusinessEvent', '', true, true)]
    local procedure MySubscriber(Sender: Codeunit MyPublishingCodeunit)
    begin
        // My subscriber code
    end;
}
```

Learn more about isolated events in [Isolated events](../devenv-events-isolated.md).

## Example

This example publishes a business type event by using the `OnAddressLineChanged` method. The method takes one `Text` parameter. The `IncludeSender` argument is set to `false`.

```AL
[BusinessEvent(false)]
procedure OnAddressLineChanged(Line: Text[100])
begin
end;
```

## Related information

[AL method reference](../methods-auto/library.md)  
[Events in AL](../devenv-events-in-al.md)  
[Publishing events](../devenv-publishing-events.md)  
[Raising events](../devenv-raising-events.md)  
[Subscribing to events](../devenv-subscribing-to-events.md)  
[Isolated events](../devenv-events-isolated.md)  
[Method attributes](devenv-method-attributes.md)
