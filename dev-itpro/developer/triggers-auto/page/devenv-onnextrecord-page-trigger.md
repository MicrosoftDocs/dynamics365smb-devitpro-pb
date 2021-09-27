---
title: "OnNextRecord (Page) Trigger"
description: "Determines the next record to be displayed."
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

# OnNextRecord (Page) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Determines the next record to be displayed.


## Syntax
```AL
trigger OnNextRecord(Steps: Integer): ActualSteps
begin
    ...
end;
```

### Parameters

*Steps*  
&emsp;Type: [Integer](../../methods-auto/integer/integer-data-type.md)  
The number of records stepped through before displaying another record. A negative value indicates steps backwards.  


## Return Value

*ActualSteps*  
&emsp;Type: [Integer](../../methods-auto/integer/integer-data-type.md)  
This return value contains the actual number of steps or records cycled through. The default value is 0.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This trigger is executed in place of the default next record behavior.  

If an error occurs in the trigger code, the page is closed.  

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnNextRecord (Request Page) Trigger](../requestpage/devenv-onnextrecord-requestpage-trigger.md)
