---
title: "Exposing Events and Calling Respective C/AL Triggers from a Windows Client Control Add-in"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 4baba7c1-69be-4b6a-a089-36eb2b8d436a
caps.latest.revision: 20
manager: edupont
---
# Exposing Events and Calling Respective C/AL Triggers from a Windows Client Control Add-in
The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] pages include an all-purpose [OnControlAddin Trigger](OnControlAddin-Trigger.md) on field controls that control add-ins can invoke to run C/AL code. No code is needed to introduce this event into C/AL. To invoke the **OnControlAddIn** trigger, a control add-in sends an event to [!INCLUDE[nav_server](includes/nav_server_md.md)], as shown in the following illustration.  

 ![RoleTailored client control add&#45;in events](media/NAVRTCControlAddinEvents.png "NAVRTCControlAddinEvents")  

 Events allow the control add-in to react to user interaction in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. An example of an event is when a user clicks a button in the control add-in display on the page. To program events in a control add-in, you implement the [Microsoft.Dynamics.Framework.UI.Extensibility.IEventControlAddInDefinition](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.IEventControlAddInDefinition) interface, as shown in the following example.  

```c#  
[ControlAddInExport("MyControlAddIn")]  
public class MyControlAddIn : IEventControlAddInDefinition  
{  
    ...  
}  

```  

 By firing the ControlAddIn event declared in the base interface, the add-in sends data to [!INCLUDE[nav_server](includes/nav_server_md.md)] in two attributes: **Index** and **Data**. The **Index** attribute value is an integer data type. The **Data** attribute value is a text string data type. You add C/AL code to the **OnControlAddIn** trigger to process the data.  

```  
if (this.ControlAddIn != null)  
{  
    this.ControlAddIn(100, "Test data");  
}  
```  

> [!NOTE]  
>  The **Data** attribute on the **OnControlAddIn** trigger supports both **Text** and **BigText** data types from [!INCLUDE[nav_server](includes/nav_server_md.md)]. The data type is determined by the **SourceExpr** property of the field control that is applied with the control add-in. If the **SourceExpr** property value is **BigText**, then the **Data** attribute is **BigText**. Otherwise, the **Data** attribute is **Text\[1024\]**. For more information about data types, see [C/AL Functions](C-AL-Functions.md).  

 For more information about how to create events in a control add-in, see [How to: Create a Windows Client Control Add-in](How-to--Create-a-Windows-Client-Control-Add-in.md).  

 For more information about how to set up the **OnControlAddin** trigger on a page, see [How to: Set Up a Windows Client Control Add-in on a Page](How-to--Set-Up-a-Windows-Client-Control-Add-in-on-a-Page.md).  

## Exposing Custom Events  
 To expose a public event in a control add-in, you add the event code to the control add-in class and mark it by using the managed attribute [ApplicationVisibleAttribute](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.ApplicationVisibleAttribute) in the control add-in class.  

 The following code example is from a control add-in class that exposes a simple method and property.  

```  
public delegate void TransactionEventHandler(string refNo);  

[ControlAddInExport("MyControlAddIn")]  
public class MyControlAddIn : WinFormsControlAddInBase, ...  
{  
    ...  

    //Exposes an event  
    [ApplicationVisible]  
    public event  HYPERLINK "http://127.0.0.1/roeder/dotnet/Default.aspx?Target=code://Microsoft.Dynamics.Nav.Client.TimelineVisualization:7.0.0.0:31bf3856ad364e35/Microsoft.Dynamics.Nav.Client.TimelineVisualization.TransactionEventHandler"TransactionEventHandler TransactionChanged;  
    ...  
```  

 In the example a trigger called **OnTransationChanged** will be created in the page for the respective field as soon as the add-in is assigned to the field. You can write C/AL code in the trigger, which will be run on the server when the add-in on the client fires the event.  

## See Also  
 [How to: Create a Windows Client Control Add-in](How-to--Create-a-Windows-Client-Control-Add-in.md)   
 [Developing Windows Client Control Add-ins](Developing-Windows-Client-Control-Add-ins.md)   
 [Client Extensibility API Overview](Client-Extensibility-API-Overview.md)   
 [Binding a Windows Client Control Add-in to the Database](Binding-a-Windows-Client-Control-Add-in-to-the-Database.md)   
 [Installing and Configuring Windows Client Control Add-ins on Pages](Installing-and-Configuring-Windows-Client-Control-Add-ins-on-Pages.md)   
 [Windows Client Control Add-in Overview](Windows-Client-Control-Add-in-Overview.md)
