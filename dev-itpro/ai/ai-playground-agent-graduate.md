---
title: Graduate an AI Playground Agent (preview)
description: Learn how to graduate an AI Playground Agent to a production-ready Copilot feature in Business Central by converting prototypes into deployable AL extensions.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 09/10/2025
ms.update-cycle: 180-days
---

# Graduate an AI Playground Agent (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-playground-preview](../includes/ai-playground-preview.md)]

SDK developers can graduate an AI Playground Agent to a production-ready Copilot feature by converting the agent's instructions, tasks, and permissions into an AL extension. This process involves translating the prototyped functionality into code that can be deployed in a production environment.

## Export an agent configuration

To facilitate the graduation process, you can export the agent's configuration from the AI Playground and import it into your AL extension project. The exported configuration includes:

- **Instructions**: The detailed guidelines that define how the agent should behave.
- **Tasks**: The specific actions the agent can perform.
- **Permissions**: The access rights the agent requires to function correctly.

To export the configuration, do the following:

1. On the **Agents (preview)** page, choose the agent that you want to export.
1. Choose **Show more options** and then choose **Export agent**.
1. The exported agent appears in your **Downloads** window. 

Save the exported file and include it in your AL extension project.

## Import an agent configuration into an AL extension

## Related information

[Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai)  
[Create and activate an AI Playground Agent (preview)](ai-playground-agent-create.md)  
[Configure instructions, tasks, and permissions for an AI Playground Agent (preview)](ai-playground-agent-configure.md)  
[Set up AI Playground Agent permissions and profiles (preview)](ai-playground-agent-permissions-profiles.md)  
[Best practices for prototyping with AI Playground Agent (preview)](ai-playground-agent-best-practices.md)