---
title: "OnPreRendering (Report) trigger"
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

# OnPreRendering (Report) trigger
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
## Related information  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  