---
title: Prompting using a floating action bar
description: Learn how to create prompt actions to promote AI capabilities in Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: overview
ms.collection:
  - bap-ai-copilot
ms.date: 10/09/2024
ms.reviewer: solsen
---

# Launch Copilot features using actions and prompt actions

In this article, you learn how to add actions in the UI that users can select to start Copilot features. There are two approaches to creating these actions. Whichever approach you choose, the action must run the prompt dialog page for the Copilot feature. The recommended approach is to use a *prompt action*, which is specifically designed for Copilot features you want available on a page. The other approach is to use a standard action, as you would for other pages.

## Add prompt actions that launch Copilot features

> **Applies to:** [!INCLUDE [prod_short](includes/prod_short.md)] 2024 release wave 1 (runtime 13) and later.

You use a prompt action to promote your Copilot feature on pages and encourage users to use it. In the UI, prompt actions associate actions directly with Copilot. They draw users' attention to tasks that Copilot can assist with on the page. Copilot might display these prompt actions elsewhere such as in the Copilot pane when asked for assistance.

A prompt action is an action that appears in a highly visible area of the page. Depending on the page type, it could appear in the action bar, at the bottom or top of the page, and even in a floating action bar.

On `List` and  `Worksheet` page types, prompt actions appear under the ![Shows the Copilot action icon](media/promptdialog-copilot-action-icon.png) **Start a Copilot prompt action** icon in the page's action bar and also in a floating action bar as illustrated in the following figure for a `List` page. Users can hide the floating action bar by selecting Hide and bring it back by selecting Show in page.

:::image type="content" source="media/copilot-prompt-actions-callouts.svg" alt-text="Example of a floating action bar for Copilot feature on list page":::

The following table describes the prompt actions in the UI for other page types.

|Card, Document, ListPlus|ListPart|StandardDialog|
|-|-|-|
|Prompt actions appear with the ![Shows the Copilot action icon](media/copilot-icon-rainbow.png) **Here's what Copilot can do on this page** icon in the upper-right corner of the page.|Prompt actions appear in the ![Shows the Copilot action icon](media/promptdialog-copilot-action-icon.png) **Start a Copilot prompt action** menu in part's action bar.|Prompt actions appear with the ![Shows the Copilot action icon](media/copilot-icon-rainbow.png) **Here's what Copilot can do on this page** icon at the bottom of the page.|
|:::image type="content" source="media/copilot-prompt-actions-card.svg" alt-text="Example of a prompt action bar for Copilot feature on card page":::|:::image type="content" source="media/copilot-prompt-actions-listpart.svg" alt-text="Example of a pompt action for Copilot feature on list part page":::|:::image type="content" source="media/copilot-prompt-actions-standarddialog.svg" alt-text="Example of a prompt action for Copilot feature on standard dialog page":::|

### Create a prompt action

To create prompt actions, you must create a new area in the `actions` section of the page object. The area must be set to `area(Prompting)`. You can then add one or more actions in the area and run a `PromptDialog` object that you want to activate when the action is clicked. Only objects of the `PromptDialog` page type can be run from a prompting area.

> [!NOTE]
> The prompt actions only appear if you specify [RunObject property](properties/devenv-runobject-property.md) to the page.

The following example shows the syntax for how to create a prompt action that runs the **My Prompt Dialog** page. This piece of AL code can be added to a page where you want to promote the **Draft a proposal** functionality. When the action is clicked, the **My Prompt Dialog** page opens.

```al
...
actions
{
    area(Prompting)
    {
        action(MyPromptAction)
        {
            Caption = 'Draft a proposal';
            Image = Sparkle;
            RunObject = page "My Prompt Dialog";
        }
    }
}
...
```

Here's an example if you're extending a list page:

```al
...

actions
{
    addlast(Prompting)
    {
        action(MyPromptAction)
        {
            Caption = 'Draft a proposal';
            Image = Sparkle;
            RunObject = page "My Prompt Dialog";
        }
    }
}
...
```

### Design guidelines and considerations

- You should set the [Image property](properties/devenv-image-property.md) to either `Sparkle` ![Shows the Copilot sparkle icon](media/copilot-sparkle.png)
or `SparkleFilled` ![Shows the Copilot sparkle filled icon](media/copilot-sparkle-filled.png).

   These images are recognized across Microsoft products to indicate that the action is associated with Copilot. In general, use the `Sparkle` icon. Reserve the `SparkleFilled` icon for special cases where you want to emphasize a specific Copilot. For example, if there are multiple Copilot actions on a page, you might want to emphasize one Copilot action over the others.
- You shouldn't use "Copilot" in prompt action captions. Instead, focus on the assistive task that Copilot performs, starting with a verb such as draft, suggest, search, or troubleshoot.
- Prompt actions are supported on specific page types. Starting with runtime 13, the supported page types include `List`, `ListPart`, `StandardDialog`, and `Worksheet`. With runtime 14, the supported page types also include `Card`, `Document`, and `ListPlus`.
- Prompt actions are displayed only if the `RunObject` property is specified.
- Prompt actions are displayed in both Business Central online and on-premises environments. However, Microsoft Copilot is exclusively available for Business Central online. Therefore, it's good practice to display prompt actions only in online environments, not in on-premises environments. To make actions dynamically visible based on the deployment, use the [Visible property](properties/devenv-visible-property.md) on prompt actions. For example, you can use one of the approaches described in the following sections. These approaches ensure that developers can view and test their prompt actions on their Docker container.

   **Based on deployment infrastructure:**

    The simplest approach is to use the [EnvironmentInformation.IsSaaSInfrastructure()](/dynamics365/business-central/application/system-application/codeunit/system.environment.environment-information) method to check whether the environment is online or on-premises and use the return value as an expression on the prompt action's [Visible](properties/devenv-visible-property.md) property. If the method returns `true`, then the environment is online, and the action is made visible. For example:

    ```al
    actions 
    {
        addlast(Prompting)
        {
            action(MyPromptAction)
            {
                Caption = 'Draft a proposal';
                RunObject = page "My Prompt Dialog";
                Visible = IsSaaS;
            }
        }
    }

    var
        IsSaaS: Boolean;


    trigger OnOpenPage()
    var
        EnvInfo: Codeunit "Environment Information";

    begin
        IsSaaS := EnvInfo.IsSaaSInfrastructure()
    end;
    ```

    **Based on capability registration:**

    The preferred approach is to register the Copilot capability only if the environment is online (learn more in [Registering an AI capability](ai-build-capability-in-al.md#registering-an-ai-capability)). Then, use the [CopilotCapability.IsCapabilityRegistered](/dynamics365/business-central/application/system-application/codeunit/system.ai.copilot-capability#iscapabilityregistered) method on the prompt action's Visible property to check whether the capability is registered. If the method returns `true`, the Copilot capability is registered, and the action is visible. For example:

    ```al
    actions
    {
        addlast(Prompting)
        {
            action(MyPromptAction)
            {
                Caption = 'Draft a proposal';
                RunObject = page "My Prompt Dialog";
                Visible = IsCapabilityRegistered;
            }
        }
    }

    var
        IsCapabilityRegistered: Boolean;

    trigger OnOpenPage()
    var
        CopilotCapability: Codeunit "Copilot Capability";
    begin
        IsCapabilityRegistered := CopilotCapability.IsCapabilityRegistered(Enum::"Copilot Capability"::"Draft a proposal");
    end;
    ```

    <!--
    enumextension 50104 "Copilot Capability Extension" extends "Copilot Capability"
    {
        value(54300; "Draft a proposal")
        {
            Caption = 'Draft a proposal';
        }
    }
    -->

### Detailed example

The next code is part of a code sample taken from the [aka.ms/BCTech](https://aka.ms/BCTech) repo; the [Job Planning Lines Copilot](https://github.com/microsoft/BCTech/blob/master/samples/AzureOpenAI/Advanced_SuggestJob/SuggestResource/JobPlanningLinesCopilot.PageExt.al) page extension. This code sample illustrates how to create two prompt actions that run the `SuggestResourceCopilotAction` and `SuggestItemCopilotAction` actions. The `SuggestResourceCopilotAction` action is used to suggest a resource to be assigned to a job planning line, and the `SuggestItemCopilotAction` action is used to suggest an item to be assigned to a job planning line. The `SuggestResourceWithAI` and `SuggestItemWithAI` functions aren't implemented in this code sample. 

```al
...
actions
    {
        addlast(Prompting)
        {
            action(SuggestResourceCopilotAction)
            {
                Caption = 'Suggest resource';
                ToolTip = 'Asks Copilot which resource can be assigned to the job planning line. You will have to confirm the suggestion from Copilot.';
                Visible = Rec.Type = Rec.Type::Resource;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    SuggestResourceWithAI(Rec);
                end;
            }
        }
        addlast(Prompting)
        {
            action(SuggestItemCopilotAction)
            {
                Caption = 'Suggest item';
                ToolTip = 'Asks Copilot which item can be assigned to the job planning line. You will have to confirm the suggestion from Copilot.';
                Visible = Rec.Type = Rec.Type::Item;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Message('not implemented');
                end;
            }
        }
    }
...
```

## Add a standard action that runs the prompt dialog page

This task is done similar to the way you add an action that opens any page. Except in this case, you target the prompt dialog page for your Copilot feature. You also apply a specific image so that users can easily recognize that the action is related to a Copilot feature.

The following code illustrates how to add an action that opens the prompt dialog page for Copilot feature:  

```al
action(MyPromptDialogAction)
{
    Caption = 'Draft a proposal';
    Image = Sparkle;

    trigger OnAction()
    begin
        Page.RunModal(Page::"My Prompt Dialog");
    end;
}
```

## Related information

[The PromptDialog page type](devenv-page-type-promptdialog.md)  
[Prompting using a prompt guide](devenv-page-promptguide.md)  
[Error handling in prompt dialogs](devenv-page-prompt-error-handling.md)
