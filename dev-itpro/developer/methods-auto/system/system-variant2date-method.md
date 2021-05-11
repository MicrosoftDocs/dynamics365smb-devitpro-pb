---
title: "System.Variant2Date Method"
description: "Gets a date from a variant."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# System.Variant2Date Method
> **Version**: _Available or changed with runtime version 1.0._

Gets a date from a variant.


## Syntax
```
Date :=   System.Variant2Date(Variant: Variant)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Variant*  
&emsp;Type: [Variant](../variant/variant-data-type.md)  
The input variant.  


## Return Value
*Date*  
&emsp;Type: [Date](../date/date-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Example  

```al
var
    TextDate: Date;
    variant1: Variant;
begin
    variant1 := Today;  
    TestDate := Variant2Date(variant1);  
end;
```  

## See Also

[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)