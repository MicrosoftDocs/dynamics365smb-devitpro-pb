---
title: "Page.GetBackgroundParameters Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# Page.GetBackgroundParameters Method
> **Version**: _Available from runtime version 4.0._

Gets the page background task input parameters.


## Syntax
```
Parameters :=   Page.GetBackgroundParameters()
```


## Return Value
*Parameters*
&emsp;Type: [Dictionary of [Text, Text]](../dictionary/dictionary-data-type.md)
The input parameters of the page background task.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

You use this method in a page background task codeunit, which is the codeunit that runs in a page background task. When a page background task is enqueued by the [EnqueueBackgroundTask](page-enqueuebackgroundtask-method.md), it can include a set of parameters (a collection of key and value pairs) that can be used in the computations done in the background task codeunit. These parameters are passed as a dictionary of text to the codeunit's OnRun trigger when the page background task session is started. You use the GetBackgroundParameters method to retrieve these parameters.  

Use the [Evaluate method](../system/system-evaluate-method.md) to convert parameter values to the data types required for calculations.

## Example

The following code is an example of a page background task codeunit that uses the GetBackgroundParameters method to retrieve the value of the key named `Wait`, which is passed to the OnRun trigger from the calling page when the page background task is enqueued. For more details about this example, see [Page Background Tasks](../../devenv-page-background-tasks.md).

```al
codeunit 50100 PBTWaitCodeunit
{
    trigger OnRun()
    var
        Result: Dictionary of [Text, Text];
        StartTime: Time;
        WaitParam: Text;
        WaitTime: Integer;
        EndTime: Time;
    begin
        if not Evaluate(WaitTime, Page.GetBackgroundParameters().Get('Wait')) then
            Error('Could not parse parameter WaitParam');

        StartTime := System.Time();
        Sleep(WaitTime);
        EndTime := System.Time();

        Result.Add('started', Format(StartTime));
        Result.Add('waited', Format(WaitTime));
        Result.Add('finished', Format(EndTime));

        Page.SetBackgroundTaskResult(Result);
    end;
}

```

## See Also

[Page Background Tasks](../../devenv-page-background-tasks.md)  
[Page Data Type](page-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)