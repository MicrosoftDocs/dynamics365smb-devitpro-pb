---
title: "IntegrationEvent Attribute"
description: "Specifies that the method is published as an integration type event."
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

# IntegrationEvent Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies that the method is published as an integration type event.


## Applies To

- Method


## Syntax

```AL
[IntegrationEvent(IncludeSender: Boolean, GlobalVarAccess: Boolean)]
```

### Arguments
*IncludeSender*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
Specifies whether global methods in the object that contains the event publisher method are exposed to event subscriber methods that subscribe to the event.  

*GlobalVarAccess*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
Specifies whether global variables in the object that contains the event publisher method are accessible to event subscriber methods that subscribe to the published event.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Snippet support

Typing the shortcut `teventint` will create the basic IntegrationEvent attribute syntax when using the [!INCLUDE[d365al_ext_md](../../includes/d365al_ext_md.md)] in Visual Studio Code.

## Remarks

When you set the *IncludeSender* argument to **true**, the signature of event subscriber methods that subscribe to the published event automatically supports a `sender` parameter for the published event object, which you must add manually (see the example). 

> [!IMPORTANT]  
> Using *GlobalVarAccess* will throw a compiler warning, which will become an error in a future release. Instead use the event parameters or mark the page or table variables as protected. For more information, see [Protected Variables](../devenv-protected-variables.md).

When you set the *GlobalVarAccess* argument to **true**, event subscriber methods that subscribe to the event can call the global variable parameters in the object that declares the event publisher method. You must add variable parameters to the event subscriber method signatures manually and use a name and type that matches the variable declaration in the event publisher object (see the example).

For more information about the different event types, see [Event Types](../devenv-event-types.md).

## Example

This example publishes an integration type event by using the OnAddressLineChanged method. The method takes a single text data type parameter.

The `IncludeSender` and `GlobalVarAccess` arguments are set to **true**. This means that the signature of event subscriber method `SubcribeToOnAddressLineChangedEvent` includes:

- The `sender` parameter for event publishing codeunit `MyPublishingCodeunit`.
- A parameter for the global variable `myGlobalVar` defined in the publishing codeunit `MyPublishingCodeunit`.

```AL
codeunit 50102 MyPublishingCodeunit
{
    [IntegrationEvent(true, true)]
    procedure OnAddressLineChangedEvent(line : Text[100])
    begin
    end;

    var
        myGlobalVar: Integer;
}

codeunit 50103 MySubscribingCodeunit
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::MyPublishingCodeunit, 'OnAddressLineChangedEvent', '', true, true)]
    local procedure SubcribeToOnAddressLineChangedEvent(sender: Codeunit MyPublishingCodeunit; myGlobalVar: Integer)
    begin
        // My subscriber code
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