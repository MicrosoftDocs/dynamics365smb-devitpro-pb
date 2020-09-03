---
title: "AL Code Actions"
description: "Code Actions"

author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/30/2020
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# AL Code Actions

The [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] offers users the option to help fix issues in code. **Code Actions** is a Visual Studio Code feature providing the user with possible corrective actions right next to an error or warning. If actions are available, a light bulb appears next to the error or warning. When the user clicks the light bulb (or presses **Ctrl+.**), a list of available code actions is presented. 

In [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] these code actions are available in the current version:

- Multiple IF to CASE converting code action.
- Spell check code action.  
- Interface implementer.
- Make method local.
- Use parenthesis for method call.
- Fix explicit `with` statements.
- Fix implicit with statements.

## To enable AL Code Actions

1. Open the Command Palette by pressing **Ctrl+P** and then open the `settings.json` file.  
2. Enter the setting `al.enableCodeActions` and set it to `true` like this `"al.enableCodeActions": true`
3. Save the settings file. You have now enabled code actions on your project.

Alternatively:

1. Open the Settings Page, **Ctrl+,** and choose either **User Settings** or **Workspace Settings** depending on which scope you want the code actions to apply to.
2. Navigate to **Extensions > AL Language extension configuration**.
3. Click on the **Enable Code Actions** checkbox. You have now enabled code actions on your project.

## See Also
[AL Development Environment](devenv-reference-overview.md)  
[AL Outline View](devenv-al-outline-view.md)  
[AL Formatter](devenv-al-formatter.md)  

