---
title: "Local Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: d19c51cd-2c65-4850-b0cb-97b999436187
caps.latest.revision: 5
manager: edupont
---
# Local Property
Specifies if a function is local to the object on which the function is defined. A local function cannot be accessed from outside the object.  
  
## Property Value  
 **Yes** to specify the function as local; otherwise, **No**.  
  
 When you add a function, the property is set to **Yes** by default. If the value is blank, then it defaults to **No**.  
  
## Remarks  
 When the property is set to **Yes**, the function definition in C/AL code includes the word **Local**.  
  
 If the property is set to **No**, then the function is considered to be global, which means that is can be called and accessed from other [!INCLUDE[navnow](includes/navnow_md.md)] objects.  
  
> [!NOTE]  
>  This property is not set to **Yes** when the function is in a test codeunit. Instead, the [FunctionType Property \(Test Codeunits\)](FunctionType-Property--Test-Codeunits-.md) is set to **Test**. Functions in test codeunits are automatically global. For more information, see [How to: Create Test Codeunits and Test Functions](How-to--Create-Test-Codeunits-and-Test-Functions.md).  
  
## See Also  
 [Standard and User-Defined Functions](Standard-and-User-Defined-Functions.md)