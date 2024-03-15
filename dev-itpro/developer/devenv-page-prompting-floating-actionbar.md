---
title: Prompting using a floating action bar
description: Business Central
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: 
ms.topic: overview
ms.collection:
  - bap-ai-copilot
ms.date: 03/07/2024
ms.custom: bap-template
---

# Prompting using a floating action bar

With [!INCLUDE [prod_short](includes/prod_short.md)] 2024 release wave 1 and runtime 13 of the AL Language extension for Visual Studio Code, you can create prompt actions to promote AI capabilities in [!INCLUDE [prod_short](includes/prod_short.md)]. A prompt action is a standard action that is rendered in a floating action bar on your pages, and it nudges users to use relevant Copilot built-in features.

<!-- image goes here -->

To create a prompt action, you must create a new area in the `actions` section of the page object. The area must be set to `area(Prompting)`. You can then create a new action in the area and run a `PromptDialog` object that you want to activate when the action is clicked. Only objects of the `PromptDialog` page type can be run from a prompting area.

The following example shows how to create a prompt action that runs the **Copilot Marketing Text** page. This piece of AL code can be added to a page where you want to promote the **Copilot Marketing Text** functionality. When the action is clicked, the **Copilot Marketing Text** page is opened in a dialog.

```al
...
actions
{
    area(Prompting)
    {
        action(MyPromptAction)
        {
            RunObject = page "Copilot Marketing Text";
        }
    }
}
...
```

## See also

[The PromptDialog page type](devenv-page-type-promptdialog.md)