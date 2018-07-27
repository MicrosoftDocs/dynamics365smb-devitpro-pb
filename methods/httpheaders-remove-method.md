---
title: "Remove Method"
ms.author: solsen
ms.custom: na
ms.date: 07/26/2018
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
# Remove Method
Removes the key and the related values from the HttpHeaders object.

## Syntax
```
[Ok := ]  HttpHeaders.Remove(Key: String)
```
#### Parameters
*HttpHeaders*  
&emsp;Type: [HttpHeaders](httpheaders-data-type.md)  
An instance of the [HttpHeaders](httpheaders-data-type.md) data type.  
*Key*  
&emsp;Type: [String](string-data-type.md)  



#### Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[HttpHeaders Data Type](httpheaders-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)