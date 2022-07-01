---
title: "IsolatedStorage Data Type"
description: "Provides data isolation for extensions."
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
# IsolatedStorage Data Type
> **Version**: _Available or changed with runtime version 2.0._

Provides data isolation for extensions.


The following methods are available on the IsolatedStorage data type.


|Method name|Description|
|-----------|-----------|
|[Contains(Text [, DataScope])](isolatedstorage-contains-method.md)|Determines whether the storage contains a value with the specified key.|
|[Delete(Text [, DataScope])](isolatedstorage-delete-method.md)|Deletes the value with the specified key from the isolated storage.|
|[Get(Text [, DataScope], var Text)](isolatedstorage-get-string-datascope-text-method.md)|Gets the value associated with the specified key.|
|[Get(Text, var Text)](isolatedstorage-get-string-text-method.md)|Gets the value associated with the specified key.|
|[Set(Text, Text [, DataScope])](isolatedstorage-set-method.md)|Sets the value associated with the specified key.|
|[SetEncrypted(Text, Text [, DataScope])](isolatedstorage-setencrypted-method.md)|Encrypts and sets the value associated with the specified key. The input string cannot exceed a length of 215 plain characters; be aware that special characters take up more space.|


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  