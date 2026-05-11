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
ms.date: 05/11/2026
ms.update-cycle: 180-days
---

# AI models for agents (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

Agents in [!INCLUDE [prod_short](../includes/prod_short.md)] can run on different AI models. The model an agent uses can affect its behavior, performance, and results. Multiple models can be available at the same time, and each agent can either use a specific model or rely on the automatic (default) model selection. If you add Copilot agents to your environment, there's no default model, you always have to specify, which one to use in code.

> [!NOTE]
> The AI models available for agents in [!INCLUDE [prod_short](../includes/prod_short.md)] are determined by Microsoft and may change over time. Model availability can depend on factors such as the agent's capabilities, the environment, and the stage of the model lifecycle.

## Where to see and control models

You can view and manage AI models in two ways:

- **Agent configuration in the UI**  
  The agent card and setup pages show the current model and allow you to change it. A dedicated list page shows all available models.
- **Agents coded in AL**  
  APIs allow you to list available models and set the model on an agent programmatically.

## Model lifecycle

Models follow a lifecycle similar to code deprecation in [!INCLUDE [prod_short](../includes/prod_short.md)]:

**Preview** → **Available** → **Default** → **Obsolete** → **Retired**

The following points apply:

- Multiple models can coexist in the same environment.
- The model lifecycle doesn't align with the standard [!INCLUDE [prod_short](../includes/prod_short.md)] deprecation timelines.
- The default model (used by auto mode) can change over time.
- Agents that use auto selection might experience behavior changes when the default model changes.

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
