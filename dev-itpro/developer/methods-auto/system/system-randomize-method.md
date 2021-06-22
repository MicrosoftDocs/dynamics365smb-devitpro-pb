---
title: "System.Randomize Method"
description: "Generates a set of random numbers from which the RANDOM method (Integer) will select a random number."
ms.author: solsen
ms.custom: na
ms.date: 05/31/2021
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
# System.Randomize Method
> **Version**: _Available or changed with runtime version 1.0._

Generates a set of random numbers from which the RANDOM method (Integer) will select a random number.


## Syntax
```
 System.Randomize([Seed: Integer])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*[Optional] Seed*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
A number used to create a unique set of numbers.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

If you use the same number as *Seed*, the same set of numbers is generated. If you omit this optional parameter, **Randomize** uses the current system time \(total number of milliseconds since midnight\). Calling the **Randomize** method before the [Random Method](../../methods-auto/system/system-random-method.md) makes the random numbers more unpredictable.  
  
Furthermore, the random generator is specific to each connection so the sequence of numbers that is returned when you call the [Random Method](../../methods-auto/system/system-random-method.md) will be the same after each call to **Randomize** with a specific seed.  
  
## Example

The following example generates random numbers between 1 and 5 by using the *Seed* from the **Randomize** method to initialize the random number generator in the [Random Method](../../methods-auto/system/system-random-method.md). The **Randomize** method uses the data from system clock as the *Seed* value.  
  
```al
var
    x: Integer;
    Text000: Label 'X=%1';
begin
    Randomize();  
    x := Random(5);  
    Message(Text000, x);  
end;
```  

## See Also

[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)