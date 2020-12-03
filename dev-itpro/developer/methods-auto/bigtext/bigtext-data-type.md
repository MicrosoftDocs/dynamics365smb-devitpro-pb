---
title: "BigText Data Type"
ms.author: solsen
ms.custom: na
ms.date: 12/03/2020
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
# BigText Data Type
> **Version**: _Available from runtime version 1.0._

Handles large text documents.



The following methods are available on instances of the BigText data type.

|Method name|Description|
|-----------|-----------|
|[Length()](bigtext-length-method.md)|Retrieves the length of the text stored in this BigText instance.|
|[AddText(String [, Integer])](bigtext-addtext-string-integer-method.md)|Adds a text string to a BigText variable.|
|[AddText(BigText [, Integer])](bigtext-addtext-bigtext-integer-method.md)|Adds a text string to a BigText variable.|
|[GetSubText(var Text, Integer [, Integer])](bigtext-getsubtext-text-integer-integer-method.md)|Gets part of a BigText variable.|
|[GetSubText(var BigText, Integer [, Integer])](bigtext-getsubtext-bigtext-integer-integer-method.md)|Gets part of a BigText variable.|
|[TextPos(String)](bigtext-textpos-method.md)|Gets the position at which a specific string first occurs in this BigText instance.|
|[Write(OutStream)](bigtext-write-method.md)|Streams a BigText object to a BLOB field in a table.|
|[Read(InStream)](bigtext-read-method.md)|Streams a BigText object that is stored as a BLOB in a table to a BigText variable.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
This data type cannot be shown in a message window or be seen in the Debugger. The maximum length of a BigText variable is 2,147,483,647 characters and this corresponds to 2 GB. You can use the BigText methods to manipulate a BigText variable, for example to extract part of a BigText variable or to add a text string to a BigText variable. The normal string methods cannot be used with a BigText variable.  
## See Also

[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  