---
title: "Using the Code Analysis Tools with the Ruleset"
description: "Configuring and using a custom ruleset on an AL project."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 06/24/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: solsen
---

# Using the Code Analysis Tools with the Ruleset

This article helps you to customize a ruleset for the severity of diagnostics produced by the code analysis tools that are part of the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] for Visual Studio Code.

## Use rulesets with code analysis

First, create a basic project in AL by following the steps below:

1. Press **Alt + A, Alt + L** to create a new project.
2. Open the Command Palette by using the **Ctrl+Shift+P** shortcut and choose either **User Settings** or **Workspace Settings**.
3. Under **Extensions**, go to **Al Language extension configuration**. When you scroll down, you'll find Code Analyzers section, choose **Edit in settings.json**.
4. Set the `al.enableCodeAnalysis` in the settings file to `true`. <br> `"al.enableCodeAnalysis": true`
5. In the `al.codeanalyzers` setting, use **Ctrl+Space** to pick from the available code analyzers. Separate the list of code analyzers with commas. For more information about the available analyzers, see [AppSourceCop](analyzers/appsourcecop.md), [CodeCop](analyzers/codecop.md), [PerTenantExtensionCop](analyzers/pertenantextensioncop.md), and [UICop](analyzers/uicop.md).

At this point, the selected analyzers will run on your project. Next, add some code to the project that will, in the following example, be used to demonstrate violations of the AA0001 **"There must be exactly one space character on each side of a binary operator such as := + - AND OR =."** code analysis rule. 

## Add your own code to the project

In the Visual Studio Code Explorer, open the `HelloWorld.al` file and replace the existing code with the  following code:

```AL
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

On the **View** tab of Visual Studio Code, select the **Problems** option and you'll see a warning with the message **"There must be exactly one space character on each side of '+'."**. In this case, the problem can be fixed by running the AL Formatter command. For more information, see [AL Formatter](devenv-al-formatter.md).

## Create and customize a ruleset

To create and customize a ruleset of your own, follow the next steps:

1. On the **File** tab in Visual Studio Code, choose **New File**.
2. Save the empty file with a name, for example `<name>.ruleset.json` and make a note of the file path.
3. Add the following code to the `<name>.ruleset.json` file:

    ```json
    {
        "name": "My Custom ruleset",
        "rules": [
            {                    
                "id": "AA0001",                    
                "action": "None"
            }
        ]
    }
    ```
4. In your project settings, set **Rule Set Path** to the path of the `<name>.ruleset.json` file, relative to the project root. For more information about custom rules, see [Ruleset for the Code Analysis Tool](devenv-rule-set-syntax-for-code-analysis-tools.md).

> [!NOTE]
> Use the `truleset` and `trule` snippets provided by the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] to create your ruleset. The ruleset will be applied to all the analyzers enabled for the current project. For more information about selectively enabling analyzers, see [The Code Analysis Tools](devenv-using-code-analysis-tool.md).

## Running the code analysis

The code analysis will run in the background and you'll see the warning **"There must be exactly one space character on each side of '+'."** disappear from the **Problems** option in Visual Studio Code.

To trigger a new compilation manually, use the **Ctrl+Shift+B** shortcut to build your project. For more information about AL keyboard shortcuts, see [Keyboard shortcuts](devenv-keyboard-shortcuts.md).

## Limitations

Changing the contents of the ruleset file won't be detected by the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)]. To see the effects of changing the ruleset file, you can try any of the following steps:

- Reload the window.
- In the project settings, change the **Rule Set Path** setting to an invalid path and save it. Then change it back and save again.

<!-- - In the project settings file, make changes to one of the settings, such as **al.ruleSetPath**, and save it. You can then undo the changes. -->

## See also

[Ruleset for the Code Analysis Tool](devenv-rule-set-syntax-for-code-analysis-tools.md)  
[Using the Code Analysis Tools](devenv-using-code-analysis-tool.md)  
[Directives in AL](directives/devenv-directives-in-al.md)  
[Development in AL](devenv-dev-overview.md)  
[Debugging in AL](devenv-debugging.md)  
[AL Language Extension Configuration](devenv-al-extension-configuration.md)  
