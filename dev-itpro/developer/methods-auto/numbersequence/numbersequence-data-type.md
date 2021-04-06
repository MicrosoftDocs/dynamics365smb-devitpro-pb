---
title: "NumberSequence Data Type"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# NumberSequence Data Type
> **Version**: _Available or changed with runtime version 4.0._

Is a complex data type for creating and managing number sequences in the database.


The following methods are available on the NumberSequence data type.


|Method name|Description|
|-----------|-----------|
|[Current(String [, Boolean])](numbersequence-current-method.md)|Gets the current value from the number sequence, without doing any increment. The value is retrieved out of transaction. The value will not be returned on transaction rollback.|
|[Delete(String [, Boolean])](numbersequence-delete-method.md)|Deletes a specific number sequence.|
|[Exists(String [, Boolean])](numbersequence-exists-method.md)|Checks whether a specific number sequence exists.|
|[Insert(String [, BigInteger] [, BigInteger] [, Boolean])](numbersequence-insert-method.md)|Creates a number sequence in the database, with the given parameters.|
|[Next(String [, Boolean])](numbersequence-next-method.md)|Retrieves the next value from the number sequence.|


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
