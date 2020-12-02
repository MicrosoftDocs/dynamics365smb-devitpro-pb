---
title: "Codeunit Data Type"
description: "The Codeunit Data Type in AL for Business Central"
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
# Codeunit Data Type
> **Version**: _Available from runtime version 1.0._

Is a container for AL code that you can use from other application objects.


The following methods are available on the Codeunit data type.


|Method name|Description|
|-----------|-----------|
|[Run(Integer [, var Record])](codeunit-run-method.md)|Loads and runs the unit of AL code you specify. To use this method, you can specify a table associated with the codeunit when you defined the codeunit properties. This allows you to pass a variable with the method. The transaction that the codeunit contains is always committed due to the Boolean return value.|

The following methods are available on instances of the Codeunit data type.

|Method name|Description|
|-----------|-----------|
|[Run(var Record)](codeunitinstance-run-method.md)|Loads and executes the unit of AL code that you specify.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  