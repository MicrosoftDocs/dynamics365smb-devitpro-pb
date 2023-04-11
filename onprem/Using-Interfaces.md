---
title: "Using Interfaces"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 23577936-4d02-4e73-96d6-6fc2ee40637b
caps.latest.revision: 3
---
# Using Interfaces
With .NET Framework interoperability in C/AL, you can define variables for .NET Framework interface types. This is useful when you have a class that explicitly implements an interface. In the .NET Framework, when an interface is explicitly implemented, you cannot call methods that belong to the interface directly from the class instance. To call a method, you must cast to the interface. This condition is similar in C/AL except that C/AL does not have a cast operation. In C/AL, you cannot call a method of an explicitly implemented interface directly on the DotNet variable for the class. Instead, you do the following steps:  
  
1.  Create a DotNet variable for the interface.  
  
2.  Assign the class variable to the interface.  
  
3.  Call the interface methods on the DotNet variable for the interface.  
  
## Example  
 In the following C\# example, you have the *Sample* class that explicitly implements the *ISample* interface.  
  
```c#  
class Sample : ISample  
{  
    ...  
    string ISample.Name()  
    {  
        ...  
    }  
}  
  
```  
  
 To call the *ISample.Name* method from C/AL code, you create the following variables.  
  
|Variable name|DataType|SubType \(simplified\)|  
|-------------------|--------------|----------------------------|  
|cvar|DotNet|Sample|  
|ivar|DotNet|ISample|  
  
 After you create the variables, add the following C/AL code that assigns the class variable to the interface variable and then calls the interface’s method.  
  
```  
// Assigns the class variable to the interface variable.  
ivar := cvar;  
  
...  
  
// Calls the method of the interface.  
ivar.Name();  
  
...  
  
```
