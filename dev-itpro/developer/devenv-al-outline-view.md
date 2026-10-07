---
title: Use the AL Outline View in Visual Studio Code
description: Use the Visual Studio Code Outline view to browse AL symbols, follow the active cursor, filter symbols, and review problem decorations.
author: SusanneWindfeldPedersen
ms.date: 10/07/2026
ms.topic: concept-article
ms.author: solsen
ms.collection: get-started
ms.reviewer: solsen
---

# Navigate AL code with the Outline view

When you work with the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)], you can use the **Outline** view to browse symbols in the active AL document. By default, the **Outline** view appears in the **Explorer** sidebar. You can move or hide the view like other Visual Studio Code views.

The **Outline** view shows the symbol tree for the active AL document and highlights the symbol that contains the cursor. You can filter the tree as you type. Select an outline item to reveal its location in the active document. When problem decorations are enabled, the view displays error and warning decorations on affected symbols in the active document.

:::image type="content" source="media/outlineview.png" alt-text="Visual Studio Code with the Outline view showing symbols in an AL document.":::

To configure the view, open the Command Palette by pressing <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd>. Then select **Preferences: Open Settings (UI)** for workspace settings or **Preferences: Open User Settings** for user settings. Search for `Outline` to find the built-in Visual Studio Code settings. You can also configure them in the `settings.json` file.

Most Outline display settings are enabled by default, and outline items are expanded.

- `outline.collapseItems` - Controls whether outline items are initially collapsed or expanded. Supported values are `alwaysCollapse` and `alwaysExpand`. The default is `alwaysExpand`.
- `outline.icons` - Shows icons for outline items.
- `outline.problems.badges` - Shows badges for errors and warnings.
- `outline.problems.colors` - Uses colors for error and warning decorations.
- `outline.problems.enabled` - Shows errors and warnings on outline items.
- `outline.showArrays` - Shows array symbols.
- `outline.showBooleans` - Shows Boolean symbols.
- `outline.showClasses` - Shows class symbols.
- `outline.showConstants` - Shows constant symbols.
- `outline.showConstructors` - Shows constructor symbols.
- `outline.showEnumMembers` - Shows enum value symbols.
- `outline.showEnums` - Shows enum symbols.

## Related information

[AL development environment](devenv-reference-overview.md)  
[AL formatter](devenv-al-formatter.md)  
