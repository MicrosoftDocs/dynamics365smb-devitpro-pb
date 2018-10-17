---
title: "Remove Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2018
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
Removes the specified header from the HttpHeaders collection.

## Syntax
```
[Ok := ]  HttpHeaders.Remove(Name: String)
```
## Parameters
*HttpHeaders*  
&emsp;Type: [HttpHeaders](httpheaders-data-type.md)  
An instance of the [HttpHeaders](httpheaders-data-type.md) data type.  

*Name*  
&emsp;Type: [String](string-data-type.md)  
The name of the header to remove from the collection.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
**true** if the element is successfully removed; otherwise, **false**. This method also returns **false** if the given header was not found in the HttpHeaders collection.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[HttpHeaders Data Type](httpheaders-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)