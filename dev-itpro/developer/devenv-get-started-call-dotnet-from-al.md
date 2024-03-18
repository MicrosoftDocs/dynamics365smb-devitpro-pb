---
title: Get started with Microsoft .NET Interoperability from AL
description: Description of the process of referencing and using .NET types
author: solsen
ms.date: 03/01/2024
ms.reviewer: na
ms.topic: conceptual
ms.author: solsen
ms.collection: get-started
---

# Get started with Microsoft .NET Interoperability from AL

You can call .NET type members, including methods, properties, and constructors from AL code. In this article, we'll guide you through the process of creating an extension that uses .NET types.

> [!IMPORTANT]  
> .NET Interoperability is only available on-premise. If you want to use this functionality, you must set the `"target": "OnPrem"` in the `app.json` file. For more information, see [JSON Files](devenv-json-files.md#appjson-file). 
> 
> Alternatively you can use services such as Azure Functions to call into .NET dlls from AL, which will also work online. For online training, see [Use Azure Functions with Dynamics 365 Business Central](/learn/modules/use-azure-functions/).

## Enabling .NET Interoperability

.NET interoperability can only be used by applications that target on-premises deployments. See [JSON Files](devenv-json-files.md#appjson-file) for more information on how to set the correct compilation target and [Compilation scope overview](devenv-compilation-scope-overview.md).

## Declaring a .NET package

Using a .NET type in AL is a two-step process. First, you must declare the type in a **dotnet** package, and then reference it from code using the **DotNet** type.

You start by declaring an empty **dotnet** package in your extension. See the example snippet below.

```AL
dotnet
{
    
}
```

It's recommended to have only one package per extension that contains all the .NET types, which you are using.

You continue by adding a declaration of the assembly that you are referencing. For this example, we use the `mscorlib` assembly that contains the core .NET types. A **dotnet** package can contain an unlimited number of assembly declarations. The name of the assembly must be the one defined in the assembly's manifest. See the following example snippet.


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

You continue by adding a reference to a type from the referenced assembly. In this example, we use `System.DateTime` from `mscorlib` and we give it the alias `MyDateTime`. The type must be referenced using its fully qualified name. The alias is used for referencing the .NET type from code. If an alias isn't provided, the compiler uses the .NET type name. A .NET assembly declaration can contain any number of type declarations. See the following example.

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
From this point on, we can reference the .NET type from AL code using its given alias, as shown in the following example.

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
        Message('Hello, world! It is: %1 ' + now.ToString());
    end;
}
```

## Publishing your extension

The AL Language extension, including the AL compiler, and the server to which you publish your code are decoupled.
When publishing, the server recompiles your code and tries to resolve all the references to external assemblies. In order for the compilation to succeed, the server must be able to locate and load all the referenced assemblies and types.

The server searches the global assembly cache (GAC), the **Add-ins** folder, and the **Add-in** table. You must manually install any custom assembly in one of these locations.

## See also

[Get started with AL](devenv-get-started.md)  
[.NET control add-ins](devenv-dotnet-controladdins.md)        
[Subscribing to events in a .NET framework type](devenv-dotnet-subscribe-to-events.md)     
[Serializing .NET framework types](devenv-dotnet-serializing-dotnetframework-types.md)  
[AL Language Extension configuration](devenv-al-extension-configuration.md)  

