---
title: "Publishing Events"
description: This article describes how to create an event publisher method to publish business and integration events.
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Publishing Events

The first phase of implementing an event is publishing the event. Publishing an event exposes it in the application. It provides hook up points for subscribers to register to the event, and eventually handle the event if it's raised. An event is published by adding an AL method that is set up as an event publisher.  

- Business and integration events require that you manually create an event publisher method for each event that you want to publish. An event publisher method declares the event in the application and makes it available for subscription. However, it doesn't raise the event. After an event is published, you can raise it in your application from where event subscribers can react and handle the event.  

- Trigger events don't require that you create publisher methods. Trigger events are predefined event publisher methods that are called automatically at runtime. So trigger events are readily available to subscribers by default.  

## Creating an event publisher method to publish business and integration events  
You create an event publisher method the same way you create any method in AL. But there are specific attributes that you set to make it an event publisher. Additionally, an event publisher method has the following requirements and restrictions that you must follow, otherwise you can't compile your code changes:  

- An event publisher method can't include any code except comments.  

- An event publisher method can't have a return value, variables, or text constants.  

The following procedure provides an outline of the tasks that are involved in creating an event publisher method for declaring an event. <!--NAV The tasks are performed from the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)]. For detailed step-by-step instructions for the tasks, see [Walkthrough: Publishing, Raising, and Subscribing to an Event in Microsoft Dynamics NAV](Walkthrough-Publishing-Raising-and-Subcribing-to-an-Event-in-Microsoft-Dynamics-NAV.md).-->  

### To create an event publisher method  

1.  Decide where you want to include the event publisher method.  

    You can include an event publisher method in the AL code of any object type, such as codeunit, page, or table. You can create a new object or use an existing object.  

    > [!IMPORTANT]  
    > If you include the event publisher method in a page object, the page must have a source table. Otherwise, you can't successfully create an event subscriber method to subscribe to the event.

2.  Add an AL method to the object.

    If you don't want the event publisher to be raised from other objects than the one defining it, make it a local method by affixing it with `local`. The event still remains available to event subscribers from other objects.   

     Give the method a name that has the format *On\[Event\]*, where *\[Event\]* is text that indicates what occurred, such as `OnAddressLineChanged`.  

3.  Decorate the method with either the [Integration attribute](methods/devenv-integration-attribute.md) or [Business attribute](methods/devenv-business-attribute.md) as follows: 

    ```AL
    [IntegrationEvent(IncludeSender : Boolean, GlobalVarAccess : Boolean)] 
    ```

    or

    ```AL 
    [BusinessEvent(IncludeSender : Boolean)] 
    ```

    > [!TIP]  
    > Use the `teventint` snippet for an integration event or the `teventbus` snippet for a business event to get started.  

    For more information about integration and business events, see [Event Types](devenv-event-types.md).
4.  Add parameters to the method as needed.  

     You can include as many parameters of any type as necessary.  

     Make sure to expose enough information. Parameters to enable subscriber methods to add value to the application. However, don't expose unnecessary parameters that may constrain you from changing or extending methodically in the future.  

 You can now add code to the application that raises the event by calling the event publisher method. You can also create subscriber methods that handle the event when it's raised. 

## Example
This example creates the codeunit **50100 MyPublishers** to publish an integration event. The event is published by adding the global method called `OnAddressLineChanged`. The event takes a single text data type parameter.

> [!NOTE]  
> This example is part of a larger, simple scenario where when users change the address of a customer on the page **21 Customer Card**, you want to check that the address doesn't include a plus sign (+). If it does, you want to display a message. To accomplish this, you will publish an event that is raised when the **Address** field on **Customer Card** is changed, and add an event subscriber method to that includes logic that checks the address value and returns a message to the user if it contains a plus sign. For a complete description of this scenario and all the code involved, see [Event Example](devenv-events-example.md).

```AL
codeunit 50100 MyPublishers
{
    [IntegrationEvent(false, false)]
    procedure OnAddressLineChanged(line : Text[100]);
    begin  
    end;
}
```
The next step is to raise this event in the application. To see an example for how this event is raised, go to [Raising Event Example](devenv-raising-events.md#example).

## See Also  
[Raising Events](devenv-raising-events.md)   
[Subscribing to Events](devenv-subscribing-to-events.md)   
[Events [!INCLUDE[d365fin_md](includes/d365fin_md.md)]](devenv-events-in-al.md)   
