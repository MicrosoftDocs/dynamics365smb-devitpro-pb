---
title: "OnPreRendering (Report Extension) trigger"
description: "Runs when a report dataset has been finalized and before the output artifact has been rendered."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnPreRendering (Report Extension) trigger
> **Version**: _Available or changed with runtime version 15.0._

Runs when a report dataset has been finalized and before the output artifact has been rendered.


## Syntax
```AL
trigger OnPreRendering(var RenderingPayload: JsonObject)
begin
    ...
end;
```

### Parameters

*RenderingPayload*  
&emsp;Type: [JsonObject](../../methods-auto/jsonobject/jsonobject-data-type.md)  
The JSON object containing post rendering setup which will be applied by the runtime during artifact rendering.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The `OnPreRendering trigger` runs after the `OnPreDataItem` trigger for the last dataitem and before `OnPostReport` trigger. It runs after the base report's `OnPreRendering` trigger. Learn more about report trigger flow in [Report triggers and runtime operations](../../devenv-report-triggers.md#overall-report-trigger-and-operations).

## Related information

[OnInitReport (report) trigger](devenv-oninitreport-report-trigger.md)  
[OnPreReport (report) trigger](devenv-onprereport-report-trigger.md)  
[OnPostReport (report) trigger](devenv-onpostreport-report-trigger.md)  
[Report triggers and runtime operations](../../devenv-report-triggers.md)  
[Get started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)  
[Developing extensions](../devenv-dev-overview.md)  