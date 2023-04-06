---
title: "Using Collections"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 302553e5-08c3-46d0-9c43-65f9e76f9c3c
caps.latest.revision: 3
---
# Using Collections
In [!INCLUDE[prodshort](includes/prodshort.md)], a common development task is to write code that loops through a set of records and performs an operation on each record in the set. You can do the same task in the .NET Framework with a *collection*, which is a .NET Framework object that you can iterate over. To loop through a collection in [!INCLUDE[prodshort](includes/prodshort.md)], the .NET Framework object must support the [System.Collections](https://go.microsoft.com/fwlink/?LinkID=203729&clcid=0x409) interface. Many types in the .NET Framework and assemblies that inherit from .NET Framework types support the `System.Collections` interface. The following example shows how you can write AL code to handle collections for a type that supports the `System.Collections` interface.  
  
## Example  
 The following example implements the [System.ArrayList](https://go.microsoft.com/fwlink/?LinkID=203944&clcid=0x409) interface and uses the `GetProcesses` method from the [System.Diagnostics.Process](https://go.microsoft.com/fwlink/?LinkID=203946&clcid=0x409) type to display a list of process IDs in message boxes. Although this is not a typical example for an ERP product such as [!INCLUDE[prodshort](includes/prodshort.md)], it shows the flexibility that you get with the .NET Framework.  
  
 The example requires that you define the following AL variables.  
  
|Variable name|DataType|SubType|  
|-------------------|--------------|-------------|  
|MyProcessList|DotNet|'mscorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Array|  
|Process|DotNet|'System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Diagnostics.Process|  
|I|Integer||  
  
```  
MyProcessList := Process.GetProcesses();  
FOR I:=0 TO (MyProcessList.Length()-1) DO  
BEGIN  
    Process := MyProcessList.GetValue(I);  
    MESSAGE(FORMAT(Process.Id));  
END;  
  
```  
  
## See Also  
 [Extending Microsoft Dynamics NAV Using Microsoft .NET Framework Interoperability](Extending-Microsoft-Dynamics-NAV-Using-Microsoft-.NET-Framework-Interoperability.md)
