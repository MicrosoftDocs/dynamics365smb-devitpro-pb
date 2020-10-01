---
title: "Local Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: d19c51cd-2c65-4850-b0cb-97b999436187
caps.latest.revision: 5
author: SusanneWindfeldPedersen
---

 

# Local Property
Specifies if a method is local to the object on which the method is defined. A local method cannot be accessed from outside the object.  
  
## Property Value  
 **True** to specify the method as local; otherwise, **false**.  
  
 When you add a method, the property is set to **true** by default. If the value is blank, then it defaults to **false**.  

## Syntax
```
Local = true;
```
  
## Remarks  
 When the property is set to **true**, the method definition in AL code includes the word **Local**.  
  
 If the property is set to **false**, then the method is considered to be global, which means that is can be called and accessed from other [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] objects.  
  
> [!NOTE]  
>  This property is not set to **true** when the method is in a test codeunit. Instead, the [Test Attribute](../methods/devenv-test-attribute.md) is declared. Methods in test codeunits are automatically global. <!-- //NAV For more information, see [How to: Create Test Codeunits and Test Methods](../methods/devenv-how-to-create-test-codeunits-and-test-methods.md).  -->
  
## See Also  
 [Standard and User-Defined Methods](../methods/devenv-standard-and-user-defined-methods.md)