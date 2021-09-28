---
title: "OnPageBackgroundTaskError (Page) Trigger"
description: "Runs when an error occurs in a page background task."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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

# OnPageBackgroundTaskError (Page) Trigger
> **Version**: _Available or changed with runtime version 4.0._

Runs when an error occurs in a page background task.


## Syntax
```AL
trigger OnPageBackgroundTaskError(TaskId: Integer, ErrorCode: Text, ErrorText: Text, ErrorCallStack: Text, IsHandled: Boolean)
begin
    ...
end;
```

### Parameters

*TaskId*  
&emsp;Type: [Integer](../../methods-auto/integer/integer-data-type.md)  
Specifies the ID of the background task that was run.  

*ErrorCode*  
&emsp;Type: [Text](../../methods-auto/text/text-data-type.md)  
Specifies the severity level of the error that occurred.  

*ErrorText*  
&emsp;Type: [Text](../../methods-auto/text/text-data-type.md)  
Specifies the message that explains the error that occurred.  

*ErrorCallStack*  
&emsp;Type: [Text](../../methods-auto/text/text-data-type.md)  
Specifies the call stack for the error that occurred.  

*IsHandled*  
&emsp;Type: [Boolean](../../methods-auto/boolean/boolean-data-type.md)  
**true** indicates that the error has been handled; **false** indicates that it has not been handled.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  

The following example modifies the `OnPageBackgroundTaskError` trigger to display a more user-friendly notification in the client when the error `Could not parse parameter WaitParam` or timeout occurs in the page background task. For more details about this example, see [Page Background Tasks](../../devenv-page-background-tasks.md).

```AL
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
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnPageBackgroundTaskError (Page Extension) Trigger](../pageextension/devenv-onpagebackgroundtaskerror-pageextension-trigger.md)
