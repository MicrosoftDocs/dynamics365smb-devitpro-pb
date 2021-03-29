---
title: "Subscribing to Events in a .NET Framework Type"
description: "How to subscribe to event in a .NET Framework Type"
author: solsen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Subscribing to Events in a .NET Framework Type
With .NET Framework interoperability in [!INCLUDE[prod_long](includes/prod_long.md)] objects, you can configure a DotNet variable to subscribe to events that are published by a .NET Framework type. Events are handled by triggers in the AL code of the [!INCLUDE[prod_short](includes/prod_short.md)] object. 

You start by declaring in AL the usage of two .NET types from the `System` assembly. The first type is `System.Timers.Timer` and it will be used to generate .NET events. The second one is called `System.Timers.ElapsedEventArgs` and it is required for creating a subscriber to the `Elapsed` event emitted by the `Timer` type.

```AL
dotnet
{
    assembly(System)
    {
        type(System.Timers.Timer; MyTimer) {}
        type(System.Timers.ElapsedEventArgs; MyElapsedEventArgs) {}
    }
}
```

You can only subscribe to events that are emitted by global variables of the .NET type marked with the `WithEvents` attribute.
For all the global variables that are marked with this attribute, the compiler will expose the events available on the type as triggers on the variable.
The syntax for declaring these triggers is `{VariableName}::{EventName}(...ParameterList)`, but IntelliSense will offer suggestions for the event name and autocomplete the parameter list.

```AL
pageextension 50101 CustomerListExt extends "Customer List"
{
    var 
        [WithEvents]
        timer: DotNet MyTimer;
    
    trigger OnOpenPage()
    begin
        SetupTimer();
    end;

    procedure SetupTimer()
    begin 
        timer := timer.Timer(2000);
        timer.AutoReset := true;
        timer.Enabled := true; 
        timer.Start();
    end;

    trigger timer::Elapsed(sender: Variant; e: DotNet MyElapsedEventArgs)
    begin
     // Print a message when this event is published 
        Message('%1', e.SignalTime());
        timer.Stop();
    end;
}
```


## See Also  
[Getting started with Microsoft .NET Interoperability from AL](devenv-get-started-call-dotnet-from-al.md)   
[.NET Control Add-Ins](devenv-dotnet-controladdins.md)   
[Serializing .NET Framework Types](devenv-dotnet-serializing-dotnetframework-types.md)   
[Method Attributes](methods/devenv-method-attributes.md)  
[AL Language Extension Configuration](devenv-al-extension-configuration.md)  
