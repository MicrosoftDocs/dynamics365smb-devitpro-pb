---
title: "OnPreDataItem Trigger"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# OnPreDataItem Trigger

Runs before a data item is processed.  

## Syntax  

```AL
trigger OnPreDataItem() 
begin
    ...
end;
```

## Applies to

- Data items  

## Remarks  

This trigger is run before a data item is processed, but after the associated variable is initialized and table views and filters are set.  

You can use this trigger to add additional filtering beyond what is established by the [DataItemLink Property (Reports)](../properties/devenv-dataitemlink-reports-property.md) or [DataItemTableView Property](../properties/devenv-dataitemtableview-property.md). For example, use this trigger if you need to filter an indented data item based on the result of a calculation. Use the [SETRANGE Record](../methods/devenv-setrange-method-record.md) or [SETFILTER Record](../methods/devenv-setfilter-method-record.md)  to add extra delimiters.  

## See Also  

[DataItemLink Property (Reports)](../properties/devenv-dataitemlink-reports-property.md)   
[DataItemTableView Property](../properties/devenv-dataitemtableview-property.md)   
[SetRange Method Record](../methods/devenv-setrange-method-record.md)   
[SetFilter Method Record](../methods/devenv-setfilter-method-record.md)
