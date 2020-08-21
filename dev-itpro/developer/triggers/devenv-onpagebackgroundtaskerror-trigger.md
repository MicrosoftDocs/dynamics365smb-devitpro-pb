---
title: "OnPageBackgroundTaskError Trigger"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
ms.service: "dynamics365-business-central"
author: jswymer
---

# OnPageBackgroundTaskError Trigger

Runs when an error occurs in a page background task.

## Syntax  

```  
OnPageBackgroundTaskError(TaskId: Integer; ErrorCode: Text; ErrorText: Text; ErrorCallStack: Text; var IsHandled: Boolean)  
```  

#### Parameters  
*TaskID*  
Type: Integer  

Specifies the ID of the background task that was run.  

*ErrorCode*  
Type: Text  

Specifies the severity level of the error that occurred.  

*ErrorText*  
Type: Text  

Specifies the message that explains the error that occurred.

*ErrorCallStack*

Type: Text

Specifies the call stack for the error that occurred.

 *IsHandled*  
 Type: Boolean  

 `true` indicates that the error has been handled; `false` indicates that it has not been handled.  

## Applies to  

Pages

## Example  

The following example modifies the `OnPageBackgroundTaskError` trigger to display a more user-friendly notification in the client when the error `Could not parse parameter WaitParam` or timeout occurs in the page background task. For more details about this example, see [Page Background Tasks](../devenv-page-background-tasks.md).

```
trigger OnPageBackgroundTaskError(TaskId: Integer; ErrorCode: Text; ErrorText: Text; ErrorCallStack: Text; var IsHandled: Boolean)
var
    PBTErrorNotification: Notification;
begin
    if (ErrorText = 'Could not parse parameter WaitParam') then begin
        IsHandled := true;
    PBTErrorNotification.Message('Something went wrong. The start and finish times have been updated.');
    PBTErrorNotification.Send();
    end
    
    else if (ErrorText = 'Child Session task was terminated because of a timeout.') then begin
        IsHandled := true;
        PBTErrorNotification.Message('It took to long to get results. Try again.');
        PBTErrorNotification.Send();
    end
end;
```

## See Also

[Page Background Tasks](../devenv-page-background-tasks.md)  
[Triggers](devenv-triggers.md)  