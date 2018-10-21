---
title: "IntegrationEvent Attribute"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
redirect_url: /dynamics365/business-central/dev-itpro/developer/methods-auto/library
---
# IntegrationEvent Attribute
Specifies the method to be integration type event publisher.

## Snippet support
Typing the shortcut ```teventint``` will create the basic IntegrationEvent attribute syntax when using the [!INCLUDE[d365al_ext_md](../../includes/d365al_ext_md.md)] in Visual Studio Code.

## Syntax  
  
```  
[IntegrationEvent(IncludeSender : Boolean, GlobalVarAccess : Boolean)] 
```    
  
#### Arguments  
*IncludeSender*  
Type: Boolean  
  
Specifies whether global methods in the object that contains the event publisher method are exposed to event subscriber methods that subscribe to the event.

**True** exposes the global methods in the object that contains the event publisher function to event subscriber functions; **false** does not. The default value is **false**.

When you set the argument to **true**, the signature of event subscriber methods that subscribe to the published event automatically include a VAR parameter for the published event object, as shown in the following example:

```
codeunit 50102 MyPublishingCodeunit2
{
    [IntegrationEvent(true, true)]
    procedure MyIntegrationEvent()
    begin
    end;

    var
        myGlobalVar: Integer;
}

codeunit 50103 MySubscribingCodeunit2
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::MyPublishingCodeunit2, 'MyIntegrationEvent', '', true, true)]
    local procedure MySubscriber(sender: Codeunit MyPublishingCodeunit2; myGlobalVar: Integer)
    begin
        // My subscriber code
    end;
}
```

*GlobalVarAccess*  
Type: Boolean  

Specifies whether global variables in the object that contains the event publisher method are accessible to event subscriber methods that subscribe to the published event.

**True** exposes the global variables; **false** does not. The default value is **false**.

When you set the argument to **true**, event subscriber methods that subscribe to the event can call the global variable parameters in the object that declares the event publisher method. You must add variable parameters to the event subscriber methods manually and use a name and type that matches the variable declaration in the event publisher object.

## Remarks
For more information about the different event types, see [Event Types](../devenv-event-types.md) 

## Example
This example publishes an integration type event by using the OnAddressLineChanged method. The method takes a single text data type parameter. The IncludeSender and GlobalVarAccess arguments are set to **false**.
```
[IntegrationEvent(false, false)]
procedure OnAddressLineChanged(line : Text[100]);
begin
end;
``` 
## See Also  
 [Events in AL](../devenv-events-in-al.md)  
 [Publishing Events](../devenv-publishing-events.md)   
 [Raising Events](../devenv-raising-events.md)   
 [Subscribing to Events](../devenv-subscribing-to-events.md)   
 [Method Attributes](devenv-method-attributes.md)