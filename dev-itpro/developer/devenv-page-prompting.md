---
title: Prompting on pages
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

# Prompting on pages

With [!INCLUDE [prod_short](includes/prod_short.md)] 2024 release wave 1 and runtime 13 of the AL Language extension for Visual Studio Code, you can create prompt actions to promote AI capabilities in [!INCLUDE [prod_short](includes/prod_short.md)]. A prompt action is a standard action that is rendered in a floating action bar on your pages, and it nudges users to use relevant Copilot built-in features.

To create a prompt action, you must create a new area in the `actions` section of the page object. The area must be set to `area(Prompting)`. You can then create a new action in the area and run a `PromptDialog` object that you want to activate when the action is clicked.

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

[the PromptDialog object](devenv-page-type-promptdialog.md)