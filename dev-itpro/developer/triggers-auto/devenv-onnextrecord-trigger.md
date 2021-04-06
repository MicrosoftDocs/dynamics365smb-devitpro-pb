---
title: "OnNextRecord Trigger"
ms.author: solsen
ms.custom: na
ms.date: 04/06/2021
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

# OnNextRecord Trigger
> **Version**: _Available or changed with runtime version 1.0._

Determines the next record to be displayed.

## Syntax
```
trigger OnNextRecord(Steps: Integer): ActualSteps
begin
    ...
end;
```

### Parameters

*Steps*  
&emsp;Type: [Integer](../methods-auto/integer/integer-data-type.md)  
The number of records stepped through before displaying another record. A negative value indicates steps backwards.  


## Return Value

*ActualSteps*
&emsp;Type: [Integer](../methods-auto/integer/integer-data-type.md)

This return value contains the actual number of steps or records cycled through. The default value is 0.

## Applies To
- Page
- RequestPage


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  