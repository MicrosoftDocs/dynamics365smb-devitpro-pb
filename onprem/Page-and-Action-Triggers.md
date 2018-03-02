---
title: "Page and Action Triggers"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1282d6c0-be0e-4399-b948-848d1f0c700e
caps.latest.revision: 17
manager: edupont
---
# Page and Action Triggers
Page triggers allow you to use C/AL code to control the behavior of the system as a result of an event on the page, such as a page opening or a field changing its value. You typically use page triggers for advanced validation and logic.  

Page triggers can be divided into three categories:  

-   General page triggers that apply to the entire page  

-   Field page triggers that apply to a field control on a page  

-   Action triggers that apply to an action on a page.  

> [!IMPORTANT]  
>  If you define two functions that have the same name, one defined in a page and the other in a table that is referenced by the page, you cannot invoke the function defined in the page directly. By default, a call to the function invokes the function that is defined in the table. This behavior occurs when the function is called from a source expression or a trigger.  

## General Triggers  
 The following table lists triggers that apply to the entire page.  

|Page trigger name|Executed|  
|-----------------------|--------------|  
|[OnInit Trigger](OnInit-Trigger.md)|When the page is loaded, but before the controls are available.|  
|[OnOpenPage Trigger](OnOpenPage-Trigger.md)|When the page is initialized and the controls are available.|  
|[OnClosePage Trigger](OnClosePage-Trigger.md)|When the page about to close and after [OnQueryClosePage Trigger](OnQueryClosePage-Trigger.md) trigger.|  
|[OnFindRecord Trigger](OnFindRecord-Trigger.md)|When the page is opened and a record is retrieved from a table.|  
|[OnNextRecord Trigger](OnNextRecord-Trigger.md)|When the page changes from displaying one record to another record in a table. For example, on a Customer card page, this happens when a user selects **Next** \(Ctrl+Page Down\) or **Previous** \(Ctrl+Page Up\).|  
|[OnAfterGetCurrRecord Trigger](OnAfterGetCurrRecord-Trigger.md)|After the current record is retrieved from the table.|  
|[OnAfterGetRecord Trigger](OnAfterGetRecord-Trigger.md)|When a record has been retrieved but not yet displayed.|  
|[OnNewRecord Trigger](OnNewRecord-Trigger.md)|When a new record has been initialized but not yet displayed.|  
|[OnInsertRecord Trigger](OnInsertRecord-Trigger.md)|When a new record is about to be inserted in the table.|  
|[OnModifyRecord Trigger](OnModifyRecord-Trigger.md)|When a record is about to be modified in the table.|  
|[OnDeleteRecord Trigger](OnDeleteRecord-Trigger.md)|When a record is about to be deleted from the table.|  
|[OnQueryClosePage Trigger](OnQueryClosePage-Trigger.md)|When the page is about to close, but before the [OnClosePage Trigger](OnClosePage-Trigger.md).|  

## Field Triggers  
 The following table describes the triggers that are available on field controls.  

|Control trigger|Executed|  
|---------------------|--------------|  
|[OnValidate \(Page fields\) Trigger](OnValidate--Page-fields--Trigger.md)|When the user changes the value in a field and then selects away from the field so that the field loses focus.|  
|[OnLookup \(Page fields\) Trigger](OnLookup--Page-fields--Trigger.md)|When the user requests a lookup by clicking a field's lookup button or pressing F4.|  
|[OnDrillDown Trigger](OnDrillDown-Trigger.md)|When the user requests a drill-down by choosing the field's drill-down button or pressing Shift+F8.|  
|[OnAssistEdit Trigger](OnAssistEdit-Trigger.md)|When the user requests assist-edit by choosing an AssistEdit button or by pressing Shift+F4.|  
|[OnControlAddin Trigger](OnControlAddin-Trigger.md)|When a control add-in is initiated on a page.|  

## Action Triggers  
 The following table lists triggers that apply to actions on a page.  

|Triggers|Executed|  
|--------------|--------------|  
|[OnAction Trigger](OnAction-Trigger.md)|When an action is initiated on a page.|  

## See Also  
 [Triggers](Triggers.md)
