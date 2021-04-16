---
title: "OnBeforeOpen (Query) Trigger"
ms.description: "Runs before a query is run and the dataset is generated."
ms.author: solsen
ms.custom: na
ms.date: 04/16/2021
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

# OnBeforeOpen (Query) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs before a query is run and the dataset is generated.


## Syntax
```
trigger OnBeforeOpen()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The AL code of a query object includes the **OnBeforeOpen** trigger that you can use to change the data that will be included in the resulting dataset. For example, you can use the **OnBeforeOpen** trigger to apply filters to a column.  

The **OnBeforeOpen** trigger only supports local variables; global variables are not supported.  

> [!NOTE]  
> A query cannot be run from the **OnBeforeOpen** trigger. You cannot call methods from the triggers that run the query, such as [Open](../../methods-auto/query/queryinstance-open-method.md), [SaveAsXml](../../methods-auto/query/queryinstance-saveasxml-method.md), [Read](../../methods-auto/query/queryinstance-read-method.md), or [Close](../../methods-auto/query/queryinstance-close-method.md) methods.  

## Example

The following code applies a filter on the Quantity column of the query by calling the SetFilter on the **OnBeforeOpen** trigger of the query object.  

```AL
currQuery.SetFilter(Quantity, '>50');  
```

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
