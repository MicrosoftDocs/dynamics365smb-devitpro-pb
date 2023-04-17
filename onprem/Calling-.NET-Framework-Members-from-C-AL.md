---
title: Calling .NET Framework Members from C/AL
description: Call all .NET Framework type members, including methods, properties, and constructors, from C/AL code with the DotNet data type for C/AL variables.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 02e7deaa-6d0f-4713-b7f5-568418cc4ebd
caps.latest.revision: 18
---
# Calling .NET Framework Members from C/AL
You can call .NET Framework type members, including methods, properties, and constructors, from C/AL code with the DotNet data type for C/AL variables. This section provides an overview of the DotNet data type, guidelines on its use, and aspects about calling members of a .NET Framework type. For information about how to create and use a DotNet variable to call members of a type, see [How to: Call .NET Framework Types From C/AL Code](How-to--Call-.NET-Framework-Types-From-C-AL-Code.md).  

## DotNet Data Type  
 The DotNet type resembles the Automation type in C/AL except that it references a .NET Framework type in an assembly. Assemblies can be either part of assemblies that are installed in the global assembly cache or custom assemblies that you have installed for [!INCLUDE[navnow](includes/navnow_md.md)]. For more information about how to install assemblies in global assembly cache, see [Assembly Installation in the GAC](https://go.microsoft.com/fwlink/?LinkID=196848).  

 After you have defined a DotNet variable, you can call it in C/AL code to instantiate members of a .NET Framework type.  

## Constructors  
 A *constructor* is a method that creates an instance of an object and prepares it for use. Before you use a DotNet variable, you should verify whether the variable is static or is an object instance because this determines whether you have to use a constructor.  

-   Static variables do not require a constructor because they do not have an instance.  

-   Object instance variables require a constructor because they must be created before they can be accessed.  

 To find the constructor and other methods and property for your object, in Object Designer, choose **Symbol**.  

## Static and Instance Method Calls  
 Methods that you call from C/AL code can be either *static* or *instance* methods.  

-   You use the same syntax to call static and instance methods.  

-   Calling static methods provides a factory pattern for creating object instances. For example, to create a new [System.TimeZoneInfo](https://msdn.microsoft.com/library/system.timezoneinfo\(v=vs.110\).aspx) object, you call the type’s [System.TimeZoneInfo.Local](https://msdn.microsoft.com/library/system.timezoneinfo.local\(v=vs.110\).aspx) static method with the following code.  

    ```  
    zone := zone.Local;  

    ```  

-   A static class or object is loaded one time for each [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, and the class or object is shared between all clients that are connected to the server instance. The data that is maintained by the static class or object is visible by all clients that use the type. You should consider this in your .NET Framework interoperability design to help avoid disclosing private information.  

## C\# Indexers  
 A C\# *indexer* is represented as an Item property in C/AL. For example, in C\#, the following code sets an array element `N` to the value `M`.  

```  
arrayVariable[N] = M;  

```  

 In C/AL, the corresponding code is as follows.  

```  
arrayVariable.Item(N) := M;  
```  

 Indexers can also be overloaded. In Object Designer, choose **C/AL Symbol Menu** to see the parameters and return types for the indexer.  

 Indexers for lists and arrays that are defined by .NET Framework variables are zero-based, which means that they start at 0. Other indexers in C/AL start at 1.  

## Operators for Comparing .NET Framework Objects  
 .NET Framework interoperability does not support direct use of operators to compare two DotNet variables. For example, the following scenario is not supported.  

```  
IF dotnetVar1 <= dotnetVar2 THEN  
```  

 If you want to compare two DotNet variables, then you can use the Equals function on the DotNet variables as shown in the following example.  

```  
IF dnVersion1.Equals(dnVersion2) THEN …  
```  

 You can perform comparisons by using .NET Framework methods and properties that return compatible C/AL types because these objects are implicitly converted to C/AL types before the comparison occurs. For example, the following C/AL code includes three DotNet variables for the System.Collections.Generic.List class: dotNetList1, dotNetList2, and dotNetList3. You cannot compare the DotNet variables directly because they do not return C/AL types. You can perform comparisons on the List.Capacity property because the List.Capacity property is a NET Framework integer type that returns a C/AL integer type. For more information about conversion between .NET Framework and C/AL types, see [Mapping Between .NET Framework and C/AL Types](Mapping-Between-.NET-Framework-and-C-AL-Types.md).  

```  
dotNetList1 := dotNetList1.List(5);  
dotNetList2 := dotNetList2.List(10);  
dotNetList3 := dotNetList3.List(5);  

IF dotNetList1.Capacity <> dotNetList3.Capacity THEN  
  ERROR('List1 and List3 should have the same capacity.');  

IF dotNetList1.Capacity = dotNetList2.Capacity THEN  
  ERROR('List1 and List2 should not have the same capacity.');  

IF dotNetList1.ToString() <> dotNetList2.ToString() THEN  
  ERROR('List1 and List2 should have the same ToString output.');  

```  

## Public Fields  
 [!INCLUDE[navnow](includes/navnow_md.md)] does not support public fields in the .NET Framework.  

## Case Sensitivity in Member Names  
 NET Framework member names in C/AL code are case-sensitive. If you use the incorrect case when you call a member, then you get an error when you compile the object. This behavior differs from other C/AL variables because you can mix cases and still compile the object. For other C/AL variables, the case is corrected automatically the next time that you open the object.  

## Local DotNet Variable Limitations  
 By default, a local DotNet variable is disposed when it goes out of scope. In this case, you should not assign the local DotNet variable to global C/AL or .NET Framework objects. However, local DotNet variables include the SuppressDispose property that you use to set the variable not to dispose when it goes out of scope, which lets you use the local variable outside the scope of its local function. For more information, see [SuppressDispose Property](SuppressDispose-Property.md).  

## See Also  
 [How to: Call .NET Framework Types From C/AL Code](How-to--Call-.NET-Framework-Types-From-C-AL-Code.md)   
 [Handling Events with Microsoft .NET Framework Interoperability](Handling-Events-with-Microsoft-.NET-Framework-Interoperability.md)   
 [Serializing .NET Framework Types](Serializing-.NET-Framework-Types.md)
