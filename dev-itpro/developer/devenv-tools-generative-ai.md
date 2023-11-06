---
title: Developer tools for generative AI for Business Central
description: Business Central
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: 
ms.topic: overview
ms.collection: 
ms.date: 11/06/2023
ms.custom: bap-template
---

# Developer tools for generative AI for Business Central

<!-- Available with version -->

The developer tools for generative AI apply to Business Central online only. The tools are available with [!INCLUDE [prod_short](includes/prod_short.md)] runtime 12.1. 

The developer tools are using the Azure OpenAI service and are intended to assist human users in completing tasks. Also, the tools aren't designed to build chat bots or chat experiences, but are for non-conversational experiences, taking input and producing output.

With the developer tools for generative AI, you can write prototypes with less code, and you can create consistency of the UI. The tools also include built-in safety controls for customers.

## Implementing generative AI with your Business Central extension

Image type `Sparkle`, which is a new image type, is used to display the signature visuals of the generative AI experience. The `Sparkle` image type is used in the `PromptDialog` page type, which is a new page type. For more information, see [The PromptDialog page type](devenv-page-type-promptdialog.md).


```al
...     
action(GenerateCopilot)
{
    Caption = 'Describe to Copilot';
    Image = Sparkle;

    trigger OnAction()
    begin
        Page.RunModal(Page::"Copilot Job Proposal");
    end;
}
...
```



## See also

[The PromptDialog page type](devenv-page-type-promptdialog.md)  