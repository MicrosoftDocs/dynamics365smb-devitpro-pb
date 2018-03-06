---
title: "SuppressDispose Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 96935e30-d516-4997-b47e-f693b8e5718a
caps.latest.revision: 4
manager: edupont
---
# SuppressDispose Property
Specifies if a Microsoft .NET Framework object that is defined by a **DotNet** variable is disposed when it goes out of scope.  

## Applies to  
 Local variables of the **DotNet** data type.  

## Property  
 **Yes** if you do not want to dispose the .NET Framework object when it goes out of scope; otherwise, **No**. The default is **No**.  

## Remarks  
 When a local .NET Framework object is disposed, it cannot be assigned outside the scope of its local function. If you want to assign the local **DotNet** variable to a global C/AL or .NET Framework object, then you set the **SuppressDispose** property to **Yes**.  

## See Also  
 [Calling .NET Framework Members from C/AL](Calling-.NET-Framework-Members-from-C-AL.md)   
 [How to: Call .NET Framework Types From C/AL Code](How-to--Call-.NET-Framework-Types-From-C-AL-Code.md)
