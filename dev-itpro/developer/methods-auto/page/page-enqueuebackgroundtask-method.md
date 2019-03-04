---
title: "EnqueueBackgroundTask Method"
ms.author: solsen
ms.custom: na
ms.date: 02/22/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# EnqueueBackgroundTask Method
Creates and queues a background task that runs the specified codeunit (without a UI) in a child session of the page session. If the task completes successfully, the **OnPageBackgroundTaskCompleted** trigger is invoked. If an error occurs, the **OnPageBackgroundTaskError** trigger is invoked. If the page is closed before the task completes, the task is cancelled.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
[Ok := ]  Page.EnqueueBackgroundTask(var TaskId: Integer, CodeunitId: Integer, [var Parameters: Dictionary of [Text, Text]], [CancelOnRecordChange: Boolean], [Timeout: Integer])
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
*CancelOnRecordChange*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether to cancel the page background task if the current record changes on the page. If this parameter is true, then the task will be cancelled. If the parameter is false, then the task will not be cancelled. The default value is true.  
*Timeout*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies the number of milliseconds that the page background task can run before it is automatically cancelled.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the page background task is successfully queued for execution; otherwise **false**.If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Page Data Type](page-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)