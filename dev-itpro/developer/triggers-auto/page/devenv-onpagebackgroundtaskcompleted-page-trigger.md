---
title: "OnPageBackgroundTaskCompleted (Page) Trigger"
ms.author: solsen
ms.custom: na
ms.date: 04/14/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnPageBackgroundTaskCompleted (Page) Trigger
> **Version**: _Available or changed with runtime version 4.0._

Runs after a page background task has successfully completed.


## Syntax
```
trigger OnPageBackgroundTaskCompleted(TaskId: Integer, Results: Dictionary[Text,Text])
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
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnPageBackgroundTaskCompleted (Page Extension) Trigger](../pageextension/devenv-onpagebackgroundtaskcompleted-pageextension-trigger.md)
