---
title: "ServiceEnabled attribute"
description: "Exposes a method to the service."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# ServiceEnabled attribute
> **Version**: _Available or changed with runtime version 2.0._

Exposes a method to the service.


## Applies to

- Method


## Syntax

```AL
[ServiceEnabled]
```

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

```AL
    [ServiceEnabled]
    procedure Post(var ActionContext: WebServiceActionContext)
    var
        SalesHeader: Record "Sales Header";
        SalesInvoiceHeader: Record "Sales Invoice Header";
    begin
        GetDraftInvoice(SalesHeader);
        PostInvoice(SalesHeader, SalesInvoiceHeader);
        SetActionResponse(ActionContext, SalesInvoiceHeader.Id);
    end;
```

## Related information  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  