---
title: "SuppressDispose Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 96935e30-d516-4997-b47e-f693b8e5718a
caps.latest.revision: 4
author: SusanneWindfeldPedersen
---

# SuppressDispose Property

Specifies if a Microsoft .NET Framework object that is defined by a **DotNet** variable is disposed when it goes out of scope.  

## Applies to  

Local variables of the **DotNet** data type.  

## Property  

**True** if you do not want to dispose the .NET Framework object when it goes out of scope; otherwise, **false**. The default is **false**.  

## Syntax

```AL
SuppressDispose = false;
```

## Remarks

When a local .NET Framework object is disposed, it cannot be assigned outside the scope of its local function. If you want to assign the local **DotNet** variable to a global AL or .NET Framework object, then you set the **SuppressDispose** property to **true**.  
<!-- 
## See Also  
 [Calling .NET Framework Members from AL](Calling-.NET-Framework-Members-from-AL.md)   
 [How to: Call .NET Framework Types From AL Code](How-to-Call-.NET-Framework-Types-From-AL-Code.md) -->

## See Also

[Properties](devenv-properties.md)
