---
title: "Walkthrough: Publishing, Raising, and Subcribing to an Event in Microsoft Dynamics NAV"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 28c99fd4-223e-4616-a13c-1e4205001bf8
caps.latest.revision: 9
manager: edupont
---
# Walkthrough: Publishing, Raising, and Subcribing to an Event in Microsoft Dynamics NAV
This walkthrough uses a simple example scenario to demonstrate how to program events in the application.  
  
## About This Walkthrough  
 The walkthrough illustrates the following tasks:  
  
-   Creating an event publisher function to publish an event.  
  
-   Adding code to application to raise the published event.  
  
-   Creating an event subscriber function to subscribe to a published event.  
  
-   Adding code to the event subscriber function to handle the raised event  
  
### Prerequisites  
 To complete this walkthrough, you will need:  
  
-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] with a developer license.  
  
-   [!INCLUDE[demolong](includes/demolong_md.md)].  
  
## Story  
 When users change the address of a customer, you want to check that the address does not include invalid characters, which in this walkthrough is a plus sign \(+\). To accomplish this, you will publish an event that is raised when the **Address** field on page **21 Customer Card** is changed. To handle the event when it is raised, you will add an event subscriber function that includes logic that checks the address value and returns a message to the user if it contains a plus sign.  
  
> [!NOTE]  
>  Most of the tasks are performed from the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)].  
  
## Publishing the Event  
 To publish an event, you create a C/AL function that is set up to be an event publisher. An event publisher function can be added in any object, such as a codeunit, page, or table. This procedure will add the event publisher function to a new codeunit, in which you can potentially add more event publisher functions for other events later. Because you might want to change this event implementation in the future, you decide to create an integration event type. The event publisher requires a single text parameter for handling the address of the customer.  
  
###  <a name="CreateCU"></a> To create a new codeunit  
  
1.  Open the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], and then connect to the [!INCLUDE[demoname](includes/demoname_md.md)] company.  
  
     For more information, see [How to: Open Databases](How-to--Open-Databases.md).  
  
2.  On the **Tools** menu, choose **Object Designer**, choose **Codeunit**, and then choose **New**.  
  
     The **C/AL Editor** opens.  
  
3.  On the **File** menu, choose **Save**.  
  
4.  On the **Save** window, enter **50000** in the **ID** field and enter **My Publishers**  in the **Name** field.  
  
5.  Make sure the **Compiled** check box is selected, and then choose the **OK** button.  
  
 The codeunit for the event publisher is created. Keep the C/AL editor open for the next task. You can now add the event publisher function to publish the event.  
  
#### To create the event publisher function to publisher the event  
  
1.  On the **View** menu, choose **C/AL Globals**.  
  
2.  In the **C/AL Globals** window, choose the **Functions** tab.  
  
3.  In a blank row, in the **Name** field, enter **OnAddressLineChanged**.  
  
4.  To open the properties for the **OnAddressLineChanged** function, select the function, and then in the **View** menu, choose **Properties**. Set the properties as follows:  
  
    1.  Set the **Local** property to **No**.  
  
         Setting this property makes the function available to be called from the other objects. For more information about this property, see [Local Property](Local-Property.md).  
  
    2.  Set the **Event** property to **Publisher**. This makes the function an event publisher.  
  
         For more information, see [Event Property](Event-Property.md).  
  
    3.  Set the **EventType** property to **Integration**.  
  
         For more information, see [EventType Property](EventType-Property.md).  
  
    4.  Close the **Properties** window.  
  
5.  Add a local parameter to the function for the address of the customer as described in the following steps:  
  
    1.  On the **Functions** tab, select the **OnAddressLineChanged** function, and then choose the **Locals** button.  
  
         The **C/AL Locals** window opens.  
  
    2.  On the **Parameters** tab, in the **Name** field, enter **line**.  
  
    3.  Set the **DataType** field to **Text**.  
  
    4.  Set the **Length** field to 100.  
  
        > [!IMPORTANT]  
        >  An event publisher function cannot have a return value, variables, or text constants; otherwise you will not be able to compile the function.  
  
    5.  Close the **C/AL Locals** window.  
  
6.  Close the **C/AL Globals** window.  
  
 The new function appears in the **C/AL Editor** with the following signature:  
  
 `[IntegrationEvent] OnAddressLineChanged(line : Text[100])`  
  
 You can now raise the event in the application.  
  
## Raising the Event  
 After you create the event publisher function to publish the event, you can add code to the application to raise the event where it is required. In this case, you want to raise the event when the **Address** field is changed on the page **21 Customer Card**. Therefore, you will add code to the **Address - OnValidate\(\)** trigger in C/AL code of the page. Raising an event basically involves calling the event publisher function that publishes the event.  
  
#### To raise the event  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], open page **21 Customer Card** as follows:  
  
    1.  On the **Tools** menu, choose **Object Designer**, and then choose **Page**.  
  
    2.  Select page **21 Customer Card**, and then choose the **Design** button.  
  
2.  Add a C/AL variable that specifies the object that publishes the event. In this case, the event publisher object is codeunit **50000 My Publishers**, which contains the event publisher function **OnAddressLineChanged** that you created in the previous procedure.  
  
    1.  On the **View** menu, choose **C/AL Globals**.  
  
    2.  On a blank row, in the **Name** field, enter **Publisher**.  
  
    3.  Set the **DataType** field to **Codeunit**.  
  
    4.  In the **Subtype** field, select codeunit **50000 My Publishers**.  
  
    5.  Close the **C/AL Globals** window.  
  
3.  In C/AL code, add the following code on the **Address - OnValidate\(\)** trigger to raise the event:  
  
    ```  
    Publisher.OnAddressLineChanged(Address);  
    ```  
  
     This calls the event publisher function to raise the event.  
  
4.  On the **File** menu, choose **Save** to save and compile the changes to the page.  
  
 The event can now be subscribed to and handled.  
  
## Subscribing to and Handling an Event  
 Once an event has been published you can add code to the application that subscribes to and handles the event when it is raised. For example, in this walkthrough, when a user changes the address of a customer \(the event\), you want code that checks that the value does not contain a plus sign. Subscribing to and handling an event is accomplished by creating a C/AL function that is set up as an event subscriber and subscribes to a specific event \(defined by an event publisher function\). The event subscription function contains the application logic for handling the raised event. For this walkthrough, you will create an event subscriber function that subscribes to the **OnAddressLineChanged** function in codeunit **50000 My Publishers**.  
  
 Unlike an event publisher function, an event subscriber function can only reside in a codeunit object. This procedure will add the event subscriber function to a new codeunit, in which you can potentially add more event subscriber functions for other events later.  
  
#### To create a new codeunit  
  
-   In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], create a new codeunit that has the ID **50001** and the name **My Subscribers**.  
  
     For more information, see [To create a new codeunit](Walkthrough--Publishing--Raising--and-Subcribing-to-an-Event-in-Microsoft-Dynamics-NAV.md#CreateCU).  
  
#### To create the event subscriber function to subscribe to and handle the event  
  
1.  On the **View** menu, choose **C/AL Globals**.  
  
2.  In the **C/AL Globals** window, choose the **Functions** tab.  
  
3.  In a blank row, in the **Name** field, enter **CheckAddressLine**.  
  
4.  To open the properties for the **CheckAddressLine** function, select the function, and then in the **View** menu, choose **Properties**. Set the properties as follows:  
  
    1.  Set the **Event** property to **Subscriber** to make the function an event subscriber.  
  
    2.  Set the **EventPublisherObject** property to **Codeunit My Publishers**.  
  
         This is the codeunit that contains the event publisher function \(**OnAddressLineChanged**\) that you want to subscribe to.  
  
    3.  In the **EventFunction** property, select the **OnAddressLineChanged** integration event.  
  
         This field reads all the published events in the event publisher object.  
  
        > [!NOTE]  
        >  When you get a message that asks whether you want to overwrite the edited function's signature, choose **Yes** to continue.  
  
    4.  Close the **Properties** window to return to the **C/AL Globals** window.  
  
5.  A local parameter that has the name **line** and the data type **Text** has been automatically added to the new **CheckAddressLine** function. To verify this, select the function in **C/AL Globals** window, choose the **Locals** button, and then see the **Parameters** tab.  
  
     Close the C/AL Locals window when done.  
  
6.  Close the **C/AL Globals** window.  
  
     The new function appears in the **C/AL Editor** with the following signature:  
  
     `[EventSubscriber] CheckAddressLine(line : Text[100])`  
  
     You can now add code to handle the event.  
  
7.  To handle the event, add the following code to the `CheckAddressLine` function in the C/AL editor:  
  
    ```  
    IF (STRPOS(line, '+') > 0) THEN BEGIN  
     MESSAGE('Cannot use a plus sign (+) in the address [' + line + ']');  
    END  
    ```  
  
     This code checks the value of the **Address** field on page **21 Customer Card** when is has been changed and returns a message if the value contains a plus sign.  
  
## Viewing the New Event Subscription  
 After you create an event subscriber, you can view information about it in page **9510 Event Subscriptions**. This page provides information about all the current event subscriptions in the application. You can open this page directly from the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] or from a [!INCLUDE[navnow](includes/navnow_md.md)] client.  
  
#### To view the event subscription from the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]  
  
-   On the **Tools** menu, choose **Debugger**, and then choose **Event Subscriptions**.  
  
#### To view the event subscription from a [!INCLUDE[navnow](includes/navnow_md.md)] client  
  
1.  Start the [!INCLUDE[navnow](includes/navnow_md.md)] client.  
  
2.  In the **Search** box, enter **Sessions**, and then choose the related link.  
  
3.  On the **Home** tab, in the **Events** group, choose **Subscriptions**.  
  
## Testing the Event  
 To test the event implementation, you can run page **21 Customer Card** from the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)].  
  
#### To test the event  
  
1.  In Object Designer, choose **Page**.  
  
2.  Select page **21 Customer Card**, and then choose the **Run** button.  
  
     A customer card opens in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
3.  On the **Home** tab, in the **Manage** group, choose **Edit**.  
  
4.  In the **Address** field, add a plus sign, and then choose the **OK** button.  
  
     The following message appears:  
  
     `Cannot use a plus sign (+) in the address [].`  
  
     \[\] contains the value of the **Address** field.  
  
## See Also  
 [Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md)   
 [Introducing Events](Introducing-Events.md)   
 [Publishing Events](Publishing-Events.md)   
 [Raising Events](Raising-Events.md)   
 [Subscribing to Events](Subscribing-to-Events.md)   
 [Debugging Events](Debugging-Events.md)