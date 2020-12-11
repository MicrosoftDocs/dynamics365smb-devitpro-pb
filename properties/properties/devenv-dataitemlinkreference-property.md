---
title: "DataItemLinkReference Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# DataItemLinkReference Property
Sets the parent data item to which a child data item is linked. After you specify the **DataItemLinkReference** value, use the [DataItemLink Property (Reports)](devenv-dataitemlink-reports-property.md) to specify a field from each data item on which to base the link.  
  
## Applies to  
  
-   Data items  
-   Reports  
  
## Remarks  
The default value is the name of the last preceding data item in the report with lower indentation. You can set **DataItemLinkReference** and **DataItemLink** properties for a data item that is not a child of another data item, however, this will not have any effect.  

## See Also  
[Properties](devenv-properties.md)  
[DataItemLink Property (Reports)](devenv-dataitemlink-reports-property.md)  