---
title: "Raising Events"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 98c53cfb-5eb8-441f-9b88-b6020fefa3cf
caps.latest.revision: 5
manager: edupont
---
# Raising Events
After an event has been published by an event publisher function, you can modify the application to raise the event where it is needed. Subscribers of an event will not react on the event until it is raised in the application.  

 To raise an event, you add logic in C/AL code of the application to call the event publisher function that declares the event. The procedure for calling the event publisher function is the same as calling any other function in C/AL.  

 When the code that calls the event publisher function is run, then all event subscriber functions that subscribe to the event are run. If there are multiple subscribers, then each event subscriber function is run one after another. The order in which the event subscribers run is random and cannot it cannot be specified.  

 If there are no subscribers to the published event, then the line of code that calls the event publisher function is ignored and not executed.  

## Example  
 You want to raise an event when a user changes the **Address** field on the page **21 Customer Card**. The event is published by the event publisher function **OnAddressedLineChanged** in the codeunit **My Publishers**. The event publisher function **OnAddressedLineChanged** accepts a single text parameter. To raise the event this, you complete the following steps in the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)]:  

1.  Add the following C/AL variable to page 21 Customer Card.  

    |Variable name|DataType|Subtype|  
    |-------------------|--------------|-------------|  
    |Publisher|Codeunit|My Publisher|  

2.  In C/AL code, add code on the **Address - OnValidate \(\)** trigger to call the OnAddressLineChanged function.  

    ```  
    Publisher.OnAddressLineChanged(Address);  

    ```  

 For step-by-step instructions for this example, see [Walkthrough: Publishing, Raising, and Subcribing to an Event in Microsoft Dynamics NAV](Walkthrough--Publishing--Raising--and-Subcribing-to-an-Event-in-Microsoft-Dynamics-NAV.md).  

## See Also  
 [Publishing Events](Publishing-Events.md)   
 [Subscribing to Events](Subscribing-to-Events.md)   
 [Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md)   
 [Introducing Events](Introducing-Events.md)
