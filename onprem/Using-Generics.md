---
title: "Using Generics"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: df552ac2-720c-4761-953e-b2fba95a82a4
caps.latest.revision: 6
---
# Using Generics
In the .NET Framework, you can use generics to customize a method, class, structure, interface, field, or property according to the data type that it acts upon. Instead of writing a method, class, structure, interface, field, or property for a particular type, you can write it to use any type. When a generic is declared, the type is specified. For example, in C\#, if you use the generic type parameter `T`, then you can write a `List<T>` class that is declared as either `List<int>`, `List<string>`, or `List<MyClass>`.  
  
 With .NET Framework interoperability, you can define DotNet variables for generics. You cannot specify generic type names in C/AL. When a generic is instantiated by a constructor in C/AL, all type names are set to the `System.Object` type. For example, if you have a *mylist* DotNet variable for the *System.List\<T>* generic, you create an instance of *mylist* in C/AL as shown. *mylist* is instantiated as a `List<Object>` type.  
  
```  
mylist := mylist.List();  
```  
  
 If a method returns an instance of a generic whose type name is defined, then the type name is applied. In the following C/AL example, the method returns a `List<String>` instance, and *mylist* is instantiated as a `List<String>` type.  
  
```  
mylist := x.GetAStringList();  
```  
  
## Example  
 The following C/AL example constructs a string list, fills the list with data, and then uses the `Item` method to validate whether the list contains the expected data. The Item method is equivalent to a C\# index operator.  
  
|Variable name|Data Type|SubType|Length|  
|-------------------|---------------|-------------|------------|  
|varDotNet|DotNet|'mscorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Collections.Generic.List\`1||  
|textResult|Text||30|  
|i|Integer|||  
|capacity|Integer|||  
  
```  
capacity := 5;  
varDotNet := varDotNet.List(capacity);  
  
FOR i:= 0 TO (capacity-1) DO  
  varDotNet.Add(FORMAT(i));  
  
IF varDotNet.Count <> capacity THEN  
  ERROR('Wrong list count, expected {0}, actual {1}', capacity,   
    varDotNet.Count);  
  
FOR i:= 0 TO (capacity-1) DO  
BEGIN  
  textResult := varDotNet.Item(i);  
  IF textResult <> FORMAT(i) THEN  
    ERROR('List index [%1] contains the wrong data, expected %2, actual  
      %3', i, FORMAT(i), textResult);  
END;  
  
```  
  
## See Also  
 [Extending Microsoft Dynamics NAV Using Microsoft .NET Framework Interoperability](Extending-Microsoft-Dynamics-NAV-Using-Microsoft-.NET-Framework-Interoperability.md)
