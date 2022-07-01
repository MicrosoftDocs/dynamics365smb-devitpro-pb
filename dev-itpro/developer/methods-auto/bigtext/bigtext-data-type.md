---
title: "BigText Data Type"
description: "Handles large text documents."
ms.author: solsen
ms.custom: na
ms.date: 03/24/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# BigText Data Type
> **Version**: _Available or changed with runtime version 1.0._

Handles large text documents.



The following methods are available on instances of the BigText data type.

|Method name|Description|
|-----------|-----------|
|[AddText(Text [, Integer])](bigtext-addtext-string-integer-method.md)|Adds a text string to a BigText variable.|
|[AddText(BigText [, Integer])](bigtext-addtext-bigtext-integer-method.md)|Adds a text string to a BigText variable.|
|[GetSubText(var Text, Integer [, Integer])](bigtext-getsubtext-text-integer-integer-method.md)|Gets part of a BigText variable.|
|[GetSubText(var BigText, Integer [, Integer])](bigtext-getsubtext-bigtext-integer-integer-method.md)|Gets part of a BigText variable.|
|[Length()](bigtext-length-method.md)|Retrieves the length of the text stored in this BigText instance.|
|[Read(InStream)](bigtext-read-method.md)|Streams a BigText object that is stored as a BLOB in a table to a BigText variable.|
|[TextPos(Text)](bigtext-textpos-method.md)|Gets the position at which a specific string first occurs in this BigText instance.|
|[Write(OutStream)](bigtext-write-method.md)|Streams a BigText object to a BLOB field in a table.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This data type cannot be shown in a message window or be seen in the Debugger. The maximum length of a BigText variable is 2,147,483,647 characters and this corresponds to 2 GB. You can use the BigText methods to manipulate a BigText variable, for example to extract part of a BigText variable or to add a text string to a BigText variable. The normal string methods cannot be used with a BigText variable.  

## See Also

[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  