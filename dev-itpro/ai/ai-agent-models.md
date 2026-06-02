---
title: AI Models for Agents (preview)
description: Learn about AI model availability, lifecycle, and how to select models for agents in Dynamics 365 Business Central.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: conceptual
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 06/02/2026
ms.update-cycle: 180-days
---

# AI models for agents (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

Agents in [!INCLUDE [prod_short](../includes/prod_short.md)] can run on different AI models. The model an agent uses can affect its behavior, performance, and results. Multiple models can be available at the same time, and each agent can either use a specific model or rely on the automatic (default) model selection. 

> [!NOTE]
> The AI models available for agents in [!INCLUDE [prod_short](../includes/prod_short.md)] are determined by Microsoft and may change over time. Model availability can depend on factors such as the agent's capabilities, the environment, and the stage of the model lifecycle.

## Where to see and control models

You can view and manage AI models in two ways:

- **Agent configuration in the UI**  
  For agents created from the agent design experience, the agent card and setup pages show the current model and allow you to change it. A dedicated list page shows all available models. For coded agents, the model in use isn't visible in the UI.
- **Agents coded in AL**  
  APIs allow you to list available models and set the model on an agent or on individual tasks programmatically.

## Select a model for a designed agent

To change the AI model for an agent created in the design experience:

1. In [!INCLUDE [prod_short](../includes/prod_short.md)], go to the **Agents** page.
2. Select the agent you want to configure.
3. On the agent card, find the **Agent model** section.
4. In the **Model** field, select a model from the list, or choose **Auto** to let the system select the default model.

:::image type="content" source="../media/ai-agent-model-selection.png" alt-text="Agent card showing the Agent model section with the Model field set to Auto.":::

The **Agent Models** list page shows all models available in the environment. Each entry displays the model name, its availability status, and its retirement date (if scheduled). Use this page to understand which models are currently available before making a selection.

:::image type="content" source="../media/ai-agent-models-list.png" alt-text="Agent Models list page showing available models with their status and retirement dates.":::

> [!TIP]
> If you select **Auto**, the agent uses whatever model Microsoft designates as the current default. This means the model can change over time without manual intervention. If you need predictable behavior, pin your agent to a specific model version.

## Model resolution

When an agent runs a task, [!INCLUDE [prod_short](../includes/prod_short.md)] resolves which model to use in the following order:

1. If a model is specified on the **task**, that model is used.
2. If no model is set on the task but a model is specified on the **agent**, the agent-level model is used.
3. If no model is set on either the task or the agent, the **default** model is used.

This resolution order lets you set a general model preference at the agent level while overriding it for specific tasks that benefit from a different model.

## Model lifecycle

Models follow a lifecycle similar to code deprecation in [!INCLUDE [prod_short](../includes/prod_short.md)]:

**Preview** → **Available** → **Obsolete** → **Retired**

The following points apply:

- Multiple models can coexist in the same environment.
- The model lifecycle doesn't align with the standard [!INCLUDE [prod_short](../includes/prod_short.md)] deprecation timelines.
- The default model (used by auto mode) can change over time.
- Agents that use auto selection might experience behavior changes when the default model changes.
- Model updates and the availability of new model-selection features in the UI can roll out independently. During transitions, agents continue to work as expected with the updated model, even before the selection UI reflects the change.

> [!IMPORTANT]
> When the default model changes, we recommend that you re-evaluate your agents, because agent behavior and accuracy can be affected by the model update.

## Retired and obsolete models

When a model becomes obsolete or retired, the following indicators help you detect and respond to the change:

- **UI indicators**  
  Annotations for retired or obsolete models are shown on the agent card and model list.
- **Developer communication**  
  Model lifecycle changes are communicated through AL Home notifications, documentation updates, and telemetry signals.

## Related information

[Configure agents programmatically (preview)](ai-agent-sdk-configuration.md)  
[Coding agents in AL (preview)](ai-agent-sdk-overview.md)  
[Define and register an agent programmatically (preview)](ai-agent-sdk-define-register.md)  
[Overview (preview)](ai-development-toolkit-landing-page.yml)
