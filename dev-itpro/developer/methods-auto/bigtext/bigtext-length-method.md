---
title: "BigText.Length Method"
description: "Retrieves the length of the text stored in this BigText instance."
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
# BigText.Length Method
> **Version**: _Available or changed with runtime version 1.0._

Retrieves the length of the text stored in this BigText instance.


## Syntax
```AL
Length :=   BigText.Length()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*BigText*  
&emsp;Type: [BigText](bigtext-data-type.md)  
An instance of the [BigText](bigtext-data-type.md) data type.  

## Return Value
*Length*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The length of the text stored in this BigText instance.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

To delete the content in a BigText variable use the [Clear Method](../../methods-auto/system/system-clear-joker-method.md). The syntax for the Clear method is shown in the following code snippet: `Clear(BigText)`.  
  
## Example

The following example demonstrates how to retrieve the length of a BigText variable.

In this example, the BigText variable is initialized with the text ‘ABCDEFG’. The length, which is 7, is stored in the VarLength variable and displayed in a message box.  
  
```al
var
    MyBigText: BigText;
    VarLength: Text;
    Text000: Label 'VarLength = %1';
begin
    MyBigText.AddText('ABCDEFG');  
    VarLength := MyBigText.Length;  
    Message(Text000, VarLength);  
end;
``` 
  
## See Also

[BigText Data Type](bigtext-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)