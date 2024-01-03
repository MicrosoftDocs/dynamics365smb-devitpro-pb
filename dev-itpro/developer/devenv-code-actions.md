---
title: "AL code actions"
description: Code actions can help you fix code issues either for your project alone or for the entire workspace.
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 08/28/2023
ms.topic: conceptual
ms.author: solsen
---

# AL code actions

[!INCLUDE [2022_releasewave2_changed](../includes/2022_releasewave2_changed.md)]

The [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] can help users fix issues in the code. **Code Actions** is a Visual Studio Code feature that provides the user with possible corrective actions right next to an error or warning. If actions are available, a light bulb appears next to the error or warning. When the user chooses the light bulb (or presses <kbd>Ctrl+.</kbd>), a list of available code actions is presented. A code action can be applied to a single instance or a broader scope depending on the type of action.

In [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)], the following code actions are available in the current version:

- Multiple IF to CASE converting code action
- Spell check code action
- Interface implementer
- Make method local
- Use parenthesis for method call fix for instance, document, project, or workspace.
- Fix explicit `with` statements
- Fix implicit with statements
- Fix old report layout and replace with `rendering` layout section
- Fix for [AW0013](analyzers\uicop-aw0013.md)
- Convert pages or page extensions to use the `actionRef` syntax for promoted actions on the action bar. Fix for instance, document, project, or workspace. For more information, see [Code action for actions](devenv-code-actions.md#code-actions-for-promoted-actions).
- Set the default value for `ApplicationArea` on a page or a report level and remove all duplicates on field level. This code action can be applied to an object, a document, a project, or a workspace.
- Convert existing event parameter in event subscribers from string literal to new identifier format. Fix event subscriber on the specific EventSubscriber instance, the active file, the active project, or the whole workspace. This makes it easy and controllable to opt in to the new syntax.
- Insert `using` statement for a missing namespace. Fix for instance, document, project, or workspace.

## Examples

The spell check code action is triggered on certain syntax errors:

:::image type="content" source="media/spellcheck-code-action.png" alt-text="spell check code action":::

The make method local action is triggered to fix the [CodeCop Warning AA0207](analyzers/codecop-aa0207.md):

:::image type="content" source="media/makemethodlocal-code-action.png" alt-text="make method local code action":::

## Code actions for promoted actions

Use the code action to convert *legacy* syntax for promoted actions to the `actionref` syntax, which is introduced with [!INCLUDE [prod_short](includes/prod_short.md)] 2022 release wave 2. In-client customizations, user personalization, and profile configurations are automatically converted into the new syntax, so this is primarily applicable to DEV extensions. The code action can apply to a single instance, the document, the project, or the workspace.

:::image type="content" source="media/codeaction_actionref.png" alt-text="Options for applying code action on actionref syntax":::

  > [!NOTE]  
  > For Designer extensions, use <kbd>F6</kbd>  to open **Designer**, which opens the page where the legacy syntax is used. Choose the Lock symbol and use **Unlock page** to automatically convert the legacy syntax for the running code. Selecting <kbd>Alt</kbd>+<kbd>F6</kbd> will bring you back into Visual Studio Code, and show the converted `actionref` code.
  
  
## To enable AL Code Actions

1. Open the Command Palette by selecting <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd> and then open the `settings.json` file.  
2. Enter the setting `al.enableCodeActions` and set it to `true` like this `"al.enableCodeActions": true`
3. Save the settings file. You have now enabled code actions on your project.

Alternatively:

1. Open the Settings Page, <kbd>Ctrl</kbd>+<kbd>,</kbd> and choose either **User Settings** or **Workspace Settings** depending on which scope you want the code actions to apply to.
2. Navigate to **Extensions > AL Language extension configuration**.
3. Choose the **Enable Code Actions** checkbox. You've now enabled code actions on your project.

## See Also

[AL Development Environment](devenv-reference-overview.md)  
[AL Outline View](devenv-al-outline-view.md)  
[AL Formatter](devenv-al-formatter.md)  
[Directives in AL](directives/devenv-directives-in-al.md)  

