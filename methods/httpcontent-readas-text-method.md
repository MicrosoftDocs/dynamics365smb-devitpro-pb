---
title: "ReadAs Method"
ms.author: solsen
ms.custom: na
ms.date: 07/27/2018
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
# ReadAs Method
Reads the content into the provided text.

## Syntax
```
[Ok := ]  HttpContent.ReadAs(var OutputString: Text)
```
#### Parameters
*HttpContent*  
&emsp;Type: [HttpContent](httpcontent-data-type.md)  
An instance of the [HttpContent](httpcontent-data-type.md) data type.  
*OutputString*  
&emsp;Type: [Text](text-data-type.md)  
  


#### Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
Accessing the HttpContent property of HttpResponseMessage in a case when the request fails will result in an error.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[HttpContent Data Type](httpcontent-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)