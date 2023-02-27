---
title: "InStream.Length() Method"
description: "Gets the stream length."
ms.author: solsen
ms.custom: na
ms.date: 02/27/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# InStream.Length() Method
> **Version**: _Available or changed with runtime version 11.0._

Gets the stream length.


## Syntax
```AL
StreamLength :=   InStream.Length()
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*InStream*  
&emsp;Type: [InStream](instream-data-type.md)  
An instance of the [InStream](instream-data-type.md) data type.  

## Return Value
*StreamLength*  
&emsp;Type: [BigInteger](../biginteger/biginteger-data-type.md)  
The stream length or -1 if the length cannot be determined.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

With [!INCLUDE [prod_short](../../includes/prod_short.md)] 2023 release wave 1, the `Length` method allows you to get the length in bytes of the stream. Use [InStream.Position([BigInteger]) Method](instream-position-method.md) to get the position within the current stream.

## See Also
[InStream Data Type](instream-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)