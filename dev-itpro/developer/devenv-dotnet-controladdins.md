---
title: ".NET Control Add-Ins"
description: "Description of the process of declaring the usage of a .NET or Javascript add-ins in AL"
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

# .NET Control Add-Ins
In [!INCLUDE[prod_long](includes/prod_long.md)] on-premises you can use existing .NET and Javascript control add-ins from the AL Language through .NET interoperability. It is recommended that you convert your existing .NET and Javascript add-ins to native AL control add-ins that are supported both on-premises and in the cloud. For more information about native AL control add-ins, see [Control Add-In Object](devenv-control-addin-object.md). 

To declare the usage of a .NET or Javascript add-in in AL, you need three critical pieces of information about the .NET type that represent the interface of the add-in. These are the name of the assembly containing the add-in, the name of the control add-in, and the name of the class that implements the control add-in. We will show how to retrieve this information for the `Microsoft.Dynamics.Nav.Client.PingPong` control add-in that ships with [!INCLUDE[prod_short](includes/prod_short.md)].

The name of the assembly can be retrieved from the AssemblyName element in the `.csproj` file associated with the .NET project that represents the control add-in. In this case the name of the assembly is `Microsoft.Dynamics.Nav.Client.PingPong`.


> [!NOTE]   
> If you do not have access to the `.csproj file`, you can determine the name of the assembly by following the instructions in [How to: Determine an Assembly's Fully Qualified Name](/dotnet/framework/app-domains/how-to-determine-assembly-fully-qualified-name).


The following code sample contains the stub definition of the `Microsoft.Dynamics.Nav.Client.PingPong` .NET add-in.
 
```
namespace Microsoft.Dynamics.Nav.Client.PingPong 
{ 

/// <summary> 
/// Add-in for pinging the server from the client. The client will respond with a pong. 
/// </summary> 
[ControlAddInExport("Microsoft.Dynamics.Nav.Client.PingPong")] 
public class PingPongAddIn : WinFormsControlAddInBase 
{
    
        /// <summary>
        /// Event will be fired when the AddIn is ready for communication through its API
        /// </summary>
        [ApplicationVisible]
        public event MethodInvoker AddInReady;

        /// <summary>
        /// Event will be fired when the specified time by the ping has elapsed.
        /// </summary>
        [ApplicationVisible]
        public event MethodInvoker Pong;

        /// <summary>
        /// Starts the ping process.
        /// </summary>
        /// <param name="milliseconds">Number of milliseconds before ponging.</param>
        /// <remarks>If a milliseconds are less than the minimum then the MinimumValue is used.</remarks>
        [ApplicationVisible]
        public void Ping(int milliseconds)
        {
            ...
        }
} 

} 
```

The next needed piece of information is the namespace-qualified name of the type annotated with the `ControlAddInExport` attribute. This is the type that provides the implementation of the control add-in and which exposes members annotated with the `ApplicationVisible` attribute to the AL runtime. In this example this is `Microsoft.Dynamics.Nav.Client.PingPong.PingPongAddIn`.

The `ControlAddInExport` attribute's constructor takes as an argument the name of the control add-in, as represented in the runtime, and in existing C/AL code. In this example, the name of the control add-in is `Microsoft.Dynamics.Nav.Client.PingPong`. This was the last component needed to construct a declaration for this .NET control add-in in AL. The name of the assembly is used in creating the `assembly` construct, the namespace-qualified name of the type is used as the first element in the `type` declaration, and the name of the control add-in is used as the alias of the type. You complete the declaration by setting the `IsControlAddIn` property to true. This property is used to tell the AL compiler to treat the given type declaration as a .NET control add-in declaration.

 Remember to add the setting **"AL: Assembly Probing Paths"** in the **User Settings** or **Workspace Settings** specifying the path of the folder containing the assembly so that the compiler can access it. For more information, see [Getting started with Microsoft .NET Interoperability from AL](devenv-get-started-call-dotnet-from-al.md).

```
dotnet
{
    assembly("Microsoft.Dynamics.Nav.Client.PingPong")
    {
        type("Microsoft.Dynamics.Nav.Client.PingPong.PingPongAddIn"; PingPongAddIn)
        {
            IsControlAddIn = true;
        }
    }
}
```

You can now use the `Microsoft.Dynamics.Nav.Client.PingPong` from AL, just as you use a native control add-in.


```
page 50100 MyPage
{
    layout
    {
        area(Content)
        {
            usercontrol(PingPongControl; PingPongAddIn)
            {
                trigger Pong()
                begin
                    Message('Pong received.');
                end;

                trigger AddInReady()
                begin
                    Message('Ready');
                end;
            }
        }
    }
}
```

## Remarks 
Only members of the .NET type implementing the control add-in that are annotated with the `ApplicationVisibleAttribute` will be accessible from AL. Usages of .NET control add-ins in C/AL are automatically converted to AL by the [Txt2Al conversion tool](devenv-txt2al-tool.md), but the code will only compile, if you manually insert the declaration of the control add-in, as outlined above. 

If within the same project you have a native AL control add-in and a .NET add-in with the same name, the .NET add-in will be the one used.  

## See Also
[Getting Started with AL](devenv-get-started.md)  
[Control Add-In Object](devenv-control-addin-object.md)      
[Getting started with Microsoft .NET Interoperability from AL](devenv-get-started-call-dotnet-from-al.md)     
[Subscribing to Events in a .NET Framework Type](devenv-dotnet-subscribe-to-events.md)            
[Serializing .NET Framework Types](devenv-dotnet-serializing-dotnetframework-types.md)   
[How to: Determine an Assembly's Fully Qualified Name](/dotnet/framework/app-domains/how-to-determine-assembly-fully-qualified-name)  
[AL Language Extension Configuration](devenv-al-extension-configuration.md)  




