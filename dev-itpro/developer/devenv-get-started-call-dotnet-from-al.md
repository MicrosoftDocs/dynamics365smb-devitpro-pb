---
title: "Getting started with Microsoft .NET Interoperability from AL"
description: "Description of the process of referencing and using .NET types"
author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Getting started with Microsoft .NET Interoperability from AL

You can call .NET type members, including methods, properties, and constructors, from AL code. In this article we will guide you through the process of creating an extension that uses .NET types.

> [!IMPORTANT]  
> .NET Interoperability is only available on-premise. If you want to use this functionality, you must set the `"target": "OnPrem"` in the `app.json` file. For more information, see [JSON Files](devenv-json-files.md#Appjson).

## Enabling .NET Interoperability

.NET interoperability can only be used by applications that target on-premise deployments. See [JSON Files](devenv-json-files.md#Appjson) for more information on how to set the correct compilation target and [Compilation Scope Overview](devenv-compilation-scope-overview.md).

## Declaring a .NET package

Using a .NET type in AL is a two-step process. First, you must declare the type in a **dotnet** package, and then reference it from code using the **DotNet** type.

You start by declaring an empty **dotnet** package in your extension. See the example snippet below.

```AL
dotnet
{
    
}
```

It is recommended to have only one package per extension that contains all the .NET types which you will be using.

You continue by adding a declaration of the assembly that you will be referencing. For this example, we will use the `mscorlib` assembly that contains the core .NET types. A **dotnet** package can contain an unlimited number of assembly declarations. The name of the assembly must be the one defined in the assembly's manifest. See the following example snippet.


```AL
dotnet
{    
    assembly(mscorlib)
    {
    }
}

```

By default, the compiler only knows about the location of the `mscorlib` assembly. You can reference any compatible assembly by providing the compiler with a path to the assembly's containing folder. This can be achieved by adding the path to assembly's containing folder to the `"al.assemblyProbingPaths"` setting. Open the Command Palette **Ctrl+Shift+P** and choose either **User Settings** or **Workspace Settings** and specify the `al.assemblyProbingPaths` setting. For example:

```AL
"al.assemblyProbingPaths": [
        "./.netpackages",
        "C:/Program Files/Assemblies"
    ]
```

> [!NOTE]  
> Any update to an assembly's code is not automatically detected by the compiler. If an assembly has changed, then you must restart your development environment.

You continue by adding a reference to a type from the referenced assembly. In this example, we will use `System.DateTime` from `mscorlib` and we will give it the alias `MyDateTime`. The type must be referenced using its fully-qualified name. The alias is used for referencing the .NET type from code. If an alias is not provided, the compiler will use the .NET type name. A .NET assembly declaration can contain any number of type declarations. See the example below.

```AL
dotnet
{
    assembly(mscorlib)
    {
        type(System.DateTime; MyDateTime){}
    }
}
```

## Using a .NET type from AL code
From this point on, we can reference the .NET type from AL code using its given alias, as shown in the example below.

```AL
dotnet
{
    assembly(mscorlib)
    {
        type(System.DateTime; MyDateTime){}
    }
}

pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        now: DotNet MyDateTime;
    begin
        now := now.UtcNow();
        Message('Hello, world! It is: ' + now.ToString());
    end;
}
```

## Publishing your extension
The AL Language extension, including the AL compiler, and the server to which you publish your code are completely decoupled.
When publishing, the server re-compiles your code and tries to resolve all the references to external assemblies. In order for the compilation to succeed, the server must be able to locate and load all the referenced assemblies and types.

The server will search the global assembly cache (GAC), the **Add-ins** folder, and the **Add-in** table. You must manually install any custom assembly in one of these locations.

## See Also
[Getting Started with AL](devenv-get-started.md)  
[.NET Control Add-Ins](devenv-dotnet-controladdins.md)        
[Subscribing to Events in a .NET Framework Type](devenv-dotnet-subscribe-to-events.md)     
[Serializing .NET Framework Types](devenv-dotnet-serializing-dotnetframework-types.md)  
[AL Language Extension Configuration](devenv-al-extension-configuration.md)  

