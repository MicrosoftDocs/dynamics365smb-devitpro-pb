---
title: "WebServiceActionContext.SetObjectId(Integer) Method"
description: "Sets the object ID."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# WebServiceActionContext.SetObjectId(Integer) Method
> **Version**: _Available or changed with runtime version 2.0._

Sets the object ID.


## Syntax
```AL
 WebServiceActionContext.SetObjectId(ObjectId: Integer)
```
## Parameters
*WebServiceActionContext*  
&emsp;Type: [WebServiceActionContext](webserviceactioncontext-data-type.md)  
An instance of the [WebServiceActionContext](webserviceactioncontext-data-type.md) data type.  

*ObjectId*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The new object ID.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

```al
actionContext.SetObjectId(Page::SalesInvoiceCopy);
```
For a complete code example, see [Creating and Interacting with an OData V4 Bound Action](../../devenv-creating-and-interacting-with-odatav4-bound-action.md).

## Related information
[WebServiceActionContext Data Type](webserviceactioncontext-data-type.md)  
[Creating and Interacting with an OData V4 Bound Action](../../devenv-creating-and-interacting-with-odatav4-bound-action.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)