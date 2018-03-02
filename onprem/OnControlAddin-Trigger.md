---
title: "OnControlAddin Trigger"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c0de4666-35c8-4229-8356-f33c523fb16a
caps.latest.revision: 17
manager: edupont
---
# OnControlAddin Trigger
Executed when a control add-in on the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] page sends event information to the server-side business logic. You add C/AL code to process the data that is sent with the event.  

## Syntax  

```  

OnControlAddin(Index ; Data)  
```  

#### Parameters  
 *Index*  
 Type: Integer  

 An integer identifier that a control add-in sends with the event.  

 *Data*  
 Type: Text or BigText  

 A text string that a control add-in sends with an event.  

> [!NOTE]  
>  The data type is determined by the binding target that is specified in the [SourceExpr Property](SourceExpr-Property.md) of the page field control. If the binding target is of type BigText, then the Data parameter is BigText. Otherwise, the Data parameter is Text  

## Applies To  

-   Page field controls  

## Remarks  
 An example of an event is when a user chooses a button in the control add-in user interface or when a user changes a value in a field. A control add-in can use events like these to invoke the OnControlAddin trigger and pass information as an integer in the *Index* parameter and as a text string in the *Data* parameter. To process the information, you add the C/AL code to the OnControlAddin trigger. For more information, see [Exposing Events and Calling Respective C/AL Triggers from a Windows Client Control Add-in](Exposing-Events-and-Calling-Respective-C-AL-Triggers-from-a-Windows-Client-Control-Add-in.md).  

## Example  
 The following is an example of C/AL code on a OnControlAddin trigger that takes a text string that is received from a control add-in event and then displays the text string in a message window. Because the information is a text string, the *Data* parameter is used. To see how to develop and use a sample control add-in that implements this event, see [Walkthrough: Creating and Using a Windows Client Control Add-in](Walkthrough--Creating-and-Using-a-Windows-Client-Control-Add-in.md).  

```  
Message(Data);  
```  

## See Also  
 [Windows Client Control Add-in Overview](Windows-Client-Control-Add-in-Overview.md)   
 [Developing Windows Client Control Add-ins](Developing-Windows-Client-Control-Add-ins.md)   
 [Exposing Events and Calling Respective C/AL Triggers from a Windows Client Control Add-in](Exposing-Events-and-Calling-Respective-C-AL-Triggers-from-a-Windows-Client-Control-Add-in.md)   
 [How to: Set Up a Windows Client Control Add-in on a Page](How-to--Set-Up-a-Windows-Client-Control-Add-in-on-a-Page.md)
