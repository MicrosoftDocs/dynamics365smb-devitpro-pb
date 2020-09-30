---
title: "WebServiceActionContext.SetResultCode Method"
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
# WebServiceActionContext.SetResultCode Method
Sets the web service action result status code.


## Syntax
```
 WebServiceActionContext.SetResultCode(ResultCode: WebServiceActionResultCode)
```
## Parameters
*WebServiceActionContext*  
&emsp;Type: [WebServiceActionContext](webserviceactioncontext-data-type.md)  
An instance of the [WebServiceActionContext](webserviceactioncontext-data-type.md) data type.  

*ResultCode*  
&emsp;Type: [WebServiceActionResultCode](../webserviceactionresultcode/webserviceactionresultcode-option.md)  
The new web service action result status code.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example
```
...
// Set the result code to inform the caller that an item was created.
actionContext.SetResultCode(WebServiceActionResultCode::Created);
...
```
For a complete code example, see [Creating and Interacting with an OData V4 Bound Action](../../devenv-creating-and-interacting-with-odatav4-bound-action.md).

## See Also
[WebServiceActionContext Data Type](webserviceactioncontext-data-type.md)  
[Creating and Interacting with an OData V4 Bound Action](../../devenv-creating-and-interacting-with-odatav4-bound-action.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)