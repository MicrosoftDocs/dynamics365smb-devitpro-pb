---
title: "Using Enumerations"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c959e566-734a-4966-a668-a1f813ff3488
caps.latest.revision: 12
manager: edupont
---
# Using Enumerations
In the .NET Framework, an enumeration typically represents constant values as symbolic or literal names. For example, if you have the type `Color`, then instead of using the values `0`, `1`, and `2`, you can use `Red`, `Green`, and `Blue`. The following is a C\# code example for the `Color` enumeration.  

```c#  
namespace Microsoft.Dynamics.Nav.EnumSample  
{  
  public class DataValues  
  {  
    public enum Color   
    {  
      Red,  
      Green,  
      Blue,  
    }  
  }  
}  

```  

 .NET Framework interoperability supports symbolic names in enumerations. In C/AL code, enumerations are handled like static fields on the .NET Framework type.  

## Creating and Calling DotNet Variables for Enumerations in C/AL  
 You create DotNet variables for enumerations similar to other .NET Framework types. When you create a DotNet variable for an enumeration in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], the enumeration name in the **.NET Type List** is preceded by a plus sign. The following illustration shows the **.NET Type List** for the enumeration in the previous code example.  

 ![.NET Type List showing enumeration.](media/NAV_DotNet_Enum_Setup.png "NAV\_DotNet\_Enum\_Setup")  

 To call an enumeration from C/AL code, you can use the **C/AL Symbol Menu**, which displays all the values for the enumeration. The following illustration shows an example in the **C/AL Symbol Menu**.  

 ![C&#47;AL Symbol Menu showing enumeration values.](media/NAV_Dotnet_Enum_Symbol.png "NAV\_Dotnet\_Enum\_Symbol")  

 The following C/AL code assigns the `Red` value to the `Color` enumeration.  

```  
Color := Color.Red;  
```  

 After the value is assigned, you can use the enumeration value in the C/AL code similar to a C/AL option data type. You must reference .NET Framework enumerations by using the DotNet variables that define them.  

## Example  
 In the following C/AL code example, the DotNet variable `EnumTarget` defines a method called `MyMethod` that has an enumeration type parameter. In the example, the `MyMethod` method is invoked by using the `Color` enumeration that is discussed in the previous sections of this topic.  

```  

EnumTarget.MyMethod(Color.Red);  
EnumTarget.MyMethod(0); // Assumes that the enumeration value Red has the numerical value of 0.  
```  

 The common language runtime automatically maps the value `0` to the correct enumeration value of `Red`.  

## See Also  
 [Calling .NET Framework Members from C/AL](Calling-.NET-Framework-Members-from-C-AL.md)   
 [Extending Microsoft Dynamics NAV Using Microsoft .NET Framework Interoperability](Extending-Microsoft-Dynamics-NAV-Using-Microsoft-.NET-Framework-Interoperability.md)
