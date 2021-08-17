---
title: "Event Types"
description: Dynamics 365 Business Central supports different types of events including BusinessEvent, IntegrationEvent, Global and trigger events. 
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Event Types

[!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] supports different types of events for different purposes.

##  <a name="BusinessEvents"></a> Business events
 
A business event is a custom event that is raised by AL code. It defines a formal contract that carries an implicit promise not to change in future releases. It is the expectation that business events are published by solution ISVs, including Microsoft.  
  
Business events can be compared with publicly released APIs on which 3rd party solution providers develop integrations and additions. Therefore, the downstream cost of making changes to a business event implementation can be considerable for those who use the event in their applications. There may be some cases where changes are required; however, you should keep these to an absolute minimum. 
  
### Development considerations
  
A typical business event reflects changes in “state” with regards to a process. This makes them very well suited for workflow. An example of a business event could be when a sales order has been posted. It is important to note that business events should not be tied to the implementation-details, such as the tables or fields in which the data is stored. Preferably, the event publisher developer should be free to change the implementation, while still keeping the business event intact. To learn about the syntax and example on how to use the BusinessEvent type, see [BusinessEvent Attribute](attributes/devenv-businessevent-attribute.md). 
  
Business events should be documented with the solution, including the before-state and after-state of the events. 
  
##  <a name="IntegrationEvents"></a> Integration events
  
An integration event is also a custom event that is raised by AL code, like a business event, except that it does not carry the same promise of not changing, nor does it have the restriction not to expose implementation details.  
  
The main purpose of integration events is to enable the integration of other solutions with [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] without having to perform traditional code modifications.  

### Development considerations

An integration event can be changed to a business event later. At which time, it must adhere to the same implied contract and commitment as any business event. It can also simply be designed-in hook points for external add-ons. To learn about the syntax and example on how to use the IntegrationEvent type, see [IntegrationEvent Attribute](attributes/devenv-integrationevent-attribute.md). 
  
## Global events
  
Global events are predefined system events that are automatically raised by various base application codeunits. For example, codeunit 40 **LoginManagement** includes several global method triggers, such as CompanyOpen, CompanyClose, and GetSystemIndicator. For most of these global method triggers, there are one or two global events: a before and after event. For example, there is an OnBeforeCompanyOpen event and an OnAfterCompanyOpen event. The global events are defined as integration event publishers by local methods in the following codeunits.

|Codeunit ID|Codeunit Name|Event|
|-----------|-------------|-----|
|40|LoginInManagement|OnRoleCenterOpen|  
|||OnAfterLogInEnd|  
|||OnBeforeLogInStart|  
|||OnBeforeCompanyOpen|  
|||OnAfterCompanyOpen|  
|||OnBeforeCompanyClose|  
|||OnAfterCompanyClose|  
|42|TextManagement|OnBeforeMakeTextFilter|  
|||OnAfterMakeDateTimeFilter|  
|||OnAfterMakeDateFilter|  
|||OnAfterMakeTextFilter|  
|||OnAfterMakeTimeFilter|
|42*|Caption Class|OnAfterCaptionClassResolve|
|||OnResolveCaptionClass|
|44|ReportManagement|OnAfterGetPrinterName|
|||[OnAfterDocumentPrintReady](devenv-onafterdocumentprintready-event.md)|
|||OnAfterGetPaperTrayForReport|
|||OnAfterHasCustomLayout|
|||[OnAfterSetupPrinters](devenv-onaftersetupprinters-event.md)|
|||OnAfterSubstituteReport|
|45|AutoFormatManagement|OnAfterAutoFormatTranslate|
|49|GlobalTriggerManagement|OnAfterGetGlobalTableTriggerMask|
|||OnAfterOnGlobalInsert|
|||OnAfterOnGlobalModify|
|||OnAfterOnGlobalDelete|
|||OnAfterOnGlobalRename|
|||OnAfterGetDatabaseTableTriggerSetup|
|||OnAfterOnDatabaseInsert|
|||OnAfterOnDatabaseModify|
|||OnAfterOnDatabaseDelete|
|||OnAfterOnDatabaseRename|
|||OnBeforeOnDatabaseInsert|
|||OnBeforeOnDatabaseModify|
|||OnBeforeOnDatabaseDelete|
|||OnBeforeOnDatabaseRename|

\* Codunit 42 **Caption Class** was introduced as a replacement for codeunit 42 **CaptionManagement**.  In previous versions, codeunit 42 **CaptionManagement** included the `OnAfterCaptionClassTranslate` event. For more information, see [Breaking Changes](https://github.com/microsoft/ALAppExtensions/blob/master/BREAKINGCHANGES.md#caption-class-module) in the ALAppExtensions GitHub repo.

## Trigger events

Unlike business and integration events which must be programmed, trigger events are predefined events. Trigger events are published by the runtime and they cannot be raised programmatically. There are two types of trigger events: database trigger events and page trigger events.  
  
> [!NOTE]  
> Trigger events do not appear as methods in AL for a table or page object.  
  
###  <a name="DatabaseEvents"></a> Database trigger events
  
Trigger events are automatically raised by the system when it performs database operations on a table object, such as deleting, inserting, modifying, and renaming a record, as defined in a table. Trigger events are closely associated with the table triggers for database operations: OnDelete, OnInsert, OnModify, OnRename, and OnValidate \(for fields\). For each database operation, there is a "before" and "after" trigger event with a fixed signature.  
  
**Available Database Trigger Events**  
  
The following table describes the available database trigger events:  
  
|Database trigger event|Signature|Description|  
|----------------------|-------------------|-----------------|
|[OnAfterDeleteEvent Trigger Event](triggers-auto/events/table/devenv-onafterdeleteevent-table-trigger.md)|`[EventSubscriber(ObjectType::Table, Database::<Table Name>, 'OnAfterDeleteEvent', '', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record, RunTrigger: Boolean)`|Executed after a record is deleted from a table.|  
|[OnAfterInsertEvent Trigger Event](triggers-auto/events/table/devenv-onafterinsertevent-table-trigger.md)|`[EventSubscriber(ObjectType::Table, Database::<Table Name>, 'OnAfterInsertEvent', '', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record, RunTrigger: Boolean)`|Executed after a record is inserted in a table.|  
|[OnAfterModifyEvent Trigger Event](triggers-auto/events/table/devenv-onaftermodifyevent-table-trigger.md)|`[EventSubscriber(ObjectType::Table, Database::<Table Name>, 'OnAfterModifyEvent', '', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record, xRec: Record, RunTrigger: Boolean)`|Executed after a record is modified in a table.|  
|[OnAfterRenameEvent Trigger Event](triggers-auto/events/table/devenv-onafterrenameevent-table-trigger.md)|`[EventSubscriber(ObjectType::Table, Database::<Table Name>, 'OnAfterRenameEvent', '', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record, xRec: Record, RunTrigger: Boolean)`|Executed after a record is renamed in a table.|  
|[OnAfterValidateEvent Trigger Event](triggers-auto/events/table/devenv-onaftervalidateevent-table-trigger.md)|`[EventSubscriber(ObjectType::Table, Database::<Table Name>, 'OnAfterValidateEvent', '<Field Name>', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record, xRec: Record, CurrFieldNo: Integer)`|Executed after a field is validated when its value has been changed.|  
|[OnBeforeDeleteEvent Trigger Event](triggers-auto/events/table/devenv-onbeforedeleteevent-table-trigger.md)|`[EventSubscriber(ObjectType::Table, Database::<Table Name>, 'OnBeforeDeleteEvent', '', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record, RunTrigger: Boolean)`|Executed before a record is deleted from a table.|  
|[OnBeforeInsertEvent Trigger Event](triggers-auto/events/table/devenv-onbeforeinsertevent-table-trigger.md)|`[EventSubscriber(ObjectType::Table, Database::<Table Name>, 'OnBeforeInsertEvent', '', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record, RunTrigger: Boolean)`|Executed before a record is inserted in a table.|  
|[OnBeforeModifyEvent Trigger Event](triggers-auto/events/table/devenv-onbeforemodifyevent-table-trigger.md)|`[EventSubscriber(ObjectType::Table, Database::<Table Name>, 'OnBeforeModifyEvent', '', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record, xRec: Record, RunTrigger: Boolean)`|Executed before a record is modified in a table.|  
|[OnBeforeRenameEvent Trigger Event](triggers-auto/events/table/devenv-onbeforerenameevent-table-trigger.md)|`[EventSubscriber(ObjectType::Table, Database::<Table Name>, 'OnBeforeRenameEvent', '', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record, xRec: Record, RunTrigger: Boolean)`|Executed before a record is renamed in a table.|  
|[OnBeforeValidateEvent Trigger Event](triggers-auto/events/table/devenv-onbeforevalidateevent-table-trigger.md)|`[EventSubscriber(ObjectType::Table, Database::<Table Name>, 'OnBeforeValidateEvent', '<Field Name>', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record, xRec: Record, CurrFieldNo: Integer)`|Executed before a field is validated when its value has been changed.|
  
The following table describes the parameters of the trigger events:  
  
|Parameter|Type|Description|  
|---------------|----------|-----------------|  
|*Rec*|Record|The table that raises the event.|  
|*xRec*|Record|The table that raises the event.|  
|*RunTrigger*|Boolean|Specifies whether to execute the code in the event trigger when it is invoked. If this parameter is true, the code will be executed. If this parameter is false, then the code is not executed.|  
|*CurrentFieldNo*|Integer|The number of the field that raises the event.|  
  
#### Order of Event Execution
  
The relative order of execution of database trigger events, table triggers, and database operations is as follows:  
  
|Order|Item|Example|  
|-----------|----------|-------------|  
|1|Trigger event \(before\)|OnBeforeDeleteEvent|  
|2|Table trigger|OnDelete|  
|3|Global table trigger in codeunit|OnDatabaseDelete|  
|4|Database operations|Delete the record|  
|5|Trigger event \(after\)|OnAfterDeleteEvent|  
  
###  <a name="PageEvents"></a> Page trigger events
  
Page Trigger events are raised automatically by the system when it performs certain operations in a page object. Page trigger events are closely associated with the standard page triggers, such as OnOpenPage, OnClosePage, and OnAction.  
  
#### Available Page Trigger Events
  
The following table describes the available page trigger events:  
  
|Trigger event|Signature|Description|  
|-------------|---------------------|-----------------|  
|[OnAfterActionEvent Trigger Event](triggers-auto/events/page/devenv-onafteractionevent-page-trigger.md)|`[EventSubscriber(ObjectType::Page, Page::<Page Name>, 'OnAfterActionEvent', '<Action Name>', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record)`|Executed after the OnAction trigger, which is called when a user selects an action on the page.|  
|[OnAfterGetCurrRecordEvent Trigger Event](triggers-auto/events/page/devenv-onaftergetcurrrecordevent-page-trigger.md)|`[EventSubscriber(ObjectType::Page, Page::<Page Name>, 'OnAfterGetCurrRecordEvent', '', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record)`|Executed after the OnAfterGetCurrRecord trigger, which is called after the current record is retrieved from the table.|  
|[OnAfterGetRecordEvent Trigger Event](triggers-auto/events/page/devenv-onaftergetrecordevent-page-trigger.md)|`[EventSubscriber(ObjectType::Page, Page::<Page Name>, 'OnAfterGetRecordEvent', '', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record)`|Executed after the OnAfterGetCurrRecord trigger, which is called after the record is retrieved from the table but before it is displayed to the user.|  
|[OnAfterValidateEvent Trigger Event](triggers-auto/events/page/devenv-onaftervalidateevent-page-trigger.md)|`[EventSubscriber(ObjectType::Page, Page::<Page Name>, 'OnAfterValidateEvent', '<Control Name>', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record, xRec: Record)`|Executed after the OnValidate (Page fields) trigger, which is called when a field loses focus after its value has been changed.|  
|[OnBeforeActionEvent Trigger Event](triggers-auto/events/page/devenv-onbeforeactionevent-page-trigger.md)|`[EventSubscriber(ObjectType::Page, Page::<Page Name>, 'OnBeforeActionEvent', '<Action Name>', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record)`|Executed before the OnAction trigger, which is called when a user selects an action on the page.|  
|[OnBeforeValidateEvent Trigger Event](triggers-auto/events/page/devenv-onbeforevalidateevent-page-trigger.md)|`[EventSubscriber(ObjectType::Page, Page::<Page Name>, 'OnBeforeValidateEvent', '<Control Name>', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record, xRec: Record)`|Executed before the OnValidate (Page fields) trigger, which is called when a field loses focus after its value has been changed.|  
|[OnClosePageEvent Trigger Event](triggers-auto/events/page/devenv-onclosepageevent-page-trigger.md)|`[EventSubscriber(ObjectType::Page, Page::<Page Name>, 'OnClosePageEvent', '', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record)`|Executed after the OnClosePage trigger, which is called when page closes after the OnQueryClosePage trigger is executed.|  
|[OnDeleteRecordEvent Trigger Event](triggers-auto/events/page/devenv-ondeleterecordevent-page-trigger.md)|`[EventSubscriber(ObjectType::Page, Page::<Page Name>, 'OnDeleteRecordEvent', '', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record, AllowDelete: Boolean)`|Executed after the OnDeleteRecord trigger, which is called before a record is deleted from a table.|  
|[OnInsertRecordEvent Trigger Event](triggers-auto/events/page/devenv-oninsertrecordevent-page-trigger.md)|`[EventSubscriber(ObjectType::Page, Page::<Page Name>, 'OnInsertRecordEvent', '', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record, BelowxRec: Boolean, xRec: Record, AllowInsert: Boolean)`|Executed after the OnInsertRecord trigger, which is called before a record is inserted in a table.|  
|[OnModifyRecordEvent Trigger Event](triggers-auto/events/page/devenv-onmodifyrecordevent-page-trigger.md)|`[EventSubscriber(ObjectType::Page, Page::<Page Name>, 'OnModifyRecordEvent', '', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record, xRec: Record, AllowModify: Boolean)`|Executed after the OnModifyRecord trigger, which is called before a record is modified in a table.|  
|[OnNewRecordEvent Trigger Event](triggers-auto/events/page/devenv-onnewrecordevent-page-trigger.md)|`[EventSubscriber(ObjectType::Page, Page::<Page Name>, 'OnNewRecordEvent', '', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record, BelowxRec: Boolean, xRec: Record)`|Executed after the OnNewRecord trigger, which is called before a new record is initialized.|  
|[OnOpenPageEvent Trigger Event](triggers-auto/events/page/devenv-onopenpageevent-page-trigger.md)|`[EventSubscriber(ObjectType::Page, Page::<Page Name>, 'OnOpenPageEvent', '', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record)`|Executed after the OnOpenPage trigger, which is called after a page is initialized and run.|  
|[OnQueryClosePageEvent Trigger Event](triggers-auto/events/page/devenv-onqueryclosepageevent-page-trigger.md)|`[EventSubscriber(ObjectType::Page, Page::<Page Name>, 'OnQueryClosePageEvent', '', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]`<br />`local procedure MyProcedure(Rec: Record, AllowClose: Boolean)`|Executed after the OnQueryClosePage trigger, which is called as a page closes and before the OnClosePage trigger executes.|   
  
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

[Events in AL](devenv-events-in-al.md)   
[Publishing Events](devenv-publishing-events.md)   
[Raising Events](devenv-raising-events.md)   
[Subscribing to Events](devenv-subscribing-to-events.md)  