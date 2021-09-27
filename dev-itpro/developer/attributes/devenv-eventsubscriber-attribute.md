---
title: "EventSubscriber Attribute"
description: "Specifies the event to which the method subscribes."
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

# EventSubscriber Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies the event to which the method subscribes.


## Applies To

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
> Use the `Shift+Alt+E` shortcut in the AL code editor to invoke the list of all events. Select the one you want to subscribe to and an event subscriber for the event will be inserted.

The value of the *ObjectType* argument will depend on the type of event: business, integration, and trigger.

- Business and integration events are published by event publisher methods in any of the valid object types. To subscribe to a business or integration type event, you specify the object that contains the event publisher method that defines the event.

- Trigger events are system events that are automatically declared and published in table and page object. To subscribe to a trigger event, you specify the `Table` or `Page`, depending on where the trigger published from.

> [!IMPORTANT]
> If the *ObjectType* is set to `Table`, you speficy *ObjectId* by its name using the syntax `Database::<ObjectName>`, instead of `Table::<ObjectName>`.

For the *SkipOnMissingLicense* and *SkipOnMissingPermission* arguments, **True** will ignore the method call, and the code execution will continue to the next subscriber; **false** will throw an error and the code execution stops. **false** is the default. 

## Example 1
This example publishes an integration type event by using the **OnAddressLineChanged** method. The method takes a single text data type parameter. The *IncludeSender* and *GlobalVarAccess* arguments are set to **false**.

```AL
codeunit 50105 MyEventPublisher
{
    [IntegrationEvent(false, false)]
    procedure OnAddressLineChanged(line : Text[100]);
    begin
    end;
}

codeunit 50106 MyEventSubscriber
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::MyEventPublisher, 'OnAddressLineChanged', '', true, true)]
    local procedure MyProcedure(line: Text[100])
    begin
    end;
}
```

## Example 2

In this example, the **OnAfterValidateLocationCodePurchase** method is subscribed to an [OnAfterValidateEvent (Table) Trigger Event](../triggers-auto/events/table/devenv-onaftervalidateevent-table-trigger.md). Therefore, it is executed after a field in the `"Purchase Line"` table is validated, after its value has been changed.

```AL
codeunit 50107 MyEventSubscriber
{
    // Update Purchase Line Jurisdiction Type once a Location Code change has been validated.

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterValidateEvent', 'Location Code', false, false)]
    local procedure OnAfterValidateLocationCodePurchase(var Rec: Record "Purchase Line")
    begin
        UpdateJurisdictionType(Rec);
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