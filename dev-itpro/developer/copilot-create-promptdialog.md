---
title: How-to topic template #Required; page title displayed in search results. Don't enclose in quotation marks.
description: How-to description #Required; article description that's displayed in search results. Don't enclose in quotation marks. Do end with a period.
author: rhanajoy #Required; your GitHub user alias, with correct capitalization.
ms.author: rhcassid #Required; your Microsoft alias; optional team alias.
ms.reviewer: kfend #Required; Microsoft alias of content publishing team member.
ms.topic: how-to #Required; don't change.
ms.collection: get-started #Required; If this isn't a getting started article, don't remove the attribute, but leave the value blank. The values for this attribute will be updated over time.
ms.date: 02/17/2024
ms.custom: bap-template #Required; don't change.
---

# Create PromptDialog type page 

You create the page like any other page, except consider the following properties:

```al
page 50100 "My copilot"
{
    Caption = 'Draft with my copilot';
    PageType = PromptDialog;
    Extensible = false;
    PromptMode = Prompt;
    IsPreview = true;
...
}
```

|Property|Description and value|
|-|-|
|[PageType](properties/devenv-pagetype-property.md)|Set to `PromptDialog`.|
|[Extensible](properties/devenv-extensible-property.md)|Set to `false` to ensure that extensions for other providers don't interfere with the experience you're providing customers|
|[PromptMode](properties/devenv-promptmode-property.md)|Specifies which mode you want to page to display when it first opens. The default is `Prompt`. For more information, go to [Specify the mode in which the PromptDialog opens](#specify-the-mode-in-which-the-promptdialog-opens).|
|[IsPreview](properties/devenv-ispreview-property.md)|This property is used to specify whether your feature is in preview or generally available. Setting this property to `true` applies a **Preview** label on the all display modes of the PromptDialog type page, as illustrated in the following figure. The **Preview** label communicates to users that the feature is available to try out and provide feedback, but the functionality is subject to change. When you feel the feature is ready, you can change this value to `false` to communicate that the feature is generally available. We recommend that most new copilot experiences start in preview. |

![Shows the prompt mode of the PromptDialog type page](media/promptdialog-prompt-mode.svg)

This step is the first in creating the PromptDialog type page. The sections that follow explain the different modes and the UI elements that comprise the modes. 

## Specify the mode in which the PromptDialog opens

By default, the PromptDialog page opens in the prompt mode. But in some scenarios, this behavior might not be desired. For example, consider [marketing text suggestions with Copilot](/dynamics365/business-central/ai-overview) from Business Central. This copilot experience includes a prompt mode, which is used for changing item attributes. However, when users start the copilot, it opens directly in the generate mode, then moves to the content mode. In the content mode, users can choose to open the prompt mode to change the input to AI, this case the item attributes, if they like. 

There are two ways to change the mode that PromptDialog page opens. One way is to use PromptMode property, as previously mentioned. The other way to change the mode at runtime, for example, by using the [OnInit](triggers-auto/page/devenv-oninit-page-trigger.md):

```al
trigger OnInit()
begin
    CurrPage.PromptMode := PromptMode::Generate;
end;
```

In both cases, the trigger defined for the `systemaction(Generate)` control is automatically invoked.
## Next steps

<!--Remove all the comments in this template before you sign-off or merge to the main branch.-->
