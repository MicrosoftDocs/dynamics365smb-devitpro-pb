---
title: "Using the Code Analysis Tools"
description: "Using static code analysis tool on an AL project."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 03/05/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---

# Using the Code Analysis Tools
This topic shows how you can use static code analysis tools on an AL project from within Visual Studio Code.

## Enabling code analysis
First, create a simple project in AL. 
1. Press **Alt + A, Alt + L** to create a new project.
2. Open the Command Palette **Ctrl+Shift+B** and choose either User Settings or Workspace Settings.
3. Copy the setting **al.enableCodeAnalysis** to the settings file and set it to `true`: **"al.enableCodeAnalysis": true**.

At this point, the analyzers packaged with the AL Language extensions will be run on your project. Next, add some code to the project that will, in the following example, be used to demonstrate a violation of the AA0001 **"There must be exactly one space character on each side of a binary operator such as := + - AND OR =."** code analysis rule. 


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
<!-- What are the analyzers? -->
<!-- What are the different types of analyzers? -->
A code analyzer is a library that builds on the compiler's functionality to offer enhanced analysis of the syntax and semantics of your code at build time.
The AL Language extension for Visual Studio Code contains three analyzers:
- **CodeCop** is an analyzer that enforces the official AL Coding Guidelines.
- **PerTenantExtensionCop** is an analyzer that enforces rules that must be respected by extensions meant to be installed for individual tenants.
- **AppSourceCop** is an analyzer that enforces rules that must be respected by extensions meant to be published to Microsoft AppSource.

## Selecting code analyzers to run
By default, all the analyzers that ship with the Visual Studio Code extension are enabled.
To selectively enable code analyzers:
1. Open the Command Palette using the **Ctrl+Shift+B** shortcut and choose either User Settings or Workspace Settings.
2. Copy the setting **al.codeAnalyzers** to the settings file and set it to an empty array: **"al.codeAnalyzers": []**.
3. Add to the array the paths to the code analyzer assemblies that you want to run.

The analyzers that are shipped with the AL Language extension are available through the following variables:
- `"${AppSourceCop}"`
- `"${CodeCop}"`
- `"${PerTenantExtensionCop}"`

## See also
[Using the Code Analysis Tools with the Rule Set](devenv-using-code-analysis-tool-with-rule-set.md)  
[Rule Set for the Code Analysis Tool](devenv-rule-set-syntax-for-code-analysis-tools.md)  
[Development in AL](devenv-dev-overview.md)  
[Debugging in AL](devenv-debugging.md)

