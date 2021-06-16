---
title: "BusinessEvent Attribute"
description: "Specifies that the method is published as a business type event."
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

# BusinessEvent Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies that the method is published as a business type event.


## Applies To

- Method


## Syntax

```
[BusinessEvent(IncludeSender: Boolean)]
```

### Arguments
*IncludeSender*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
Specifies that the firing instance of the object is available as a parameter to subscribers of that event.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Snippet support
Typing the shortcut `teventbus` will create the basic BusinessEvent attribute syntax when using the [!INCLUDE[d365al_ext_md](../../includes/d365al_ext_md.md)] in Visual Studio Code.

## Remarks
For more information about the different event types, see [Event Types](../devenv-event-types.md).

When you set the *IncludeSender* argument to **true**, the signature of event subscriber methods that subscribe to the published event automatically include a VAR parameter for the published event object, as shown in the following example:

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
    local procedure MySubscriber(sender: Codeunit MyPublishingCodeunit)
    begin
        // My subscriber code
    end;
}
```

## Example
This example publishes a business type event by using the `OnAddressLineChanged` method. The method takes a single text data type parameter. The IncludeSender argument is set to **false**.

```AL
[BusinessEvent(false)] 
procedure OnAddressLineChanged(line : Text[100]);
begin    
end;
```  

## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  