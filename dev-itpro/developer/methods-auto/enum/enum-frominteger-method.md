---
title: "Enum.FromInteger(Integer) Method"
description: "Returns an enum with the integer value"
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# Enum.FromInteger(Integer) Method
> **Version**: _Available or changed with runtime version 4.0._

Returns an enum with the integer value


## Syntax
```AL
Enum with integer value :=   Enum.FromInteger(Value: Integer)
```
## Parameters
*Value*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
  


## Return Value
*Enum with integer value*  
&emsp;Type: [Any](../any/any-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Example

```al
enum 50130 YesNo
{
    value(0; Yes) { }
    value(10; No) { }
}

codeunit 50130 YesNoTest
{
    procedure Test();
    var
        Answer: enum YesNo;
    begin
        Answer := Enum::YesNo.FromInteger(10); // Ordinal value for 'No'
        if Answer = YesNo::No then
            Message('Success');
    end;
}
```

## See Also
[Enum Data Type](enum-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)