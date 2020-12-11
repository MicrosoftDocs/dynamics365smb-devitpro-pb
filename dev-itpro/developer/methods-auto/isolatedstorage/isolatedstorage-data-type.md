---
title: "IsolatedStorage Data Type"
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
# IsolatedStorage Data Type
> **Version**: _Available from runtime version 2.0._

Provides data isolation for extensions.


The following methods are available on the IsolatedStorage data type.


|Method name|Description|
|-----------|-----------|
|[Set(String, String [, DataScope])](isolatedstorage-set-method.md)|Sets the value associated with the specified key.|
|[Get(String [, DataScope], var Text)](isolatedstorage-get-string-datascope-text-method.md)|Gets the value associated with the specified key.|
|[Get(String, var Text)](isolatedstorage-get-string-text-method.md)|Gets the value associated with the specified key.|
|[Contains(String [, DataScope])](isolatedstorage-contains-method.md)|Determines whether the storage contains a value with the specified key.|
|[Delete(String [, DataScope])](isolatedstorage-delete-method.md)|Deletes the value with the specified key from the isolated storage.|
|[SetEncrypted(String, String [, DataScope])](isolatedstorage-setencrypted-method.md)|Encrypts and sets the value associated with the specified key. The input string cannot exceed a length of 215 plain characters; be aware that special characters take up more space.|


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  