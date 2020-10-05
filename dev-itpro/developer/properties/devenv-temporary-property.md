---
title: "Temporary Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

 

# Temporary Property
Sets whether a temporary table is created.  
  
## Applies to  
- Record variables  
  
## Syntax

```
var
    TempInvoicePostBuffer: Record "Invoice Post. Buffer" temporary;
```

## Remarks  
Changes made to a temporary table are not stored to a database.  
  
## See Also  
[Properties](devenv-properties.md)   
[UseTemporary Property (Report)](devenv-usetemporary-report-property.md)   
[UseTemporary Property (XMLPort)](devenv-usetemporary-xmlport-property.md)    
[Temporary Tables](../devenv-temporary-tables.md)  