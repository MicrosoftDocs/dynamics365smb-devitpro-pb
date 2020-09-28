---
title: "Using the Code Analysis Tool"
description: "Using static code analysis tool on an AL project."

author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2020
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Using the Code Analysis Tool
This topic shows how you can use static code analysis tool on an AL project from within Visual Studio Code.

## Enabling code analysis
First, follow the steps below to create a simple project in AL. 
1. Press **Alt + A, Alt + L** to create a new project.
2. Open the Command Palette **Ctrl+Shift+P** and choose either **User Settings** or **Workspace Settings**.
3. Copy the setting `al.enableCodeAnalysis` to the settings file and set it to `true`: `"al.enableCodeAnalysis": true`.
4. Copy the setting `al.codeanalyzers` to the settings file and then use **Ctrl+Space** to pick from the available code analyzers. Separate the list of code analyzers with commas. For more information about the available analyzers, see [AppSourceCop](analyzers/appsourcecop.md), [CodeCop](analyzers/codecop.md), [PerTenantExtensionCop](analyzers/pertenantextensioncop.md), and [UICop](analyzers/uicop.md).

At this point, the selected analyzers will be run on your project. Next, add some code to the project that will, in the following example, be used to demonstrate a violation of the AA0001 **"There must be exactly one space character on each side of a binary operator such as := + - AND OR =."** code analysis rule. 

> [!NOTE]  
> By default, code analysis is run in the background.

## Adding your own code to the project
In the Visual Studio Code Explorer, open the `HelloWorld.al` file and replace the existing code with the following:

```
pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        result: Integer;
    begin        
        // The following line will trigger the warning
        // AA0001 "There must be exactly one space character on each side 
        // of a binary operator such as := + - AND OR =." 
        result := 2+2; 
        Message('2 + 2 = ' + Format(result));
    end;
}
```

## Viewing the results of the code analysis
The code analysis tools will run in the background. You will see the faulty expression underlined and the warning **"There must be exactly one space character on each side of '+'."** will be displayed if you mouse over the underlined code.
You can also view the list of issues by selecting the **View** tab of Visual Studio Code and choosing the **Problems** option.

Using the **Ctrl+Shift+B** shortcut to build your project will run the code analysis tools on the entire project and the detected issues will be displayed in the **Output** window of Visual Studio Code. For more information about AL keyboard shortcuts, see [Keyboard shortcuts](devenv-keyboard-shortcuts.md).

## Code analyzers
A code analyzer is a library that builds on the compiler's functionality to offer enhanced analysis of the syntax and semantics of your code at build time.
The [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] for Visual Studio Code contains four analyzers:
- **CodeCop** is an analyzer that enforces the official AL Coding Guidelines. For more information about the CodeCop rules, see [CodeCop Analyzer Rules](analyzers/codecop.md).
- **PerTenantExtensionCop** is an analyzer that enforces rules that must be respected by extensions meant to be installed for individual tenants. For more information about the PerTenantExtensionCop rules, see [PerTenantExtensionCop Analyzer Rules](analyzers/pertenantextensioncop.md).
- **AppSourceCop** is an analyzer that enforces rules that must be respected by extensions meant to be published to Microsoft AppSource. For more information about the AppSourceCop rules, see [AppSourceCop Analyzer Rules](analyzers/appsourcecop.md).
- **UICop** is an analyzer that enforces rules that must be respected by extensions meant to customize the Web Client. For more information about the UserInterfaceCop rules, see [UICop Analyzer Rules](analyzers/uicop.md).

## <a name="largeprojects"></a>Enabling code analysis on large projects
In order to improve performance when running code analysis on large projects, you can switch off running code analysis in the background. To do so, open the Command Palette **Ctrl+Shift+P** and choose either **User Settings** or **Workspace Settings**. Then, specify the setting `"al.backgroundCodeAnalysis": false`.
  
## See Also

[Using the Code Analysis Tools with the Ruleset](devenv-using-code-analysis-tool-with-rule-set.md)  
[Ruleset for the Code Analysis Tool](devenv-rule-set-syntax-for-code-analysis-tools.md)  
[Development in AL](devenv-dev-overview.md)  
[Directives in AL](directives/devenv-directives-in-al.md)  
[Debugging in AL](devenv-debugging.md)  
[AL Language Extension Configuration](devenv-al-extension-configuration.md)  

