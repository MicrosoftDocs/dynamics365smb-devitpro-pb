---
title: "IntegrationEvent attribute"
description: "Specifies that the method is published as an integration type event."
ms.author: solsen
ms.date: 08/19/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# IntegrationEvent attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies that the method is published as an integration type event.


## Applies to

- Method


## Syntax

```AL
[IntegrationEvent(IncludeSender: Boolean, GlobalVarAccess: Boolean [, Isolated: Boolean])]
```

### Arguments
*IncludeSender*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
Specifies whether global methods in the object that contains the event publisher method are exposed to event subscriber methods that subscribe to the event.  

*GlobalVarAccess*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
Specifies whether global variables in the object that contains the event publisher method are accessible to event subscriber methods that subscribe to the published event.  

*[Optional] Isolated*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
Specifies if event subscribers should be invoked in an isolated transaction.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Snippet support

Typing the shortcut `teventint` will create the basic IntegrationEvent attribute syntax when using the [!INCLUDE[d365al_ext_md](../../includes/d365al_ext_md.md)] in Visual Studio Code.

## Remarks

When you set `IncludeSender` to `true`, an event subscriber can declare a `sender` parameter that references the publishing object. You must add the parameter to the subscriber manually, as shown in the example.

> [!IMPORTANT]  
> Avoid `GlobalVarAccess`. Use event parameters instead, or mark page or table variables as `protected`. Learn more in [Protected variables](../devenv-protected-variables.md).

When you set `GlobalVarAccess` to `true`, an event subscriber can access global variables in the object that declares the publisher method. Add each variable to the subscriber signature manually. Its name and type must match the declaration in the publishing object, as shown in the example.

Learn more about the different event types in [Event types](../devenv-event-types.md).

Learn more about isolated events in [Isolated events](../devenv-events-isolated.md).

## Example

This example publishes an integration type event by using the `OnAddressLineChangedEvent` method. The method takes one `Text` parameter.

The `IncludeSender` and `GlobalVarAccess` arguments are set to `true`. The subscriber method `SubscribeToOnAddressLineChangedEvent` therefore includes:

- The `sender` parameter for event publishing codeunit `MyPublishingCodeunit`.
- A parameter for the global variable `myGlobalVar` defined in the publishing codeunit `MyPublishingCodeunit`.

```AL
codeunit 50102 MyPublishingCodeunit
{
    [IntegrationEvent(true, true)]
    procedure OnAddressLineChangedEvent(Line: Text[100])
    begin
    end;

    var
        MyGlobalVar: Integer;
}

codeunit 50103 MySubscribingCodeunit
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::MyPublishingCodeunit, 'OnAddressLineChangedEvent', '', true, true)]
    local procedure SubscribeToOnAddressLineChangedEvent(Sender: Codeunit MyPublishingCodeunit; MyGlobalVar: Integer)
    begin
        // My subscriber code
    end;
}
```

## Related information

[AL method reference](../methods-auto/library.md)  
[Events in AL](../devenv-events-in-al.md)  
[Publishing events](../devenv-publishing-events.md)  
[Raising events](../devenv-raising-events.md)  
[Subscribing to events](../devenv-subscribing-to-events.md)  
[Isolated events](../devenv-events-isolated.md)  
[Method attributes](devenv-method-attributes.md)
