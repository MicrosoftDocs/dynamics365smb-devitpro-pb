---
title: "RequestPage.Activate Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# RequestPage.Activate Method
Activates the current page on the client if possible. The data on the page will not be refreshed.


## Syntax
```
[Ok := ]  RequestPage.Activate([Refresh: Boolean])
```
## Parameters
*RequestPage*  
&emsp;Type: [RequestPage](requestpage-data-type.md)  
An instance of the [RequestPage](requestpage-data-type.md) data type.  

*Refresh*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
If set to **true**, the data on the page will be refreshed.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[RequestPage Data Type](requestpage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)