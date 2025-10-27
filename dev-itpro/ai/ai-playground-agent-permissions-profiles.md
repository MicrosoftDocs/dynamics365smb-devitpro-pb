---
title: Set up AI Playground Agent permissions and profiles (preview)
description: Learn how you can use AI Playground Agent in Business Central.
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

# Set up AI Playground Agent permissions and profiles (preview)

[This article is prerelease documentation and is subject to change.]

The AI Playground Agent is a prototyping tool that allows developers and partners to experiment with AI capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)]. It's available in sandbox environments and designed for testing and learning purposes, providing a safe environment to explore AI functionalities without affecting production data.

## Permissions

The agent operates with explicit permission sets that control what data and actions it can access. This follows the principle of least privilege—grant only the permissions necessary for the agent's intended functionality. Permission sets can only be modified when the agent is deactivated.

## Profile

The agent is assigned to a profile (role) that determines which UI elements it can see and interact with. You can create custom profiles specifically for agents, using page customization properties to control visibility of actions, layouts, views, and operations like insert/delete.

## Related information

[Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai)  
[Create and manage an AI Playground Agent (preview)](ai-playground-agent-create.md)  
[Configure instructions, tasks, and permissions for an AI Playground Agent (preview)](ai-playground-agent-configure.md)  
[Best practices for prototyping with AI Playground Agent (preview)](ai-playground-agent-best-practices.md)