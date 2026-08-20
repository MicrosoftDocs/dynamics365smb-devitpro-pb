---
title: "EventSubscriber attribute"
description: "Specifies the event to which the method subscribes."
ms.author: solsen
ms.date: 08/19/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# EventSubscriber attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies the event to which the method subscribes.


## Applies to

- Method

> [!NOTE]
> The **EventSubscriber** attribute can only be set inside codeunits.

## Syntax

```AL
[EventSubscriber(ObjectType: ObjectType, ObjectId: Integer, EventName: Text, ElementName: Text, SkipOnMissingLicense: Boolean, SkipOnMissingPermission: Boolean)]
```

### Arguments
*ObjectType*  
&emsp;Type: [ObjectType](../methods-auto/objecttype/objecttype-option.md)  
Specifies the type of object that publishes the event to subscribe to.  

*ObjectId*  
&emsp;Type: [Integer](../methods-auto/integer/integer-data-type.md)  
Specifies the ID of the object that that publishes the event to subscribe to. You can specify the object by its ID (integer) or by its name using the syntax `<ObjectType>::<ObjectName>`, such as `Codeunit::MyEventPublisher`. Using the name is the recommended way.  

*EventName*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Specifies the name of method that publishes the event in the object that is specified by the ObjectId parameter.  

*ElementName*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Specifies the table field that the trigger event pertains to. This argument only requires a value for database trigger events, that is, when the *ObjectType* is set to **table** and the *EventName* argument is a validate trigger event, such as `OnAfterValidateEvent`.  

*SkipOnMissingLicense*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
Specifies what happens to the event subscriber method call when the Dynamics 365 Business Central license of the user account that is running the current session does not include the codeunit that contains the subscriber method.  

*SkipOnMissingPermission*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
Specifies what happens to the subscriber method call when the user account that is running the current session does not have permission to the codeunit that contains the event subscriber method.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

> [!TIP]
> Use the <kbd>Shift</kbd>+<kbd>Alt</kbd>+<kbd>E</kbd> shortcut in the AL code editor to open the list of [business](devenv-businessevent-attribute.md), [integration](devenv-integrationevent-attribute.md), and [internal](devenv-internalevent-attribute.md) events. Select an event to insert an event subscriber.

The `ObjectType` value depends on whether you subscribe to a business, integration, internal, or trigger event.

- Business, integration, and internal events are published by event publisher methods. Specify the object that contains the publisher method.

- Trigger events are system events published by table and page objects. Set `ObjectType` to `ObjectType::Table` for a table trigger event or `ObjectType::Page` for a page trigger event. For `ObjectId`, use `Database::<ObjectName>` for a table or `Page::<ObjectName>` for a page.

> [!IMPORTANT]  
> For a table event, specify `ObjectId` by name with `Database::<ObjectName>`, not `Table::<ObjectName>`.

For `SkipOnMissingLicense` and `SkipOnMissingPermission`, `true` skips the subscriber call when the required license or permission is missing. Execution then continues with the next subscriber. The default value, `false`, raises an error instead.

## Integration event example
This example publishes an integration type event by using the `OnAddressLineChanged` method. The method takes one `Text` parameter. The `IncludeSender` and `GlobalVarAccess` arguments are set to `false`.

```AL
codeunit 50105 MyEventPublisher
{
    [IntegrationEvent(false, false)]
    procedure OnAddressLineChanged(Line: Text[100])
    begin
    end;
}

codeunit 50106 MyEventSubscriber
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::MyEventPublisher, 'OnAddressLineChanged', '', true, true)]
    local procedure MyProcedure(Line: Text[100])
    begin
    end;
}
```

## Table trigger event example

In this example, the `OnAfterValidateLocationCodePurchase` method subscribes to the [OnAfterValidateEvent table trigger event](../triggers-auto/events/table/devenv-onaftervalidateevent-table-trigger.md). It runs after the `"Purchase Line"` table's `"Location Code"` field is validated.

```AL
codeunit 50107 MyEventSubscriber
{
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterValidateEvent', 'Location Code', false, false)]
    local procedure OnAfterValidateLocationCodePurchase(var Rec: Record "Purchase Line")
    begin
        // Add logic that runs after the Location Code field is validated.
    end;
}
```

## Related information
[AL method reference](../methods-auto/library.md)  
[Events in AL](../devenv-events-in-al.md)  
[Publishing events](../devenv-publishing-events.md)   
[Raising events](../devenv-raising-events.md)   
[Subscribing to events](../devenv-subscribing-to-events.md)   
[Method attributes](devenv-method-attributes.md)
