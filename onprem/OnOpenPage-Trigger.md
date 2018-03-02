---
title: "OnOpenPage Trigger"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c6b911c1-55b2-4837-b1af-32dbe64f84e3
caps.latest.revision: 11
manager: edupont
---
# OnOpenPage Trigger
Executed after a page is initialized and run.  
  
## Syntax  
  
```  
  
OnOpenPage()  
```  
  
## Applies To  
  
-   Pages  
  
## Remarks  
 This trigger is executed after the [OnInit Trigger](OnInit-Trigger.md).  
  
 You use the OnOpenPage trigger to change dynamic properties, including those which can only be changed when the page is opened, such as the [Visible Property](Visible-Property.md). You can also write to the database from the trigger.  
  
 The `OnOpenPage` trigger is the only trigger that can toggle the [Visible Property](Visible-Property.md) and the property can only be toggled on columns. This is true for all of the [!INCLUDE[navnow](includes/navnow_md.md)] clients.  
  
 If an error occurs in the trigger execution, then the page closes.  
  
> [!NOTE]  
>  If you use the [LOCKTABLE Function \(Record\)](LOCKTABLE-Function--Record-.md) in the OnOpenPage trigger, then the table lock will be released when the trigger completes execution and not when the user closes the page.  
  
> [!NOTE]  
>  The OnOpenPage trigger does not support calls to control add-in methods and properties because the trigger is invoked before the page is instantiated. For more information see, [Exposing Methods and Properties in a Windows Client Control Add-in](Exposing-Methods-and-Properties-in-a-Windows-Client-Control-Add-in.md).