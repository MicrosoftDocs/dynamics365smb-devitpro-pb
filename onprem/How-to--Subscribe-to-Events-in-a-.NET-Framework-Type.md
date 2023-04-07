---
title: "How to: Subscribe to Events in a .NET Framework Type"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: f8bf546a-c619-4c88-b570-1a56a5c581e6
caps.latest.revision: 14
---
# How to: Subscribe to Events in a .NET Framework Type
With .NET Framework interoperability in [!INCLUDE[navnow](includes/navnow_md.md)] objects, you can configure a DotNet variable to subscribe to events that are published by a .NET Framework type. Events are handled by triggers in the C/AL code of the [!INCLUDE[navnow](includes/navnow_md.md)] object. To configure a DotNet variable to subscribe to events published by a .NET Framework class, you set the [WithEvents Property](WithEvents-Property.md) of the DotNet variable. A trigger is automatically added in the C/AL code for each event that is exposed by the .NET Framework type. For more information about events in NET Framework Interoperability, see [Handling Events with Microsoft .NET Framework Interoperability](Handling-Events-with-Microsoft-.NET-Framework-Interoperability.md).  

> [!IMPORTANT]  
>  You can only subscribe to events on a DotNet variable that is defined as global variable.  

### To subscribe to events published by a .NET Framework type  

1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], open the [!INCLUDE[navnow](includes/navnow_md.md)] object that uses .NET Framework interoperability, and then open the C/AL code.  

2.  On the **View** menu, choose **C/AL Globals**.  

3.  On the **Variables** tab, select the DotNet variable, and then on the **View** menu, choose **Properties**.  

4.  In the **Properties** window, set the **WithEvents** property to **Yes**.  

     For each event that is exposed by the .NET Framework class, a blank trigger is added to the C/AL code. The triggers have the following format.  

    ```  

    DotNetVariable :: Event (sender : Variant;e DotNet "EventArgs")  
    ```  

    -   `DotNetVariable` is the name of the DotNet variable that subscribes to the event.  

    -   `Event` is the name of the event published by the .NET Framework class  

    -   `()` will contain any parameters that the event has.  

5.  Add code to the event triggers to handle the events.  

## Example  
 The following code example implements a simple synchronous event that will invoke a C/AL trigger without any parameters. You will create a .NET Framework assembly that contains the event, and then subscribe to the event in the C/AL code of a [!INCLUDE[navnow](includes/navnow_md.md)] codeunit.  

#### To create and deploy the assembly that includes an event  

1.  In Visual Studio, create a C\# class library project that is called *MyEvent*.  

2.  Add the following code that implements the ChangedEvent event in the EventsNoArgs class.  

    ```c#  
    namespace MyEvent  
    {  
        public class EventsNoArgs  
        {  
            public delegate void ChangedEventHandler();  
            public event ChangedEventHandler ChangedEvent;  

            // Invoke the ChangedEvent  
            protected virtual void OnChangedEvent()  
            {  
                if (ChangedEvent != null)  
                {  
                    ChangedEvent();  
                }  
            }  

            // The following method is exposed to C/AL and will invoke the event trigger that is registered in the ChangedEvent variable.   
            public void FireEvent()  
            {  
                OnChangedEvent();  
            }  
        }  

    }  

    ```  

3.  Build the project.  

4.  Copy the MyEvent.dll file to the computer that is running the [!INCLUDE[navnow](includes/navnow_md.md)] development environment. You must copy the assembly to the Add-ins folder of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[nav_server](includes/nav_server_md.md)] installation folders. The default path of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] installation folder is [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\RoleTailored Client or [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]RoleTailored Client. The default path of the [!INCLUDE[nav_server](includes/nav_server_md.md)] installation folder is [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\Service.  

#### To subscribe to the event in C/AL  

1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], create a new codeunit.  

2.  Create the following global C/AL variables.  

    |Variable name|DataType|SubType|  
    |-------------------|--------------|-------------|  
    |eventVar|DotNet|MyEvent.EventsNoArgs|  
    |counter|Integer||  

3.  Open the properties for the eventVAR variable, and then set the [WithEvents Property](WithEvents-Property.md) to **Yes**.  

     The `eventVar::ChangedEvent()` trigger is added to the C/AL.  

4.  On the `OnRun` trigger, add the following code.  

    ```  
    //Reset the global counter to zero.  
    counter := 0;  
    // Construct the DotNet object that implements the event.  
    eventVar := eventVar.EventsNoArgs();  

    // Fire the event three times.  
    eventVar.FireEvent();  
    eventVar.FireEvent();  
    eventVar.FireEvent();  

    // Inspect the counter and raise an error if the count does not match the number of events fired.  
    if counter <> 3 then error(‘Unexpected count value, %1’, counter);  
    message(‘Received %1 events’, counter);  

    ```  

5.  On the `eventVar::ChangedEvent()` trigger, add the following code to increment the counter variable.  

    ```  
    counter += 1;  
    ```  

6.  Save and compile the codeunit.  

7.  To test the event, in Object Designer, select the codeunit, and then choose **Run**.  

     The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] opens and the message “Received 3 events” appears.  

     If you remove one of the `eventVar.FireEvent();` statements, and then compile and run the codeunit again, you will get an error message.  

## See Also  
 [Handling Events with Microsoft .NET Framework Interoperability](Handling-Events-with-Microsoft-.NET-Framework-Interoperability.md)   
 [Extending Microsoft Dynamics NAV Using Microsoft .NET Framework Interoperability](Extending-Microsoft-Dynamics-NAV-Using-Microsoft-.NET-Framework-Interoperability.md)   
 [Calling .NET Framework Members from C/AL](Calling-.NET-Framework-Members-from-C-AL.md)
