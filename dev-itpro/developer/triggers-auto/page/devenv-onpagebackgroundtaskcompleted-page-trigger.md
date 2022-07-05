---
title: "OnPageBackgroundTaskCompleted (Page) Trigger"
description: "Runs after a page background task has successfully completed."
ms.author: solsen
ms.custom: na
ms.date: 06/15/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnPageBackgroundTaskCompleted (Page) Trigger
> **Version**: _Available or changed with runtime version 4.0._

Runs after a page background task has successfully completed.


## Syntax
```AL
trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary[Text,Text])
begin
    ...
end;
```

### Parameters

*TaskId*  
&emsp;Type: [Integer](../../methods-auto/integer/integer-data-type.md)  
Specifies the ID of the background task that was run. The ID is automatically assigned to the background task when it is created.  

*Results*  
&emsp;Type: [Dictionary[Text,Text]](../../methods-auto/dictionary/dictionary-text-text-data-type.md)  
Specifies the results of the page background task.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The callback triggers can't execute UI operations, except notifications and control updates. This means that, for example, CurrPage.Update() statements are ignored because they would in many cases lead to infinite loops when page background tasks are started from the [OnAfterGetCurrRecord](devenv-onaftergetcurrrecord-page-trigger.md) trigger.

## Example

The following example modifies the **OnPageBackgroundTaskCompleted** trigger to update the page with the started and finished times that were calculated in the page background task, and displays a notification that the times have been updated. For more details about this example, see [Page Background Tasks](../../devenv-page-background-tasks.md).

```AL
    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    var
        started: Text;
        waited: Text;
        finished: Text;
        PBTNotification: Notification;
    begin
        if (TaskId = WaitTaskId) then begin
            Evaluate(started, Results.Get('started'));
            Evaluate(waited, Results.Get('waited'));
            Evaluate(finished, Results.Get('finished'));

            before1 := started;
            duration1 := waited;
            after1 := finished;
            PBTNotification.Message('Start and finish times have been updated.');
            PBTNotification.Send();
        end;
    end;
```

## See Also

[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnPageBackgroundTaskCompleted (Page Extension) Trigger](../pageextension/devenv-onpagebackgroundtaskcompleted-pageextension-trigger.md)
