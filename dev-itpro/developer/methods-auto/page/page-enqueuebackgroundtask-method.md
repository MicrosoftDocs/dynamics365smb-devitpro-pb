---
title: "Page.EnqueueBackgroundTask Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Page.EnqueueBackgroundTask Method
Creates and queues a background task that runs the specified codeunit (without a UI) in a read-only child session of the page session. If the task completes successfully, the **OnPageBackgroundTaskCompleted** trigger is invoked. If an error occurs, the **OnPageBackgroundTaskError** trigger is invoked. If the page is closed before the task completes, or the page record ID on the task changed, the task is cancelled.


## Syntax
```
[Ok := ]  Page.EnqueueBackgroundTask(var TaskId: Integer, CodeunitId: Integer [, var Parameters: Dictionary of [Text, Text]] [, Timeout: Integer] [, ErrorLevel: PageBackgroundTaskErrorLevel])
```
## Parameters
*Page*  
&emsp;Type: [Page](page-data-type.md)  
An instance of the [Page](page-data-type.md) data type.  

*TaskId*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies the ID of the new page background task. The ID is assigned to the TaskId variable after the task is queued successfully. This parameter is passed by reference to the method.  
*CodeunitId*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies the ID of the codeunit to run when the task is started.  
*Parameters*  
&emsp;Type: [Dictionary of [Text, Text]](../dictionary/dictionary-data-type.md)  
Specifies a collection of keys and values that are passed to the OnRun trigger of the codeunit that runs when the page background task session is started.  
*Timeout*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies the number of milliseconds that the page background task can run before it is automatically cancelled.  
*ErrorLevel*  
&emsp;Type: [PageBackgroundTaskErrorLevel](../pagebackgroundtaskerrorlevel/pagebackgroundtaskerrorlevel-option.md)  
Specifies the level of error handling on page background task level.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the page background task is successfully queued for execution; otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The enqueued page background task stores the record ID of the current page. If the current record ID on the page changes, or the page is closed, the task is canceled. Typically, you call the ENQUEUEBACKGROUNDTASK method from a page trigger. The ID of the current record of the page must remain static after the call is made and while the background task is running. Otherwise, the task will be canceled. For this reason, we recommend that you don't enqueue the background task from the `OnOpenPage` trigger. Instead, use the  `OnAfterGetRecord` or `OnAfterGetCurrRecord` triggers.

​The **Child Session Max Concurrency** setting of the [!INCLUDE[server](../../includes/server.md)] controls how many page background tasks can be run simultaneously for a parent session.  The setting has a default value of 5. If this number is exceeded, then they'll be queued and run when a slot becomes available as other tasks are finished. Enqueuing the task will fail if the total number of enqueued tasks exceed the **Child Sessions Max Queue Length** server configuration setting.​ For more information, see [Configuring Business Central Server - Asynchronous Processing](../administration/configure-server-instance.md#PBT).

### <a name="timeout"></a>Timeout

When the value of the *Timeout* parameter is exceeded, the background task is canceled and an error with error code ChildSessionTaskTimeout occurs. On the page, the error will appear as a notification.

The [!INCLUDE[server](../../includes/server.md)] instance includes two configuration settings related to the page back ground task timeout: PageBackgroundTaskDefaultTimeout and PageBackgroundTaskMaxTimeout.
- The PageBackgroundTaskDefaultTimeout (which has a default value of 00:02:00) determines the timeout if the *Timeout* parameter isn't given a value.

- The PageBackgroundTaskMaxTimeout specifies the maximum amount of time that a page background task can run. It doesn't matter what the  *Timeout* parameter value is. If the *Timeout* value is greater than the PageBackgroundTaskMaxTimeout, which has a default value of 00:10:00, the PageBackgroundTaskMaxTimeout value determines the timeout.

For more information these settings, see [Configuring Business Central Server](../../../administration/configure-server-instance.md#PBT).

It's possible to enqueue the task again in the completion trigger or error trigger, but this pattern isn't recommended as it can lead to an endless loop. For more information, see [Page Background Tasks](../../devenv-page-background-tasks.md#reenqueu).

## Example

The following code extends the **Customer Card** page with a page background task by using the ENQUEUEBACKGROUNDTASK method. For more information about this example, see [Page Background Tasks](../../devenv-page-background-tasks.md).
  
```
pageextension 50100 CustomerCardExt extends "Customer Card"
{
    layout
    {
        addlast(General)
        {

            field(Before1; before1)
            {
                ApplicationArea = All;
                Caption = 'Before 1';
                Editable = false;
            }

            field(Duration1; duration1)
            {
                ApplicationArea = All;
                Caption = 'Duration 1';
                Editable = false;
            }

            field(After1; after1)
            {
                ApplicationArea = All;
                Caption = 'After 1';
                Editable = false;
            }
        }
    }

    var
        // Global variable used for the TaskID
        WaitTaskId: Integer;
        
        // Variables for the three fields on the page 
        before1: Text;
        duration1: Text;
        after1: Text;

    trigger OnAfterGetRecord();
    var
        //Defines a variable for passing parameters to the background task
        TaskParameters: Dictionary of [Text, Text];
    begin
        // Adds a key-value pair to the parameters dictionary 
        TaskParameters.Add('Wait', '1000');

        //Enqueues the page background task
        CurrPage.EnqueueBackgroundTask(WaitTaskId, 50100, TaskParameters, 10000, PageBackgroundTaskErrorLevel::Warning);
    end;
```

## See Also

[Page Background Tasks](../../devenv-page-background-tasks.md)  
[Page Data Type](page-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)
