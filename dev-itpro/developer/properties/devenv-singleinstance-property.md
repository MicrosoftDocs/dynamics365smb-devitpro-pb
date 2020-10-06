---
title: "SingleInstance Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 5b0f6ddb-2a7b-46b0-a07d-f5408d63a0e5
caps.latest.revision: 7
author: SusanneWindfeldPedersen
---

# SingleInstance Property

Sets whether a single instance of the codeunit and codeunit variables are instantiated.  
  
## Applies to  

- Codeunits  
  
## Property Values  

**True** if only one instance of a codeunit that makes it a single instance codeunit is set; otherwise, **false**. The default is **false**.

## Syntax

```AL
SingleInstance = true;
```  
  
## Remarks

When you set this property to **true** on a codeunit, all codeunit variables that use this codeunit use the same instance. That is, all codeunit variables of this codeunit use the same set of internal variables when the code is running on the same client. The codeunit remains instantiated until you close the company.  
  
The following example shows how you can use the SingleInstance property.  
  
Two pages can connect to the same codeunit.  
  
On Page1:  
  
`Codeunit1.SetNumber(100);`  
  
On Page2:  
  
`Number := Codeunit1.GetNumber();`  
  
`Message(Format(Number));`  
  
The SingleInstance property in Codeunit1 is set to **true**. Page1 calls a function on Codeunit1 and sets the parameter to 100. Codeunit1 saves this parameter in a local variable. Page2 is now able to get the parameter value \(=100\) from Codeunit1. A message is displayed.  
  
## See Also  

[Properties](devenv-properties.md)