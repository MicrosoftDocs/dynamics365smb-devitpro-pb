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

To create a prompt action, you must create a new action in the `actions` property of the page object. The `RunObject` property of the action must be set to a `Page` object that is of type `PromptDialog`. The `RunObject` property cis then set to the object that you want to run. The object that you want to run must be of the type `PromptDialog`.

```
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
```

## See also

[the PromptDialog object](devenv-page-type-promptdialog.md)