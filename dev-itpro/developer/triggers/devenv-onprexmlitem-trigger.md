---
title: "OnPreXMLItem Trigger"
description: "OnPreXMLItem trigger in AL for Business Central."
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---


# OnPreXMLItem Trigger
Runs after the table is initialized and before you start exporting data to an XML object. This trigger only applies to XMLPort elements that have a source type of **Table**.  
  
## Applies to  
- XMLports  
  
## Remarks  
 This trigger is only used to export data. It is typically used to set filters on the data and to initialize variables before finding the first record.  
  
## See Also  
 [Triggers](devenv-triggers.md)  
 [XMLport trigger](devenv-xmlport-triggers.md)  