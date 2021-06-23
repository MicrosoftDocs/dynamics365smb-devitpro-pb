---
title: "WebServiceActionContext.AddEntityKey Method"
description: "Add a new \<fieldId, value\> pair to the collection of entity keys."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# WebServiceActionContext.AddEntityKey Method
> **Version**: _Available or changed with runtime version 2.0._

Add a new \<fieldId, value\> pair to the collection of entity keys.


## Syntax
```AL
[Ok := ]  WebServiceActionContext.AddEntityKey(FieldId: Integer, FieldValue: Any)
```
## Parameters
*WebServiceActionContext*  
&emsp;Type: [WebServiceActionContext](webserviceactioncontext-data-type.md)  
An instance of the [WebServiceActionContext](webserviceactioncontext-data-type.md) data type.  

*FieldId*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The field ID of the entity key.
        
*FieldValue*  
&emsp;Type: [Any](../any/any-data-type.md)  
The value for the field in the entity key.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if adding the entity key succeeded, otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

```al
actionContext.AddEntityKey(Rec.FieldNO(Id), ToSalesHeader.Id);
```
For a complete code example, see [Creating and Interacting with an OData V4 Bound Action](../../devenv-creating-and-interacting-with-odatav4-bound-action.md).


## See Also
[WebServiceActionContext Data Type](webserviceactioncontext-data-type.md)  
[Creating and Interacting with an OData V4 Bound Action](../../devenv-creating-and-interacting-with-odatav4-bound-action.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)