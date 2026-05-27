---
title: AL code actions
description: Learn about AL code actions in Visual Studio Code, including scope levels, available actions, and how to enable them for your project.
author: SusanneWindfeldPedersen
ms.date: 05/27/2026
ms.topic: article
ms.author: solsen
ms.collection: get-started
ms.reviewer: solsen
---

# AL code actions

[!INCLUDE [2024-releasewave2-changed](../includes/2024-releasewave2-changed.md)]

[!INCLUDE [getstarted-contributions](includes/getstarted-contributions.md)]

The [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] can help users fix issues in the code. **Code Actions** is a Visual Studio Code feature that provides the user with possible corrective actions right next to an error or warning. If actions are available, a light bulb appears next to the error or warning. When the user chooses the light bulb (or presses <kbd>Ctrl+.</kbd>), a list of available code actions is presented. A code action can be applied to a single instance or to a broader scope depending on the type of action.

## Scope levels

Many code actions let you choose the scope of the fix. The following table explains each scope level.

| Scope | Description |
|-------|-------------|
| Instance | Applies the fix to the single occurrence at the current cursor position. |
| Document | Applies the fix to all occurrences in the current file. A file can contain multiple AL objects. |
| Project | Applies the fix to all occurrences across all files in the current AL project. |
| Workspace | Applies the fix to all occurrences across all projects in the current Visual Studio Code workspace. Relevant in multi-root workspaces. |

When you select a code action from the light bulb menu, the available scope options are shown as sub-items. Choose the scope that matches how broadly you want the fix applied.

## Available code actions

In [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)], the following code actions are available in the current version.

### Multiple IF to CASE

Converts a chain of `if ... else if` statements into a `case` statement when the same variable is tested in each condition. This action is triggered when the compiler detects a suitable `if`/`else if` pattern.

**Scope:** Instance only.

### Spell check

Suggests corrections for misspelled identifiers in your AL code. Triggered on certain syntax errors where the compiler can identify a close match to a known identifier.

**Scope:** Instance only.

### Interface implementer

Generates stub procedure implementations for all members of an interface that aren't yet implemented in the current codeunit. Triggered when a codeunit declares that it implements an interface but is missing one or more procedure definitions.

**Scope:** Instance only.

### Make method local

Changes a method's accessibility from public (or internal) to `local` when the method is only used within the same object. This action is the fix for [CodeCop Warning AA0207](analyzers/codecop-aa0207.md).

**Scope:** Instance only.

### Use parenthesis for method call

Adds missing parentheses to method calls that omit them. Ensures consistent syntax for procedure invocations.

**Scope:** Instance, document, project, or workspace.

### Fix explicit `with` statements

Removes explicit `with` statements and qualifies all member references with the record variable name. This action helps you move away from the deprecated `with` syntax.

**Scope:** Instance, document, project, or workspace.

### Fix implicit `with` statements

Resolves implicit `with` usage (where fields are accessed without qualification) by adding explicit record variable prefixes. This action helps you move away from the deprecated `with` syntax.

**Scope:** Instance, document, project, or workspace.

### Fix old report layout

Replaces the legacy report layout properties (`RDLCLayout`, `WordLayout`) with a `rendering` layout section. Triggered on reports that use the old layout declaration syntax.

**Scope:** Instance only.

### Fix for AW0013

Applies the fix for analyzer warning [AW0013](analyzers/uicop-aw0013.md), which flags groups in a page that contain only one action.

**Scope:** Instance only.

### Convert promoted actions to actionref syntax

Converts pages or page extensions from legacy promoted action syntax to the `actionref` syntax introduced with [!INCLUDE [prod_short](includes/prod_short.md)] 2022 release wave 2. Learn more in [Code actions for promoted actions](#code-actions-for-promoted-actions).

**Scope:** Instance, document, project, or workspace.

### Set ApplicationArea default value

Sets the `ApplicationArea` property at the page or report level and removes redundant per-field `ApplicationArea` declarations. This consolidates the property to the object level.

**Scope:** Instance (single object), document, project, or workspace.

### Convert event subscriber parameters

Converts existing event parameters in event subscribers from the legacy string literal format to the new identifier format. This makes it easy to opt in to the new syntax in a controlled way.

**Scope:** Instance, document, project, or workspace.

### Insert using statement

Adds a `using` directive for a namespace that's referenced in the code but not yet declared. Triggered when the compiler detects an unresolved type that exists in a known namespace.

**Scope:** Instance, document, project, or workspace.

### Convert page control tooltips

Moves tooltips from page controls to the underlying table fields, or removes tooltips from page controls when the table field already has the same tooltip defined. This action helps consolidate tooltip definitions at the table field level, making them reusable across multiple pages.

The action uses the following logic:

- If the table field doesn't have a tooltip, the tooltip from the page control is moved to the table field.
- If the table field already has the same tooltip, the duplicate on the page control is removed.
- If both the table field and the page control have different tooltips, the conflict is flagged for manual resolution.

Learn more in [Tooltip property](properties/devenv-tooltip-property.md).

**Scope:** Instance, document, project, or workspace.

### Fix self-reference to use `this` keyword

Updates code to use the `this` keyword when a codeunit references its own methods or properties, improving code readability. Learn more in [Use the this keyword for codeunit self-reference](devenv-al-this-keyword.md).

**Scope:** Instance, document, project, or workspace.

### Add namespace

Adds a `namespace` declaration to a file based on your project's namespace template, the namespace used in sibling files, or the publisher/project name. Learn more in [Adopting namespaces in AL](devenv-namespaces-structure.md).

**Scope:** Instance, document, project, or workspace.

### Sort using statements

Reorders `using` directives alphabetically within a file, project, or workspace for consistent ordering.

**Scope:** Document, project, or workspace.

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
  
  
## To enable AL code actions

1. Open the Command Palette by selecting <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd> and then open the `settings.json` file.  
2. Enter the setting `al.enableCodeActions` and set it to `true` like this `"al.enableCodeActions": true`
3. Save the settings file. You have now enabled code actions on your project.

Alternatively:

1. Open the settings page, <kbd>Ctrl</kbd>+<kbd>,</kbd> and choose either **User Settings** or **Workspace Settings** depending on which scope you want the code actions to apply to.
2. Navigate to **Extensions > AL Language extension configuration**.
3. Choose the **Enable Code Actions** checkbox. You've now enabled code actions on your project.

## Related information

[AL development environment](devenv-reference-overview.md)  
[AL outline view](devenv-al-outline-view.md)  
[AL Formatter](devenv-al-formatter.md)  
[Directives in AL](directives/devenv-directives-in-al.md)  
