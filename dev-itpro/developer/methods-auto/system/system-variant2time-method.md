---
title: "System.Variant2Time Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# System.Variant2Time Method
> **Version**: _Available from runtime version 1.0._

Gets a time from a variant.


## Syntax
```
Time :=   System.Variant2Time(Variant: Variant)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Variant*  
&emsp;Type: [Variant](../variant/variant-data-type.md)  
The input variant.  


## Return Value
*Time*
&emsp;Type: [Time](../time/time-data-type.md)



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

```al
var
    TextTime: Time;
    variant1: Variant;
begin 
    variant1 := Time;  
    TestTime := Variant2Time(variant1);  
end;
```  

## See Also

[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)