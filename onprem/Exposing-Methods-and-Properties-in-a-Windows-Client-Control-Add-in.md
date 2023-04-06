---
title: "Exposing Methods and Properties in a Windows Client Control Add-in"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 9f1b5e9e-4167-4d57-bb0f-498587530ec7
caps.latest.revision: 18
---
# Exposing Methods and Properties in a Windows Client Control Add-in
Control add-ins let you add custom user interface \(UI\) controls to pages in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. By using the basic control add-in definition interfaces, a control add-in is bound to a page only through the field that is applied with the control add-in. It is also bound to the page through the [SourceExpr Property](SourceExpr-Property.md), the [OnControlAddin Trigger](OnControlAddin-Trigger.md), and other triggers for exposed events. To extend UI controls on a page, you can expose methods and properties in a control add-in assembly so that they can be called by C/AL code on most page triggers.  
  
## Exposing Methods and Properties  
 To expose a public method or property in a control add-in, you add the method or property to the control add-in class and mark it by using the managed attribute [Microsoft.Dynamics.Framework.UI.Extensibility.ApplicationVisibleAttribute](assetId:///T:Microsoft.Dynamics.Framework.UI.Extensibility.ApplicationVisibleAttribute) in control add-in class.  
  
 The following code example is from a control add-in class that exposes a simple method and property.  
  
```c#  
  
[ControlAddInExport("MyControlAddIn")]  
public class MyControlAddIn : WinFormsControlAddInBase, ...  
{  
    ...  
  
    //Exposes a method  
    [ApplicationVisible]  
    public string Add(int param1, int param2)  
    {  
        return FormatNumber(param1 + param2, this.Notation);  
    }  
  
    //Exposes a property  
    [ApplicationVisible]  
    public Notation Notation  
    {  
        get { return this.notation; }  
        set { this.notation = value; }  
    }  
  
```  
  
## Calling Methods and Properties in the Control Add-in From C/AL Triggers  
 Exposed methods and properties in a control add-in can be invoked from C/AL code on page triggers. The invoking mechanism resembles other .NET Framework types with the .NET Framework interoperability except that you can call the control add-in methods and properties using C/AL without defining a variable.  
  
 To call a method in C/AL code on a page trigger, use the following code.  
  
```c#  
CurrPage.ControlName.MyMethod(parameter)  
```  
  
 To call a property in C/AL code, use the following code.  
  
```c#  
CurrPage.ControlName.MyProperty  
```  
  
 `ControlName` is the name of the field control that is applied with the control add-in. The name is specified by the [Name Property](Name-Property.md). `MyMethod` and `MyProperty` are the names of method and property of the control add-in to be invoked.  
  
### Triggers That Are Not Supported  
 You cannot invoke control add-in methods and properties from the following triggers because the triggers are invoked before the page is instantiated:  
  
-   [OnInit Trigger](OnInit-Trigger.md)  
  
-   [OnOpenPage Trigger](OnOpenPage-Trigger.md)  
  
-   [OnNewRecord Trigger](OnNewRecord-Trigger.md)  
  
## See Also  
 [How to: Create a Windows Client Control Add-in](How-to--Create-a-Windows-Client-Control-Add-in.md)   
 [Extending the Windows Client Using Control Add-ins](Extending-the-Windows-Client-Using-Control-Add-ins.md)   
 [Extending Microsoft Dynamics NAV Using Microsoft .NET Framework Interoperability](Extending-Microsoft-Dynamics-NAV-Using-Microsoft-.NET-Framework-Interoperability.md)
