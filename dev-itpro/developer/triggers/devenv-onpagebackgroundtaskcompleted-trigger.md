---
title: "OnPageBackgroundTaskCompleted Trigger"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
ms.service: "dynamics365-business-central"
author: jswymer
---

# OnPageBackgroundTaskCompleted Trigger

Runs after a page background task has successfully completed.  

## Syntax  

```AL
OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])  
```  

#### Parameters

*TaskID*  
Type: Integer  

Specifies the ID of the background task that was run. The ID is automatically assigned to the background task when it is created.  

*Results*  
Type: Dictionary of [Text, Text]  

Specifies the results of the page background task.

## Applies to

- Pages

## Example

The following example modifies the `OnPageBackgroundTaskCompleted` trigger to update the page with the started and finished times that were calculated in the page background task, and displays a notification that the times have been updated. For more details about this example, see [Page Background Tasks](../devenv-page-background-tasks.md).

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

[Page Background Tasks](../devenv-page-background-tasks.md)  
[Triggers](devenv-triggers.md)  