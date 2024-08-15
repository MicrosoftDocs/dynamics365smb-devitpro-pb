---
title: "IsolatedStorage Data Type"
description: "Provides data isolation for extensions."
ms.author: solsen
ms.date: 08/15/2024
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# IsolatedStorage Data Type
> **Version**: _Available or changed with runtime version 2.0._

Provides data isolation for extensions.


## Static methods
The following methods are available on the IsolatedStorage data type.


|Method name|Description|
|-----------|-----------|
|[Contains(Text [, DataScope])](isolatedstorage-contains-string-datascope-method.md)|Determines whether the storage contains a value with the specified key.|
|[Contains(Text [, DataScope], var Boolean)](isolatedstorage-contains-string-datascope-boolean-method.md)|Determines whether the storage contains a value with the specified key.|
|[Delete(Text [, DataScope])](isolatedstorage-delete-method.md)|Deletes the value with the specified key from the isolated storage.|
|[Get(Text [, DataScope], var Text)](isolatedstorage-get-string-datascope-text-method.md)|Gets the value associated with the specified key.|
|[Get(Text, var Text)](isolatedstorage-get-string-text-method.md)|Gets the value associated with the specified key.|
|[Get(Text [, DataScope], var SecretText)](isolatedstorage-get-string-datascope-secrettext-method.md)|Gets the value associated with the specified key.|
|[Get(Text, var SecretText)](isolatedstorage-get-string-secrettext-method.md)|Gets the value associated with the specified key.|
|[Set(Text, Text [, DataScope])](isolatedstorage-set-string-string-datascope-method.md)|Sets the value associated with the specified key.|
|[Set(Text, SecretText [, DataScope])](isolatedstorage-set-string-secrettext-datascope-method.md)|Sets the value associated with the specified key.|
|[SetEncrypted(Text, Text [, DataScope])](isolatedstorage-setencrypted-string-string-datascope-method.md)|Encrypts and sets the value associated with the specified key. The input string cannot exceed a length of 215 plain characters; be aware that special characters take up more space.|
|[SetEncrypted(Text, SecretText [, DataScope])](isolatedstorage-setencrypted-string-secrettext-datascope-method.md)|Encrypts and sets the value associated with the specified key. The input string cannot exceed a length of 215 plain characters; be aware that special characters take up more space.|


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  