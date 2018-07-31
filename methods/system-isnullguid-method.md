---
title: "IsNullGuid Method"
ms.author: solsen
ms.custom: na
ms.date: 07/31/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# IsNullGuid Method
Indicates whether a value has been assigned to a GUID. A null GUID that consists only of zeros is valid but must never be used for references.

## Syntax
```
Ok :=   System.IsNullGuid(Guid: Guid)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Guid*  
&emsp;Type: [Guid](guid-data-type.md)  
The GUID that you want to check whether it is null.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)