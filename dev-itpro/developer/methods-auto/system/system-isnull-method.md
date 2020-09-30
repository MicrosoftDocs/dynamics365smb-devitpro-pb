---
title: "System.IsNull Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
# System.IsNull Method
Gets a value indicating whether a DotNet object has been created or not.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
Ok :=   System.IsNull(DotNet: DotNet)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*DotNet*  
&emsp;Type: [DotNet](../dotnet/dotnet-data-type.md)  
A DotNet expression.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**True** if the DotNet object is NULL, otherwise **false**.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)