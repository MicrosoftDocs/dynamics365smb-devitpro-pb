---
title: AL Code Actions in Visual Studio Code
description: Learn about AL code actions in Visual Studio Code, including scope levels, available actions, and how to enable them for your project.
author: SusanneWindfeldPedersen
ms.date: 10/16/2026
ms.topic: conceptual
ms.author: solsen
ms.collection: get-started
ms.reviewer: solsen
---

# AL code actions

Use code actions in the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] to fix code issues and refactor AL code. In Visual Studio Code, a light bulb appears when an action is available. Select the light bulb or press <kbd>Ctrl</kbd>+<kbd>.</kbd> to see the available actions. Some actions fix errors or warnings. Others are refactorings available at the current cursor position and don't require a diagnostic. Depending on the action, you can apply it to a single instance or a broader scope.

## Choose a code action scope

Many code actions let you choose the scope of the fix. The following table explains each scope level.

| Scope | Description |
|-------|-------------|
| Instance | Applies the action at the current location. Depending on the action, this scope can affect an expression, object, or file. |
| Document | Selects applicable occurrences in the current file. A file can contain multiple AL objects. Some actions also update related files. |
| Project | Applies the fix to all applicable occurrences across all files in the current AL project. |
| Workspace | Applies the fix to all applicable occurrences across all projects in the current Visual Studio Code workspace. This scope is relevant in multi-root workspaces. |

When multiple scopes are available, choose the light bulb menu entry for the scope you want to apply.

## Available code actions

In [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)], the following code actions are available in the current version.

### Convert multiple if statements to case

Converts a chain of `if ... else if` statements into a `case` statement when the same expression is tested in each condition. This action is available when the cursor or selection is within a suitable chain of equality comparisons against the same expression.

**Scope:** Instance only.

### Spell check

Suggests corrections for misspelled identifiers and keywords. This action is available for certain compiler diagnostics when a similar completion candidate is available.

**Scope:** Instance only.

### Interface implementer

Generates missing interface procedure implementations in a codeunit. Depending on the diagnostic, you can implement required methods, all missing methods, or a `RequiredPending` method.

**Scope:** Instance only.

### Make method local

Changes a nonlocal event subscriber procedure to `local`. This action fixes [CodeCop warning AA0207](analyzers/codecop-aa0207.md).

**Scope:** Instance only.

### Use parenthesis for method call

Adds missing parentheses to method calls that omit them. Ensures consistent syntax for procedure invocations.

**Scope:** Instance, document, project, or workspace.

### Fix explicit `with` statements

Removes explicit `with` statements and qualifies all member references with the record variable name. This action helps you move away from the deprecated `with` syntax.

**Scope:** Instance, document, project, or workspace.

### Fix implicit `with` statements

Resolves implicit `with` usage by adding explicit record variable prefixes to fields accessed without qualification. This action helps you move away from the deprecated `with` syntax.

**Scope:** Instance, document, project, or workspace.

### Fix old report layout

Replaces the legacy `RDLCLayout` and `WordLayout` properties with a `rendering` layout section. This action is available on reports and report extensions that use legacy layout properties and don't already have a rendering section.

**Scope:** Instance only.

### Fix for AW0013

Applies fixes for analyzer warning [AW0013](analyzers/uicop-aw0013.md), which flags hidden action groups that contain promoted actions.

**Scope:** Instance only.

### Convert promoted actions to actionref syntax

Converts pages or page extensions from legacy promoted action syntax to the `actionref` syntax introduced with [!INCLUDE [prod_short](includes/prod_short.md)] 2022 release wave 2. Learn more in [Code actions for promoted actions](#code-actions-for-promoted-actions).

**Scope:** Instance, document, project, or workspace.

### Set ApplicationArea default value

Sets the `ApplicationArea` property at the page or report level and removes redundant per-field `ApplicationArea` declarations. This consolidates the property to the object level.

**Scope:** Instance, document, project, or workspace. Instance scope applies to a single object.

### Convert event subscriber parameters

Converts `EventSubscriber` attribute arguments from string literals to identifiers. This conversion makes it easy to opt in to the new syntax in a controlled way.

**Scope:** Instance, document, project, or workspace.

### Insert using statement

Adds a `using` directive for a missing namespace import when the compiler detects an unresolved type in a known namespace. This action is available in files that already declare a namespace.

**Scope:** Instance. Document, project, and workspace scopes are available when the unresolved name has a single candidate symbol.

### Convert page control tooltips

Moves tooltips from page controls down to the underlying table fields. Defining tooltips at the table field level makes them reusable across all pages that display the same field, so you don't have to maintain duplicate tooltip text on each page.

The action applies to eligible page fields bound to `Rec` whose underlying table field is defined in the same project.

The action uses the following logic:

- If the table field doesn't have a tooltip yet, the tooltip is moved from the page control to the table field, and the page control tooltip is removed.
- If the table field already has the same tooltip as the page control, the redundant page control tooltip is removed.
- If the table field already has a different tooltip, the action leaves the page control tooltip unchanged. Review these differences manually.

Learn more in [Tooltip property](properties/devenv-tooltip-property.md).

**Scope:** Instance, document, or project.

### Fix self-reference to use the this keyword

Adds the `this` qualifier to unqualified references to global variables and instance methods. This action fixes [CodeCop warning AA0248](analyzers/codecop-aa0248.md). Learn more in [Use the this keyword for codeunit self-reference](devenv-al-this-keyword.md).

**Scope:** Instance, document, project, or workspace.

### Add namespace

Adds a `namespace` declaration to a file based on your project's namespace template, the namespace used in sibling files, or the publisher/project name. Learn more in [Adopting namespaces in AL](devenv-namespaces-structure.md).

**Scope:** Instance, document, project, or workspace.

### Sort using statements

Reorders `using` directives alphabetically within a file, project, or workspace for consistent ordering.

**Scope:** Document, project, or workspace.

## Examples of code actions

The spell check action can correct a misspelled keyword:

:::image type="content" source="media/spellcheck-code-action.png" alt-text="Screenshot of the spell check action changing the misspelled AL keyword them to then.":::

The make method local action is triggered to fix [CodeCop warning AA0207](analyzers/codecop-aa0207.md):

:::image type="content" source="media/makemethodlocal-code-action.png" alt-text="Screenshot of the Make method local action for a nonlocal event subscriber procedure.":::

## Code actions for promoted actions

Use the code action to convert *legacy* syntax for promoted actions to the `actionref` syntax, which is introduced with [!INCLUDE [prod_short](includes/prod_short.md)] 2022 release wave 2. In-client customizations, user personalization, and profile configurations are automatically converted into the new syntax, so this is primarily applicable to DEV extensions. The code action can apply to a single instance, the document, the project, or the workspace.

:::image type="content" source="media/codeaction_actionref.png" alt-text="Options for applying code action on actionref syntax":::

> [!NOTE]
> For Designer extensions, press <kbd>F6</kbd> in Visual Studio Code to publish and open **Designer**. Open the page that uses the legacy syntax. Select the lock icon, and then select **Unlock page** to convert the legacy action syntax. Return to Visual Studio Code and press <kbd>Alt</kbd>+<kbd>F6</kbd> to download the updated source.

## Enable AL code actions

AL code actions are enabled by default. If they're disabled, use either of the following methods to enable them.

To edit the setting directly:

1. Press <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd> to open the **Command Palette**, and select **Preferences: Open User Settings (JSON)**.
2. Set `"al.enableCodeActions": true`.
3. Save the settings file.

To use the settings editor:

1. Press <kbd>Ctrl</kbd>+<kbd>,</kbd> to open **Settings**. Choose user or workspace settings depending on where you want to enable the setting.
2. Go to **Extensions** > **AL Language extension configuration**.
3. Select the **Enable Code Actions** checkbox.

Actions that fix CodeCop or UICop diagnostics require the corresponding analyzer to be configured and background code analysis to be enabled.

## Related information

[AL development environment](devenv-reference-overview.md)  
[AL outline view](devenv-al-outline-view.md)  
[AL formatter](devenv-al-formatter.md)  
[Directives in AL](directives/devenv-directives-in-al.md)  
