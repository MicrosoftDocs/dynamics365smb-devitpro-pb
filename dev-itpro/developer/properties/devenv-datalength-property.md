---
title: "DataLength Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 5aeb3c81-dca9-4df6-98dc-322153eca056
caps.latest.revision: 6
author: SusanneWindfeldPedersen
---

 

# DataLength Property
Sets the maximum length of data stored in this field.  
  
## Applies to  
 Fields  

## Syntax
```
field(1; City; Text[15])
```
  
## Remarks  
 For [Text Data Type](../datatypes/devenv-text-data-type.md) and [Code Data Type](../datatypes/devenv-code-data-type.md) fields, enter the maximum length of the field. The database only stores the actual content of the field—not the maximum length you specify.  
  
 This field does not apply to the other data types because they have fixed lengths.  
  
## See Also  
 [Text Data Type](../datatypes/devenv-text-data-type.md)   
 [Code Data Type](../datatypes/devenv-code-data-type.md)