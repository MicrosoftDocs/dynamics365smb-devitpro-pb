---
title: "Numeric Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 9fa14511-7807-4f9e-823f-bab30edbdd95
caps.latest.revision: 10
author: SusanneWindfeldPedersen
---

 

# Numeric Property
Sets a value that requires that users enter only numbers in the field.  
  
## Applies To  
  
-   Table Fields  
  
-   Page Fields  

## Syntax
```
Numeric = true;
```
  
## Remarks  
 This setting is checked during validation. Validation occurs only if the field or control value is updated through the UI, for example, if a value is updated on a page or if a field is updated in a table directly. If a field is updated through application code, then the **Numeric** property is not validated.  
  
## See Also  
 [MinValue Property](devenv-minvalue-property.md)   
 [MaxValue Property](devenv-maxvalue-property.md)   
 [Properties](devenv-properties.md)