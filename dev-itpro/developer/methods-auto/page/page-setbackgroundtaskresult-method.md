---
title: "Page.SetBackgroundTaskResult Method"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# Page.SetBackgroundTaskResult Method
> **Version**: _Available or changed with runtime version 4.0._

Sets the page background task result as a dictionary. When the task is completed, the OnPageBackgroundCompleted trigger will be invoked on the page with this result dictionary.


## Syntax
```
 Page.SetBackgroundTaskResult(Results: Dictionary of [Text, Text])
```
## Parameters
*Results*  
&emsp;Type: [Dictionary of [Text, Text]](../dictionary/dictionary-data-type.md)  
Specifies the dictionary of results for the page background task.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

You use this method in a page background task codeunit to pass the results of the page background task codeunit to the calling page. Before calling this method, use the [Add method](../dictionary/dictionary-add-method.md) to populate the `Results` dictionary with the key-value pairs that you want to pass to calling page's [OnPageBackgroundTaskCompleted trigger](../../triggers-auto/page/devenv-onpagebackgroundtaskcompleted-page-trigger.md). The `OnPageBackgroundCompleted` trigger can then handle the results on the calling page, such as updating the record in the UI or database.
    
## Example

The following code is an example of a page background task codeunit that uses the SetBackgroundTaskResult method to set a dictionary of results that will be passed to the calling page. For more details about this example, see [Page Background Tasks](../../devenv-page-background-tasks.md).
   
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