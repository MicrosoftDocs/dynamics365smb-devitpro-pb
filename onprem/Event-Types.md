---
title: "Event Types"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 34b5f1e6-6916-45bf-a7c2-2c845f71e382
caps.latest.revision: 12
---
# Event Types
[!INCLUDE[navnow](includes/navnow_md.md)] supports different types of events for different purposes. This topic describes the following event types:  
  
-   [Business Events](Event-Types.md#BusinessEvents)  
  
-   [Integration Events](Event-Types.md#IntegrationEvents)  
  
-   [Global Events](Event-Types.md#SystemEvents)  
  
-   [Database Trigger Events](Event-Types.md#DatabaseEvents)  
  
-   [Page Trigger Events](Event-Types.md#PageEvents)  
  
##  <a name="BusinessEvents"></a> Business Events  
 A business event is a custom event that is raised by C/AL code. It defines a formal contract that carries an implicit promise not to change in future releases. It is the expectation that business events are published by solution ISVs, including Microsoft.  
  
 Business events can be compared with publicly released APIs on which 3rd party solution provider develop integrations and additions. Therefore, the downstream cost of making changes to a business event implementation can be considerable for those who use the event in their applications. There may be some cases where changes are required; however, you should keep these to an absolute minimum.  
  
 **Development considerations**  
  
 A typical business event reflects changes in “state” with regards to a process. This makes them very well suited for workflow. An example of a business event could be when a sales order has been posted. It is important to note that business events should not be tied to the implementation-details, such as the tables or fields in which the data is stored. Preferably, the event publisher developer should be free to change the implementation, while still keeping the business event intact.  
  
 Business events should be documented with the solution, including the before-state and after-state of the events.  
  
##  <a name="IntegrationEvents"></a> Integration Events  
 An integration event is also a custom event that is raised by C/AL code, like a business event, except that it does not carry the same promise of not changing, nor does it have the restriction not to expose implementation details.  
  
 The main purpose of integration events is to enable the integration of other solutions with [!INCLUDE[navnow](includes/navnow_md.md)] without having to perform traditional code modifications.  
  
 **Development considerations**  
  
 An integration event can be changed to a business event later. At which time, it must adhere to the same implied contract and commitment as any business event. It can also simply be designed-in hook points for external add-ons.  
  
##  <a name="SystemEvents"></a> Global Events  
 Global events are predefined system events that are automatically raised by Codeunit 1 **ApplicationManagement**. Codeunit 1 includes several global function triggers, such as CompanyOpen, CompanyClose, and GetSystemIndicator. For most of these global function triggers, there are one or two global events: a before and after event. For example, there is an OnBeforeCompanyOpen event and an OnAfterCompanyOpen event. The global events are defined as integration events by local functions in codeunit 1.  
  
## Trigger Events  
 Unlike business and integration events which must be programmed, trigger events are predefined events. Trigger events are published by the runtime and they cannot be raised programmatically. There are two types of trigger events as described in this section: database trigger events and page trigger events.  
  
> [!NOTE]  
>  Trigger events do not appear as functions in C/AL Editor for a table or page object in the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)].  
  
###  <a name="DatabaseEvents"></a> Database Trigger Events  
 Trigger events are automatically raised by the system when it performs database operations on a table object, such as deleting, inserting, modifying, and renaming a record, as defined in  a table . Trigger events are closely associated with the table triggers for database operations: OnDelete, OnInsert, OnModify, OnRename, and OnValidate \(for fields\). For each database operation, there is a "before" and "after" trigger event with a fixed signature.  
  
 **Available Database Trigger Events**  
  
 The following table describes the available database trigger events:  
  
|Database trigger event with signature|Description|  
|-------------------------------------------|-----------------|  
|`OnBeforeDeleteEvent(VAR Rec: Record, RunTrigger: Boolean)`|Executed before a record is deleted from a table.|  
|`OnAfterDeleteEvent(VAR Rec: Record, RunTrigger: Boolean)`|Executed after a record is deleted from a table.|  
|`OnBeforeInsertEvent(VAR Rec: Record, RunTrigger: Boolean)`|Executed before a record is inserted in a table.|  
|`OnAfterInsertEvent(VAR Rec : Record, RunTrigger : Boolean)`|Executed after a record is inserted in a table.|  
|`OnBeforeModifyEvent(VAR Rec : Record, VAR xRec : Record, RunTrigger : Boolean)`|Executed before a record is modified in a table.|  
|`OnAfterModifyEvent(VAR Rec : Record, VAR xRec : Record, RunTrigger : Boolean)`|Executed after a record is modified in a table.|  
|`OnBeforeRenameEvent(VAR Rec : Record, VAR xRec : Record, RunTrigger : Boolean)`|Executed before a record is renamed in a table.|  
|`OnAfterRenameEvent(VAR Rec : Record, VAR xRec: Record, RunTrigger : Boolean)`|Executed after a record is renamed in a table.|  
|`OnBeforeValidateEvent(VAR Rec : Record, VAR xRec : Record, RunTrigger : Boolean; CurrentFieldNo : Integer)`|Executed before a field is validated when its value has been changed.|  
|`OnAfterValidateEvent(VAR Rec : Record, VAR xRec : Record, RunTrigger : Boolean, CurrentFieldNo : Integer)`|Executed after a field is validated when its value has been changed.|  
  
 The following table describes the parameters of the trigger events:  
  
|Parameter|Type|Description|  
|---------------|----------|-----------------|  
|*Rec*|Record|The table that raises the event.|  
|*xRec*|Record|The table that raises the event.|  
|*RunTrigger*|Boolean|Specifies whether to execute the code in the event trigger when it is invoked. If this parameter is true, the code will be executed. If this parameter is false, then the code is not executed.|  
|*CurrentFieldNo*|Integer|The number of the field that raises the event.|  
  
 **Order of Event Execution**  
  
 The relative order of execution of database trigger events, table triggers, and database operations is as follows:  
  
|Order|Item|Example|  
|-----------|----------|-------------|  
|1|Trigger event \(before\)|OnBeforeDeleteEvent|  
|2|Table trigger|OnDelete|  
|3|Global table trigger in codeunit 1|OnDatabaseDelete|  
|4|Database operations|Delete the record|  
|5|Trigger event \(after\)|OnAfterDeleteEvent|  
  
###  <a name="PageEvents"></a> Page Trigger Events  
 Page Trigger events are raised automatically by the system when it performs certain operations in a page object. Page trigger events are closely associated with the standard page triggers, such as OnOpenPage. OnClosePage, and OnAction.  
  
 **Available Page Trigger Events**  
  
 The following table describes the available page trigger events:  
  
|Trigger event with signature|Description|  
|----------------------------------|-----------------|  
|`OnBeforeActionEvent(VAR Rec : Record)`|Executed before the [OnAction Trigger](OnAction-Trigger.md), which is called when a user selects an action on the page.|  
|`OnAfterActionEvent(VAR Rec : Record)`|Executed after the [OnAction Trigger](OnAction-Trigger.md), which is called when a user selects an action on the page.|  
|`OnAfterGetCurrRecordEvent(VAR Rec : Record)`|Executed after the [OnAfterGetCurrRecord Trigger](OnAfterGetCurrRecord-Trigger.md), which is called after the current record is retrieved from the table.|  
|`OnAfterGetRecordEvent(VAR Rec : Record)`|Executed after the [OnAfterGetCurrRecord Trigger](OnAfterGetCurrRecord-Trigger.md), which is called after the record is retrieved from the table but before it is displayed to the user.|  
|`OnBeforeValidateEvent(VAR Rec : Record, VAR xRec : Record)`|Executed before the [OnValidate \(Page fields\) Trigger](OnValidate--Page-fields--Trigger.md), which is called when a field loses focus after its value has been changed.|  
|`OnAfterValidate(VAR Rec : Record, VAR xRec : Record)`|Executed after the [OnValidate \(Page fields\) Trigger](OnValidate--Page-fields--Trigger.md), which is called when a field loses focus after its value has been changed.|  
|`OnClosePageEvent(VAR Rec : Record)`|Executed after the [OnClosePage Trigger](OnClosePage-Trigger.md), which is called when page closes after the OnQueryClosePage trigger is executed.|  
|`OnDeleteRecordEvent(VAR Rec : Record, VAR AllowDelete : Boolean)`|Executed after the [OnDeleteRecord Trigger](OnDeleteRecord-Trigger.md), which is called before a record is deleted from a table.|  
|`OnInsertRecordEvent(VAR Rec : Record, BelowxRec : Boolean, VAR xRec : Record, VAR AllowInsert : Boolean)`|Executed after the [OnInsertRecord Trigger](OnInsertRecord-Trigger.md), which is called before a record is inserted in a table.|  
|`OnModifyRecordEvent(VAR Rec : Record, VAR xRec : Record, VAR AllowModify : Boolean)`|Executed after the [OnModifyRecord Trigger](OnModifyRecord-Trigger.md), which is called before a record is modified in a table.|  
|`OnNewRecordEvent(VAR Rec: Record, BelowxRec : Boolean, VAR xRec : Record)`|Executed after the [OnNewRecord Trigger](OnNewRecord-Trigger.md), which is called before a new record is initialized.|  
|`OnOpenPageEvent(VAR Rec : Record)`|Executed after the [OnOpenPage Trigger](OnOpenPage-Trigger.md), which is called after a page is initialized and run.|  
|`OnQueryClosePageEvent(VAR Rec : Record, VAR AllowClose : Boolean)`|Executed after the [OnQueryClosePage Trigger](OnQueryClosePage-Trigger.md), which is called as a page closes and before the OnClosePage Trigger executes.|  
  
 The following table describes the parameters of the trigger events:  
  
|Parameter|Type|Description|  
|---------------|----------|-----------------|  
|*Rec*|Record|The table that used page that raises the event.|  
|*xRec*|Record|The table that used page that raises the event.|  
|*AllowDelete*|Boolean|Specifies whether the OnDeleteRecord trigger call was successful and the record can be deleted. If this parameter is true, the code will be executed. If this parameter is false, then the code is not executed.|  
|*AllowModify*|Boolean|Specifies whether the OnModifyRecord trigger call was successful and the record can be modified. If this parameter is true, the code will be executed. If this parameter is false, then the code is not executed.|  
|*BelowxRec*|Boolean|Specifies whether the new record was inserted after the last record in the table \(xRec\).|  
|*AllowClose*|Boolean|Specifies whether to the page can close. If this parameter is true, the code will be executed. If this parameter is false, then the code is not executed.|  
  
## See Also  
 [Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md)   
 [Publishing Events](Publishing-Events.md)   
 [Raising Events](Raising-Events.md)   
 [Subscribing to Events](Subscribing-to-Events.md)
